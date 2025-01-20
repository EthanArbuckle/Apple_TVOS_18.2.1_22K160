uint64_t sub_100002F84()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  NSString v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  unint64_t *v15;
  uint64_t *v16;
  char *v17;
  char *v18;
  os_log_s *v19;
  os_log_type_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  os_log_s *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  Swift::String v47;
  Swift::String v48;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  char *v53;
  unint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSURL *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  os_log_s *v69;
  os_log_type_t v70;
  uint8_t *v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t *v85;
  unint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  unint64_t v90;
  v1 = *(void *)(sub_100006FD0(&qword_10000C1F0) - 8);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = (char *)&v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  v6 = (char *)&v81 - v5;
  v89 = &_swiftEmptyArrayStorage;
  v7 = [(id)objc_opt_self(NSFileManager) defaultManager];
  v9 = *(void *)&v0[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath];
  v8 = *(void *)&v0[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath + 8];
  v10 = String._bridgeToObjectiveC()();
  v90 = 0LL;
  v11 = [v7 contentsOfDirectoryAtPath:v10 error:&v90];

  v12 = (id)v90;
  if (v11)
  {
    v83 = v1;
    v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for String);
    v14 = v12;

    v15 = (unint64_t *)v13;
    v16 = (uint64_t *)&v0[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logger];
    v17 = v0;
    swift_bridgeObjectRetain_n(v15, 2LL);
    v18 = v17;
    v85 = v16;
    v19 = (os_log_s *)Logger.logObject.getter(v18);
    v20 = static os_log_type_t.default.getter();
    v21 = os_log_type_enabled(v19, v20);
    v86 = v15;
    v84 = v18;
    if (v21)
    {
      v22 = swift_slowAlloc(22LL, -1LL);
      v82 = swift_slowAlloc(64LL, -1LL);
      v90 = v82;
      *(_DWORD *)v22 = 136315394;
      swift_bridgeObjectRetain(v8);
      v87 = sub_100004298(v9, v8, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v22 + 4, v22 + 12);

      swift_bridgeObjectRelease(v8);
      *(_WORD *)(v22 + 12) = 2080;
      v23 = swift_bridgeObjectRetain(v15);
      v24 = Array.description.getter(v23, &type metadata for String);
      v26 = v25;
      swift_bridgeObjectRelease(v86);
      v87 = sub_100004298(v24, v26, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v22 + 14, v22 + 22);
      swift_bridgeObjectRelease_n(v86, 2LL);
      v27 = v26;
      v15 = v86;
      swift_bridgeObjectRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "#STS DE# content of path %s %s", (uint8_t *)v22, 0x16u);
      v28 = v82;
      swift_arrayDestroy(v82, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v15, 2LL);
    }

    v41 = v15[2];
    v42 = &_swiftEmptyArrayStorage;
    if (v41)
    {
      v43 = v15 + 5;
      v44 = &_swiftEmptyArrayStorage;
      do
      {
        v46 = *(v43 - 1);
        v45 = *v43;
        swift_bridgeObjectRetain(*v43);
        v47._countAndFlagsBits = 6709603LL;
        v47._object = (void *)0xE300000000000000LL;
        if (String.hasSuffix(_:)(v47)
          || (v48._countAndFlagsBits = 0x6E6970736C696174LL,
              v48._object = (void *)0xE800000000000000LL,
              String.hasSuffix(_:)(v48)))
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v44);
          v90 = (unint64_t)v44;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_100004A84(0, v44[2] + 1LL, 1);
            v44 = (void *)v90;
          }

          v51 = v44[2];
          v50 = v44[3];
          if (v51 >= v50 >> 1)
          {
            sub_100004A84(v50 > 1, v51 + 1, 1);
            v44 = (void *)v90;
          }

          v44[2] = v51 + 1;
          v52 = &v44[2 * v51];
          v52[4] = v46;
          v52[5] = v45;
        }

        else
        {
          swift_bridgeObjectRelease(v45);
        }

        v43 += 2;
        --v41;
      }

      while (v41);
    }

    else
    {
      v44 = &_swiftEmptyArrayStorage;
    }

    swift_bridgeObjectRelease(v86);
    v53 = v84;
    v54 = sub_1000069D8((uint64_t)v44, (uint64_t)v53);
    swift_release(v44);

    v90 = (unint64_t)&_swiftEmptyArrayStorage;
    v55 = v54[2];
    if (v55)
    {
      v56 = (uint64_t)v54 + ((*(unsigned __int8 *)(v83 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80));
      v57 = *(void *)(v83 + 72);
      v86 = v54;
      swift_bridgeObjectRetain(v54);
      do
      {
        sub_100007048(v56, (uint64_t)v6);
        sub_100007048((uint64_t)v6, (uint64_t)v4);
        v59 = type metadata accessor for URL(0LL);
        v60 = *(void *)(v59 - 8);
        v62 = 0LL;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48))(v4, 1LL, v59) != 1)
        {
          URL._bridgeToObjectiveC()(v61);
          v62 = v63;
          (*(void (**)(char *, uint64_t))(v60 + 8))(v4, v59);
        }

        v64 = [objc_allocWithZone(DEAttachmentItem) initWithPathURL:v62];

        v65 = sub_100007090((uint64_t)v6);
        if (v64)
        {
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v65);
          v67 = *(void *)((v90 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          v66 = *(void *)((v90 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v67 >= v66 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v66 > 1, v67 + 1, 1LL);
          }
          v58 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v67, v64);
          specialized Array._endMutation()(v58);
        }

        v56 += v57;
        --v55;
      }

      while (v55);
      v54 = v86;
      swift_bridgeObjectRelease(v86);
      v42 = (id)v90;
    }

    swift_bridgeObjectRelease(v54);
    v68 = swift_bridgeObjectRetain_n(v42, 2LL);
    v69 = (os_log_s *)Logger.logObject.getter(v68);
    v70 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v72 = swift_slowAlloc(32LL, -1LL);
      v90 = v72;
      *(_DWORD *)v71 = 136315138;
      v73 = sub_1000070D0();
      v74 = swift_bridgeObjectRetain(v42);
      v75 = Array.description.getter(v74, v73);
      v77 = v76;
      swift_bridgeObjectRelease(v42);
      v87 = sub_100004298(v75, v77, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v71 + 4, v71 + 12);
      swift_bridgeObjectRelease_n(v42, 2LL);
      swift_bridgeObjectRelease(v77);
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "#STS DE# filtered %s", v71, 0xCu);
      swift_arrayDestroy(v72, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v72, -1LL, -1LL);
      swift_slowDealloc(v71, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v42, 2LL);
    }

    sub_100003898((uint64_t)v42);
    v78 = v89;
  }

  else
  {
    v29 = (id)v90;
    v30 = _convertNSErrorToError(_:)(v12);

    swift_willThrow();
    v31 = v0;
    swift_errorRetain(v30);
    v32 = v31;
    v33 = swift_errorRetain(v30);
    v34 = (os_log_s *)Logger.logObject.getter(v33);
    v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = swift_slowAlloc(22LL, -1LL);
      v85 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      v86 = (unint64_t *)swift_slowAlloc(32LL, -1LL);
      v90 = (unint64_t)v86;
      *(_DWORD *)v36 = 138412546;
      swift_errorRetain(v30);
      v37 = _swift_stdlib_bridgeErrorToNSError(v30);
      v87 = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v36 + 4, v36 + 12);
      v38 = v85;
      *v85 = v37;
      swift_errorRelease(v30);
      swift_errorRelease(v30);
      *(_WORD *)(v36 + 12) = 2080;
      swift_bridgeObjectRetain(v8);
      v87 = sub_100004298(v9, v8, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v36 + 14, v36 + 22);

      swift_bridgeObjectRelease(v8);
      _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "#STS DE# attachmentList error: %@ at %s",  (uint8_t *)v36,  0x16u);
      v39 = sub_100006FD0(&qword_10000C1F8);
      swift_arrayDestroy(v38, 1LL, v39);
      swift_slowDealloc(v38, -1LL, -1LL);
      v40 = v86;
      swift_arrayDestroy(v86, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1LL, -1LL);
      swift_slowDealloc(v36, -1LL, -1LL);
      swift_errorRelease(v30);
    }

    else
    {
      swift_errorRelease(v30);

      swift_errorRelease(v30);
      swift_errorRelease(v30);
    }

    v78 = &_swiftEmptyArrayStorage;
  }

  v79 = sub_100003A50((uint64_t)v78);
  swift_bridgeObjectRelease(v78);
  return v79;
}

uint64_t sub_100003898(uint64_t a1)
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
    uint64_t result = sub_1000067CC(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
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

uint64_t sub_100003A50(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v17 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_100004A4C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        unint64_t v6 = sub_1000070D0();
        swift_dynamicCast(v16, &v15, v6, (char *)&type metadata for Any + 8, 7LL);
        uint64_t v3 = v17;
        if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
        {
          sub_100004A4C(0, v3[2] + 1LL, 1);
          uint64_t v3 = v17;
        }

        unint64_t v8 = v3[2];
        unint64_t v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_100004A4C(v7 > 1, v8 + 1, 1);
          uint64_t v3 = v17;
        }

        v3[2] = v8 + 1;
        sub_100007014(v16, &v3[4 * v8 + 4]);
      }
    }

    else
    {
      uint64_t v9 = (id *)(a1 + 32);
      unint64_t v10 = sub_1000070D0();
      do
      {
        id v15 = *v9;
        id v11 = v15;
        swift_dynamicCast(v16, &v15, v10, (char *)&type metadata for Any + 8, 7LL);
        uint64_t v3 = v17;
        if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
        {
          sub_100004A4C(0, v3[2] + 1LL, 1);
          uint64_t v3 = v17;
        }

        unint64_t v13 = v3[2];
        unint64_t v12 = v3[3];
        if (v13 >= v12 >> 1)
        {
          sub_100004A4C(v12 > 1, v13 + 1, 1);
          uint64_t v3 = v17;
        }

        v3[2] = v13 + 1;
        sub_100007014(v16, &v3[4 * v13 + 4]);
        ++v9;
        --v2;
      }

      while (v2);
    }

    return (uint64_t)v3;
  }

  __break(1u);
  return result;
}

uint64_t sub_100003CDC(void *a1, void *a2)
{
  uint64_t v4 = sub_100006FD0(&qword_10000C1E0);
  uint64_t v5 = __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  unint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  unint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v36 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  v19 = (char *)&v36 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v36 - v20;
  uint64_t v22 = a1[3];
  v23 = sub_100007024(a1, v22);
  v24 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v23, v22);
  if (([v24 respondsToSelector:"modificationDate"] & 1) == 0)
  {
    swift_unknownObjectRelease(v24);
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  id v25 = [v24 modificationDate];
  swift_unknownObjectRelease(v24);
  if (v25)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v25);

    uint64_t v26 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56LL))(v16, 0LL, 1LL, v26);
  }

  else
  {
    uint64_t v26 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56LL))(v16, 1LL, 1LL, v26);
  }

  sub_10000719C((uint64_t)v16, (uint64_t)v19, &qword_10000C1E0);
  sub_10000719C((uint64_t)v19, (uint64_t)v21, &qword_10000C1E0);
  type metadata accessor for Date(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  if (v28(v21, 1LL, v26) == 1) {
    goto LABEL_13;
  }
  uint64_t v29 = a2[3];
  v30 = sub_100007024(a2, v29);
  a2 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v30, v29);
  if (([a2 respondsToSelector:"modificationDate"] & 1) == 0)
  {
LABEL_14:
    uint64_t result = swift_unknownObjectRelease(a2);
    __break(1u);
    goto LABEL_15;
  }

  id v31 = [a2 modificationDate];
  swift_unknownObjectRelease(a2);
  if (v31)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v31);

    uint64_t v32 = 0LL;
  }

  else
  {
    uint64_t v32 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v7, v32, 1LL, v26);
  sub_10000719C((uint64_t)v7, (uint64_t)v10, &qword_10000C1E0);
  sub_10000719C((uint64_t)v10, (uint64_t)v13, &qword_10000C1E0);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v28)(v13, 1LL, v26);
  if ((_DWORD)result != 1)
  {
    char v34 = static Date.< infix(_:_:)(v21, v13);
    v35 = *(void (**)(char *, uint64_t))(v27 + 8);
    v35(v13, v26);
    v35(v21, v26);
    return v34 & 1;
  }

LABEL_15:
  __break(1u);
  return result;
}

id sub_100004158()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STSDiagnosticExtension(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000041E0()
{
  return type metadata accessor for STSDiagnosticExtension(0LL);
}

uint64_t type metadata accessor for STSDiagnosticExtension(uint64_t a1)
{
  uint64_t result = qword_10000C238;
  if (!qword_10000C238) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for STSDiagnosticExtension);
  }
  return result;
}

uint64_t sub_100004224(uint64_t a1, uint64_t a2)
{
  uint64_t result = type metadata accessor for Logger(319LL, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    v5[1] = &unk_1000076F8;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v5, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100004298(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004368(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006F94((uint64_t)v12, *a3);
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
      sub_100006F94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100006F74(v12);
  return v7;
}

uint64_t sub_100004368(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100004520(a5, a6);
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

uint64_t sub_100004520(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000045B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_10000478C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000478C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000045B4(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100004728(v4, 0LL);
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

void *sub_100004728(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100006FD0(&qword_10000C1D0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  void v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000478C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100006FD0(&qword_10000C1D0);
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

void *sub_1000048D8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_18;
  }
  if (!v5) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v8 = 32 * v5;
  if (v5 <= 0)
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
    if (v4 != a3) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }

  uint64_t v9 = sub_100006FD0(&qword_10000C1D8);
  uint64_t v10 = (void *)swift_allocObject(v9, v8 + 32, 7LL);
  int64_t v11 = j__malloc_size(v10);
  uint64_t v12 = v11 - 32;
  if (v11 < 32) {
    uint64_t v12 = v11 - 1;
  }
  v10[2] = v5;
  v10[3] = 2 * (v12 >> 5);
  if (v4 == a3)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

LABEL_7:
  if (v5 < 0)
  {
LABEL_19:
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_20;
  }

  uint64_t v13 = v10 + 4;
  unint64_t v14 = a2 + 32 * a3;
  if (v14 >= (unint64_t)&v10[(unint64_t)v8 / 8 + 4] || (unint64_t)v13 >= v14 + v8)
  {
    swift_arrayInitWithCopy(v13, v14, v5, (char *)&type metadata for Any + 8);
    return v10;
  }

  uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_100004A4C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100004AA0(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100004A68(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100004C0C(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_100004A84(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100004DF4(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100004AA0(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100006FD0(&qword_10000C1D8);
    int64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 1;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 5);
  }

  else
  {
    int64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8]) {
      memmove(v14, v15, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14, v15, v8, (char *)&type metadata for Any + 8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100004C0C(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_100006FD0(&qword_10000C220);
  uint64_t v11 = *(void *)(sub_100006FD0(&qword_10000C1F0) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
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
  uint64_t v18 = sub_100006FD0(&qword_10000C1F0);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v23 = *(void *)(v19 + 72) * v8;
  v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21, v22, v8, v18);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100004DF4(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100006FD0(&qword_10000C208);
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
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

Swift::Int sub_100004F5C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_1000069C4(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_100004FC4(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_100004FC4(uint64_t *a1)
{
  uint64_t v4 = sub_100006FD0(&qword_10000C1E0);
  uint64_t v5 = __chkstk_darwin(v4);
  int64_t v7 = (char *)&v157 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v175 = (uint64_t)&v157 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v174 = (uint64_t)&v157 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v157 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v176 = (uint64_t)&v157 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v157 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v157 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v164 = (uint64_t)&v157 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v163 = (uint64_t)&v157 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v166 = (char *)&v157 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v165 = (uint64_t)&v157 - v30;
  __chkstk_darwin(v29);
  uint64_t v170 = (uint64_t)&v157 - v31;
  v182 = a1;
  Swift::Int v32 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v32);
  if (result >= v32)
  {
    if (v32 < 0) {
      goto LABEL_160;
    }
    if (v32) {
      return sub_100005DCC(0LL, v32, 1LL, v182);
    }
    return result;
  }

  if (v32 >= 0) {
    uint64_t v34 = v32;
  }
  else {
    uint64_t v34 = v32 + 1;
  }
  if (v32 < -1) {
    goto LABEL_176;
  }
  Swift::Int v158 = result;
  v159 = v22;
  if (v32 < 2)
  {
    v37 = _swiftEmptyArrayStorage;
    v171 = (char *)&_swiftEmptyArrayStorage[4];
    if (v32 != 1)
    {
      unint64_t v1 = _swiftEmptyArrayStorage[2];
      v39 = (char *)_swiftEmptyArrayStorage;
LABEL_123:
      uint64_t v2 = v172;
      if (v1 >= 2)
      {
        uint64_t v149 = *v182;
        do
        {
          unint64_t v150 = v1 - 2;
          if (v1 < 2) {
            goto LABEL_154;
          }
          if (!v149) {
            goto LABEL_175;
          }
          v151 = v39;
          uint64_t v152 = *(void *)&v39[16 * v150 + 32];
          uint64_t v153 = *(void *)&v39[16 * v1 + 24];
          sub_10000620C( (char *)(v149 + 32 * v152),  (char *)(v149 + 32LL * *(void *)&v39[16 * v1 + 16]),  v149 + 32 * v153,  v171);
          if (v2)
          {
            v156 = v151;
            goto LABEL_136;
          }

          if (v153 < v152) {
            goto LABEL_156;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v151) & 1) == 0) {
            v151 = sub_1000066C4((uint64_t)v151);
          }
          if (v150 >= *((void *)v151 + 2)) {
            goto LABEL_157;
          }
          v154 = &v151[16 * v150 + 32];
          *(void *)v154 = v152;
          *((void *)v154 + 1) = v153;
          unint64_t v155 = *((void *)v151 + 2);
          if (v1 > v155) {
            goto LABEL_158;
          }
          memmove(&v151[16 * v1 + 16], &v151[16 * v1 + 32], 16 * (v155 - v1));
          v39 = v151;
          *((void *)v151 + 2) = v155 - 1;
          unint64_t v1 = v155 - 1;
        }

        while (v155 > 2);
      }

      v156 = v39;
LABEL_136:
      swift_bridgeObjectRelease(v156);
LABEL_137:
      v37[2] = 0LL;
      return swift_bridgeObjectRelease(v37);
    }

    v157 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v35 = v34 >> 1;
    uint64_t v36 = static Array._allocateBufferUninitialized(minimumCapacity:)(v34 >> 1, (char *)&type metadata for Any + 8);
    *(void *)(v36 + 16) = v35;
    v157 = (void *)v36;
    v171 = (char *)(v36 + 32);
  }

  uint64_t v38 = 0LL;
  v39 = (char *)_swiftEmptyArrayStorage;
  v173 = v7;
  v177 = v14;
  while (1)
  {
    uint64_t v2 = v38;
    uint64_t v40 = v38 + 1;
    v161 = v39;
    uint64_t v168 = v2;
    if (v40 < v32)
    {
      uint64_t v41 = *v182;
      sub_100006F94(*v182 + 32 * v40, (uint64_t)&v180);
      sub_100006F94(v41 + 32 * v2, (uint64_t)v178);
      LODWORD(v167) = sub_100003CDC(&v180, v178);
      if (v172)
      {
        sub_100006F74(v178);
        sub_100006F74(&v180);
        v148 = v161;
LABEL_120:
        swift_bridgeObjectRelease(v148);
        v37 = v157;
        goto LABEL_137;
      }

      sub_100006F74(v178);
      sub_100006F74(&v180);
      uint64_t v40 = v2 + 2;
      Swift::Int v160 = v32;
      uint64_t v162 = v41;
      if (v2 + 2 < v32)
      {
        uint64_t v42 = v41 + 32 * v2 + 32;
        do
        {
          sub_100006F94(v42 + 32, (uint64_t)&v180);
          sub_100006F94(v42, (uint64_t)v178);
          uint64_t v43 = v181;
          v44 = sub_100007024(&v180, v181);
          unint64_t v1 = _bridgeAnythingToObjectiveC<A>(_:)(v44, v43);
          uint64_t v2 = (uint64_t)[(id)v1 modificationDate];
          swift_unknownObjectRelease(v1);
          v45 = v166;
          Swift::Int v169 = v42;
          if (v2)
          {
            static Date._unconditionallyBridgeFromObjectiveC(_:)(v2);

            unint64_t v1 = type metadata accessor for Date(0LL);
            (*(void (**)(char *, void, uint64_t, unint64_t))(*(void *)(v1 - 8) + 56LL))( v45,  0LL,  1LL,  v1);
          }

          else
          {
            unint64_t v1 = type metadata accessor for Date(0LL);
            (*(void (**)(char *, uint64_t, uint64_t, unint64_t))(*(void *)(v1 - 8) + 56LL))( v45,  1LL,  1LL,  v1);
          }

          uint64_t v46 = (uint64_t)v45;
          uint64_t v47 = v165;
          sub_10000719C(v46, v165, &qword_10000C1E0);
          uint64_t v48 = v170;
          sub_10000719C(v47, v170, &qword_10000C1E0);
          type metadata accessor for Date(0LL);
          uint64_t v49 = *(void *)(v1 - 8);
          v50 = *(unsigned int (**)(uint64_t, uint64_t, unint64_t))(v49 + 48);
          if (v50(v48, 1LL, v1) == 1) {
            goto LABEL_171;
          }
          uint64_t v51 = v179;
          v52 = sub_100007024(v178, v179);
          uint64_t v2 = _bridgeAnythingToObjectiveC<A>(_:)(v52, v51);
          id v53 = [(id)v2 modificationDate];
          swift_unknownObjectRelease(v2);
          if (v53)
          {
            uint64_t v54 = (uint64_t)v159;
            static Date._unconditionallyBridgeFromObjectiveC(_:)(v53);

            uint64_t v55 = 0LL;
          }

          else
          {
            uint64_t v55 = 1LL;
            uint64_t v54 = (uint64_t)v159;
          }

          (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(v49 + 56))(v54, v55, 1LL, v1);
          uint64_t v56 = v164;
          sub_10000719C(v54, v164, &qword_10000C1E0);
          uint64_t v57 = v56;
          uint64_t v58 = v163;
          sub_10000719C(v57, v163, &qword_10000C1E0);
          if (v50(v58, 1LL, v1) == 1) {
            goto LABEL_172;
          }
          uint64_t v59 = v170;
          int v60 = static Date.< infix(_:_:)(v170, v58);
          uint64_t v61 = v58;
          int v62 = v60;
          v63 = *(void (**)(uint64_t, unint64_t))(v49 + 8);
          v63(v61, v1);
          v63(v59, v1);
          sub_100006F74(v178);
          sub_100006F74(&v180);
          Swift::Int v32 = v160;
          ++v40;
          uint64_t v42 = v169 + 32;
        }

        while (v160 != v40);
        uint64_t v40 = v160;
LABEL_31:
        uint64_t v2 = v168;
        uint64_t v41 = v162;
      }

      v39 = v161;
      if ((v167 & 1) != 0)
      {
        if (v40 < v2) {
          goto LABEL_163;
        }
        if (v2 < v40)
        {
          uint64_t v64 = 32 * v40 - 32;
          uint64_t v65 = v40;
          uint64_t v66 = 32 * v2;
          do
          {
            if (v2 != --v65)
            {
              if (!v41) {
                goto LABEL_174;
              }
              v67 = (_OWORD *)(v41 + v66);
              unint64_t v1 = v162 + v64;
              sub_100007014(v67, &v180);
              __int128 v68 = *(_OWORD *)(v1 + 16);
              _OWORD *v67 = *(_OWORD *)v1;
              v67[1] = v68;
              uint64_t v41 = v162;
              sub_100007014(&v180, (_OWORD *)v1);
              v39 = v161;
            }

            ++v2;
            v64 -= 32LL;
            v66 += 32LL;
          }

          while (v2 < v65);
          uint64_t v2 = v168;
          Swift::Int v32 = v160;
        }
      }
    }

    if (v40 < v32)
    {
      if (__OFSUB__(v40, v2)) {
        goto LABEL_159;
      }
      if (v40 - v2 < v158) {
        break;
      }
    }

LABEL_68:
    if (v40 < v2) {
      goto LABEL_155;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v39);
    Swift::Int v169 = v40;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0) {
      v39 = v161;
    }
    else {
      v39 = sub_100006524(0LL, *((void *)v161 + 2) + 1LL, 1, v161);
    }
    unint64_t v96 = *((void *)v39 + 2);
    unint64_t v95 = *((void *)v39 + 3);
    unint64_t v1 = v96 + 1;
    if (v96 >= v95 >> 1) {
      v39 = sub_100006524((char *)(v95 > 1), v96 + 1, 1, v39);
    }
    *((void *)v39 + 2) = v1;
    v97 = v39 + 32;
    v98 = (uint64_t *)&v39[16 * v96 + 32];
    Swift::Int v99 = v169;
    uint64_t *v98 = v2;
    v98[1] = v99;
    if (v96)
    {
      while (1)
      {
        unint64_t v100 = v1 - 1;
        if (v1 >= 4)
        {
          v105 = &v97[16 * v1];
          uint64_t v106 = *((void *)v105 - 8);
          uint64_t v107 = *((void *)v105 - 7);
          BOOL v111 = __OFSUB__(v107, v106);
          uint64_t v108 = v107 - v106;
          if (v111) {
            goto LABEL_143;
          }
          uint64_t v110 = *((void *)v105 - 6);
          uint64_t v109 = *((void *)v105 - 5);
          BOOL v111 = __OFSUB__(v109, v110);
          uint64_t v103 = v109 - v110;
          char v104 = v111;
          if (v111) {
            goto LABEL_144;
          }
          unint64_t v112 = v1 - 2;
          v113 = &v97[16 * v1 - 32];
          uint64_t v115 = *(void *)v113;
          uint64_t v114 = *((void *)v113 + 1);
          BOOL v111 = __OFSUB__(v114, v115);
          uint64_t v116 = v114 - v115;
          if (v111) {
            goto LABEL_146;
          }
          BOOL v111 = __OFADD__(v103, v116);
          uint64_t v117 = v103 + v116;
          if (v111) {
            goto LABEL_149;
          }
          if (v117 >= v108)
          {
            v135 = &v97[16 * v100];
            uint64_t v137 = *(void *)v135;
            uint64_t v136 = *((void *)v135 + 1);
            BOOL v111 = __OFSUB__(v136, v137);
            uint64_t v138 = v136 - v137;
            if (v111) {
              goto LABEL_153;
            }
            BOOL v128 = v103 < v138;
            goto LABEL_105;
          }
        }

        else
        {
          if (v1 != 3)
          {
            uint64_t v129 = *((void *)v39 + 4);
            uint64_t v130 = *((void *)v39 + 5);
            BOOL v111 = __OFSUB__(v130, v129);
            uint64_t v122 = v130 - v129;
            char v123 = v111;
            goto LABEL_99;
          }

          uint64_t v102 = *((void *)v39 + 4);
          uint64_t v101 = *((void *)v39 + 5);
          BOOL v111 = __OFSUB__(v101, v102);
          uint64_t v103 = v101 - v102;
          char v104 = v111;
        }

        if ((v104 & 1) != 0) {
          goto LABEL_145;
        }
        unint64_t v112 = v1 - 2;
        v118 = &v97[16 * v1 - 32];
        uint64_t v120 = *(void *)v118;
        uint64_t v119 = *((void *)v118 + 1);
        BOOL v121 = __OFSUB__(v119, v120);
        uint64_t v122 = v119 - v120;
        char v123 = v121;
        if (v121) {
          goto LABEL_148;
        }
        v124 = &v97[16 * v100];
        uint64_t v126 = *(void *)v124;
        uint64_t v125 = *((void *)v124 + 1);
        BOOL v111 = __OFSUB__(v125, v126);
        uint64_t v127 = v125 - v126;
        if (v111) {
          goto LABEL_151;
        }
        if (__OFADD__(v122, v127)) {
          goto LABEL_152;
        }
        if (v122 + v127 >= v103)
        {
          BOOL v128 = v103 < v127;
LABEL_105:
          if (v128) {
            unint64_t v100 = v112;
          }
          goto LABEL_107;
        }

LABEL_99:
        if ((v123 & 1) != 0) {
          goto LABEL_147;
        }
        v131 = &v97[16 * v100];
        uint64_t v133 = *(void *)v131;
        uint64_t v132 = *((void *)v131 + 1);
        BOOL v111 = __OFSUB__(v132, v133);
        uint64_t v134 = v132 - v133;
        if (v111) {
          goto LABEL_150;
        }
        if (v134 < v122) {
          goto LABEL_116;
        }
LABEL_107:
        unint64_t v139 = v100 - 1;
        if (v100 - 1 >= v1)
        {
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

        if (!*v182) {
          goto LABEL_169;
        }
        v140 = v19;
        v141 = v39;
        v142 = v97;
        v143 = (unint64_t *)&v97[16 * v139];
        unint64_t v1 = *v143;
        v144 = v142;
        uint64_t v2 = (uint64_t)&v142[16 * v100];
        int64_t v145 = *(void *)(v2 + 8);
        uint64_t v146 = v172;
        sub_10000620C((char *)(*v182 + 32 * *v143), (char *)(*v182 + 32LL * *(void *)v2), *v182 + 32 * v145, v171);
        uint64_t v172 = v146;
        if (v146)
        {
          v148 = v141;
          goto LABEL_120;
        }

        if (v100 > *((void *)v141 + 2)) {
          goto LABEL_141;
        }
        unint64_t *v143 = v1;
        *(void *)&v144[16 * v139 + 8] = v145;
        unint64_t v147 = *((void *)v141 + 2);
        if (v100 >= v147) {
          goto LABEL_142;
        }
        v97 = v144;
        unint64_t v1 = v147 - 1;
        memmove((void *)v2, (const void *)(v2 + 16), 16 * (v147 - 1 - v100));
        v39 = v141;
        *((void *)v141 + 2) = v147 - 1;
        uint64_t v14 = v177;
        uint64_t v19 = v140;
        if (v147 <= 2) {
          goto LABEL_116;
        }
      }
    }

    unint64_t v1 = 1LL;
LABEL_116:
    Swift::Int v32 = v182[1];
    uint64_t v38 = v169;
    if (v169 >= v32)
    {
      v37 = v157;
      goto LABEL_123;
    }
  }

  if (__OFADD__(v2, v158)) {
    goto LABEL_161;
  }
  if (v2 + v158 >= v32) {
    Swift::Int v69 = v32;
  }
  else {
    Swift::Int v69 = v2 + v158;
  }
  if (v69 >= v2)
  {
    if (v40 != v69)
    {
      uint64_t v70 = 32 * v40 - 32;
      Swift::Int v167 = v69;
      do
      {
        uint64_t v71 = v2;
        Swift::Int v169 = v70;
        do
        {
          uint64_t v72 = *v182 + v70;
          sub_100006F94(v72 + 32, (uint64_t)&v180);
          sub_100006F94(v72, (uint64_t)v178);
          uint64_t v73 = v181;
          v74 = sub_100007024(&v180, v181);
          unint64_t v1 = _bridgeAnythingToObjectiveC<A>(_:)(v74, v73);
          uint64_t v2 = (uint64_t)[(id)v1 modificationDate];
          swift_unknownObjectRelease(v1);
          if (v2)
          {
            static Date._unconditionallyBridgeFromObjectiveC(_:)(v2);

            unint64_t v1 = type metadata accessor for Date(0LL);
            (*(void (**)(char *, void, uint64_t, unint64_t))(*(void *)(v1 - 8) + 56LL))( v14,  0LL,  1LL,  v1);
          }

          else
          {
            unint64_t v1 = type metadata accessor for Date(0LL);
            (*(void (**)(char *, uint64_t, uint64_t, unint64_t))(*(void *)(v1 - 8) + 56LL))( v14,  1LL,  1LL,  v1);
          }

          uint64_t v75 = v176;
          sub_10000719C((uint64_t)v14, v176, &qword_10000C1E0);
          sub_10000719C(v75, (uint64_t)v19, &qword_10000C1E0);
          type metadata accessor for Date(0LL);
          uint64_t v76 = *(void *)(v1 - 8);
          v77 = *(unsigned int (**)(char *, uint64_t, unint64_t))(v76 + 48);
          if (v77(v19, 1LL, v1) == 1) {
            goto LABEL_165;
          }
          uint64_t v78 = v179;
          v79 = sub_100007024(v178, v179);
          uint64_t v2 = _bridgeAnythingToObjectiveC<A>(_:)(v79, v78);
          id v80 = [(id)v2 modificationDate];
          swift_unknownObjectRelease(v2);
          if (v80)
          {
            uint64_t v81 = (uint64_t)v173;
            static Date._unconditionallyBridgeFromObjectiveC(_:)(v80);

            uint64_t v82 = 0LL;
          }

          else
          {
            uint64_t v82 = 1LL;
            uint64_t v81 = (uint64_t)v173;
          }

          (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(v76 + 56))(v81, v82, 1LL, v1);
          uint64_t v83 = v81;
          uint64_t v84 = v175;
          uint64_t v2 = (uint64_t)&qword_10000C1E0;
          sub_10000719C(v83, v175, &qword_10000C1E0);
          uint64_t v85 = v84;
          uint64_t v86 = v174;
          sub_10000719C(v85, v174, &qword_10000C1E0);
          char v87 = static Date.< infix(_:_:)(v19, v86);
          uint64_t v88 = v86;
          char v89 = v87;
          v90 = *(void (**)(uint64_t, unint64_t))(v76 + 8);
          v90(v88, v1);
          v90((uint64_t)v19, v1);
          sub_100006F74(v178);
          sub_100006F74(&v180);
          uint64_t v14 = v177;
          if ((v89 & 1) == 0) {
            break;
          }
          uint64_t v91 = *v182;
          if (!*v182) {
            goto LABEL_168;
          }
          v92 = (_OWORD *)(v91 + v70);
          sub_100007014((_OWORD *)(v91 + v70 + 32), &v180);
          __int128 v93 = v92[1];
          v92[2] = *v92;
          v92[3] = v93;
          sub_100007014(&v180, v92);
          v70 -= 32LL;
          ++v71;
        }

        while (v40 != v71);
        ++v40;
        uint64_t v2 = v168;
        uint64_t v70 = v169 + 32;
      }

      while (v40 != v167);
      uint64_t v40 = v167;
      v39 = v161;
    }

    goto LABEL_68;
  }

LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  swift_unknownObjectRelease(v1);
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  swift_unknownObjectRelease(v2);
  __break(1u);
LABEL_168:
  __break(1u);
LABEL_169:
  __break(1u);
LABEL_170:
  swift_unknownObjectRelease(v1);
  __break(1u);
LABEL_171:
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  swift_unknownObjectRelease(v2);
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100005DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  v63 = a4;
  uint64_t v56 = a1;
  uint64_t v6 = sub_100006FD0(&qword_10000C1E0);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v58 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v60 = (uint64_t)&v54 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v59 = (uint64_t)&v54 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v54 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v61 = (uint64_t)&v54 - v17;
  uint64_t result = __chkstk_darwin(v16);
  __int128 v68 = (char *)&v54 - v19;
  uint64_t v62 = a3;
  uint64_t v55 = a2;
  if (a3 != a2)
  {
    uint64_t v20 = 32 * v62 - 32;
    uint64_t v21 = &STSDiagnosticExtension;
    uint64_t v22 = &STSDiagnosticExtension;
LABEL_5:
    uint64_t v23 = v56;
    uint64_t v57 = v20;
    while (1)
    {
      uint64_t v24 = *v63 + v20;
      sub_100006F94(v24 + 32, (uint64_t)&v66);
      sub_100006F94(v24, (uint64_t)v64);
      uint64_t v25 = v67;
      uint64_t v26 = sub_100007024(&v66, (uint64_t)v67);
      uint64_t v27 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v26, v25);
      id v28 = objc_msgSend(v27, (SEL)v21[2].base_meths);
      swift_unknownObjectRelease(v27);
      if (v28)
      {
        static Date._unconditionallyBridgeFromObjectiveC(_:)(v28);

        uint64_t v29 = type metadata accessor for Date(0LL);
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v15, 0LL, 1LL, v29);
      }

      else
      {
        uint64_t v29 = type metadata accessor for Date(0LL);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v15, 1LL, 1LL, v29);
      }

      uint64_t v30 = v61;
      sub_10000719C((uint64_t)v15, v61, &qword_10000C1E0);
      uint64_t v31 = v30;
      uint64_t v25 = v68;
      sub_10000719C(v31, (uint64_t)v68, &qword_10000C1E0);
      type metadata accessor for Date(0LL);
      uint64_t v32 = *(void *)(v29 - 8);
      v33 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v32 + 48);
      if (v33(v25, 1LL, v29) == 1) {
        goto LABEL_21;
      }
      uint64_t v34 = v65;
      uint64_t v35 = sub_100007024(v64, v65);
      uint64_t v25 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v35, v34);
      uint64_t v36 = v21;
      v37 = v15;
      uint64_t v38 = v36;
      id v39 = objc_msgSend(v25, (SEL)v36[2].base_meths);
      swift_unknownObjectRelease(v25);
      if (v39)
      {
        uint64_t v40 = v58;
        static Date._unconditionallyBridgeFromObjectiveC(_:)(v39);

        uint64_t v41 = 0LL;
      }

      else
      {
        uint64_t v41 = 1LL;
        uint64_t v40 = v58;
      }

      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v40, v41, 1LL, v29);
      uint64_t v42 = (uint64_t)v40;
      uint64_t v43 = v60;
      sub_10000719C(v42, v60, &qword_10000C1E0);
      uint64_t v44 = v43;
      uint64_t v45 = v59;
      sub_10000719C(v44, v59, &qword_10000C1E0);
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v33)(v45, 1LL, v29);
      if ((_DWORD)result == 1) {
        goto LABEL_23;
      }
      uint64_t v15 = v37;
      uint64_t v46 = (uint64_t)v68;
      char v47 = static Date.< infix(_:_:)(v68, v45);
      uint64_t v48 = v45;
      char v49 = v47;
      v50 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v50(v48, v29);
      v50(v46, v29);
      sub_100006F74(v64);
      uint64_t result = sub_100006F74(&v66);
      uint64_t v21 = v38;
      uint64_t v22 = &STSDiagnosticExtension;
      if ((v49 & 1) != 0)
      {
        uint64_t v51 = *v63;
        if (!*v63) {
          goto LABEL_24;
        }
        v52 = (_OWORD *)(v51 + v20);
        sub_100007014((_OWORD *)(v51 + v20 + 32), &v66);
        __int128 v53 = v52[1];
        v52[2] = *v52;
        v52[3] = v53;
        uint64_t result = (uint64_t)sub_100007014(&v66, v52);
        v20 -= 32LL;
        if (v62 != ++v23) {
          continue;
        }
      }

      uint64_t v20 = v57 + 32;
      if (++v62 == v55) {
        return result;
      }
      goto LABEL_5;
    }

    swift_unknownObjectRelease(v27);
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    uint64_t result = swift_unknownObjectRelease(v25);
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }

  return result;
}

uint64_t sub_10000620C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v5 = __dst;
  uint64_t v7 = a2;
  int64_t v9 = a2 - __src;
  int64_t v10 = a2 - __src + 31;
  if (a2 - __src >= 0) {
    int64_t v10 = a2 - __src;
  }
  uint64_t v11 = v10 >> 5;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = a3 - (void)a2 + 31;
  uint64_t v14 = v13 >> 5;
  v37 = __src;
  uint64_t v36 = __dst;
  if (v11 >= v13 >> 5)
  {
    if (v12 >= -31)
    {
      if (__dst != a2 || &a2[32 * v14] <= __dst) {
        memmove(__dst, a2, 32 * v14);
      }
      uint64_t v23 = &v5[32 * v14];
      uint64_t v35 = v23;
      v37 = v7;
      if (__src >= v7 || v12 < 32) {
        goto LABEL_48;
      }
      uint64_t v24 = (char *)(a3 - 32);
      while (1)
      {
        sub_100006F94((uint64_t)(v23 - 32), (uint64_t)v34);
        uint64_t v26 = v7 - 32;
        sub_100006F94((uint64_t)(v7 - 32), (uint64_t)v33);
        char v27 = sub_100003CDC(v34, v33);
        if (v4) {
          goto LABEL_47;
        }
        char v28 = v27;
        uint64_t v29 = v24 + 32;
        sub_100006F74(v33);
        sub_100006F74(v34);
        if ((v28 & 1) != 0)
        {
          if (v29 != v7 || v24 >= v7)
          {
            __int128 v25 = *((_OWORD *)v7 - 1);
            *(_OWORD *)uint64_t v24 = *(_OWORD *)v26;
            *((_OWORD *)v24 + 1) = v25;
          }

          v37 -= 32;
          uint64_t v23 = v35;
          if (v35 <= v5) {
            goto LABEL_48;
          }
        }

        else
        {
          unint64_t v30 = (unint64_t)v35;
          uint64_t v23 = v35 - 32;
          v35 -= 32;
          if ((unint64_t)v29 < v30 || (unint64_t)v24 >= v30 || v29 != (char *)v30)
          {
            __int128 v31 = *((_OWORD *)v23 + 1);
            *(_OWORD *)uint64_t v24 = *(_OWORD *)v23;
            *((_OWORD *)v24 + 1) = v31;
          }

          uint64_t v26 = v7;
          if (v23 <= v5) {
            goto LABEL_48;
          }
        }

        v24 -= 32;
        uint64_t v7 = v26;
        if (v26 <= __src) {
          goto LABEL_48;
        }
      }
    }
  }

  else if (v9 >= -31)
  {
    if (__dst != __src || &__src[32 * v11] <= __dst) {
      memmove(__dst, __src, 32 * v11);
    }
    unint64_t v15 = (unint64_t)&v5[32 * v11];
    uint64_t v35 = (char *)v15;
    while (1)
    {
      sub_100006F94((uint64_t)v7, (uint64_t)v34);
      sub_100006F94((uint64_t)v5, (uint64_t)v33);
      char v16 = sub_100003CDC(v34, v33);
      if (v4) {
        break;
      }
      char v17 = v16;
      sub_100006F74(v33);
      sub_100006F74(v34);
      uint64_t v18 = v37;
      if ((v17 & 1) != 0)
      {
        unint64_t v19 = (unint64_t)(v7 + 32);
        if (v37 >= v7 && (unint64_t)v37 < v19 && v37 == v7)
        {
          uint64_t v18 = v7;
        }

        else
        {
          __int128 v20 = *((_OWORD *)v7 + 1);
          *(_OWORD *)v37 = *(_OWORD *)v7;
          *((_OWORD *)v18 + 1) = v20;
        }
      }

      else
      {
        uint64_t v21 = v36 + 32;
        if (v37 != v36 || v37 >= v21)
        {
          __int128 v22 = *((_OWORD *)v36 + 1);
          *(_OWORD *)v37 = *(_OWORD *)v36;
          *((_OWORD *)v18 + 1) = v22;
        }

        uint64_t v36 = v21;
        unint64_t v19 = (unint64_t)v7;
      }

      v37 = v18 + 32;
      uint64_t v5 = v36;
      if ((unint64_t)v36 < v15)
      {
        uint64_t v7 = (char *)v19;
        if (v19 < a3) {
          continue;
        }
      }

      goto LABEL_48;
    }

LABEL_47:
    sub_100006F74(v33);
    sub_100006F74(v34);
LABEL_48:
    sub_10000661C((void **)&v37, (const void **)&v36, &v35);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_100006524(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100006FD0(&qword_10000C1E8);
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
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_10000661C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 31;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -32)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 5;
    if (result != v3 || result >= &v3[32 * v7]) {
      return (char *)memmove(result, v3, 32 * v7);
    }
  }

  return result;
}

char *sub_1000066C4(uint64_t a1)
{
  return sub_100006524(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_1000066D8( void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100006758(v6, a2, a3);
  return sub_10000672C;
}

void sub_10000672C(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_100006758(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_1000067C4;
  }

  __break(1u);
  return result;
}

void sub_1000067C4(id *a1)
{
}

uint64_t sub_1000067CC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v18 = a3;
    }
    else {
      uint64_t v18 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v18);
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
      uint64_t v12 = a3;
    }
    else {
      uint64_t v12 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000710C();
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_100006FD0(&qword_10000C210);
          unint64_t v15 = sub_1000066D8(v20, i, a3);
          id v17 = *v16;
          ((void (*)(void (**)(id *), void))v15)(v20, 0LL);
          *(void *)(a1 + 8 * i) = v17;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

LABEL_23:
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

  uint64_t v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    unint64_t v11 = sub_1000070D0();
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }

LABEL_26:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1000069C4(uint64_t a1)
{
  return sub_100004AA0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t *sub_1000069D8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100006FD0(&qword_10000C1F0) - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v21 = v2;
    __int128 v25 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100004A68(0, v8, 0);
    uint64_t v9 = v25;
    uint64_t v10 = *(void *)(a2 + OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath);
    uint64_t v11 = *(void *)(a2 + OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath + 8);
    uint64_t v22 = v10;
    uint64_t v12 = (void **)(a1 + 40);
    do
    {
      uint64_t v13 = (uint64_t)*(v12 - 1);
      uint64_t v14 = *v12;
      uint64_t v23 = v22;
      uint64_t v24 = v11;
      swift_bridgeObjectRetain(v14);
      swift_bridgeObjectRetain(v11);
      v15._countAndFlagsBits = v13;
      v15._object = v14;
      String.append(_:)(v15);
      uint64_t v16 = v24;
      URL.init(fileURLWithPath:)(v23, v24);
      swift_bridgeObjectRelease(v16);
      uint64_t v17 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v7, 0LL, 1LL, v17);
      swift_bridgeObjectRelease(v14);
      __int128 v25 = v9;
      unint64_t v19 = v9[2];
      unint64_t v18 = v9[3];
      if (v19 >= v18 >> 1)
      {
        sub_100004A68(v18 > 1, v19 + 1, 1);
        uint64_t v9 = v25;
      }

      v12 += 2;
      v9[2] = v19 + 1;
      sub_10000719C( (uint64_t)v7,  (uint64_t)v9 + ((*(unsigned __int8 *)(v5 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
      + *(void *)(v5 + 72) * v19,
        &qword_10000C1F0);
      --v8;
    }

    while (v8);
  }

  return v9;
}

uint64_t sub_100006B90()
{
  id v1 = [v0 attachmentList];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, (char *)&type metadata for Any + 8);

    uint64_t v33 = v3;
    swift_bridgeObjectRetain(v3);
    sub_100004F5C(&v33);
    swift_bridgeObjectRelease(v3);
    uint64_t v4 = v33;
    uint64_t v5 = swift_retain_n(v33, 2LL);
    uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v7 = static os_log_type_t.default.getter();
    int64_t v8 = &loc_100007000;
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v10 = swift_slowAlloc(32LL, -1LL);
      uint64_t v33 = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v11 = swift_retain(v4);
      uint64_t v12 = Array.description.getter(v11, (char *)&type metadata for Any + 8);
      unint64_t v14 = v13;
      swift_release(v4);
      uint64_t v31 = sub_100004298(v12, v14, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v9 + 4, v9 + 12);
      swift_release_n(v4, 2LL);
      swift_bridgeObjectRelease(v14);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "#STS DE# Preparing... %s}", v9, 0xCu);
      int64_t v8 = (void *)&loc_100007000;
      swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
      swift_release_n(v4, 2LL);
    }

    if (*(void *)(v4 + 16) >= 0x14uLL) {
      uint64_t v15 = 20LL;
    }
    else {
      uint64_t v15 = *(void *)(v4 + 16);
    }
    uint64_t v16 = type metadata accessor for __ContiguousArrayStorageBase(0LL);
    uint64_t v17 = swift_unknownObjectRetain_n(v4, 2LL);
    unint64_t v18 = (void *)swift_dynamicCastClass(v17, v16);
    if (!v18)
    {
      swift_release(v4);
      unint64_t v18 = _swiftEmptyArrayStorage;
    }

    uint64_t v19 = v18[2];
    swift_release(v18);
    if (v19 == v15)
    {
      __int128 v20 = (void *)swift_dynamicCastClass(v4, v16);
      if (!v20)
      {
        swift_release(v4);
        __int128 v20 = _swiftEmptyArrayStorage;
      }
    }

    else
    {
      swift_release(v4);
      __int128 v20 = sub_1000048D8(v4, v4 + 32, 0LL, (2 * v15) | 1);
    }

    swift_release(v4);
    uint64_t v21 = swift_bridgeObjectRetain_n(v20, 2LL);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v25 = swift_slowAlloc(32LL, -1LL);
      uint64_t v33 = v25;
      *(_DWORD *)uint64_t v24 = v8[215];
      uint64_t v26 = swift_bridgeObjectRetain(v20);
      uint64_t v27 = Array.description.getter(v26, (char *)&type metadata for Any + 8);
      unint64_t v29 = v28;
      swift_release(v20);
      uint64_t v31 = sub_100004298(v27, v29, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v24 + 4, v24 + 12);
      swift_release_n(v20, 2LL);
      swift_bridgeObjectRelease(v29);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "#STS DE# Attaching: %s", v24, 0xCu);
      swift_arrayDestroy(v25, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    else
    {
      swift_release_n(v20, 2LL);
    }

    return (uint64_t)v20;
  }

  else
  {
    __break(1u);
    uint64_t result = swift_release(v33);
    __break(1u);
  }

  return result;
}

uint64_t sub_100006F74(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006F94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006FD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

_OWORD *sub_100007014(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_100007024(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100007048(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006FD0(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007090(uint64_t a1)
{
  uint64_t v2 = sub_100006FD0(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_1000070D0()
{
  unint64_t result = qword_10000C200;
  if (!qword_10000C200)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___DEAttachmentItem);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C200);
  }

  return result;
}

unint64_t sub_10000710C()
{
  unint64_t result = qword_10000C218;
  if (!qword_10000C218)
  {
    uint64_t v1 = sub_100007158(&qword_10000C210);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C218);
  }

  return result;
}

uint64_t sub_100007158(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000719C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006FD0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}
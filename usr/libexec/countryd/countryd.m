BOOL sub_100004CD4()
{
  BOOL v0;
  uint64_t v4;
  void *v5;
  BOOL v6;
  if (&class metadata base offset for LSKLocalStatusClient) {
    v0 = &type metadata accessor for LSKLocalStatusClient == 0LL;
  }
  else {
    v0 = 1;
  }
  if (v0
    || &type metadata for LSKLocalStatusClient == 0LL
    || &nominal type descriptor for LSKLocalStatusClient == 0LL
    || &metaclass for LSKLocalStatusClient == 0LL)
  {
    v4 = static os_log_type_t.info.getter();
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    v5 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)( v4,  &_mh_execute_header,  v5,  "This platform does not have LocalStatusKit",  42LL,  2LL,  &_swiftEmptyArrayStorage);
  }

  if (&metaclass for LSKLocalStatusClient) {
    v6 = &nominal type descriptor for LSKLocalStatusClient == 0LL;
  }
  else {
    v6 = 1;
  }
  return !v6
      && &type metadata for LSKLocalStatusClient != 0LL
      && &type metadata accessor for LSKLocalStatusClient != 0LL
      && &class metadata base offset for LSKLocalStatusClient != 0LL;
}

id sub_100004E9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RDSharerAvailability();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for RDSharerAvailability()
{
  return objc_opt_self(&OBJC_CLASS____TtC8countryd20RDSharerAvailability);
}

id sub_100004F28(uint64_t a1)
{
  return sub_100008F54(a1, type metadata accessor for RDSharerAvailability);
}

void *sub_100004F34(uint64_t a1)
{
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (v2) {
      goto LABEL_3;
    }
LABEL_40:
    swift_bridgeObjectRelease(a1);
    double v59 = COERCE_DOUBLE(&_swiftEmptyDictionarySingleton);
    return *(void **)&v59;
  }

  if (a1 < 0) {
    uint64_t v64 = a1;
  }
  else {
    uint64_t v64 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v64);
  if (!v2) {
    goto LABEL_40;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    id v3 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a1);
  }

  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
      __break(1u);
      goto LABEL_44;
    }

    id v3 = *(id *)(a1 + 32);
  }

  v4 = v3;
  swift_bridgeObjectRelease(a1);
  id v67 = v4;
  id v5 = [v4 countryCode];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;

    uint64_t v10 = sub_100005630(v7, v9);
    uint64_t v12 = v11;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
    double __src = COERCE_DOUBLE(&_swiftEmptyDictionarySingleton);
    sub_10000A174(v10, v12, 0xD000000000000032LL, 0x8000000100010A00LL, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  if (v2 < 1) {
LABEL_44:
  }
    __break(1u);
  double v68 = COERCE_DOUBLE(&_swiftEmptyDictionarySingleton);
  swift_bridgeObjectRetain(a1);
  uint64_t v14 = 0LL;
  v15 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if ((a1 & 0xC000000000000001LL) != 0) {
      id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, a1);
    }
    else {
      id v17 = *(id *)(a1 + 8 * v14 + 32);
    }
    v18 = v17;
    id v19 = [v17 countryCode];
    if (v19)
    {
      v20 = v19;
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v23 = v22;

      if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0) {
        v15 = sub_1000092DC(0LL, *((void *)v15 + 2) + 1LL, 1, v15);
      }
      unint64_t v25 = *((void *)v15 + 2);
      unint64_t v24 = *((void *)v15 + 3);
      if (v25 >= v24 >> 1) {
        v15 = sub_1000092DC((char *)(v24 > 1), v25 + 1, 1, v15);
      }
      *((void *)v15 + 2) = v25 + 1;
      v16 = &v15[16 * v25];
      *((void *)v16 + 4) = v21;
      *((void *)v16 + 5) = v23;
    }

    ++v14;
  }

  while (v2 != v14);
  swift_bridgeObjectRelease(a1);
  v26 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  double __src = 0.0;
  id v28 = [v26 dataWithJSONObject:isa options:0 error:&__src];

  id v29 = *(id *)&__src;
  if (v28)
  {
    uint64_t v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v28);
    unint64_t v32 = v31;

    sub_10000AACC(v30, v32);
    char v33 = swift_isUniquelyReferenced_nonNull_native(*(void *)&v68);
    double __src = v68;
    sub_10000A174(v30, v32, 0xD000000000000033LL, 0x80000001000109C0LL, v33);
    double v68 = __src;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_10000AB10(v30, v32);
  }

  else
  {
    v34 = v29;
    uint64_t v35 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease(v35);
  }

  uint64_t v36 = type metadata accessor for Date(0LL);
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = *(void *)(v37 + 64);
  __chkstk_darwin(v36);
  unint64_t v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  id v40 = [v67 timestamp];
  uint64_t v41 = sub_100008FF8(&qword_100019140);
  uint64_t v42 = __chkstk_darwin(v41);
  v44 = (char *)&v66 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v40)
  {
    __chkstk_darwin(v42);
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v40);

    v45 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
    v45(v44, (char *)&v66 - v39, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v44, 0LL, 1LL, v36);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v44, 1LL, v36) != 1)
    {
      uint64_t v46 = ((uint64_t (*)(char *, char *, uint64_t))v45)((char *)&v66 - v39, v44, v36);
      double __src = Date.timeIntervalSinceReferenceDate.getter(v46);
      uint64_t v47 = sub_10000A724(&__src, &v73);
      uint64_t v49 = v48 & 0xFFFFFFFFFFFFFFLL;
      double v50 = v68;
      char v51 = swift_isUniquelyReferenced_nonNull_native(*(void *)&v68);
      double v69 = v50;
      sub_10000A174(v47, v49, 0xD000000000000030LL, 0x8000000100010980LL, v51);
      double v68 = v69;
      swift_bridgeObjectRelease(0x8000000000000000LL);
      (*(void (**)(char *, uint64_t))(v37 + 8))((char *)&v66 - v39, v36);
      goto LABEL_28;
    }
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v44, 1LL, 1LL, v36);
  }

  sub_10000B53C((uint64_t)v44, &qword_100019140);
LABEL_28:
  LODWORD(v69) = 0;
  int v52 = kRDPrioritySingleLocation;
  id v53 = v67;
  if ([v67 priorityIsAtLeast:kRDPrioritySingleLocation]
    || (int v52 = kRDPriorityNearbyCellsMCC, [v53 priorityIsAtLeast:kRDPriorityNearbyCellsMCC])
    || (int v52 = kRDPriorityServingCellMCC, [v53 priorityIsAtLeast:kRDPriorityServingCellMCC])
    || (int v52 = kRDPriorityWiFiAP, [v53 priorityIsAtLeast:kRDPriorityWiFiAP]))
  {
    LODWORD(v69) = v52;
  }

  uint64_t v54 = sub_10000A724(&v69, (_BYTE *)&v69 + 4);
  uint64_t v56 = v55 & 0xFFFFFFFFFFFFFFLL;
  double v57 = v68;
  char v58 = swift_isUniquelyReferenced_nonNull_native(*(void *)&v68);
  double __src = v57;
  sub_10000A174(v54, v56, 0xD00000000000002FLL, 0x8000000100010910LL, v58);
  double v59 = __src;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  if ([v53 isInDisputedArea])
  {
    unsigned __int8 v70 = [v53 isInDisputedArea];
    uint64_t v60 = sub_10000A724(&v70, v71);
    uint64_t v62 = v61 & 0xFFFFFFFFFFFFFFLL;
    char v63 = swift_isUniquelyReferenced_nonNull_native(*(void *)&v59);
    double __src = v59;
    sub_10000A174(v60, v62, 0xD000000000000031LL, 0x8000000100010940LL, v63);
    double v59 = __src;

    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  else
  {
  }

  return *(void **)&v59;
}

uint64_t sub_100005630(uint64_t a1, unint64_t a2)
{
  *(void *)&__int128 v19 = a1;
  *((void *)&v19 + 1) = a2;
  swift_bridgeObjectRetain(a2);
  uint64_t v2 = sub_100008FF8(&qword_100019328);
  if (!swift_dynamicCast(v17, &v19, &type metadata for String.UTF8View, v2, 6LL))
  {
    uint64_t v18 = 0LL;
    memset(v17, 0, sizeof(v17));
    sub_10000B53C((uint64_t)v17, &qword_100019330);
    if ((a2 & 0x1000000000000000LL) != 0) {
      goto LABEL_20;
    }
    if ((a2 & 0x2000000000000000LL) != 0)
    {
      v20[0] = a1;
      v20[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v7 = (char *)v20 + (HIBYTE(a2) & 0xF);
      unint64_t v8 = v20;
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
        uint64_t v5 = _StringObject.sharedUTF8.getter();
      }

      if (v5) {
        uint64_t v7 = (_BYTE *)(v5 + v6);
      }
      else {
        uint64_t v7 = 0LL;
      }
      unint64_t v8 = (_BYTE *)v5;
    }

    unint64_t v9 = sub_10000A8DC(v8, v7);
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

    *(void *)&v17[0] = sub_10000A940(v12);
    *((void *)&v17[0] + 1) = v13;
    __chkstk_darwin(*(void *)&v17[0]);
    sub_100009AA0();
    __asm { BR              X12 }
  }

  sub_10000B5E8(v17, (uint64_t)v20);
  uint64_t v3 = v21;
  uint64_t v4 = v22;
  sub_10000B600(v20, v21);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)( &v19,  sub_100009D90,  0LL,  &type metadata for Data._Representation,  v3,  v4);
  swift_bridgeObjectRelease(a2);
  v17[0] = v19;
  sub_10000B624(v20);
  return *(void *)&v17[0];
}

uint64_t sub_100005B34()
{
  return 0LL;
}

uint64_t sub_100005B3C()
{
  v1 = (void *)(v0 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient);
  swift_beginAccess(v0 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient, v3, 0LL, 0LL);
  return swift_retain(*v1);
}

uint64_t sub_100005B84(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient);
  swift_beginAccess(v3, v6, 1LL, 0LL);
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
  return swift_release(v4);
}

void *sub_100005BD4(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

uint64_t sub_100005C18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for LSKStatusOptions(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 1LL, 1LL, v2);
}

uint64_t sub_100005C54@<X0>(uint64_t a1@<X8>)
{
  return sub_100005CE0(&OBJC_IVAR____TtC8countryd14RDStatusSharer_options, &qword_100019150, a1);
}

uint64_t sub_100005C68(uint64_t a1)
{
  return sub_100005D50(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_options, &qword_100019150);
}

void *sub_100005C7C(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

uint64_t sub_100005CC0@<X0>(uint64_t a1@<X8>)
{
  return sub_100005E04(&qword_100019158, a1);
}

uint64_t sub_100005CCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100005CE0(&OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey, &qword_100019160, a1);
}

uint64_t sub_100005CE0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess(v6, v8, 0LL, 0LL);
  return sub_10000AEC4(v6, a3, a2);
}

uint64_t sub_100005D3C(uint64_t a1)
{
  return sub_100005D50(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey, &qword_100019160);
}

uint64_t sub_100005D50(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = v3 + *a2;
  swift_beginAccess(v6, v8, 33LL, 0LL);
  sub_10000AB54(a1, v6, a3);
  return swift_endAccess(v8);
}

void *sub_100005DB4(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

uint64_t sub_100005DF8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005E04(&qword_100019168, a1);
}

uint64_t sub_100005E04@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_100008FF8(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(a2, 1LL, 1LL, v3);
}

uint64_t sub_100005E3C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005CE0(&OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey, &qword_100019170, a1);
}

uint64_t sub_100005E50(uint64_t a1)
{
  return sub_100005D50(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey, &qword_100019170);
}

void *sub_100005E64(uint64_t a1)
{
  return &j__swift_endAccess;
}

id sub_100005EAC()
{
  return [objc_allocWithZone(v0) init];
}

id sub_100005ECC()
{
  *(void *)&v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient] = 0LL;
  uint64_t v1 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_options];
  uint64_t v2 = type metadata accessor for LSKStatusOptions(0LL);
  uint64_t v3 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL);
  v3(v1, 1LL, 1LL, v2);
  uint64_t v4 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey];
  uint64_t v5 = sub_100008FF8(&qword_100019158);
  uint64_t v60 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL);
  v60(v4, 1LL, 1LL, v5);
  uint64_t v6 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey];
  uint64_t v7 = sub_100008FF8(&qword_100019168);
  unint64_t v8 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL);
  v8(v6, 1LL, 1LL, v7);
  v63.receiver = v0;
  v63.super_class = (Class)type metadata accessor for RDStatusSharer(0LL);
  id v9 = objc_msgSendSuper2(&v63, "init");
  if (&class metadata base offset for LSKLocalStatusClient) {
    BOOL v10 = &type metadata accessor for LSKLocalStatusClient == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10
    && &type metadata for LSKLocalStatusClient != 0LL
    && &nominal type descriptor for LSKLocalStatusClient != 0LL
    && &metaclass for LSKLocalStatusClient != 0LL)
  {
    uint64_t v14 = type metadata accessor for LSKLocalStatusClient(0LL);
    swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
    uint64_t v55 = (uint64_t *)v3;
    v15 = (char *)v9;
    uint64_t v16 = LSKLocalStatusClient.init()();
    id v17 = (uint64_t *)&v15[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient];
    uint64_t v54 = v15;
    swift_beginAccess(&v15[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient], v62, 1LL, 0LL);
    uint64_t v18 = *v17;
    *id v17 = v16;
    swift_release(v18);
    sub_100008FF8(&qword_100019150);
    id v59 = v9;
    ((void (*)(void))__chkstk_darwin)();
    v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    type metadata accessor for LSKStatusOptions.Scope(0LL);
    ((void (*)(void))__chkstk_darwin)();
    char v58 = v8;
    uint64_t v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *, void))(v23 + 104))(v22, enum case for LSKStatusOptions.Scope.sameAccount(_:));
    uint64_t v24 = sub_100008FF8(&qword_100019178);
    uint64_t v25 = type metadata accessor for LSKStatusOptions.DeviceType(0LL);
    uint64_t v56 = v5;
    uint64_t v57 = v7;
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)(v25 - 8);
    uint64_t v28 = *(unsigned __int8 *)(v27 + 80);
    uint64_t v29 = (v28 + 32) & ~v28;
    uint64_t v30 = swift_allocObject(v24, v29 + *(void *)(v27 + 72), v28 | 7);
    *(_OWORD *)(v30 + 16) = xmmword_1000107F0;
    (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))( v30 + v29,  enum case for LSKStatusOptions.DeviceType.n301(_:),  v26);
    LSKStatusOptions.init(scope:publishToDeviceTypes:)(v22, v30);
    ((void (*)(char *, void, uint64_t, uint64_t))v55)(v20, 0LL, 1LL, v2);
    uint64_t v31 = (uint64_t)&v15[OBJC_IVAR____TtC8countryd14RDStatusSharer_options];
    swift_beginAccess(&v15[OBJC_IVAR____TtC8countryd14RDStatusSharer_options], v61, 33LL, 0LL);
    sub_10000AB54((uint64_t)v20, v31, &qword_100019150);
    swift_endAccess(v61);
    sub_100008FF8(&qword_100019160);
    uint64_t v55 = &v53;
    ((void (*)(void))__chkstk_darwin)();
    char v33 = (char *)&v53 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v34 = type metadata accessor for LSKDomain(0LL);
    uint64_t v35 = *(void *)(*(void *)(v34 - 8) + 64LL);
    ((void (*)(void))__chkstk_darwin)();
    unint64_t v36 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v37 = enum case for LSKDomain.regulatory(_:);
    unint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 104);
    v39((char *)&v53 - v36, enum case for LSKDomain.regulatory(_:), v34);
    uint64_t v40 = sub_100008FF8(&qword_100019180);
    uint64_t v41 = sub_10000AC5C( &qword_100019188,  (void (*)(void))sub_10000AC18,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    uint64_t v42 = sub_10000AC5C( &qword_100019198,  (void (*)(void))sub_10000ACD0,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    LSKKey.init(domain:name:)((char *)&v53 - v36, 0xD00000000000002DLL, 0x8000000100010A40LL, v40, v41, v42);
    v60(v33, 0LL, 1LL, v56);
    uint64_t v43 = v54;
    uint64_t v44 = (uint64_t)&v54[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey];
    swift_beginAccess(&v54[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey], v61, 33LL, 0LL);
    sub_10000AB54((uint64_t)v33, v44, &qword_100019160);
    swift_endAccess(v61);
    sub_100008FF8(&qword_100019170);
    uint64_t v45 = ((uint64_t (*)(void))__chkstk_darwin)();
    uint64_t v47 = (char *)&v53 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    __chkstk_darwin(v45);
    v39((char *)&v53 - v36, v37, v34);
    uint64_t v48 = sub_100008FF8(&qword_1000191A8);
    unint64_t v49 = sub_10000AD14();
    unint64_t v50 = sub_10000AD98();
    id v9 = v59;
    LSKKey.init(domain:name:)((char *)&v53 - v36, 0xD00000000000002FLL, 0x8000000100010A70LL, v48, v49, v50);

    v58(v47, 0LL, 1LL, v57);
    uint64_t v51 = (uint64_t)v43 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey;
    swift_beginAccess(v51, v61, 33LL, 0LL);
    sub_10000AB54((uint64_t)v47, v51, &qword_100019170);
    swift_endAccess(v61);
  }

  return v9;
}

uint64_t sub_1000064B8(uint64_t a1)
{
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = v1;
  return swift_task_switch(sub_1000064D0, 0LL, 0LL);
}

uint64_t sub_1000064D0(uint64_t a1, uint64_t a2)
{
  if (&class metadata base offset for LSKLocalStatusClient) {
    BOOL v3 = &type metadata accessor for LSKLocalStatusClient == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3
    || &type metadata for LSKLocalStatusClient == 0LL
    || &nominal type descriptor for LSKLocalStatusClient == 0LL
    || &metaclass for LSKLocalStatusClient == 0LL)
  {
    uint64_t v16 = static os_log_type_t.info.getter(a1, a2);
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    id v17 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)( v16,  &_mh_execute_header,  v17,  "No LSK available on this platform, exiting",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    return (*(uint64_t (**)(void))(v2 + 8))();
  }

  uint64_t v7 = (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v2 + 112)) + 0x70LL))();
  *(void *)(v2 + 120) = v7;
  if (!v7) {
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  uint64_t v8 = v7;
  id v9 = *(void **)(v2 + 112);
  uint64_t v10 = sub_100008FF8(&qword_100019158);
  *(void *)(v2 + 128) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v2 + 136) = v11;
  uint64_t v12 = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v2 + 144) = v12;
  uint64_t v13 = sub_100008FF8(&qword_100019160);
  uint64_t v14 = swift_task_alloc((*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(void))((swift_isaMask & *v9) + 0xA0LL))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v14, 1LL, v10) == 1)
  {
    swift_release(v8);
    sub_10000B53C(v14, &qword_100019160);
    uint64_t v15 = v14;
LABEL_20:
    swift_task_dealloc(v15);
    swift_task_dealloc(v12);
    return (*(uint64_t (**)(void))(v2 + 8))();
  }

  uint64_t v18 = *(void **)(v2 + 112);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12, v14, v10);
  swift_task_dealloc(v14);
  uint64_t v19 = type metadata accessor for LSKStatusOptions(0LL);
  *(void *)(v2 + 152) = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  *(void *)(v2 + 160) = v20;
  uint64_t v39 = swift_task_alloc((*(void *)(v20 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v2 + 168) = v39;
  uint64_t v21 = sub_100008FF8(&qword_100019150);
  uint64_t v22 = swift_task_alloc((*(void *)(*(void *)(v21 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(void))((swift_isaMask & *v18) + 0x88LL))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v22, 1LL, v19) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    swift_release(v8);
    sub_10000B53C(v22, &qword_100019150);
    swift_task_dealloc(v22);
    uint64_t v15 = v39;
    goto LABEL_20;
  }

  uint64_t v24 = *(void *)(v2 + 104);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v39, v22, v19);
  swift_task_dealloc(v22);
  uint64_t v25 = sub_100008FF8(&qword_1000191C8);
  *(void *)(v2 + 176) = v25;
  uint64_t v26 = *(void *)(*(void *)(v25 - 8) + 64LL);
  *(void *)(v2 + 184) = v26;
  uint64_t v27 = swift_task_alloc((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v2 + 192) = v27;
  if (v24)
  {
    uint64_t v28 = *(void **)(v2 + 104);
    uint64_t v29 = sub_100008FF8(&qword_100019230);
    uint64_t inited = swift_initStackObject(v29, v2 + 16);
    *(_OWORD *)(inited + 16) = xmmword_100010800;
    *(void *)(inited + 32) = v28;
    uint64_t v40 = inited;
    specialized Array._endMutation()();
    id v31 = v28;
    unint64_t v32 = (unint64_t)sub_100004F34(v40);
    swift_bridgeObjectRelease(v40);
  }

  else
  {
    unint64_t v32 = sub_10000771C((uint64_t)&_swiftEmptyArrayStorage);
  }

  *(void *)(v2 + 200) = v32;
  uint64_t v33 = *(int *)(v25 + 48);
  *(_DWORD *)(v2 + 336) = v33;
  uint64_t v34 = v27 + v33;
  *(void *)(v2 + 72) = v32;
  uint64_t v35 = (void *)swift_task_alloc(async function pointer to LSKLocalStatusClient.publish<A>(_:for:options:)[1]);
  *(void *)(v2 + 208) = v35;
  uint64_t v36 = sub_100008FF8(&qword_100019180);
  uint64_t v37 = sub_10000AC5C( &qword_100019188,  (void (*)(void))sub_10000AC18,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
  uint64_t v38 = sub_10000AC5C( &qword_100019198,  (void (*)(void))sub_10000ACD0,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
  sub_10000AE1C();
  *uint64_t v35 = v2;
  v35[1] = sub_100006934;
  return LSKLocalStatusClient.publish<A>(_:for:options:)(v27, v34, v2 + 72, v12, v39, v36, v37, v38);
}

uint64_t sub_100006934()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 200LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 208LL);
  *(void *)(*(void *)v1 + 216LL) = v0;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v3);
  if (v0) {
    uint64_t v4 = sub_10000768C;
  }
  else {
    uint64_t v4 = sub_1000069A0;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000069A0()
{
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = v1 + *(int *)(v0 + 336);
  unint64_t v4 = (*(void *)(v0 + 184) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = sub_100008FF8(&qword_1000191E0);
  *(void *)(v0 + 224) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)(v0 + 232) = v6;
  uint64_t v7 = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v0 + 240) = v7;
  uint64_t v8 = swift_task_alloc(v4);
  uint64_t v9 = v8 + *(int *)(v2 + 48);
  uint64_t v10 = sub_100008FF8(&qword_1000191E8);
  *(void *)(v0 + 248) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v0 + 256) = v11;
  uint64_t v61 = *(void (**)(void))(v11 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v8, v1, v10);
  sub_10000AEC4(v3, v9, &qword_1000191F0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v9, 1LL, v5) == 1)
  {
    uint64_t v12 = *(void *)(v0 + 176);
    uint64_t v13 = *(void *)(v0 + 192) + *(int *)(v0 + 336);
    unint64_t v14 = (*(void *)(v0 + 184) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
    sub_10000B53C(v9, &qword_1000191F0);
    char v58 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v58(v8, v10);
    swift_task_dealloc(v8);
    uint64_t v15 = swift_task_dealloc(v7);
    os_log_type_t v16 = static os_log_type_t.error.getter(v15);
    uint64_t v17 = swift_task_alloc(v14);
    uint64_t v18 = v17 + *(int *)(v12 + 48);
    v61();
    sub_10000AEC4(v13, v18, &qword_1000191F0);
    uint64_t v19 = swift_task_alloc(v14);
    uint64_t v60 = v17;
    sub_10000AF08(v17, v19);
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v20 = (os_log_s *)static OS_os_log.default.getter();
    BOOL v21 = os_log_type_enabled(v20, v16);
    uint64_t v59 = *(void *)(v0 + 192);
    if (v21)
    {
      uint64_t v22 = *(void *)(v0 + 176);
      uint64_t v52 = *(void *)(v0 + 160);
      uint64_t v53 = *(void *)(v0 + 152);
      uint64_t v54 = *(void *)(v0 + 136);
      uint64_t v55 = *(void *)(v0 + 168);
      uint64_t v56 = *(void *)(v0 + 128);
      uint64_t v57 = *(void *)(v0 + 144);
      uint64_t v51 = *(void *)(v0 + 120);
      os_log_type_t type = v16;
      unint64_t v23 = (*(void *)(v0 + 184) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v49 = swift_slowAlloc(32LL, -1LL);
      uint64_t v62 = v49;
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v25 = swift_task_alloc(v23);
      uint64_t v26 = *(int *)(v22 + 48);
      uint64_t v27 = v25 + v26;
      uint64_t v28 = v19 + v26;
      v61();
      sub_10000AEC4(v28, v27, &qword_1000191F0);
      uint64_t v29 = LSKPublishedStatus.debugDescription.getter(v10);
      unint64_t v31 = v30;
      v58(v25, v10);
      sub_10000B53C(v27, &qword_1000191F0);
      swift_task_dealloc(v25);
      *(void *)(v0 + 80) = sub_1000093E8(v29, v31, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v24 + 4, v24 + 12);
      swift_bridgeObjectRelease(v31);
      sub_10000B53C(v19, &qword_1000191C8);
      _os_log_impl((void *)&_mh_execute_header, v20, type, "Not scanning for deliveries? %s", v24, 0xCu);
      swift_arrayDestroy(v49, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_release(v51);

      sub_10000B53C(v59, &qword_1000191C8);
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v55, v53);
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v57, v56);
      swift_task_dealloc(v19);
      swift_task_dealloc(v60);
    }

    else
    {
      uint64_t v41 = *(void *)(v0 + 160);
      uint64_t v40 = *(void *)(v0 + 168);
      uint64_t v43 = *(void *)(v0 + 144);
      uint64_t v42 = *(void *)(v0 + 152);
      uint64_t v44 = *(void *)(v0 + 128);
      uint64_t v45 = *(void *)(v0 + 136);
      uint64_t v46 = *(void *)(v0 + 120);

      swift_release(v46);
      sub_10000B53C(v19, &qword_1000191C8);
      swift_task_dealloc(v19);
      swift_task_dealloc(v60);
      sub_10000B53C(v59, &qword_1000191C8);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v43, v44);
    }

    uint64_t v47 = *(void *)(v0 + 168);
    uint64_t v48 = *(void *)(v0 + 144);
    swift_task_dealloc(*(void *)(v0 + 192));
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v7, v9, v5);
    unint64_t v32 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    *(void *)(v0 + 264) = v32;
    v32(v8, v10);
    swift_task_dealloc(v8);
    uint64_t v33 = sub_100008FF8(&qword_1000191F8);
    *(void *)(v0 + 272) = v33;
    uint64_t v34 = *(void *)(v33 - 8);
    *(void *)(v0 + 280) = v34;
    *(void *)(v0 + 288) = swift_task_alloc((*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    LSKPublishedStatusSequence.makeAsyncIterator()(v5);
    uint64_t v35 = sub_100008FF8(&qword_100019200);
    uint64_t v36 = swift_task_alloc((*(void *)(*(void *)(v35 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    *(void *)(v0 + 296) = v36;
    unint64_t v37 = sub_10000AF50();
    *(void *)(v0 + 304) = v37;
    uint64_t v38 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(void *)(v0 + 312) = v38;
    *uint64_t v38 = v0;
    v38[1] = sub_100006F04;
    return dispatch thunk of AsyncIteratorProtocol.next()(v36, v33, v37);
  }
}

uint64_t sub_100006F04()
{
  uint64_t v2 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 312));
  if (v0)
  {
    *(void *)(v2 + 320) = v0;
    uint64_t v3 = sub_1000074C0;
  }

  else
  {
    uint64_t v3 = sub_100006F68;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100006F68()
{
  uint64_t v1 = *(void *)(v0 + 296);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 256);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 288);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 280) + 8LL))(v4, *(void *)(v0 + 272));
    swift_task_dealloc(v1);
    uint64_t v5 = swift_task_dealloc(v4);
    LOBYTE(v4) = static os_log_type_t.info.getter(v5, v6);
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v7 = (os_log_s *)static OS_os_log.default.getter();
    os_log_type_t type = v4;
    BOOL v8 = os_log_type_enabled(v7, (os_log_type_t)v4);
    uint64_t v9 = *(void *)(v0 + 240);
    uint64_t v58 = *(void *)(v0 + 232);
    uint64_t v60 = *(void *)(v0 + 224);
    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v12 = *(void *)(v0 + 160);
    uint64_t v11 = *(void *)(v0 + 168);
    uint64_t v13 = *(void *)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 152);
    uint64_t v15 = *(void *)(v0 + 128);
    uint64_t v16 = *(void *)(v0 + 136);
    uint64_t v56 = *(void *)(v0 + 120);
    if (v8)
    {
      uint64_t v54 = *(void *)(v0 + 144);
      uint64_t v53 = *(void *)(v0 + 160);
      uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v48 = swift_slowAlloc(32LL, -1LL);
      uint64_t v62 = v48;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v50 = v9;
      uint64_t v18 = type metadata accessor for Date(0LL);
      uint64_t v52 = v11;
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      static Date.now.getter();
      uint64_t v51 = v15;
      uint64_t v21 = type metadata accessor for Date.ISO8601FormatStyle(0LL);
      uint64_t v49 = v14;
      uint64_t v22 = *(void *)(v21 - 8);
      uint64_t v47 = v10;
      uint64_t v23 = swift_task_alloc((*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      static FormatStyle<>.iso8601.getter();
      unint64_t v24 = sub_10000AF9C();
      Date.formatted<A>(_:)(v23, v21, v24);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v21);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
      swift_task_dealloc(v23);
      swift_task_dealloc(v20);
      unint64_t v25 = *(void *)(v0 + 64);
      *(void *)(v0 + 96) = sub_1000093E8(*(void *)(v0 + 56), v25, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease(v25);
      _os_log_impl((void *)&_mh_execute_header, v7, type, "Deliveries completed at %s", v17, 0xCu);
      swift_arrayDestroy(v48, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_release(v56);

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v50, v60);
      sub_10000B53C(v47, &qword_1000191C8);
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v49);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v54, v51);
    }

    else
    {

      swift_release(v56);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v9, v60);
      sub_10000B53C(v10, &qword_1000191C8);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v13, v15);
    }

    swift_task_dealloc(*(void *)(v0 + 240));
    uint64_t v43 = *(void *)(v0 + 168);
    uint64_t v44 = *(void *)(v0 + 144);
    swift_task_dealloc(*(void *)(v0 + 192));
    swift_task_dealloc(v43);
    swift_task_dealloc(v44);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    uint64_t v57 = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v57, v1, v2);
    unsigned int v59 = static os_log_type_t.info.getter(v26, v27);
    uint64_t v28 = sub_100008FF8(&qword_100019220);
    uint64_t v29 = swift_allocObject(v28, 112LL, 7LL);
    *(_OWORD *)(v29 + 16) = xmmword_100010810;
    uint64_t v30 = type metadata accessor for Date(0LL);
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = swift_task_alloc((*(void *)(v31 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    static Date.now.getter();
    uint64_t v33 = type metadata accessor for Date.ISO8601FormatStyle(0LL);
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = swift_task_alloc((*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    static FormatStyle<>.iso8601.getter();
    *(void *)(v29 + 56) = &type metadata for String;
    unint64_t v36 = sub_10000AFE4();
    *(void *)(v29 + 64) = v36;
    unint64_t v37 = sub_10000AF9C();
    Date.formatted<A>(_:)(v35, v33, v37);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v30);
    swift_task_dealloc(v35);
    swift_task_dealloc(v32);
    uint64_t v38 = LSKPublishedStatus.debugDescription.getter(v2);
    *(void *)(v29 + 96) = &type metadata for String;
    *(void *)(v29 + 104) = v36;
    *(void *)(v29 + 72) = v38;
    *(void *)(v29 + 80) = v39;
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v40 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v40, "Delivered at %s with status %s", v45, v46);

    swift_bridgeObjectRelease(v29);
    v61(v57, v2);
    swift_task_dealloc(v57);
    uint64_t v41 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(void *)(v0 + 328) = v41;
    *uint64_t v41 = v0;
    v41[1] = sub_100007628;
    return dispatch thunk of AsyncIteratorProtocol.next()( *(void *)(v0 + 296),  *(void *)(v0 + 272),  *(void *)(v0 + 304));
  }

uint64_t sub_1000074C0()
{
  *(void *)(v0 + 88) = *(void *)(v0 + 320);
  uint64_t v1 = sub_100008FF8(&qword_100019210);
  swift_willThrowTypedImpl(v0 + 88, v1, &protocol self-conformance witness table for Error);
  return swift_task_switch(sub_100007520, 0LL, 0LL);
}

uint64_t sub_100007520()
{
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 224);
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v8 = *(void *)(v0 + 160);
  uint64_t v9 = *(void *)(v0 + 152);
  uint64_t v16 = *(void *)(v0 + 144);
  uint64_t v17 = *(void *)(v0 + 296);
  uint64_t v13 = *(void *)(v0 + 136);
  uint64_t v14 = *(void *)(v0 + 168);
  uint64_t v15 = *(void *)(v0 + 128);
  swift_release(*(void *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  sub_10000B53C(v7, &qword_1000191C8);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v14, v9);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v15);
  swift_task_dealloc(v17);
  swift_task_dealloc(v1);
  swift_task_dealloc(v5);
  uint64_t v10 = *(void *)(v0 + 168);
  uint64_t v11 = *(void *)(v0 + 144);
  swift_task_dealloc(*(void *)(v0 + 192));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007628()
{
  uint64_t v2 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 328));
  if (v0)
  {
    *(void *)(v2 + 320) = v0;
    uint64_t v3 = sub_1000074C0;
  }

  else
  {
    uint64_t v3 = sub_100006F68;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000768C()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 136);
  swift_release(*(void *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  uint64_t v7 = *(void *)(v0 + 168);
  uint64_t v8 = *(void *)(v0 + 144);
  swift_task_dealloc(*(void *)(v0 + 192));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_10000771C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100008FF8(&qword_100019320);
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
  uint64_t v6 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v7 = *(v6 - 3);
    uint64_t v8 = *(v6 - 2);
    uint64_t v9 = *(v6 - 1);
    unint64_t v10 = *v6;
    swift_bridgeObjectRetain(v8);
    sub_10000AACC(v9, v10);
    unint64_t result = sub_100009E04(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v13 = v7;
    v13[1] = v8;
    uint64_t v14 = (uint64_t *)(v4[7] + 16 * result);
    *uint64_t v14 = v9;
    v14[1] = v10;
    uint64_t v15 = v4[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v6 += 4;
    v4[2] = v17;
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

uint64_t sub_100007970(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_1000191C4;
  id v7 = a1;
  id v8 = a3;
  uint64_t v9 = (void *)swift_task_alloc(v6);
  v3[5] = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_1000079FC;
  v9[13] = a1;
  v9[14] = v8;
  return swift_task_switch(sub_1000064D0, 0LL, 0LL);
}

uint64_t sub_1000079FC()
{
  uint64_t v2 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v3 = *(void **)(*v1 + 24);
  uint64_t v5 = *v1;
  swift_task_dealloc(v2);

  uint64_t v6 = *(void *)(v5 + 32);
  if (v0)
  {
    id v7 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

  else
  {
    (*(void (**)(void, void))(v6 + 16))(*(void *)(v5 + 32), 0LL);
  }

  _Block_release(*(const void **)(v5 + 32));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_100007AA0(uint64_t a1)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = v1;
  return swift_task_switch(sub_100007AB8, 0LL, 0LL);
}

uint64_t sub_100007AB8(uint64_t a1, uint64_t a2)
{
  if (&class metadata base offset for LSKLocalStatusClient) {
    BOOL v3 = &type metadata accessor for LSKLocalStatusClient == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3
    || &type metadata for LSKLocalStatusClient == 0LL
    || &nominal type descriptor for LSKLocalStatusClient == 0LL
    || &metaclass for LSKLocalStatusClient == 0LL)
  {
    uint64_t v16 = static os_log_type_t.info.getter(a1, a2);
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v17 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)( v16,  &_mh_execute_header,  v17,  "No LSK available on this platform, exiting",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    return (*(uint64_t (**)(void))(v2 + 8))();
  }

  uint64_t v7 = (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v2 + 72)) + 0x70LL))();
  *(void *)(v2 + 80) = v7;
  if (!v7) {
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void **)(v2 + 72);
  uint64_t v10 = sub_100008FF8(&qword_100019158);
  *(void *)(v2 + 88) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v2 + 96) = v11;
  uint64_t v12 = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v2 + 104) = v12;
  uint64_t v13 = sub_100008FF8(&qword_100019160);
  uint64_t v14 = swift_task_alloc((*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(void))((swift_isaMask & *v9) + 0xA0LL))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v14, 1LL, v10) == 1)
  {
    swift_release(v8);
    sub_10000B53C(v14, &qword_100019160);
    uint64_t v15 = v14;
LABEL_20:
    swift_task_dealloc(v15);
    swift_task_dealloc(v12);
    return (*(uint64_t (**)(void))(v2 + 8))();
  }

  uint64_t v18 = *(void **)(v2 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12, v14, v10);
  swift_task_dealloc(v14);
  uint64_t v19 = type metadata accessor for LSKStatusOptions(0LL);
  *(void *)(v2 + 112) = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  *(void *)(v2 + 120) = v20;
  uint64_t v35 = swift_task_alloc((*(void *)(v20 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v2 + 128) = v35;
  uint64_t v21 = sub_100008FF8(&qword_100019150);
  uint64_t v22 = swift_task_alloc((*(void *)(*(void *)(v21 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(void))((swift_isaMask & *v18) + 0x88LL))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v22, 1LL, v19) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    swift_release(v8);
    sub_10000B53C(v22, &qword_100019150);
    swift_task_dealloc(v22);
    uint64_t v15 = v35;
    goto LABEL_20;
  }

  uint64_t v24 = *(void *)(v2 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v35, v22, v19);
  swift_task_dealloc(v22);
  uint64_t v25 = sub_100008FF8(&qword_1000191C8);
  *(void *)(v2 + 136) = v25;
  uint64_t v26 = *(void *)(*(void *)(v25 - 8) + 64LL);
  *(void *)(v2 + 144) = v26;
  uint64_t v27 = swift_task_alloc((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v2 + 152) = v27;
  if (v24) {
    unint64_t v28 = (unint64_t)sub_100004F34(*(void *)(v2 + 64));
  }
  else {
    unint64_t v28 = sub_10000771C((uint64_t)&_swiftEmptyArrayStorage);
  }
  *(void *)(v2 + 160) = v28;
  uint64_t v29 = *(int *)(v25 + 48);
  *(_DWORD *)(v2 + 296) = v29;
  uint64_t v30 = v27 + v29;
  *(void *)(v2 + 32) = v28;
  uint64_t v31 = (void *)swift_task_alloc(async function pointer to LSKLocalStatusClient.publish<A>(_:for:options:)[1]);
  *(void *)(v2 + 168) = v31;
  uint64_t v32 = sub_100008FF8(&qword_100019180);
  uint64_t v33 = sub_10000AC5C( &qword_100019188,  (void (*)(void))sub_10000AC18,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
  uint64_t v34 = sub_10000AC5C( &qword_100019198,  (void (*)(void))sub_10000ACD0,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
  sub_10000AE1C();
  *uint64_t v31 = v2;
  v31[1] = sub_100007ECC;
  return LSKLocalStatusClient.publish<A>(_:for:options:)(v27, v30, v2 + 32, v12, v35, v32, v33, v34);
}

uint64_t sub_100007ECC()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 160LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 168LL);
  *(void *)(*(void *)v1 + 176LL) = v0;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v3);
  if (v0) {
    uint64_t v4 = sub_100008C24;
  }
  else {
    uint64_t v4 = sub_100007F38;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100007F38()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = v1 + *(int *)(v0 + 296);
  unint64_t v4 = (*(void *)(v0 + 144) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = sub_100008FF8(&qword_1000191E0);
  *(void *)(v0 + 184) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)(v0 + 192) = v6;
  uint64_t v7 = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v0 + 200) = v7;
  uint64_t v8 = swift_task_alloc(v4);
  uint64_t v9 = v8 + *(int *)(v2 + 48);
  uint64_t v10 = sub_100008FF8(&qword_1000191E8);
  *(void *)(v0 + 208) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v0 + 216) = v11;
  uint64_t v61 = *(void (**)(void))(v11 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v8, v1, v10);
  sub_10000AEC4(v3, v9, &qword_1000191F0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v9, 1LL, v5) == 1)
  {
    uint64_t v12 = *(void *)(v0 + 136);
    uint64_t v13 = *(void *)(v0 + 152) + *(int *)(v0 + 296);
    unint64_t v14 = (*(void *)(v0 + 144) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
    sub_10000B53C(v9, &qword_1000191F0);
    uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v58(v8, v10);
    swift_task_dealloc(v8);
    uint64_t v15 = swift_task_dealloc(v7);
    os_log_type_t v16 = static os_log_type_t.error.getter(v15);
    uint64_t v17 = swift_task_alloc(v14);
    uint64_t v18 = v17 + *(int *)(v12 + 48);
    v61();
    sub_10000AEC4(v13, v18, &qword_1000191F0);
    uint64_t v19 = swift_task_alloc(v14);
    uint64_t v60 = v17;
    sub_10000AF08(v17, v19);
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v20 = (os_log_s *)static OS_os_log.default.getter();
    BOOL v21 = os_log_type_enabled(v20, v16);
    uint64_t v59 = *(void *)(v0 + 152);
    if (v21)
    {
      uint64_t v22 = *(void *)(v0 + 136);
      uint64_t v52 = *(void *)(v0 + 120);
      uint64_t v53 = *(void *)(v0 + 112);
      uint64_t v54 = *(void *)(v0 + 96);
      uint64_t v55 = *(void *)(v0 + 128);
      uint64_t v56 = *(void *)(v0 + 88);
      uint64_t v57 = *(void *)(v0 + 104);
      uint64_t v51 = *(void *)(v0 + 80);
      os_log_type_t type = v16;
      unint64_t v23 = (*(void *)(v0 + 144) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v49 = swift_slowAlloc(32LL, -1LL);
      uint64_t v62 = v49;
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v25 = swift_task_alloc(v23);
      uint64_t v26 = *(int *)(v22 + 48);
      uint64_t v27 = v25 + v26;
      uint64_t v28 = v19 + v26;
      v61();
      sub_10000AEC4(v28, v27, &qword_1000191F0);
      uint64_t v29 = LSKPublishedStatus.debugDescription.getter(v10);
      unint64_t v31 = v30;
      v58(v25, v10);
      sub_10000B53C(v27, &qword_1000191F0);
      swift_task_dealloc(v25);
      *(void *)(v0 + 40) = sub_1000093E8(v29, v31, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v24 + 4, v24 + 12);
      swift_bridgeObjectRelease(v31);
      sub_10000B53C(v19, &qword_1000191C8);
      _os_log_impl((void *)&_mh_execute_header, v20, type, "Not scanning for deliveries? %s", v24, 0xCu);
      swift_arrayDestroy(v49, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_release(v51);

      sub_10000B53C(v59, &qword_1000191C8);
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v55, v53);
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v57, v56);
      swift_task_dealloc(v19);
      swift_task_dealloc(v60);
    }

    else
    {
      uint64_t v41 = *(void *)(v0 + 120);
      uint64_t v40 = *(void *)(v0 + 128);
      uint64_t v43 = *(void *)(v0 + 104);
      uint64_t v42 = *(void *)(v0 + 112);
      uint64_t v44 = *(void *)(v0 + 88);
      uint64_t v45 = *(void *)(v0 + 96);
      uint64_t v46 = *(void *)(v0 + 80);

      swift_release(v46);
      sub_10000B53C(v19, &qword_1000191C8);
      swift_task_dealloc(v19);
      swift_task_dealloc(v60);
      sub_10000B53C(v59, &qword_1000191C8);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v43, v44);
    }

    uint64_t v47 = *(void *)(v0 + 128);
    uint64_t v48 = *(void *)(v0 + 104);
    swift_task_dealloc(*(void *)(v0 + 152));
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v7, v9, v5);
    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    *(void *)(v0 + 224) = v32;
    v32(v8, v10);
    swift_task_dealloc(v8);
    uint64_t v33 = sub_100008FF8(&qword_1000191F8);
    *(void *)(v0 + 232) = v33;
    uint64_t v34 = *(void *)(v33 - 8);
    *(void *)(v0 + 240) = v34;
    *(void *)(v0 + 248) = swift_task_alloc((*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    LSKPublishedStatusSequence.makeAsyncIterator()(v5);
    uint64_t v35 = sub_100008FF8(&qword_100019200);
    uint64_t v36 = swift_task_alloc((*(void *)(*(void *)(v35 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    *(void *)(v0 + 256) = v36;
    unint64_t v37 = sub_10000AF50();
    *(void *)(v0 + 264) = v37;
    uint64_t v38 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(void *)(v0 + 272) = v38;
    *uint64_t v38 = v0;
    v38[1] = sub_10000849C;
    return dispatch thunk of AsyncIteratorProtocol.next()(v36, v33, v37);
  }

uint64_t sub_10000849C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 272));
  if (v0)
  {
    *(void *)(v2 + 280) = v0;
    uint64_t v3 = sub_100008A58;
  }

  else
  {
    uint64_t v3 = sub_100008500;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100008500()
{
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 216);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 248);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 240) + 8LL))(v4, *(void *)(v0 + 232));
    swift_task_dealloc(v1);
    uint64_t v5 = swift_task_dealloc(v4);
    LOBYTE(v4) = static os_log_type_t.info.getter(v5, v6);
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v7 = (os_log_s *)static OS_os_log.default.getter();
    os_log_type_t type = v4;
    BOOL v8 = os_log_type_enabled(v7, (os_log_type_t)v4);
    uint64_t v9 = *(void *)(v0 + 200);
    uint64_t v58 = *(void *)(v0 + 192);
    uint64_t v60 = *(void *)(v0 + 184);
    uint64_t v10 = *(void *)(v0 + 152);
    uint64_t v12 = *(void *)(v0 + 120);
    uint64_t v11 = *(void *)(v0 + 128);
    uint64_t v13 = *(void *)(v0 + 104);
    uint64_t v14 = *(void *)(v0 + 112);
    uint64_t v15 = *(void *)(v0 + 88);
    uint64_t v16 = *(void *)(v0 + 96);
    uint64_t v56 = *(void *)(v0 + 80);
    if (v8)
    {
      uint64_t v54 = *(void *)(v0 + 104);
      uint64_t v53 = *(void *)(v0 + 120);
      uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v48 = swift_slowAlloc(32LL, -1LL);
      uint64_t v62 = v48;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v50 = v9;
      uint64_t v18 = type metadata accessor for Date(0LL);
      uint64_t v52 = v11;
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      static Date.now.getter();
      uint64_t v51 = v15;
      uint64_t v21 = type metadata accessor for Date.ISO8601FormatStyle(0LL);
      uint64_t v49 = v14;
      uint64_t v22 = *(void *)(v21 - 8);
      uint64_t v47 = v10;
      uint64_t v23 = swift_task_alloc((*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      static FormatStyle<>.iso8601.getter();
      unint64_t v24 = sub_10000AF9C();
      Date.formatted<A>(_:)(v23, v21, v24);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v21);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
      swift_task_dealloc(v23);
      swift_task_dealloc(v20);
      unint64_t v25 = *(void *)(v0 + 24);
      *(void *)(v0 + 56) = sub_1000093E8(*(void *)(v0 + 16), v25, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease(v25);
      _os_log_impl((void *)&_mh_execute_header, v7, type, "Deliveries completed at %s", v17, 0xCu);
      swift_arrayDestroy(v48, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_release(v56);

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v50, v60);
      sub_10000B53C(v47, &qword_1000191C8);
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v49);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v54, v51);
    }

    else
    {

      swift_release(v56);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v9, v60);
      sub_10000B53C(v10, &qword_1000191C8);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v13, v15);
    }

    swift_task_dealloc(*(void *)(v0 + 200));
    uint64_t v43 = *(void *)(v0 + 128);
    uint64_t v44 = *(void *)(v0 + 104);
    swift_task_dealloc(*(void *)(v0 + 152));
    swift_task_dealloc(v43);
    swift_task_dealloc(v44);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
    uint64_t v57 = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v57, v1, v2);
    unsigned int v59 = static os_log_type_t.info.getter(v26, v27);
    uint64_t v28 = sub_100008FF8(&qword_100019220);
    uint64_t v29 = swift_allocObject(v28, 112LL, 7LL);
    *(_OWORD *)(v29 + 16) = xmmword_100010810;
    uint64_t v30 = type metadata accessor for Date(0LL);
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = swift_task_alloc((*(void *)(v31 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    static Date.now.getter();
    uint64_t v33 = type metadata accessor for Date.ISO8601FormatStyle(0LL);
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = swift_task_alloc((*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    static FormatStyle<>.iso8601.getter();
    *(void *)(v29 + 56) = &type metadata for String;
    unint64_t v36 = sub_10000AFE4();
    *(void *)(v29 + 64) = v36;
    unint64_t v37 = sub_10000AF9C();
    Date.formatted<A>(_:)(v35, v33, v37);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v30);
    swift_task_dealloc(v35);
    swift_task_dealloc(v32);
    uint64_t v38 = LSKPublishedStatus.debugDescription.getter(v2);
    *(void *)(v29 + 96) = &type metadata for String;
    *(void *)(v29 + 104) = v36;
    *(void *)(v29 + 72) = v38;
    *(void *)(v29 + 80) = v39;
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v40 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v40, "Delivered at %s with status %s", v45, v46);

    swift_bridgeObjectRelease(v29);
    v61(v57, v2);
    swift_task_dealloc(v57);
    uint64_t v41 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(void *)(v0 + 288) = v41;
    *uint64_t v41 = v0;
    v41[1] = sub_100008BC0;
    return dispatch thunk of AsyncIteratorProtocol.next()( *(void *)(v0 + 256),  *(void *)(v0 + 232),  *(void *)(v0 + 264));
  }

uint64_t sub_100008A58()
{
  *(void *)(v0 + 48) = *(void *)(v0 + 280);
  uint64_t v1 = sub_100008FF8(&qword_100019210);
  swift_willThrowTypedImpl(v0 + 48, v1, &protocol self-conformance witness table for Error);
  return swift_task_switch(sub_100008AB8, 0LL, 0LL);
}

uint64_t sub_100008AB8()
{
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 240);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 200);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 152);
  uint64_t v8 = *(void *)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 112);
  uint64_t v16 = *(void *)(v0 + 104);
  uint64_t v17 = *(void *)(v0 + 256);
  uint64_t v13 = *(void *)(v0 + 96);
  uint64_t v14 = *(void *)(v0 + 128);
  uint64_t v15 = *(void *)(v0 + 88);
  swift_release(*(void *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  sub_10000B53C(v7, &qword_1000191C8);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v14, v9);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v15);
  swift_task_dealloc(v17);
  swift_task_dealloc(v1);
  swift_task_dealloc(v5);
  uint64_t v10 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 104);
  swift_task_dealloc(*(void *)(v0 + 152));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008BC0()
{
  uint64_t v2 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 288));
  if (v0)
  {
    *(void *)(v2 + 280) = v0;
    uint64_t v3 = sub_100008A58;
  }

  else
  {
    uint64_t v3 = sub_100008500;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100008C24()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 96);
  swift_release(*(void *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v8 = *(void *)(v0 + 104);
  swift_task_dealloc(*(void *)(v0 + 152));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008DE4(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  if (a1)
  {
    uint64_t v6 = sub_10000B3EC(0LL, &qword_1000192F0, &OBJC_CLASS___RDEstimate_ptr);
    a1 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a1, v6);
  }

  v3[4] = a1;
  uint64_t v7 = dword_10001923C;
  id v8 = a3;
  uint64_t v9 = (void *)swift_task_alloc(v7);
  v3[5] = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_100008E9C;
  v9[8] = a1;
  v9[9] = v8;
  return swift_task_switch(sub_100007AB8, 0LL, 0LL);
}

uint64_t sub_100008E9C()
{
  uint64_t v3 = *(void *)(*v1 + 32);
  uint64_t v2 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc(v2);

  swift_bridgeObjectRelease(v3);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v0)
  {
    uint64_t v7 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

  else
  {
    (*(void (**)(void, void))(v6 + 16))(*(void *)(v5 + 24), 0LL);
  }

  _Block_release(*(const void **)(v5 + 24));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

id sub_100008F44()
{
  return sub_100008F54(0LL, (uint64_t (*)(void))type metadata accessor for RDStatusSharer);
}

id sub_100008F54(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_100008FF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100009038(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  objc_super v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10000B660;
  return v6();
}

uint64_t sub_10000908C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000B660;
  return v7();
}

uint64_t sub_1000090E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000B53C(a1, &qword_1000192A8);
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
  uint64_t v17 = swift_allocObject(&unk_1000148D0, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    uint64_t v18 = v20;
    v20[2] = v13;
    void v20[3] = v15;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_1000192E8, v17);
}

uint64_t sub_10000922C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100009290;
  return v6(a1);
}

uint64_t sub_100009290()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_1000092DC(char *result, int64_t a2, char a3, char *a4)
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
      uint64_t v10 = sub_100008FF8(&qword_100019338);
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

    sub_10000A9DC(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_1000093E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000094B8(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B4FC((uint64_t)v12, *a3);
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
      sub_10000B4FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000B624(v12);
  return v7;
}

uint64_t sub_1000094B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100009670(a5, a6);
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

uint64_t sub_100009670(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100009704(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009954(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100009954(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100009704(uint64_t a1, unint64_t a2)
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
      char v5 = sub_100009878(v4, 0LL);
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

void *sub_100009878(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100008FF8(&qword_100019318);
  char v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000098DC(unint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100009954(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100008FF8(&qword_100019318);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
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

void sub_100009AA0()
{
  __asm { BR              X11 }

void *sub_100009B00@<X0>(uint64_t a1@<X8>)
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
  int64_t v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  uint64_t v10 = BYTE4(a1);
  unint64_t v11 = BYTE5(a1);
  size_t v12 = BYTE6(a1);
  uint64_t result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2) {
    uint64_t result = v7;
  }
  unint64_t v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  void *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_100009D90@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
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
    uint64_t result = (_BYTE *)sub_10000A724(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (_BYTE *)sub_10000A7E4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    uint64_t result = (_BYTE *)sub_10000A85C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

unint64_t sub_100009E04(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10000A2E8(a1, a2, v5);
}

Swift::Int sub_100009E68(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100008FF8(&qword_100019320);
  char v7 = a2;
  uint64_t v8 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v9 = v8;
  if (*(void *)(v5 + 16))
  {
    unint64_t v36 = v3;
    uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
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
              unint64_t v3 = v36;
              if ((v7 & 1) != 0)
              {
                uint64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
                if (v35 >= 64) {
                  bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v38 = -1LL << v35;
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
        sub_10000AACC(v39, *((unint64_t *)&v39 + 1));
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
      uint64_t v21 = (void *)(*(void *)(v9 + 48) + v20);
      *uint64_t v21 = v34;
      v21[1] = v33;
      *(_OWORD *)(*(void *)(v9 + 56) + v20) = v39;
      ++*(void *)(v9 + 16);
    }
  }

  Swift::Int result = swift_release(v5);
  *unint64_t v3 = v9;
  return result;
}

uint64_t sub_10000A174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100009E04(a3, a4);
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
    sub_10000A3C8();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 16 * v14;
      uint64_t result = sub_10000AB10(*(void *)v21, *(void *)(v21 + 8));
      *(void *)uint64_t v21 = a1;
      *(void *)(v21 + 8) = a2;
      return result;
    }

LABEL_11:
    v20[(v14 >> 6) + 8] |= 1LL << v14;
    unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
    *unint64_t v25 = a3;
    v25[1] = a4;
    int64_t v26 = (void *)(v20[7] + 16 * v14);
    void *v26 = a1;
    v26[1] = a2;
    uint64_t v27 = v20[2];
    BOOL v28 = __OFADD__(v27, 1LL);
    uint64_t v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain(a4);
    }

    goto LABEL_14;
  }

  sub_100009E68(v17, a5 & 1);
  unint64_t v23 = sub_100009E04(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    unint64_t v14 = v23;
    uint64_t v20 = (void *)*v6;
    if ((v18 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

unint64_t sub_10000A2E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

void *sub_10000A3C8()
{
  uint64_t v1 = v0;
  sub_100008FF8(&qword_100019320);
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

LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    __int128 v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    void *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain(v18);
    uint64_t result = (void *)sub_10000AACC(v24, *((unint64_t *)&v24 + 1));
  }

  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000A58C( void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
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

char *sub_10000A5F0(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
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

uint64_t sub_10000A69C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
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

uint64_t sub_10000A724(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_10000A7E4(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000A85C(uint64_t a1, uint64_t a2)
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

_BYTE *sub_10000A8DC(_BYTE *result, _BYTE *a2)
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
      return (_BYTE *)sub_10000A724(result, a2);
    }

    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_10000A7E4((uint64_t)result, (uint64_t)a2);
    }

    else
    {
      return (_BYTE *)sub_10000A85C((uint64_t)result, (uint64_t)a2);
    }
  }

  return result;
}

uint64_t sub_10000A940(uint64_t result)
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

uint64_t sub_10000A9DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10000AACC(uint64_t result, unint64_t a2)
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

uint64_t sub_10000AB10(uint64_t result, unint64_t a2)
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

uint64_t sub_10000AB54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008FF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40LL))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for RDStatusSharer(uint64_t a1)
{
  uint64_t result = qword_1000195B8;
  if (!qword_1000195B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RDStatusSharer);
  }
  return result;
}

uint64_t sub_10000ABD4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_10000AC18()
{
  unint64_t result = qword_100019190;
  if (!qword_100019190)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100019190);
  }

  return result;
}

uint64_t sub_10000AC5C(unint64_t *a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_10000ABD4(&qword_100019180);
    a2();
    uint64_t result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10000ACD0()
{
  unint64_t result = qword_1000191A0;
  if (!qword_1000191A0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1000191A0);
  }

  return result;
}

unint64_t sub_10000AD14()
{
  unint64_t result = qword_1000191B0;
  if (!qword_1000191B0)
  {
    uint64_t v1 = sub_10000ABD4(&qword_1000191A8);
    sub_10000AC5C( &qword_100019188,  (void (*)(void))sub_10000AC18,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000191B0);
  }

  return result;
}

unint64_t sub_10000AD98()
{
  unint64_t result = qword_1000191B8;
  if (!qword_1000191B8)
  {
    uint64_t v1 = sub_10000ABD4(&qword_1000191A8);
    sub_10000AC5C( &qword_100019198,  (void (*)(void))sub_10000ACD0,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000191B8);
  }

  return result;
}

unint64_t sub_10000AE1C()
{
  unint64_t result = qword_1000191D0;
  if (!qword_1000191D0)
  {
    uint64_t v1 = sub_10000ABD4(&qword_100019180);
    sub_10000AE80();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_1000191D0);
  }

  return result;
}

unint64_t sub_10000AE80()
{
  unint64_t result = qword_1000191D8;
  if (!qword_1000191D8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1000191D8);
  }

  return result;
}

uint64_t sub_10000AEC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008FF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000AF08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008FF8(&qword_1000191C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000AF50()
{
  unint64_t result = qword_100019208;
  if (!qword_100019208)
  {
    uint64_t v1 = sub_10000ABD4(&qword_1000191F8);
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for LSKPublishedStatusSequence<A, B>.AsyncIterator,  v1);
    atomic_store(result, (unint64_t *)&qword_100019208);
  }

  return result;
}

unint64_t sub_10000AF9C()
{
  unint64_t result = qword_100019218;
  if (!qword_100019218)
  {
    uint64_t v1 = type metadata accessor for Date.ISO8601FormatStyle(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Date.ISO8601FormatStyle, v1);
    atomic_store(result, (unint64_t *)&qword_100019218);
  }

  return result;
}

unint64_t sub_10000AFE4()
{
  unint64_t result = qword_100019228;
  if (!qword_100019228)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100019228);
  }

  return result;
}

uint64_t sub_10000B028()
{
  return type metadata accessor for RDStatusSharer(0LL);
}

void sub_10000B030(uint64_t a1)
{
  v8[0] = "\b";
  sub_10000B0FC(319LL);
  if (v3 <= 0x3F)
  {
    v8[1] = *(void *)(v2 - 8) + 64LL;
    sub_10000B150(319LL, &qword_100019298, &qword_100019158);
    if (v5 <= 0x3F)
    {
      v8[2] = *(void *)(v4 - 8) + 64LL;
      sub_10000B150(319LL, &qword_1000192A0, &qword_100019168);
      if (v7 <= 0x3F)
      {
        v8[3] = *(void *)(v6 - 8) + 64LL;
        swift_updateClassMetadata2(a1, 256LL, 4LL, v8, a1 + 80);
      }
    }
  }

void sub_10000B0FC(uint64_t a1)
{
  if (!qword_100019290)
  {
    uint64_t v2 = type metadata accessor for LSKStatusOptions(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100019290);
    }
  }

void sub_10000B150(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    uint64_t v5 = sub_10000ABD4(a3);
    unint64_t v6 = type metadata accessor for Optional(a1, v5);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }

uint64_t sub_10000B1A0()
{
  uint64_t v2 = v0[2];
  unint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_1000192B4);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000B660;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_1000192B0 + dword_1000192B0))(v2, v3, v4);
}

uint64_t sub_10000B210()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_1000192C4);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000B660;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000192C0 + dword_1000192C0))(v2, v3, v4);
}

uint64_t sub_10000B28C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_1000192D4);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000B660;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000192D0 + dword_1000192D0))( a1,  v4,  v5,  v6);
}

uint64_t sub_10000B310()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000B334(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000192E4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000B3A4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000192E0 + dword_1000192E0))(a1, v4);
}

uint64_t sub_10000B3A4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000B3EC(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_10000B428()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10000B45C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_1000192FC);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000B3A4;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1000192F8 + dword_1000192F8))(v2, v3, v4);
}

uint64_t sub_10000B4D0()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000B4FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B53C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008FF8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void *sub_10000B578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_10000A58C( (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_10000B644,  (uint64_t)v12,  a1,  a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_10000B5D4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000AB10(result, a2);
  }
  return result;
}

uint64_t sub_10000B5E8(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000B600(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10000B624(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000B644@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_10000A69C(a1, a2, *(uint64_t **)(v3 + 16), a3);
}

void start()
{
  if (qword_100019340 != -1) {
    dispatch_once(&qword_100019340, &stru_1000149C0);
  }
  uint64_t v0 = (os_log_s *)qword_100019348;
  if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    uint64_t v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Starting countryd}",  (uint8_t *)v4,  0x12u);
  }

  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100014980);
  uint64_t v1 = objc_autoreleasePoolPush();
  __int128 v2 = objc_alloc_init(&OBJC_CLASS___RDCommServer);
  uint64_t v3 = (void *)qword_1000195C8;
  qword_1000195C8 = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
  dispatch_main();
}

void sub_10000B764(id a1, OS_xpc_object *a2)
{
  __int128 v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    if (qword_100019340 != -1) {
      dispatch_once(&qword_100019340, &stru_1000149C0);
    }
    uint64_t v4 = (os_log_s *)qword_100019348;
    if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = string;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Got Darwin notification, notification:%{public, location:escape_only}s}",  (uint8_t *)&v7,  0x1Cu);
    }

    if (!strcmp("com.apple.os-eligibility-domain.input-needed", string))
    {
      if (qword_100019340 != -1) {
        dispatch_once(&qword_100019340, &stru_1000149C0);
      }
      __int16 v5 = (os_log_s *)qword_100019348;
      if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 68289026;
        int v8 = 0;
        __int16 v9 = 2082;
        uint64_t v10 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:eligibility engine wants input}",  (uint8_t *)&v7,  0x12u);
      }

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[RDCachedData loadCache](&OBJC_CLASS___RDCachedData, "loadCache"));
      [v6 postResultsToEligibilityEngine];
    }
  }
}

void sub_10000B924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B94C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.countryd", "Daemon");
  __int128 v2 = (void *)qword_100019348;
  qword_100019348 = (uint64_t)v1;
}

uint64_t sub_10000C0EC()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 valueForEntitlement:@"com.apple.countryd.contribute"]);
  if (v1
    && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)
    && ([v1 BOOLValue] & 1) != 0)
  {
    uint64_t v3 = 1LL;
  }

  else
  {
    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    uint64_t v4 = (void *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_FAULT))
    {
      __int16 v5 = v4;
      int v10 = 68289538;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      __int16 v14 = 2082;
      unint64_t v15 = "com.apple.countryd.contribute";
      __int16 v16 = 1026;
      unsigned int v17 = [v0 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:peer process is missing entitlement to contribute data, entitlement:%{public, locat ion:escape_only}s, process:%{public}d}",  (uint8_t *)&v10,  0x22u);

      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
    }

    uint64_t v6 = (void *)qword_100019358;
    if (os_signpost_enabled((os_log_t)qword_100019358))
    {
      int v7 = v6;
      unsigned int v8 = [v0 processIdentifier];
      int v10 = 68289538;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      __int16 v14 = 2082;
      unint64_t v15 = "com.apple.countryd.contribute";
      __int16 v16 = 1026;
      unsigned int v17 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "peer process is missing entitlement to contribute data",  "{msg%{public}.0s:peer process is missing entitlement to contribute data, entitlement:%{public, locat ion:escape_only}s, process:%{public}d}",  (uint8_t *)&v10,  0x22u);
    }

    uint64_t v3 = 0LL;
  }

  return v3;
}

BOOL sub_10000C320()
{
  uint64_t v0 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.RegulatoryDomain");
  BOOL v1 = -[NSUserDefaults BOOLForKey:](v0, "BOOLForKey:", @"UpdatesLocked");

  return v1;
}

LABEL_39:
}

LABEL_34:
}

void sub_10000D620(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dataCache]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getEstimateForPeerDeviceWithID:*(void *)(a1 + 48)]);
  __int16 v5 = v4;
  if (v2)
  {
    uint64_t v6 = *(void **)(a1 + 32);

    if (v5 != v6)
    {
      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
      int v7 = (void *)qword_100019358;
      if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_INFO))
      {
        id v8 = *(id *)(a1 + 48);
        __int16 v9 = v7;
        id v10 = [v8 UTF8String];
        uint64_t v11 = *(void *)(a1 + 32);
        int v21 = 68289538;
        int v22 = 0;
        __int16 v23 = 2082;
        __int128 v24 = "";
        __int16 v25 = 2082;
        id v26 = v10;
        __int16 v27 = 2114;
        uint64_t v28 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:updating estimate for peer, peer:%{public, location:escape_only}s, estimate:% {public, location:escape_only}@}",  (uint8_t *)&v21,  0x26u);
      }

      id v12 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dataCache]);
      [v12 setEstimate:*(void *)(a1 + 32) forPeerDeviceWithID:*(void *)(a1 + 48)];
      goto LABEL_23;
    }

    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    __int16 v16 = (void *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_INFO))
    {
      id v17 = *(id *)(a1 + 48);
      id v12 = v16;
      int v21 = 68289282;
      int v22 = 0;
      __int16 v23 = 2082;
      __int128 v24 = "";
      __int16 v25 = 2082;
      id v26 = [v17 UTF8String];
      uint64_t v18 = "{msg%{public}.0s:estimate for peer unchanged, ignoring, peer:%{public, location:escape_only}s}";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0x1Cu);
LABEL_23:
    }
  }

  else
  {

    if (v5)
    {
      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
      uint64_t v13 = (void *)qword_100019358;
      if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_INFO))
      {
        id v14 = *(id *)(a1 + 48);
        unint64_t v15 = v13;
        int v21 = 68289282;
        int v22 = 0;
        __int16 v23 = 2082;
        __int128 v24 = "";
        __int16 v25 = 2082;
        id v26 = [v14 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:peer went away, peer:%{public, location:escape_only}s}",  (uint8_t *)&v21,  0x1Cu);
      }

      id v12 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dataCache]);
      [v12 removeEstimateForPeerDeviceWithID:*(void *)(a1 + 48)];
      goto LABEL_23;
    }

    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    uint64_t v19 = (void *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_INFO))
    {
      id v20 = *(id *)(a1 + 48);
      id v12 = v19;
      int v21 = 68289282;
      int v22 = 0;
      __int16 v23 = 2082;
      __int128 v24 = "";
      __int16 v25 = 2082;
      id v26 = [v20 UTF8String];
      uint64_t v18 = "{msg%{public}.0s:peer already not used, nothing to do, peer:%{public, location:escape_only}s}";
      goto LABEL_22;
    }
  }

void sub_10000E5A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.countryd", "Shared");
  uint64_t v2 = (void *)qword_100019358;
  qword_100019358 = (uint64_t)v1;
}

void sub_10000E5D0(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.countryd.serialqueue", v4);
  uint64_t v3 = (void *)qword_1000195D0;
  qword_1000195D0 = (uint64_t)v2;
}

void sub_10000E620(id a1)
{
  os_log_t v1 = os_log_create("com.apple.countryd", "Daemon");
  dispatch_queue_t v2 = (void *)qword_100019348;
  qword_100019348 = (uint64_t)v1;
}

void sub_10000F5E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.countryd", "Daemon");
  dispatch_queue_t v2 = (void *)qword_100019348;
  qword_100019348 = (uint64_t)v1;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_BOOLValueSafe(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValueSafe];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_createNewDataCache(void *a1, const char *a2, ...)
{
  return _[a1 createNewDataCache];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_dataCache(void *a1, const char *a2, ...)
{
  return _[a1 dataCache];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getCacheDirPath(void *a1, const char *a2, ...)
{
  return _[a1 getCacheDirPath];
}

id objc_msgSend_getCachePath(void *a1, const char *a2, ...)
{
  return _[a1 getCachePath];
}

id objc_msgSend_getEstimateForPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEstimateForPeerDeviceWithID:");
}

id objc_msgSend_initWithCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCache:");
}

id objc_msgSend_initWithCountryCode_andDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCountryCode:andDate:");
}

id objc_msgSend_initWithCountryCode_priority_timestamp_inDisputedArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCountryCode:priority:timestamp:inDisputedArea:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_lastShareDate(void *a1, const char *a2, ...)
{
  return _[a1 lastShareDate];
}

id objc_msgSend_loadCache(void *a1, const char *a2, ...)
{
  return _[a1 loadCache];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_postResultsToEligibilityEngine(void *a1, const char *a2, ...)
{
  return _[a1 postResultsToEligibilityEngine];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_recompute(void *a1, const char *a2, ...)
{
  return _[a1 recompute];
}

id objc_msgSend_removeEstimateForPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEstimateForPeerDeviceWithID:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCountriesFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromLocation:");
}

id objc_msgSend_setCountriesFromLocation_isInDisputedArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromLocation:isInDisputedArea:");
}

id objc_msgSend_setCountriesFromNearbyCells_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromNearbyCells:");
}

id objc_msgSend_setCountriesFromServingCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromServingCell:");
}

id objc_msgSend_setCountriesFromWiFiAPs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromWiFiAPs:");
}

id objc_msgSend_setCountryFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountryFromLocation:");
}

id objc_msgSend_setCountryFromMCC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountryFromMCC:");
}

id objc_msgSend_setCountryFromWiFiAPs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountryFromWiFiAPs:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEstimate_forPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimate:forPeerDeviceWithID:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 sharedCountryCode];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_updatePeer_withEstimate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePeer:withEstimate:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}
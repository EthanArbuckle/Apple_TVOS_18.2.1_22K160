id sub_100002F18(void *a1)
{
  objc_class *v1;
  id v2;
  v2 = objc_allocWithZone(v1);
  return sub_100002F50(a1);
}

id sub_100002F50(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType(v1);
  v11 = a1;
  id v2 = v1;
  id v12 = v1;
  id v3 = a1;
  *(void *)&v6[OBJC_IVAR____TtC12MemoryPoster13PosterUpdater_serviceProxy] = a1;

  v10.receiver = v12;
  v10.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v10, "init");
  id v4 = v9;
  id v12 = v9;

  return v9;
}

uint64_t sub_100003000(uint64_t a1)
{
  v2[39] = v1;
  v2[38] = a1;
  v2[18] = v2;
  v2[19] = 0LL;
  v2[21] = 0LL;
  v2[22] = 0LL;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[40] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[41] = v4;
  uint64_t v8 = *(void *)(v4 + 64);
  v2[42] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[43] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[44] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for IdlePosterState(0LL);
  v2[45] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[46] = v6;
  uint64_t v9 = *(void *)(v6 + 64);
  v2[47] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[48] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[19] = v1;
  return swift_task_switch(sub_100003114, 0LL);
}

uint64_t sub_100003114()
{
  uint64_t v1 = *(void *)(v0 + 312);
  *(void *)(v0 + 144) = v0;
  id v5 = *(id *)(v1 + OBJC_IVAR____TtC12MemoryPoster13PosterUpdater_serviceProxy);
  *(void *)(v0 + 392) = v5;
  id v2 = v5;
  swift_beginAccess();
  uint64_t v4 = TVISAmbientSnapshotQueryIntentSyncing;
  swift_endAccess(v0 + 120);
  *(void *)(v0 + 16) = *(void *)(v0 + 144);
  *(void *)(v0 + 56) = v0 + 160;
  *(void *)(v0 + 24) = sub_10000321C;
  *(void *)(v0 + 112) = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(_DWORD *)(v0 + 88) = 0x40000000;
  *(_DWORD *)(v0 + 92) = 0;
  *(void *)(v0 + 96) = sub_1000040E0;
  *(void *)(v0 + 104) = &unk_100020828;
  [v5 queryCurrentSnapshotWithIntent:v4 reply:v0 + 80];
  return j__swift_continuation_await(v0 + 16);
}

uint64_t sub_10000321C()
{
  uint64_t v1 = (void *)*v0;
  v1[18] = *v0;
  uint64_t v2 = v1[6];
  v1[50] = v2;
  if (v2) {
    return swift_task_switch(sub_100003704, 0LL);
  }
  else {
    return swift_task_switch(sub_1000032BC, 0LL);
  }
}

uint64_t sub_1000032BC()
{
  v26 = *(void **)(v0 + 392);
  uint64_t v28 = *(void *)(v0 + 384);
  uint64_t v29 = *(void *)(v0 + 376);
  uint64_t v27 = *(void *)(v0 + 368);
  uint64_t v30 = *(void *)(v0 + 360);
  uint64_t v1 = *(void *)(v0 + 352);
  uint64_t v31 = *(void *)(v0 + 328);
  uint64_t v32 = *(void *)(v0 + 320);
  *(void *)(v0 + 144) = v0;
  swift_unknownObjectRelease(*(void *)(v0 + 160));

  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v29, enum case for IdlePosterState.normal(_:), v30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v28, v29, v30);
  uint64_t v2 = sub_10000A1F8();
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v1, v2, v32);
  v37 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v36 = static os_log_type_t.default.getter();
  *(void *)(v0 + 264) = 2LL;
  unint64_t v33 = sub_100006D24();
  unint64_t v34 = sub_100006D8C();
  unint64_t v4 = sub_100006DF4();
  UnsignedInteger<>.init<A>(_:)(v0 + 264, &type metadata for UInt32, &type metadata for Int, v33, v34, v4);
  uint32_t v35 = *(_DWORD *)(v0 + 416);
  uint64_t v5 = sub_100006E5C(&qword_100025B58);
  uint64_t v38 = _allocateUninitializedArray<A>(_:)(0LL, v5);
  if (os_log_type_enabled(v37, v36))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v19 = sub_100006E5C(&qword_100025B60);
    uint64_t v21 = sub_100006EC8(0LL, v19, v19);
    uint64_t v22 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    *(void *)(v25 + 272) = buf;
    *(void *)(v25 + 280) = v21;
    *(void *)(v25 + 288) = v22;
    sub_100006F20(0LL, (_BYTE **)(v25 + 272));
    sub_100006F20(0LL, (_BYTE **)(v25 + 272));
    *(void *)(v25 + 296) = v38;
    v23 = (void *)swift_task_alloc(48LL);
    v23[2] = v25 + 272;
    v23[3] = v25 + 280;
    v23[4] = v25 + 288;
    uint64_t v24 = sub_100006E5C(&qword_100025B68);
    unint64_t v6 = sub_100006FA4();
    Sequence.forEach(_:)(sub_100007120, v23, v24, v6);
    swift_task_dealloc(v23);
    _os_log_impl((void *)&_mh_execute_header, v37, v36, "Poster is normal.", buf, v35);
    sub_100007088(v21, 0LL);
    sub_100007088(v22, 0LL);
    UnsafeMutablePointer.deallocate()();
  }

  swift_bridgeObjectRelease(v38);
  uint64_t v10 = *(void *)(v25 + 352);
  uint64_t v9 = *(void *)(v25 + 328);
  uint64_t v11 = *(void *)(v25 + 320);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  uint64_t v14 = *(void *)(v25 + 384);
  uint64_t v15 = *(void *)(v25 + 376);
  uint64_t v12 = *(void *)(v25 + 368);
  uint64_t v13 = *(void *)(v25 + 360);
  uint64_t v16 = *(void *)(v25 + 352);
  uint64_t v17 = *(void *)(v25 + 344);
  uint64_t v18 = *(void *)(v25 + 336);
  (*(void (**)(void))(v12 + 16))();
  char v7 = sub_1000042A4();
  IdlePosterInfo.init(posterState:shouldHideInSwitcher:)(v15, v7 & 1);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  return (*(uint64_t (**)(void))(*(void *)(v25 + 144) + 8LL))();
}

uint64_t sub_100003704()
{
  uint64_t v70 = v0[50];
  v69 = (void *)v0[49];
  v0[18] = v0;
  swift_willThrow();

  swift_errorRetain(v70);
  v0[21] = v70;
  swift_errorRetain(v70);
  v71 = (void *)_convertErrorToNSError(_:)();
  v0[22] = v71;
  swift_errorRelease();
  id v76 = [v71 domain];
  uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)(v76);
  uint64_t v75 = v1;
  v74 = (void *)TVISAmbientServiceErrorDomain;
  id v2 = TVISAmbientServiceErrorDomain;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v74);
  uint64_t v73 = v4;
  char v77 = static String.== infix(_:_:)(v72, v75, v3);
  swift_bridgeObjectRelease(v73);

  swift_bridgeObjectRelease(v75);
  if ((v77 & 1) != 0 && [v71 code] == (id)2)
  {
    uint64_t v57 = *(void *)(v68 + 384);
    v58 = *(Swift::String **)(v68 + 376);
    uint64_t v56 = *(void *)(v68 + 368);
    uint64_t v59 = *(void *)(v68 + 360);
    uint64_t v5 = *(void *)(v68 + 344);
    uint64_t v60 = *(void *)(v68 + 328);
    uint64_t v61 = *(void *)(v68 + 320);
    Swift::String *v58 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("POSTER_STILL_SYNCING", 0x14uLL, 1);
    (*(void (**)(void))(v56 + 104))();
    (*(void (**)(uint64_t, Swift::String *, uint64_t))(v56 + 32))(v57, v58, v59);
    uint64_t v6 = sub_10000A1F8();
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v5, v6, v61);
    v66 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v65 = static os_log_type_t.default.getter();
    *(void *)(v68 + 224) = 2LL;
    unint64_t v62 = sub_100006D24();
    unint64_t v63 = sub_100006D8C();
    unint64_t v8 = sub_100006DF4();
    UnsignedInteger<>.init<A>(_:)(v68 + 224, &type metadata for UInt32, &type metadata for Int, v62, v63, v8);
    uint32_t v64 = *(_DWORD *)(v68 + 412);
    uint64_t v9 = sub_100006E5C(&qword_100025B58);
    uint64_t v67 = _allocateUninitializedArray<A>(_:)(0LL, v9);
    if (os_log_type_enabled(v66, v65))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v50 = sub_100006E5C(&qword_100025B60);
      uint64_t v52 = sub_100006EC8(0LL, v50, v50);
      uint64_t v53 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      *(void *)(v68 + 232) = buf;
      *(void *)(v68 + 240) = v52;
      *(void *)(v68 + 248) = v53;
      sub_100006F20(0LL, (_BYTE **)(v68 + 232));
      sub_100006F20(0LL, (_BYTE **)(v68 + 232));
      *(void *)(v68 + 256) = v67;
      v54 = (void *)swift_task_alloc(48LL);
      v54[2] = v68 + 232;
      v54[3] = v68 + 240;
      v54[4] = v68 + 248;
      uint64_t v55 = sub_100006E5C(&qword_100025B68);
      unint64_t v10 = sub_100006FA4();
      Sequence.forEach(_:)(sub_1000070F4, v54, v55, v10);
      swift_task_dealloc(v54);
      _os_log_impl((void *)&_mh_execute_header, v66, v65, "Poster is still syncing.", buf, v64);
      sub_100007088(v52, 0LL);
      sub_100007088(v53, 0LL);
      UnsafeMutablePointer.deallocate()();
    }

    swift_bridgeObjectRelease(v67);
    uint64_t v48 = *(void *)(v68 + 344);
    uint64_t v47 = *(void *)(v68 + 328);
    uint64_t v49 = *(void *)(v68 + 320);

    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v49);
  }

  else
  {
    uint64_t v36 = *(void *)(v68 + 384);
    v37 = *(Swift::String **)(v68 + 376);
    uint64_t v35 = *(void *)(v68 + 368);
    uint64_t v38 = *(void *)(v68 + 360);
    uint64_t v11 = *(void *)(v68 + 336);
    uint64_t v39 = *(void *)(v68 + 328);
    uint64_t v40 = *(void *)(v68 + 320);
    Swift::String *v37 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("POSTER_NOT_SETUP", 0x10uLL, 1);
    (*(void (**)(void))(v35 + 104))();
    (*(void (**)(uint64_t, Swift::String *, uint64_t))(v35 + 32))(v36, v37, v38);
    uint64_t v12 = sub_10000A1F8();
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v11, v12, v40);
    oslog = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v44 = static os_log_type_t.default.getter();
    *(void *)(v68 + 184) = 2LL;
    unint64_t v41 = sub_100006D24();
    unint64_t v42 = sub_100006D8C();
    unint64_t v14 = sub_100006DF4();
    UnsignedInteger<>.init<A>(_:)(v68 + 184, &type metadata for UInt32, &type metadata for Int, v41, v42, v14);
    uint32_t size = *(_DWORD *)(v68 + 408);
    uint64_t v15 = sub_100006E5C(&qword_100025B58);
    uint64_t v46 = _allocateUninitializedArray<A>(_:)(0LL, v15);
    if (os_log_type_enabled(oslog, v44))
    {
      uint64_t v30 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v29 = sub_100006E5C(&qword_100025B60);
      uint64_t v31 = sub_100006EC8(0LL, v29, v29);
      uint64_t v32 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      *(void *)(v68 + 192) = v30;
      *(void *)(v68 + 200) = v31;
      *(void *)(v68 + 208) = v32;
      sub_100006F20(0LL, (_BYTE **)(v68 + 192));
      sub_100006F20(0LL, (_BYTE **)(v68 + 192));
      *(void *)(v68 + 216) = v46;
      unint64_t v33 = (void *)swift_task_alloc(48LL);
      v33[2] = v68 + 192;
      v33[3] = v68 + 200;
      v33[4] = v68 + 208;
      uint64_t v34 = sub_100006E5C(&qword_100025B68);
      unint64_t v16 = sub_100006FA4();
      Sequence.forEach(_:)(sub_100006F78, v33, v34, v16);
      swift_task_dealloc(v33);
      _os_log_impl((void *)&_mh_execute_header, oslog, v44, "Poster is not setup.", v30, size);
      sub_100007088(v31, 0LL);
      sub_100007088(v32, 0LL);
      UnsafeMutablePointer.deallocate()();
    }

    swift_bridgeObjectRelease(v46);
    uint64_t v27 = *(void *)(v68 + 336);
    uint64_t v26 = *(void *)(v68 + 328);
    uint64_t v28 = *(void *)(v68 + 320);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
  }

  swift_errorRelease();
  swift_errorRelease();
  uint64_t v21 = *(void *)(v68 + 384);
  uint64_t v22 = *(void *)(v68 + 376);
  uint64_t v19 = *(void *)(v68 + 368);
  uint64_t v20 = *(void *)(v68 + 360);
  uint64_t v23 = *(void *)(v68 + 352);
  uint64_t v24 = *(void *)(v68 + 344);
  uint64_t v25 = *(void *)(v68 + 336);
  (*(void (**)(void))(v19 + 16))();
  char v17 = sub_1000042A4();
  IdlePosterInfo.init(posterState:shouldHideInSwitcher:)(v22, v17 & 1);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  return (*(uint64_t (**)(void))(*(void *)(v68 + 144) + 8LL))();
}

uint64_t sub_1000040E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  if (a3)
  {
    swift_errorRetain(a3);
    uint64_t v6 = sub_100006E5C(&qword_100025DB0);
    sub_1000041FC(v11, (uint64_t)a3, v6);
  }

  else
  {
    swift_unknownObjectRetain(a2);
    if (a2)
    {
      uint64_t v7 = a2;
    }

    else
    {
      _diagnoseUnexpectedNilOptional(_filenameStart:_filenameLength:_filenameIsASCII:_line:_isImplicitUnwrap:)( "",  0LL,  1,  0LL,  1);
      __break(1u);
    }

    uint64_t v12 = v7;
    uint64_t v4 = sub_100006E5C(&qword_100025DB0);
    sub_100004254(v11, (uint64_t)&v12, v4);
  }

  return swift_unknownObjectRelease(a2);
}

uint64_t sub_1000041FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = a3;
  v7[0] = a2;
  uint64_t v3 = sub_100006E5C(&qword_100025DB8);
  return sub_100008354((uint64_t)v7, a1, a3, v3, (uint64_t)&protocol self-conformance witness table for Error);
}

uint64_t sub_100004254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100008304(a2, a1, a3);
}

uint64_t sub_1000042A4()
{
  return 0LL;
}

uint64_t sub_1000042B0()
{
  if (!"MemoryPoster.PosterUpdater")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_1000158E4( (uint64_t)"MemoryPoster.PosterUpdater",  26LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"MemoryPoster/PosterUpdater.swift",  32LL,  2,  v2,  0xCuLL,  0xDuLL);
  __break(1u);
  return result;
}

id sub_1000043E0()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000445C()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("POSTER_TITLE", 0xCuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  xmmword_1000262D0 = (__int128)v1;
  return result;
}

__int128 *sub_10000449C()
{
  if (qword_100025B20 != -1) {
    swift_once(&qword_100025B20, sub_10000445C);
  }
  return &xmmword_1000262D0;
}

uint64_t sub_1000044F0(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[2] = v3;
  v3[3] = 0LL;
  v3[4] = 0LL;
  v3[5] = 0LL;
  v3[6] = 0LL;
  uint64_t v4 = type metadata accessor for IdlePosterInfo(0LL);
  v3[8] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[9] = v5;
  v3[10] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v2;
  return swift_task_switch(sub_1000045C0, 0LL);
}

uint64_t sub_1000045C0()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v13 = (void *)TVISAmbientPosterServiceIdentifierPhoto;
  id v1 = TVISAmbientPosterServiceIdentifierPhoto;
  char IsAvailable = TVISAmbientPosterServiceIsAvailable(v13);

  if ((IsAvailable & 1) != 0)
  {
    sub_1000071B0();
    Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PhotoPoster", 0xBuLL, 1);
    unint64_t v8 = (void *)PRPosterRoleAmbient;
    id v3 = PRPosterRoleAmbient;
    id v10 = sub_100004990(v2._countAndFlagsBits, (uint64_t)v2._object, v8);
    v12[11] = v10;
    v12[6] = v10;
    uint64_t v9 = *((void *)sub_10000449C() + 1);
    swift_bridgeObjectRetain(v9);
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
    [v10 setDisplayNameLocalizationKey:v11];

    uint64_t v4 = (void *)swift_task_alloc(dword_100025B3C);
    v12[12] = v4;
    *uint64_t v4 = v12[2];
    v4[1] = sub_1000047A4;
    return sub_100003000(v12[10]);
  }

  else
  {
    unint64_t v6 = sub_10000714C();
    uint64_t v7 = _allocateUninitializedArray<A>(_:)(0LL, v6);
    swift_task_dealloc(v12[10]);
    return (*(uint64_t (**)(uint64_t))(v12[2] + 8LL))(v7);
  }
}

uint64_t sub_1000047A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 96LL);
  *(void *)(*(void *)v0 + 16LL) = *(void *)v0;
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100004810, 0LL);
}

uint64_t sub_100004810()
{
  uint64_t v1 = *(void *)(v0 + 80);
  *(void *)(v0 + 16) = v0;
  PRMutablePosterDescriptor.setIdlePosterInfo(_:)(v1);
  id v11 = (id)v12[11];
  uint64_t v10 = v12[10];
  uint64_t v8 = v12[9];
  uint64_t v9 = v12[8];
  unint64_t v6 = sub_10000714C();
  uint64_t v7 = _allocateUninitializedArray<A>(_:)(1LL, v6);
  uint64_t v5 = v2;
  id v3 = v11;
  *uint64_t v5 = v11;
  sub_100004A08();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v9);

  swift_task_dealloc(v12[10]);
  return (*(uint64_t (**)(uint64_t))(v12[2] + 8LL))(v7);
}

id sub_100004990(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  id v7 =  [(id)((uint64_t (*)())swift_getObjCClassFromMetadata)() mutableDescriptorWithIdentifier:v5 role:a3];

  swift_bridgeObjectRelease(a2);
  return v7;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100004A08()
{
}

uint64_t sub_100004AE8(void *a1, void *a2, const void *a3, void *a4)
{
  v4[5] = a4;
  v4[4] = a2;
  v4[3] = a1;
  v4[2] = v4;
  id v6 = a1;
  id v7 = a2;
  v4[6] = _Block_copy(a3);
  id v8 = a4;
  v4[7] = sub_10000714C();
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a1, &type metadata for String);
  v4[8] = v15;
  uint64_t v9 = (void *)swift_task_alloc(dword_100025B7C);
  *(void *)(v13 + 72) = v9;
  *uint64_t v9 = *(void *)(v13 + 16);
  v9[1] = sub_100004BCC;
  return sub_1000044F0(v15, (uint64_t)a2);
}

void *sub_100004BCC(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 72);
  *(void *)(v3 + 16) = *v2;
  unint64_t v14 = (void *)(v3 + 16);
  uint64_t v15 = (void *)(v3 + 16);
  swift_task_dealloc(v4);
  if (v1)
  {
    uint64_t v10 = (void (**)(void *, void))v14[4];
    id v9 = (id)((uint64_t (*)())_convertErrorToNSError(_:))();
    v10[2](v10, 0LL);

    _Block_release(v10);
    ((void (*)())swift_errorRelease)();
  }

  else
  {
    aBlock = (void (**)(void))v14[4];
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    aBlock[2]();

    _Block_release(aBlock);
    swift_bridgeObjectRelease(a1);
  }

  id v7 = (void *)v14[3];
  id v8 = (void *)v14[2];
  id v6 = (void *)v14[1];
  swift_bridgeObjectRelease(v14[6]);

  return (*(void *(**)(void *__return_ptr))(*v15 + 8LL))(v15);
}

uint64_t sub_100004D14(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  unint64_t v15 = (*(void *)(*(void *)(sub_100006E5C(&qword_100025D78) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v23 = (char *)&v14 - v15;
  uint64_t v2 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 56LL))(v23, 1LL);
  uint64_t v18 = 48LL;
  uint64_t v19 = 7LL;
  uint64_t v3 = swift_allocObject(&unk_100020980, 48LL, 7LL);
  uint64_t v4 = v16;
  id v5 = (void *)v3;
  uint64_t v6 = v17;
  uint64_t v22 = v5;
  v5[2] = 0LL;
  v5[3] = 0LL;
  v5[4] = v6;
  v5[5] = v4;
  uint64_t v20 = v5[2];
  uint64_t v21 = v5[3];
  swift_unknownObjectRetain();
  uint64_t v7 = swift_allocObject(&unk_1000209A8, v18, v19);
  uint64_t v8 = v21;
  id v9 = v22;
  uint64_t v10 = (void *)v7;
  uint64_t v11 = (uint64_t)v23;
  v10[2] = v20;
  v10[3] = v8;
  v10[4] = &unk_100025D88;
  v10[5] = v9;
  uint64_t v12 = sub_100008848(v11, (uint64_t)&unk_100025D98, (uint64_t)v10);
  return swift_release(v12);
}

uint64_t sub_100004E4C(uint64_t a1, uint64_t a2)
{
  v3[18] = v2;
  v3[17] = a1;
  v3[2] = v3;
  v3[3] = 0LL;
  v3[4] = 0LL;
  v3[5] = 0LL;
  v3[8] = 0LL;
  uint64_t v4 = type metadata accessor for IdlePosterInfo(0LL);
  v3[19] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[20] = v5;
  uint64_t v9 = *(void *)(v5 + 64);
  v3[21] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v3[22] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  v3[23] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[24] = v7;
  uint64_t v10 = *(void *)(v7 + 64);
  v3[25] = swift_task_alloc((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v3[26] = swift_task_alloc((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v2;
  return swift_task_switch(sub_100004F84, 0LL);
}

uint64_t sub_100004F84()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v22 = *(void *)(v0 + 192);
  uint64_t v23 = *(void *)(v0 + 184);
  *(void *)(v0 + 16) = v0;
  uint64_t v2 = sub_10000A1F8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
  *(void *)(v0 + 216) = v3;
  uint64_t v4 = v3(v1, v2, v23);
  uint64_t v28 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v27 = static os_log_type_t.default.getter();
  *(void *)(v0 + 48) = 2LL;
  unint64_t v24 = sub_100006D24();
  *(void *)(v0 + 224) = v24;
  unint64_t v25 = sub_100006D8C();
  *(void *)(v0 + 232) = v25;
  unint64_t v5 = sub_100006DF4();
  *(void *)(v0 + 240) = v5;
  UnsignedInteger<>.init<A>(_:)(v0 + 48, &type metadata for UInt32, &type metadata for Int, v24, v25, v5);
  uint32_t v26 = *(_DWORD *)(v0 + 280);
  uint64_t v6 = sub_100006E5C(&qword_100025B58);
  *(void *)(v0 + 248) = v6;
  uint64_t v29 = _allocateUninitializedArray<A>(_:)(0LL, v6);
  if (os_log_type_enabled(v28, v27))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v15 = sub_100006E5C(&qword_100025B60);
    uint64_t v17 = sub_100006EC8(0LL, v15, v15);
    uint64_t v18 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    *(void *)(v21 + 104) = buf;
    *(void *)(v21 + 112) = v17;
    *(void *)(v21 + 120) = v18;
    sub_100006F20(0LL, (_BYTE **)(v21 + 104));
    sub_100006F20(0LL, (_BYTE **)(v21 + 104));
    *(void *)(v21 + 128) = v29;
    uint64_t v19 = (void *)swift_task_alloc(48LL);
    v19[2] = v21 + 104;
    v19[3] = v21 + 112;
    v19[4] = v21 + 120;
    uint64_t v20 = sub_100006E5C(&qword_100025B68);
    unint64_t v7 = sub_100006FA4();
    Sequence.forEach(_:)(sub_100007480, v19, v20, v7);
    swift_task_dealloc(v19);
    _os_log_impl((void *)&_mh_execute_header, v28, v27, "Updating configuration...", buf, v26);
    sub_100007088(v17, 0LL);
    sub_100007088(v18, 0LL);
    UnsafeMutablePointer.deallocate()();
  }

  swift_bridgeObjectRelease(v29);
  *(void *)(v21 + 256) = 0LL;
  uint64_t v13 = *(void *)(v21 + 208);
  uint64_t v12 = *(void *)(v21 + 192);
  uint64_t v14 = *(void *)(v21 + 184);

  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
  *(void *)(v21 + 264) = v8;
  uint64_t v9 = v8(v13, v14);
  PRPosterConfiguration.getIdlePosterInfo()(v9);
  uint64_t v10 = (void *)swift_task_alloc(dword_100025B3C);
  *(void *)(v21 + 272) = v10;
  *uint64_t v10 = *(void *)(v21 + 16);
  v10[1] = sub_100005364;
  return sub_100003000(*(void *)(v21 + 168));
}

uint64_t sub_100005364()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 272LL);
  *(void *)(*(void *)v0 + 16LL) = *(void *)v0;
  swift_task_dealloc(v1);
  return swift_task_switch(sub_1000053D0, 0LL);
}

uint64_t sub_1000053D0()
{
  uint64_t v57 = v0[22];
  uint64_t v56 = v0[21];
  v0[2] = v0;
  sub_100007380();
  if ((dispatch thunk of static Equatable.== infix(_:_:)(v57, v56) & 1) != 0)
  {
    uint64_t v21 = *(void *)(v55 + 176);
    uint64_t v20 = *(void *)(v55 + 168);
    uint64_t v19 = *(void *)(v55 + 160);
    uint64_t v22 = *(void *)(v55 + 152);
    id v8 = *(id *)(v55 + 136);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v23(v20, v22);
    v23(v21, v22);
    id v31 = *(id *)(v55 + 136);
    goto LABEL_10;
  }

  uint64_t v50 = *(void *)(v55 + 248);
  uint64_t v49 = *(void *)(v55 + 240);
  uint64_t v48 = *(void *)(v55 + 232);
  uint64_t v47 = *(void *)(v55 + 224);
  uint64_t v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v55 + 216);
  uint64_t v1 = *(void *)(v55 + 200);
  uint64_t v45 = *(void *)(v55 + 184);
  uint64_t v2 = sub_10000A1F8();
  uint64_t v3 = v46(v1, v2, v45);
  uint64_t v53 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v52 = static os_log_type_t.default.getter();
  *(void *)(v55 + 56) = 2LL;
  UnsignedInteger<>.init<A>(_:)(v55 + 56, &type metadata for UInt32, &type metadata for Int, v47, v48, v49);
  uint32_t v51 = *(_DWORD *)(v55 + 284);
  uint64_t v54 = _allocateUninitializedArray<A>(_:)(0LL, v50);
  if (os_log_type_enabled(v53, v52))
  {
    uint64_t v4 = *(void *)(v55 + 256);
    uint64_t v40 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v39 = sub_100006E5C(&qword_100025B60);
    uint64_t v41 = sub_100006EC8(0LL, v39, v39);
    uint64_t v42 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    *(void *)(v55 + 72) = v40;
    *(void *)(v55 + 80) = v41;
    *(void *)(v55 + 88) = v42;
    sub_100006F20(0LL, (_BYTE **)(v55 + 72));
    sub_100006F20(0LL, (_BYTE **)(v55 + 72));
    *(void *)(v55 + 96) = v54;
    v43 = (void *)swift_task_alloc(48LL);
    v43[2] = v55 + 72;
    v43[3] = v55 + 80;
    v43[4] = v55 + 88;
    uint64_t v44 = sub_100006E5C(&qword_100025B68);
    unint64_t v5 = sub_100006FA4();
    uint64_t result = Sequence.forEach(_:)(sub_100007454, v43, v44, v5);
    if (v4) {
      return result;
    }
    swift_task_dealloc(v43);
    _os_log_impl( (void *)&_mh_execute_header,  v53,  v52,  "Creating a new configuration as posterInfo has changed.",  v40,  v51);
    sub_100007088(v41, 0LL);
    sub_100007088(v42, 0LL);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease(v54);
    uint64_t v38 = 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v54);
    uint64_t v38 = *(void *)(v55 + 256);
  }

  uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v55 + 264);
  uint64_t v32 = *(void *)(v55 + 200);
  uint64_t v33 = *(void *)(v55 + 184);
  uint64_t v36 = *(void *)(v55 + 168);

  v34(v32, v33);
  sub_1000073F0();
  uint64_t v35 = (void *)PRPosterRoleAmbient;
  id v7 = PRPosterRoleAmbient;
  id v37 = sub_100005A50(v35);
  *(void *)(v55 + 64) = v37;
  PRMutablePosterConfiguration.setIdlePosterInfo(_:)(v36);
  if (!v38)
  {
    uint64_t v28 = *(void *)(v55 + 176);
    uint64_t v27 = *(void *)(v55 + 168);
    uint64_t v26 = *(void *)(v55 + 160);
    uint64_t v29 = *(void *)(v55 + 152);
    uint64_t v24 = *((void *)sub_10000449C() + 1);
    swift_bridgeObjectRetain(v24);
    id v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    [v37 setDisplayNameLocalizationKey:v25];

    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v30(v27, v29);
    v30(v28, v29);
    id v31 = v37;
LABEL_10:
    uint64_t v16 = *(void *)(v55 + 200);
    uint64_t v17 = *(void *)(v55 + 176);
    uint64_t v18 = *(void *)(v55 + 168);
    swift_task_dealloc(*(void *)(v55 + 208));
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    return (*(uint64_t (**)(id))(*(void *)(v55 + 16) + 8LL))(v31);
  }

  uint64_t v12 = *(void *)(v55 + 208);
  uint64_t v13 = *(void *)(v55 + 200);
  uint64_t v14 = *(void *)(v55 + 176);
  uint64_t v15 = *(void *)(v55 + 168);
  uint64_t v9 = *(void *)(v55 + 160);
  uint64_t v10 = *(void *)(v55 + 152);

  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v11(v15, v10);
  v11(v14, v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  return (*(uint64_t (**)())(*(void *)(v55 + 16) + 8LL))();
}

id sub_100005A50(void *a1)
{
  id v4 = [(id)swift_getObjCClassFromMetadata(v1) mutableConfigurationWithRole:a1];

  return v4;
}

uint64_t sub_100005B40(void *a1, void *a2, const void *a3, void *a4)
{
  v4[5] = a4;
  v4[4] = a2;
  v4[3] = a1;
  v4[2] = v4;
  id v6 = a1;
  id v7 = a2;
  v4[6] = _Block_copy(a3);
  id v8 = a4;
  uint64_t v9 = (void *)swift_task_alloc(dword_100025BA4);
  *(void *)(v12 + 56) = v9;
  *uint64_t v9 = *(void *)(v12 + 16);
  v9[1] = sub_100005BF4;
  return sub_100004E4C((uint64_t)a1, (uint64_t)a2);
}

void *sub_100005BF4(void *a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 56);
  *(void *)(v3 + 16) = *v2;
  uint64_t v12 = v3 + 16;
  uint64_t v13 = (void *)(v3 + 16);
  swift_task_dealloc(v4);
  if (v1)
  {
    uint64_t v9 = *(void (***)(void *, void))(v12 + 32);
    id v8 = (id)_convertErrorToNSError(_:)();
    v9[2](v9, 0LL);

    _Block_release(v9);
    swift_errorRelease();
  }

  else
  {
    aBlock = *(void (***)(void))(v12 + 32);
    aBlock[2]();
    _Block_release(aBlock);
  }

  id v6 = *(void **)(v12 + 16);
  id v7 = *(void **)(v12 + 8);

  return (*(void *(**)(void *__return_ptr))(*v13 + 8LL))(v13);
}

uint64_t sub_100005D18(uint64_t a1)
{
  unint64_t v3 = sub_100008224();
  unint64_t v1 = sub_10000814C();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()(a1, v3, v1);
}

uint64_t sub_100005D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_100008224();
  unint64_t v3 = sub_10000814C();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3);
}

uint64_t sub_100005D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_100008224();
  unint64_t v3 = sub_10000814C();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3) & 1;
}

uint64_t sub_100005DE4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_100008224();
  unint64_t v2 = sub_10000814C();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)(a1, a2, v5, v2);
}

uint64_t sub_100005E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100007F24();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for Int) & 1;
}

uint64_t sub_100005E74(uint64_t a1)
{
  unint64_t v3 = sub_1000080DC();
  unint64_t v1 = sub_10000814C();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()(a1, v3, v1);
}

uint64_t sub_100005EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_1000080DC();
  unint64_t v3 = sub_10000814C();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3);
}

uint64_t sub_100005EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_1000080DC();
  unint64_t v3 = sub_10000814C();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3) & 1;
}

uint64_t sub_100005F40(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_1000080DC();
  unint64_t v2 = sub_10000814C();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)(a1, a2, v5, v2);
}

uint64_t sub_100005F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100007B9C();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for Int) & 1;
}

uint64_t sub_100005FD0(uint64_t a1)
{
  unint64_t v3 = sub_100007F94();
  unint64_t v1 = sub_100008004();
  return OptionSet<>.init()(a1, v3, v1);
}

uint64_t sub_100006010(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100007F94();
  return OptionSet<>.contains(_:)(a1, a2, v2) & 1;
}

uint64_t sub_100006048(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100007F94();
  return OptionSet.union(_:)(a1, a2, v2);
}

uint64_t sub_100006084(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100007F94();
  return OptionSet.intersection(_:)(a1, a2, v2);
}

uint64_t sub_1000060C0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100007F94();
  return OptionSet.symmetricDifference(_:)(a1, a2, v2);
}

uint64_t sub_1000060FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100007F94();
  return OptionSet<>.insert(_:)(a1, a2, a3, v3) & 1;
}

uint64_t sub_10000613C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100007F94();
  return OptionSet<>.remove(_:)(a1, a2, v2);
}

uint64_t sub_100006178(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100007F94();
  return OptionSet<>.update(with:)(a1, a2, v2);
}

uint64_t sub_1000061B4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_100007F94();
  unint64_t v2 = sub_100008004();
  return OptionSet<>.formUnion(_:)(a1, a2, v5, v2);
}

uint64_t sub_1000061F4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_100007F94();
  unint64_t v2 = sub_100008004();
  return OptionSet<>.formIntersection(_:)(a1, a2, v5, v2);
}

uint64_t sub_100006234(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_100007F94();
  unint64_t v2 = sub_100008004();
  return OptionSet<>.formSymmetricDifference(_:)(a1, a2, v5, v2);
}

uint64_t sub_100006274()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t sub_100006288()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t sub_1000062A0()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t sub_1000062B8()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t sub_1000062D0()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t sub_1000062E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_100006320()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t sub_100006334(uint64_t a1)
{
  unint64_t v3 = sub_100008F30();
  unint64_t v1 = sub_100008FA0();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()(a1, v3, v1);
}

uint64_t sub_10000636C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_100008F30();
  unint64_t v3 = sub_100008FA0();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3);
}

uint64_t sub_1000063B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_100008F30();
  unint64_t v3 = sub_100008FA0();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3) & 1;
}

uint64_t sub_100006400(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_100008F30();
  unint64_t v2 = sub_100008FA0();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)(a1, a2, v5, v2);
}

uint64_t sub_100006448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100008DB8();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for String) & 1;
}

void sub_100006490(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2 & 1;
}

  ;
}

void sub_1000064EC(void *a1@<X8>)
{
  *a1 = v1;
}

  ;
}

uint64_t sub_100006534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_10000806C();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for UInt) & 1;
}

void sub_10000657C(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2 & 1;
}

  ;
}

void sub_1000065D8(void *a1@<X8>)
{
  *a1 = v1;
}

  ;
}

uint64_t sub_100006620@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_3(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100006660@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_4(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_100006690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100007D28();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for UInt) & 1;
}

uint64_t sub_1000066D8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100007DAC();
  return SetAlgebra<>.init(arrayLiteral:)(a1, a2, v2);
}

uint64_t sub_100006714@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *a2 = result;
  return result;
}

NSString sub_100006740@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_100006774(*a1, a1[1]);
  *a2 = result;
  return result;
}

NSString sub_100006774(uint64_t a1, uint64_t a2)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v2 = v5;
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(a2);

  return v5;
}

uint64_t sub_1000067CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000067FC(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000067FC(void *a1)
{
  id v1 = a1;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);

  return v4;
}

uint64_t sub_100006848@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_2(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100006884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_5(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1000068B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_6(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1000068F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_7(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_100006924(uint64_t a1)
{
  unint64_t v3 = sub_100008294();
  unint64_t v1 = sub_100008224();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v1, &protocol witness table for Int);
}

uint64_t sub_100006980(uint64_t a1)
{
  unint64_t v3 = sub_1000081B4();
  unint64_t v1 = sub_1000080DC();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v1, &protocol witness table for Int);
}

uint64_t sub_1000069DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100006A18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_8(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_100006A48(uint64_t a1)
{
  unint64_t v3 = sub_100009008();
  unint64_t v1 = sub_100008F30();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v1, &protocol witness table for String);
}

uint64_t sub_100006A90(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100008224();
  return _SwiftNewtypeWrapper<>.hashValue.getter(a1, a2, v2, &protocol witness table for Int);
}

uint64_t sub_100006ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100008224();
  return _SwiftNewtypeWrapper<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for Int);
}

uint64_t sub_100006B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100008224();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for Int);
}

uint64_t sub_100006B54(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000080DC();
  return _SwiftNewtypeWrapper<>.hashValue.getter(a1, a2, v2, &protocol witness table for Int);
}

uint64_t sub_100006B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_1000080DC();
  return _SwiftNewtypeWrapper<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for Int);
}

uint64_t sub_100006BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_1000080DC();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for Int);
}

uint64_t sub_100006C18(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100008F30();
  return _SwiftNewtypeWrapper<>.hashValue.getter(a1, a2, v2, &protocol witness table for String);
}

uint64_t sub_100006C54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100008F30();
  return _SwiftNewtypeWrapper<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_100006C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100008F30();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_100006CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100007A10();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for Int) & 1;
}

unint64_t sub_100006D24()
{
  uint64_t v2 = qword_100025B40;
  if (!qword_100025B40)
  {
    unint64_t v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)( &protocol conformance descriptor for UInt32,  &type metadata for UInt32);
    atomic_store(v0, (unint64_t *)&qword_100025B40);
    return v0;
  }

  return v2;
}

unint64_t sub_100006D8C()
{
  uint64_t v2 = qword_100025B48;
  if (!qword_100025B48)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025B48);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100006DF4()
{
  uint64_t v2 = qword_100025B50;
  if (!qword_100025B50)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025B50);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_100006E5C(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2((char *)a1 + (int)*a1, -(*a1 >> 32), 0LL);
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }

  return v4;
}

uint64_t sub_100006EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100006F20(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100006F34( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100006F78(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_100006FA4()
{
  uint64_t v3 = qword_100025B70;
  if (!qword_100025B70)
  {
    uint64_t v0 = sub_100007014(&qword_100025B68);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025B70);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100007014(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)*a1,  -(*a1 >> 32),  0LL);
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }

  return v4;
}

void sub_100007088(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }

uint64_t sub_1000070F4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100007120(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_10000714C()
{
  uint64_t v3 = qword_100025B80;
  if (!qword_100025B80)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRPosterDescriptor);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100025B80);
    return ObjCClassMetadata;
  }

  return v3;
}

unint64_t sub_1000071B0()
{
  uint64_t v3 = qword_100025B88;
  if (!qword_100025B88)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRMutablePosterDescriptor);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100025B88);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_100007214()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v2, 48LL, 7LL);
}

uint64_t sub_100007268()
{
  *(void *)(v1 + 16) = v1;
  unint64_t v7 = (void *)v0[2];
  uint64_t v4 = (void *)v0[3];
  NSString v5 = (const void *)v0[4];
  id v6 = (void *)v0[5];
  uint64_t v2 = (void *)swift_task_alloc(dword_100025B94);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_100007320;
  return ((uint64_t (*)(void *, void *, const void *, void *))((char *)&dword_100025B90 + dword_100025B90))( v7,  v4,  v5,  v6);
}

uint64_t sub_100007320()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

unint64_t sub_100007380()
{
  uint64_t v3 = qword_100025BA8;
  if (!qword_100025BA8)
  {
    uint64_t v0 = type metadata accessor for IdlePosterInfo(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for IdlePosterInfo, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025BA8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000073F0()
{
  uint64_t v3 = qword_100025BB0;
  if (!qword_100025BB0)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRMutablePosterConfiguration);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100025BB0);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_100007454(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100007480(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1000074AC()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_100007500()
{
  *(void *)(v1 + 16) = v1;
  unint64_t v7 = (void *)v0[2];
  uint64_t v4 = (void *)v0[3];
  NSString v5 = (const void *)v0[4];
  id v6 = (void *)v0[5];
  uint64_t v2 = (void *)swift_task_alloc(dword_100025BBC);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_1000075B8;
  return ((uint64_t (*)(void *, void *, const void *, void *))((char *)&dword_100025BB8 + dword_100025BB8))( v7,  v4,  v5,  v6);
}

uint64_t sub_1000075B8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for PosterUpdater()
{
  return objc_opt_self(&OBJC_CLASS____TtC12MemoryPoster13PosterUpdater);
}

uint64_t type metadata accessor for TVISAmbientPosterServiceSnapshotUpdateTrait(uint64_t a1)
{
  uint64_t v5 = qword_100025CB0;
  if (!qword_100025CB0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_1000208A0);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100025CB0);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for UITraitEnvironmentLayoutDirection(uint64_t a1)
{
  uint64_t v5 = qword_100025CB8;
  if (!qword_100025CB8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_1000208C8);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100025CB8);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for AutoresizingMask(uint64_t a1)
{
  uint64_t v5 = qword_100025CC0;
  if (!qword_100025CC0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_1000208E8);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100025CC0);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for PRRenderingMode(uint64_t a1)
{
  uint64_t v5 = qword_100025CC8;
  if (!qword_100025CC8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100020910);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100025CC8);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for TVISPhotoSlideShowStyleType(uint64_t a1)
{
  uint64_t v5 = qword_100025CD0;
  if (!qword_100025CD0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100020930);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100025CD0);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for TVISAmbientSnapshotQueryIntent(uint64_t a1)
{
  uint64_t v5 = qword_100025CD8;
  if (!qword_100025CD8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100020958);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100025CD8);
      return v2;
    }
  }

  return v5;
}

unint64_t sub_1000079FC()
{
  return sub_100007A10();
}

unint64_t sub_100007A10()
{
  uint64_t v3 = qword_100025CE0;
  if (!qword_100025CE0)
  {
    uint64_t Intent = type metadata accessor for TVISAmbientSnapshotQueryIntent(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DDE0, Intent);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025CE0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007A80()
{
  return sub_100007A94();
}

unint64_t sub_100007A94()
{
  uint64_t v3 = qword_100025CE8;
  if (!qword_100025CE8)
  {
    uint64_t Intent = type metadata accessor for TVISAmbientSnapshotQueryIntent(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DDB4, Intent);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025CE8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007B04()
{
  return sub_100007B18();
}

unint64_t sub_100007B18()
{
  uint64_t v3 = qword_100025CF0;
  if (!qword_100025CF0)
  {
    uint64_t Intent = type metadata accessor for TVISAmbientSnapshotQueryIntent(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DE50, Intent);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025CF0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007B88()
{
  return sub_100007B9C();
}

unint64_t sub_100007B9C()
{
  uint64_t v3 = qword_100025CF8;
  if (!qword_100025CF8)
  {
    uint64_t v0 = type metadata accessor for TVISPhotoSlideShowStyleType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DF38, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025CF8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007C0C()
{
  return sub_100007C20();
}

unint64_t sub_100007C20()
{
  uint64_t v3 = qword_100025D00;
  if (!qword_100025D00)
  {
    uint64_t v0 = type metadata accessor for TVISPhotoSlideShowStyleType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DF0C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D00);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007C90()
{
  return sub_100007CA4();
}

unint64_t sub_100007CA4()
{
  uint64_t v3 = qword_100025D08;
  if (!qword_100025D08)
  {
    uint64_t v0 = type metadata accessor for TVISPhotoSlideShowStyleType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E300, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D08);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007D14()
{
  return sub_100007D28();
}

unint64_t sub_100007D28()
{
  uint64_t v3 = qword_100025D10;
  if (!qword_100025D10)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E0EC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D10);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007D98()
{
  return sub_100007DAC();
}

unint64_t sub_100007DAC()
{
  uint64_t v3 = qword_1000260E0;
  if (!qword_1000260E0)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E208, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000260E0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007E1C()
{
  return sub_100007E30();
}

unint64_t sub_100007E30()
{
  uint64_t v3 = qword_100025D20;
  if (!qword_100025D20)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E0C0, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D20);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007EA0()
{
  return sub_100007EB4();
}

unint64_t sub_100007EB4()
{
  uint64_t v3 = qword_100025D28;
  if (!qword_100025D28)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E08C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D28);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007F24()
{
  uint64_t v3 = qword_100025D30;
  if (!qword_100025D30)
  {
    uint64_t v0 = type metadata accessor for PRRenderingMode(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E044, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D30);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100007F94()
{
  uint64_t v3 = qword_100025D38;
  if (!qword_100025D38)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E128, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D38);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100008004()
{
  uint64_t v2 = qword_100025D40;
  if (!qword_100025D40)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt, &type metadata for UInt);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D40);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_10000806C()
{
  uint64_t v3 = qword_100025D48;
  if (!qword_100025D48)
  {
    uint64_t updated = type metadata accessor for TVISAmbientPosterServiceSnapshotUpdateTrait(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E164, updated);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D48);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000080DC()
{
  uint64_t v3 = qword_100025D50;
  if (!qword_100025D50)
  {
    uint64_t v0 = type metadata accessor for TVISPhotoSlideShowStyleType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DF74, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D50);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000814C()
{
  uint64_t v2 = qword_100025D58;
  if (!qword_100025D58)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D58);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_1000081B4()
{
  uint64_t v3 = qword_100025D60;
  if (!qword_100025D60)
  {
    uint64_t v0 = type metadata accessor for TVISPhotoSlideShowStyleType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DFA8, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D60);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100008224()
{
  uint64_t v3 = qword_100025D68;
  if (!qword_100025D68)
  {
    uint64_t Intent = type metadata accessor for TVISAmbientSnapshotQueryIntent(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DE1C, Intent);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D68);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100008294()
{
  uint64_t v3 = qword_100025D70;
  if (!qword_100025D70)
  {
    uint64_t Intent = type metadata accessor for TVISAmbientSnapshotQueryIntent(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001DE7C, Intent);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025D70);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100008304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_continuation_throwingResume(a2);
}

uint64_t sub_100008354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocError(a4, a5, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(v5, a1);
  return swift_continuation_throwingResumeWithError(a2, v9);
}

void sub_1000083C4()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_1000083D0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = v3;
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = *(void *)(v3 + 16);
  v4[1] = sub_10000844C;
  return v6();
}

uint64_t sub_10000844C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000084AC()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_1000084F0()
{
  *(void *)(v1 + 16) = v1;
  uint64_t v6 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_100025D84);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_1000085A8;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100025D80 + dword_100025D80))(v6, v4, v5);
}

uint64_t sub_1000085A8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100008608(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = v4;
  unint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = *(void *)(v4 + 16);
  v5[1] = sub_100008684;
  return v7();
}

uint64_t sub_100008684()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000086E4()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_100008728(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  unint64_t v7 = (int *)v1[4];
  uint64_t v3 = (void *)swift_task_alloc(dword_100025D94);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_1000087E8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100025D90 + dword_100025D90))( a1,  v5,  v6,  v7);
}

uint64_t sub_1000087E8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100008848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 48))(a1, 1LL) == 1)
  {
    sub_100008A68(a1);
    uint64_t v15 = 0LL;
  }

  else
  {
    unsigned __int8 v14 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a1, v19);
    uint64_t v15 = v14;
  }

  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v13)
  {
    uint64_t ObjectType = swift_getObjectType(v13);
    uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
    uint64_t v9 = v4;
    swift_unknownObjectRelease(v13);
    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  uint64_t v6 = swift_allocObject(&unk_1000209D0, 32LL, 7LL);
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  unint64_t v7 = 0LL;
  if (v10 != 0 || v11 != 0)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    v21[2] = v10;
    v21[3] = v11;
    unint64_t v7 = v21;
  }

  return swift_task_create(v15 | 0x1C00, v7, (char *)&type metadata for () + 8, &unk_100025DA8, v6);
}

uint64_t sub_100008A68(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_100008AD8(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100008B5C;
  return v5(a1);
}

uint64_t sub_100008B5C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100008BC0()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100008BFC(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc(dword_100025DA4);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100008CA4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100025DA0 + dword_100025DA0))(a1, v5);
}

uint64_t sub_100008CA4()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for PRRenderingEventType(uint64_t a1)
{
  uint64_t v5 = qword_100025DC0;
  if (!qword_100025DC0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_1000209F8);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100025DC0);
      return v2;
    }
  }

  return v5;
}

unint64_t sub_100008DA4()
{
  return sub_100008DB8();
}

unint64_t sub_100008DB8()
{
  uint64_t v3 = qword_100025DC8;
  if (!qword_100025DC8)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E388, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025DC8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100008E28()
{
  return sub_100008E3C();
}

unint64_t sub_100008E3C()
{
  uint64_t v3 = qword_100025DD0;
  if (!qword_100025DD0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E35C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025DD0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100008EAC()
{
  return sub_100008EC0();
}

unint64_t sub_100008EC0()
{
  uint64_t v3 = qword_1000262B0;
  if (!qword_1000262B0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E488, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000262B0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100008F30()
{
  uint64_t v3 = qword_100025DE0;
  if (!qword_100025DE0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E3C4, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025DE0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100008FA0()
{
  uint64_t v2 = qword_100025DE8;
  if (!qword_100025DE8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025DE8);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100009008()
{
  uint64_t v3 = qword_100025DF0;
  if (!qword_100025DF0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E3F8, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025DF0);
    return WitnessTable;
  }

  return v3;
}

id sub_100009078()
{
  id v10 = 0LL;
  id v11 = 0LL;
  sub_10000915C();
  id v9 = sub_1000091C0();
  type metadata accessor for PosterUpdater();
  id v0 = v9;
  id v8 = sub_100002F18(v9);
  id v1 = v8;
  id v10 = v8;
  type metadata accessor for PosterPresenter();
  id v2 = v9;
  id v7 = sub_10000A3C0(v9);
  id v3 = v7;
  id v11 = v7;

  id v4 = v8;
  id v5 = v7;

  sub_1000091EC(&v10);
  return v8;
}

unint64_t sub_10000915C()
{
  uint64_t v3 = qword_100025F80;
  if (!qword_100025F80)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___TVISAmbientPosterServiceProxy);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100025F80);
    return ObjCClassMetadata;
  }

  return v3;
}

id sub_1000091C0()
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0));
  return sub_10000A14C();
}

id *sub_1000091EC(id *a1)
{
  return a1;
}

uint64_t sub_100009220(void *a1, void *a2)
{
  unsigned __int8 v14 = a1;
  uint64_t v15 = a2;
  uint64_t v11 = sub_100006E5C(&qword_100025F88);
  id v2 = a1;
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = swift_allocObject(&unk_100020BB8, 32LL, 7LL);
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v10 = PRProviderConfiguration.__allocating_init(updatingDelegate:content:)();
  swift_retain(v10);
  uint64_t v13 = v10;
  uint64_t v12 = v10;
  unint64_t v6 = sub_100009508();
  static _SceneBuilder.buildBlock<A>(_:)(&v12, v11, v6);
  swift_release(v12);
  return swift_release(v13);
}

uint64_t sub_100009318@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v24 = a1;
  id v25 = a2;
  uint64_t v15 = type metadata accessor for PRRenderingConfiguration(0LL);
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = swift_allocObject(&unk_100020C60, 32LL, 7LL);
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v14 = PRRenderingConfiguration.__allocating_init(_:)(sub_10000A010);
  swift_retain(v14);
  uint64_t v23 = v14;
  uint64_t v16 = type metadata accessor for PREditingConfiguration(0LL);
  id v6 = a1;
  id v7 = a2;
  uint64_t v8 = swift_allocObject(&unk_100020C88, 32LL, 7LL);
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v13 = PREditingConfiguration.__allocating_init(_:)(sub_10000A060);
  swift_retain(v13);
  uint64_t v22 = v13;
  uint64_t v21 = v14;
  uint64_t v20 = v13;
  unint64_t v17 = sub_10000A06C();
  unint64_t v9 = sub_10000A0DC();
  uint64_t v18 = sub_1000095F8((uint64_t)&v21, (uint64_t)&v20, v15, v16, v17, v9);
  swift_release(v20);
  swift_release(v21);
  *a3 = v18;
  swift_release(v22);
  return swift_release(v23);
}

uint64_t sub_1000094B8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000094FC@<X0>(uint64_t *a1@<X8>)
{
  return sub_100009318(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_100009508()
{
  uint64_t v3 = qword_100025F90;
  if (!qword_100025F90)
  {
    uint64_t v0 = sub_100007014(&qword_100025F88);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025F90);
    return WitnessTable;
  }

  return v3;
}

id sub_100009578(int a1, id a2)
{
  id v2 = a2;
  return a2;
}

id sub_1000095B8(int a1, id a2)
{
  id v2 = a2;
  return a2;
}

uint64_t sub_1000095F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = a1;
  uint64_t v22 = a2;
  uint64_t v17 = a3;
  uint64_t v25 = a4;
  uint64_t v18 = a5;
  uint64_t v26 = a6;
  uint64_t v30 = a3;
  uint64_t v29 = a4;
  uint64_t v21 = *(void *)(a4 - 8);
  unint64_t v12 = (*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v27 = (char *)&v11 - v12;
  uint64_t v15 = *(void *)(v6 - 8);
  unint64_t v13 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v19 = (char *)&v11 - v13;
  uint64_t v14 = sub_100006E5C((uint64_t *)&unk_100025FC0);
  uint64_t v7 = *(void *)(type metadata accessor for _AnySceneConfiguration(0LL) - 8);
  uint64_t v20 = *(void *)(v7 + 72);
  uint64_t v8 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + 2 * v20,  *(unsigned __int8 *)(v7 + 80) | 7LL);
  uint64_t v28 = sub_10000A16C(v8, 2LL);
  uint64_t v24 = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v19, v16, v17);
  _AnySceneConfiguration.init<A>(erasing:)(v19, v17, v18);
  uint64_t v23 = v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v27, v22, v25);
  _AnySceneConfiguration.init<A>(erasing:)(v27, v25, v26);
  uint64_t result = v28;
  sub_10000A1BC();
  return result;
}

uint64_t sub_100009790()
{
  unint64_t v2 = sub_100009EF0();
  unint64_t v0 = sub_100009F5C();
  return static _AppExtension<>.main()(&unk_100020C38, v2, v0);
}

id sub_100009810@<X0>(void *a1@<X8>)
{
  id result = sub_100009078();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_10000983C()
{
  return sub_100009220(*v0, v0[1]);
}

uint64_t sub_100009858()
{
  return _AppExtension.hostAuditToken.getter();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

void *sub_100009928(void *a1, uint64_t a2)
{
  id v5 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v5;
  uint64_t v7 = *(void **)(a2 + 8);
  id v3 = v7;
  id result = a1;
  a1[1] = v7;
  return result;
}

void sub_10000997C(id *a1)
{
}

void *sub_1000099AC(void *a1, uint64_t a2)
{
  id v5 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v5;
  uint64_t v7 = *(void **)(a2 + 8);
  id v3 = v7;
  id result = a1;
  a1[1] = v7;
  return result;
}

uint64_t sub_100009A00(uint64_t a1, uint64_t a2)
{
  id v7 = *(id *)a2;
  id v2 = *(id *)a2;
  id v3 = *(void **)a1;
  *(void *)a1 = v7;

  uint64_t v9 = *(void **)(a2 + 8);
  id v4 = v9;
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v9;

  return a1;
}

__n128 sub_100009A68(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100009A74(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  id v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  return a1;
}

uint64_t sub_100009AC4(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      int v4 = *(_OWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      int v3 = -1;
      int v4 = v3;
    }
  }

  else
  {
    int v4 = -1;
  }

  return (v4 + 1);
}

uint64_t sub_100009C24(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)__n128 result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 16) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)__n128 result = a2 - 1;
    }
  }

  return result;
}

void *type metadata accessor for MemoryPosterExtension()
{
  return &unk_100020C38;
}

unint64_t sub_100009E40()
{
  return sub_100009E54();
}

unint64_t sub_100009E54()
{
  uint64_t v3 = qword_100025F98;
  if (!qword_100025F98)
  {
    uint64_t v0 = sub_100007014(&qword_100025F88);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025F98);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100009EC4(uint64_t a1)
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2(a1, &unk_10001E724, 1LL) + 8) + 8LL);
}

unint64_t sub_100009EF0()
{
  uint64_t v2 = qword_100025FA0;
  if (!qword_100025FA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E518, &unk_100020C38);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025FA0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100009F5C()
{
  uint64_t v3 = qword_100025FA8;
  if (!qword_100025FA8)
  {
    uint64_t v0 = sub_100007014(&qword_100025F88);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025FA8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100009FCC()
{
  return swift_deallocObject(v2, 32LL);
}

id sub_10000A010()
{
  return sub_100009578(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_10000A01C()
{
  return swift_deallocObject(v2, 32LL);
}

id sub_10000A060()
{
  return sub_1000095B8(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

unint64_t sub_10000A06C()
{
  uint64_t v3 = qword_100025FB0;
  if (!qword_100025FB0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingConfiguration(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRRenderingConfiguration, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025FB0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000A0DC()
{
  uint64_t v3 = qword_100025FB8;
  if (!qword_100025FB8)
  {
    uint64_t v0 = type metadata accessor for PREditingConfiguration(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PREditingConfiguration, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100025FB8);
    return WitnessTable;
  }

  return v3;
}

id sub_10000A14C()
{
  return [v0 init];
}

uint64_t sub_10000A16C(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = 2 * a2;
  type metadata accessor for _AnySceneConfiguration(0LL);
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000A1BC()
{
}

void sub_10000A1EC()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_10000A1F8()
{
  if (qword_100025B28 != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)(&qword_100025B28, sub_10000A258);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_10000A2FC(v0, (uint64_t)qword_1000262E0);
}

uint64_t sub_10000A258()
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000A33C(v3, qword_1000262E0);
  sub_10000A2FC(v3, (uint64_t)qword_1000262E0);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.IdleScreen.Memory", 0x1BuLL, 1);
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

uint64_t sub_10000A2FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_10000A33C(uint64_t a1, uint64_t *a2)
{
  id v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc( *(void *)(*(void *)(a1 - 8) + 64LL),  *(_DWORD *)(*(void *)(a1 - 8) + 80LL));
    *a2 = v2;
    return v2;
  }

  return (uint64_t)v5;
}

void *type metadata accessor for Log()
{
  return &unk_100020CE8;
}

id sub_10000A3C0(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return sub_10000A3F8(a1);
}

id sub_10000A3F8(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v1);
  v15[6] = a1;
  id v2 = v1;
  uint64_t v3 = v1;
  int v4 = v1;
  id v5 = v1;
  id v16 = v1;
  *(void *)&v1[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_renderer] = 0LL;

  *(void *)&v1[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_environment] = 0LL;
  memset(v15, 0, 48);
  sub_10000A54C(v15, &v1[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state]);

  id v6 = a1;
  *(void *)&v10[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_serviceProxy] = a1;

  v14.receiver = v16;
  v14.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v14, "init");
  id v7 = v13;
  id v8 = v13;
  id v16 = v13;
  objc_msgSend(a1, "setDelegate:");
  swift_unknownObjectRelease(v13);

  return v13;
}

void *sub_10000A54C(const void *a1, void *a2)
{
  return a2;
}

uint64_t sub_10000A5CC(uint64_t a1)
{
  v2[12] = v1;
  v2[11] = a1;
  v2[2] = v2;
  v2[3] = 0LL;
  v2[4] = 0LL;
  v2[6] = 0LL;
  v2[8] = 0LL;
  v2[10] = 0LL;
  uint64_t v3 = sub_100006E5C(&qword_100025D78);
  v2[13] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v2[14] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[15] = v5;
  uint64_t v8 = *(void *)(v5 + 64);
  v2[16] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[17] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v10 = type metadata accessor for MainActor(0LL);
  v2[18] = v10;
  v2[19] = static MainActor.shared.getter(v10);
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  v2[20] = v11;
  v2[21] = v6;
  return swift_task_switch(sub_10000A70C, v11);
}

uint64_t sub_10000A70C()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v28 = *(void *)(v0 + 120);
  uint64_t v29 = *(void *)(v0 + 112);
  *(void *)(v0 + 16) = v0;
  uint64_t v2 = sub_10000A1F8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 16);
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = v3(v1, v2, v29);
  uint64_t v40 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v41 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 40) = 12LL;
  unint64_t v30 = sub_100006D24();
  *(void *)(v0 + 184) = v30;
  unint64_t v31 = sub_100006D8C();
  *(void *)(v0 + 192) = v31;
  unint64_t v5 = sub_100006DF4();
  *(void *)(v0 + 200) = v5;
  UnsignedInteger<>.init<A>(_:)(v0 + 40, &type metadata for UInt32, &type metadata for Int, v30, v31, v5);
  uint32_t v32 = *(_DWORD *)(v0 + 248);
  uint64_t v34 = swift_allocObject(&unk_100020D08, 17LL, 7LL);
  *(_BYTE *)(v34 + 16) = 32;
  uint64_t v35 = swift_allocObject(&unk_100020D30, 17LL, 7LL);
  *(_BYTE *)(v35 + 16) = 8;
  uint64_t v33 = swift_allocObject(&unk_100020D58, 32LL, 7LL);
  *(void *)(v33 + 16) = sub_10000B598;
  *(void *)(v33 + 24) = 0LL;
  uint64_t v37 = swift_allocObject(&unk_100020D80, 32LL, 7LL);
  *(void *)(v37 + 16) = sub_10001765C;
  *(void *)(v37 + 24) = v33;
  uint64_t v39 = sub_100006E5C(&qword_100025B58);
  *(void *)(v0 + 208) = v39;
  uint64_t v36 = _allocateUninitializedArray<A>(_:)(3LL, v39);
  uint64_t v38 = v6;
  swift_retain(v34);
  *uint64_t v38 = sub_1000175E8;
  v38[1] = v34;
  swift_retain(v35);
  v38[2] = sub_100017618;
  v38[3] = v35;
  swift_retain(v37);
  v38[4] = sub_1000176A4;
  v38[5] = v37;
  sub_100004A08();
  swift_bridgeObjectRelease(v36);
  if (os_log_type_enabled(v40, v41))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v23 = sub_100006E5C(&qword_100025B60);
    uint64_t v25 = sub_100006EC8(0LL, v23, v23);
    uint64_t v26 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v42 = buf;
    uint64_t v43 = v25;
    uint64_t v44 = v26;
    sub_100006F20(2LL, &v42);
    sub_100006F20(1LL, &v42);
    uint64_t v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000175E8;
    uint64_t v46 = v34;
    sub_100006F34(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    uint64_t v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100017618;
    uint64_t v46 = v35;
    sub_100006F34(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    uint64_t v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000176A4;
    uint64_t v46 = v37;
    sub_100006F34(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "%s", buf, v32);
    sub_100007088(v25, 0LL);
    sub_100007088(v26, 1LL);
    UnsafeMutablePointer.deallocate()();
    swift_release(v34);
    swift_release(v35);
    swift_release(v37);
  }

  else
  {
    swift_release(v34);
    swift_release(v35);
    swift_release(v37);
  }

  uint64_t v14 = v27[17];
  uint64_t v13 = v27[15];
  uint64_t v15 = v27[14];
  uint64_t v20 = v27[13];
  id v17 = (id)v27[12];
  uint64_t v18 = v27[11];

  id v7 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
  v27[27] = v7;
  uint64_t v8 = v7(v14, v15);
  static TaskPriority.userInitiated.getter(v8);
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 56LL))(v20, 0LL, 1LL);
  uint64_t v16 = static MainActor.shared.getter(v17);
  uint64_t v19 = (void *)swift_allocObject(&unk_100020DA8, 48LL, 7LL);
  v19[2] = v16;
  v19[3] = &protocol witness table for MainActor;
  v19[4] = v17;
  v19[5] = v18;
  uint64_t v22 = sub_100006E5C(&qword_100025DB0);
  uint64_t v21 = sub_10000B8DC(v20, (uint64_t)&unk_100026008, (uint64_t)v19, v22);
  v27[28] = v21;
  v27[6] = v21;
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to Task.value.getter[1]);
  v27[29] = v10;
  uint64_t v11 = sub_100006E5C(&qword_100025DB8);
  *uint64_t v10 = v27[2];
  v10[1] = sub_10000AD94;
  return Task.value.getter(v27 + 7, v21, v22, v11, &protocol self-conformance witness table for Error);
}

uint64_t sub_10000AD94()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 232);
  *(void *)(v2 + 16) = *v1;
  uint64_t v5 = v2 + 16;
  *(void *)(v2 + 240) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    return swift_task_switch(sub_10000AF14, *(void *)(v5 + 144));
  }
  else {
    return swift_task_switch(sub_10000AE48, *(void *)(v5 + 144));
  }
}

uint64_t sub_10000AE48()
{
  v0[2] = v0;
  uint64_t v2 = v0[7];
  v0[10] = v2;
  sub_10000BAB4(v2);
  swift_unknownObjectRelease(v2);
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[13];
  swift_release(v0[28]);
  swift_release(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0[2] + 8LL))();
}

uint64_t sub_10000AF14()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v22 = v1;
  uint64_t v35 = *(void *)(v0 + 208);
  uint64_t v25 = *(void *)(v0 + 200);
  uint64_t v24 = *(void *)(v0 + 192);
  uint64_t v23 = *(void *)(v0 + 184);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v20 = *(void *)(v0 + 112);
  *(void *)(v0 + 16) = v0;
  swift_errorRetain(v1);
  *(void *)(v0 + 64) = v22;
  uint64_t v3 = sub_10000A1F8();
  v21(v2, v3, v20);
  swift_errorRetain(v22);
  uint64_t v27 = swift_allocObject(&unk_100020DD0, 24LL, 7LL);
  *(void *)(v27 + 16) = v22;
  sub_10000DD2C();
  uint64_t v5 = swift_bridgeObjectRelease(v4);
  uint64_t v36 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v37 = static os_log_type_t.error.getter();
  *(void *)(v0 + 72) = 12LL;
  UnsignedInteger<>.init<A>(_:)(v0 + 72, &type metadata for UInt32, &type metadata for Int, v23, v24, v25);
  uint32_t v26 = *(_DWORD *)(v0 + 252);
  uint64_t v30 = swift_allocObject(&unk_100020DF8, 17LL, 7LL);
  *(_BYTE *)(v30 + 16) = 64;
  uint64_t v31 = swift_allocObject(&unk_100020E20, 17LL, 7LL);
  *(_BYTE *)(v31 + 16) = 8;
  uint64_t v28 = swift_allocObject(&unk_100020E48, 32LL, 7LL);
  *(void *)(v28 + 16) = sub_100017834;
  *(void *)(v28 + 24) = v27;
  uint64_t v29 = swift_allocObject(&unk_100020E70, 32LL, 7LL);
  *(void *)(v29 + 16) = sub_1000178D8;
  *(void *)(v29 + 24) = v28;
  uint64_t v33 = swift_allocObject(&unk_100020E98, 32LL, 7LL);
  *(void *)(v33 + 16) = sub_100017920;
  *(void *)(v33 + 24) = v29;
  uint64_t v32 = _allocateUninitializedArray<A>(_:)(3LL, v35);
  uint64_t v34 = v6;
  swift_retain(v30);
  *uint64_t v34 = sub_100017864;
  v34[1] = v30;
  swift_retain(v31);
  v34[2] = sub_100017894;
  v34[3] = v31;
  swift_retain(v33);
  v34[4] = sub_100017AC4;
  v34[5] = v33;
  sub_100004A08();
  swift_bridgeObjectRelease(v32);
  if (os_log_type_enabled(v36, v37))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v15 = sub_100006E5C(&qword_100025B60);
    uint64_t v17 = sub_100006EC8(1LL, v15, v15);
    uint64_t v18 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v38 = buf;
    uint64_t v39 = v17;
    uint64_t v40 = v18;
    sub_100006F20(2LL, &v38);
    sub_100006F20(1LL, &v38);
    os_log_type_t v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100017864;
    uint64_t v42 = v30;
    sub_100006F34(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
    os_log_type_t v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100017894;
    uint64_t v42 = v31;
    sub_100006F34(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
    os_log_type_t v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100017AC4;
    uint64_t v42 = v33;
    sub_100006F34(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "Failed to query snapshot: %@", buf, v26);
    sub_100007088(v17, 1LL);
    sub_100007088(v18, 0LL);
    UnsafeMutablePointer.deallocate()();
    swift_release(v30);
    swift_release(v31);
    swift_release(v33);
  }

  else
  {
    swift_release(v30);
    swift_release(v31);
    swift_release(v33);
  }

  uint64_t v10 = (void (*)(uint64_t, uint64_t))v19[27];
  uint64_t v8 = v19[16];
  uint64_t v9 = v19[14];

  v10(v8, v9);
  sub_10000DD54();
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v11 = v19[19];
  uint64_t v12 = v19[17];
  uint64_t v13 = v19[16];
  uint64_t v14 = v19[13];
  swift_release(v19[28]);
  swift_release(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(v19[2] + 8LL))();
}

uint64_t sub_10000B598()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("refreshViewModel(intent:)", 0x19uLL, 1)._countAndFlagsBits;
}

uint64_t sub_10000B5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[21] = a5;
  v5[20] = a4;
  v5[19] = a1;
  v5[15] = v5;
  v5[16] = 0LL;
  v5[17] = 0LL;
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  v5[22] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v5[23] = v9;
  v5[24] = v6;
  return swift_task_switch(sub_10000B668, v9);
}

uint64_t sub_10000B668()
{
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v1 = *(void *)(v0 + 160);
  *(void *)(v0 + 120) = v0;
  id v5 = *(id *)(v1 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_serviceProxy);
  *(void *)(v0 + 200) = v5;
  id v2 = v5;
  *(void *)(v0 + 16) = *(void *)(v0 + 120);
  *(void *)(v0 + 56) = v0 + 144;
  *(void *)(v0 + 24) = sub_10000B744;
  *(void *)(v0 + 112) = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(_DWORD *)(v0 + 88) = 0x40000000;
  *(_DWORD *)(v0 + 92) = 0;
  *(void *)(v0 + 96) = sub_1000040E0;
  *(void *)(v0 + 104) = &unk_1000218C8;
  [v5 queryCurrentSnapshotWithIntent:v4 reply:v0 + 80];
  return j__swift_continuation_await_0(v0 + 16);
}

uint64_t sub_10000B744()
{
  uint64_t v1 = *v0;
  *(void *)(v1 + 120) = *v0;
  uint64_t v2 = v1 + 120;
  uint64_t v3 = *(void *)(v2 - 72);
  *(void *)(v2 + 88) = v3;
  if (v3) {
    return swift_task_switch(sub_10000B85C, *(void *)(v2 + 64));
  }
  else {
    return swift_task_switch(sub_10000B7F4, *(void *)(v2 + 64));
  }
}

uint64_t sub_10000B7F4()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v4 = v0[22];
  uint64_t v2 = (void *)v0[19];
  v0[15] = v0;
  *uint64_t v2 = v0[18];

  swift_release(v4);
  return (*(uint64_t (**)(void))(v0[15] + 8LL))();
}

uint64_t sub_10000B85C()
{
  id v2 = (id)v0[25];
  uint64_t v3 = v0[22];
  v0[15] = v0;
  swift_willThrow();

  swift_release(v3);
  return (*(uint64_t (**)(void))(v0[15] + 8LL))();
}

uint64_t sub_10000B8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v22[4] = a4;
  uint64_t v20 = type metadata accessor for TaskPriority(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v21 + 48))(a1, 1LL) == 1)
  {
    sub_100008A68(a1);
    uint64_t v15 = 0LL;
  }

  else
  {
    unsigned __int8 v14 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a1, v20);
    uint64_t v15 = v14;
  }

  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(a3 + 24);
  swift_unknownObjectRetain(v13);
  if (v13)
  {
    uint64_t ObjectType = swift_getObjectType(v13);
    uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
    uint64_t v9 = v5;
    swift_unknownObjectRelease(v13);
    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  id v7 = 0LL;
  if (v10 != 0 || v11 != 0)
  {
    v22[0] = 0LL;
    v22[1] = 0LL;
    v22[2] = v10;
    v22[3] = v11;
    id v7 = v22;
  }

  return swift_task_create(v15 | 0x1C00, v7, a4, a2, a3);
}

void sub_10000BAB4(uint64_t a1)
{
  uint64_t v356 = a1;
  uint64_t v355 = v1;
  uint64_t ObjectType = swift_getObjectType(v1);
  v469 = 0LL;
  uint64_t v468 = 0LL;
  uint64_t v467 = 0LL;
  uint64_t v349 = 0LL;
  v458 = 0LL;
  v450 = 0LL;
  char v449 = 0;
  char v448 = 0;
  id v445 = 0LL;
  v430 = 0LL;
  id v425 = 0LL;
  v409 = 0LL;
  uint64_t v350 = 0LL;
  unint64_t v351 = (*(void *)(*(void *)(type metadata accessor for MemoryScreenSaverView() - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin(0LL);
  v352 = (uint64_t *)((char *)&v156 - v351);
  unint64_t v353 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v2);
  v354 = (uint64_t *)((char *)&v156 - v353);
  v469 = (char *)&v156 - v353;
  uint64_t v371 = type metadata accessor for Logger(v4);
  v370 = *(void **)(v371 - 8);
  uint64_t v366 = v370[8];
  unint64_t v357 = (v366 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(v356);
  v358 = (char *)&v156 - v357;
  unint64_t v359 = (v366 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = __chkstk_darwin(v5);
  v360 = (char *)&v156 - v359;
  unint64_t v361 = (v366 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v7 = __chkstk_darwin(v6);
  v362 = (char *)&v156 - v361;
  unint64_t v363 = (v366 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v7);
  v364 = (char *)&v156 - v363;
  unint64_t v365 = (v366 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = __chkstk_darwin(v8);
  v367 = (char *)&v156 - v365;
  unint64_t v368 = (v366 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v156 - v368;
  v369 = (char *)&v156 - v368;
  uint64_t v468 = v10;
  uint64_t v467 = v12;
  uint64_t v13 = sub_10000A1F8();
  v372 = (uint64_t (*)(char *, uint64_t, uint64_t))v370[2];
  uint64_t v14 = v372(v11, v13, v371);
  v388 = (os_log_s *)Logger.logObject.getter(v14);
  int v389 = static os_log_type_t.debug.getter();
  v375 = &v465;
  uint64_t v465 = 12LL;
  unint64_t v373 = sub_100006D24();
  unint64_t v374 = sub_100006D8C();
  unint64_t v376 = sub_100006DF4();
  UnsignedInteger<>.init<A>(_:)(v375, &type metadata for UInt32, &type metadata for Int, v373, v374, v376);
  uint32_t v377 = v466;
  uint64_t v378 = 17LL;
  uint64_t v380 = 7LL;
  uint64_t v15 = swift_allocObject(&unk_100020EC0, 17LL, 7LL);
  uint64_t v16 = v378;
  uint64_t v17 = v380;
  uint64_t v382 = v15;
  *(_BYTE *)(v15 + 16) = 32;
  uint64_t v18 = swift_allocObject(&unk_100020EE8, v16, v17);
  uint64_t v19 = v380;
  uint64_t v383 = v18;
  *(_BYTE *)(v18 + 16) = 8;
  uint64_t v379 = 32LL;
  uint64_t v20 = swift_allocObject(&unk_100020F10, 32LL, v19);
  uint64_t v21 = v379;
  uint64_t v22 = v380;
  uint64_t v381 = v20;
  *(void *)(v20 + 16) = sub_10000E3A8;
  *(void *)(v20 + 24) = 0LL;
  uint64_t v23 = swift_allocObject(&unk_100020F38, v21, v22);
  uint64_t v24 = v381;
  uint64_t v385 = v23;
  *(void *)(v23 + 16) = sub_100017B6C;
  *(void *)(v23 + 24) = v24;
  uint64_t v387 = sub_100006E5C(&qword_100025B58);
  uint64_t v384 = _allocateUninitializedArray<A>(_:)(3LL, v387);
  v386 = v25;
  swift_retain(v382);
  uint64_t v26 = v383;
  uint64_t v27 = v382;
  uint64_t v28 = v386;
  void *v386 = sub_100017AF8;
  v28[1] = v27;
  swift_retain(v26);
  uint64_t v29 = v385;
  uint64_t v30 = v383;
  uint64_t v31 = v386;
  v386[2] = sub_100017B28;
  v31[3] = v30;
  swift_retain(v29);
  uint64_t v32 = v384;
  uint64_t v33 = v385;
  uint64_t v34 = v386;
  v386[4] = sub_100017BB4;
  v34[5] = v33;
  sub_100004A08();
  swift_bridgeObjectRelease(v32);
  if (os_log_type_enabled(v388, (os_log_type_t)v389))
  {
    uint64_t v35 = v349;
    v341 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v340 = sub_100006E5C(&qword_100025B60);
    uint64_t v342 = sub_100006EC8(0LL, v340, v340);
    uint64_t v343 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v344 = &v394;
    v394 = v341;
    v345 = &v393;
    uint64_t v393 = v342;
    v346 = &v392;
    uint64_t v392 = v343;
    sub_100006F20(2LL, &v394);
    sub_100006F20(1LL, v344);
    v390 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100017AF8;
    uint64_t v391 = v382;
    sub_100006F34(&v390, (uint64_t)v344, (uint64_t)v345, (uint64_t)v346);
    uint64_t v347 = v35;
    if (v35)
    {
      __break(1u);
    }

    else
    {
      v390 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100017B28;
      uint64_t v391 = v383;
      sub_100006F34(&v390, (uint64_t)&v394, (uint64_t)&v393, (uint64_t)&v392);
      uint64_t v338 = 0LL;
      v390 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100017BB4;
      uint64_t v391 = v385;
      sub_100006F34(&v390, (uint64_t)&v394, (uint64_t)&v393, (uint64_t)&v392);
      uint64_t v337 = 0LL;
      _os_log_impl((void *)&_mh_execute_header, v388, (os_log_type_t)v389, "%s", v341, v377);
      sub_100007088(v342, 0LL);
      sub_100007088(v343, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v382);
      swift_release(v383);
      swift_release(v385);
      uint64_t v339 = v337;
    }
  }

  else
  {
    uint64_t v36 = v349;
    swift_release(v382);
    swift_release(v383);
    swift_release(v385);
    uint64_t v339 = v36;
  }

  uint64_t v334 = v339;

  v335 = (void (*)(char *, uint64_t))v370[1];
  v335(v369, v371);
  swift_unknownObjectRetain(v356);
  uint64_t v37 = objc_opt_self(&OBJC_CLASS___TVISPhotoScreenSaver);
  uint64_t v336 = swift_dynamicCastObjCClass(v356, v37);
  if (v336)
  {
    v333 = (void *)v336;
  }

  else
  {
    v332 = 0LL;
    swift_unknownObjectRelease(v356);
    v333 = v332;
  }

  v331 = v333;
  if (v333)
  {
    v330 = v331;
    id v326 = v331;
    v458 = v331;
    v327 = (void **)(v355 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_environment);
    v328 = &v457;
    swift_beginAccess();
    v329 = *v327;
    swift_unknownObjectRetain(v329);
    swift_endAccess(v328);
    if (v329)
    {
      v325 = v329;
      id v323 = v329;
      v450 = v329;
      swift_getObjectType(v329);
      swift_unknownObjectRetain(v323);
      unsigned int v322 = [v323 isPreview];
      swift_unknownObjectRelease(v323);
      BOOL v324 = (v322 & 1) != 1;
      swift_unknownObjectRetain(v323);
      if (v324)
      {
        int v312 = 0;
      }

      else
      {
        swift_getObjectType(v323);
        swift_unknownObjectRetain(v323);
        id v321 = [v323 context];
        swift_unknownObjectRelease(v323);
        if (v321)
        {
          id v320 = v321;
          id v316 = v321;
          id v317 = [v321 mode];

          id v318 = v317;
          int v319 = 0;
        }

        else
        {
          id v318 = 0LL;
          int v319 = 1;
        }

        id v397 = v318;
        char v398 = v319 & 1;
        uint64_t v399 = 1LL;
        char v400 = 0;
        if ((v319 & 1) != 0 || (sub_100018E34((uint64_t)&v397, (uint64_t)v396), (v400 & 1) != 0))
        {
          int v315 = 0;
        }

        else
        {
          v313 = &v395;
          uint64_t v395 = v399;
          uint64_t v314 = type metadata accessor for PRRenderingMode(0LL);
          sub_100018E50();
          int v315 = dispatch thunk of static Equatable.== infix(_:_:)(v396, v313);
        }

        int v312 = v315 ^ 1;
      }

      int v307 = v312;
      swift_unknownObjectRelease(v323);
      int v308 = 1;
      char v449 = v307 & 1;
      swift_getObjectType(v323);
      swift_unknownObjectRetain(v323);
      unsigned int v309 = [v323 isPreview];
      char v448 = v309 & 1 & v308;
      swift_unknownObjectRelease(v323);
      id v446 = 0LL;
      id v310 = [v326 baseScreenSaver];
      id v445 = v310;
      swift_unknownObjectRetain(v310);
      uint64_t v38 = objc_opt_self(&OBJC_CLASS___TVISMemoryScreenSaver);
      uint64_t v311 = swift_dynamicCastObjCClass(v310, v38);
      if (v311)
      {
        v306 = (void *)v311;
      }

      else
      {
        v305 = 0LL;
        swift_unknownObjectRelease(v310);
        v306 = v305;
      }

      v304 = v306;
      if (v306)
      {
        v303 = v304;
        uint64_t v39 = v367;
        id v289 = v304;
        v409 = v304;
        uint64_t v40 = sub_10000A1F8();
        v372(v39, v40, v371);
        id v41 = v289;
        uint64_t v293 = 7LL;
        uint64_t v42 = swift_allocObject(&unk_1000210C8, 24LL, 7LL);
        uint64_t v294 = v42;
        *(void *)(v42 + 16) = v289;
        v301 = (os_log_s *)Logger.logObject.getter(v42);
        int v302 = static os_log_type_t.default.getter();
        uint64_t v407 = 12LL;
        UnsignedInteger<>.init<A>(_:)(&v407, &type metadata for UInt32, &type metadata for Int, v373, v374, v376);
        uint32_t v290 = v408;
        uint64_t v291 = 17LL;
        uint64_t v43 = swift_allocObject(&unk_1000210F0, 17LL, v293);
        uint64_t v44 = v291;
        uint64_t v45 = v293;
        uint64_t v296 = v43;
        *(_BYTE *)(v43 + 16) = 64;
        uint64_t v46 = swift_allocObject(&unk_100021118, v44, v45);
        uint64_t v47 = v293;
        uint64_t v297 = v46;
        *(_BYTE *)(v46 + 16) = 8;
        uint64_t v292 = 32LL;
        uint64_t v48 = swift_allocObject(&unk_100021140, 32LL, v47);
        uint64_t v49 = v292;
        uint64_t v50 = v293;
        uint64_t v51 = v48;
        uint64_t v52 = v294;
        uint64_t v295 = v51;
        *(void *)(v51 + 16) = sub_100018400;
        *(void *)(v51 + 24) = v52;
        uint64_t v53 = swift_allocObject(&unk_100021168, v49, v50);
        uint64_t v54 = v387;
        uint64_t v55 = v53;
        uint64_t v56 = v295;
        uint64_t v299 = v55;
        *(void *)(v55 + 16) = sub_1000184A4;
        *(void *)(v55 + 24) = v56;
        uint64_t v298 = _allocateUninitializedArray<A>(_:)(3LL, v54);
        v300 = v57;
        swift_retain(v296);
        uint64_t v58 = v297;
        uint64_t v59 = v296;
        uint64_t v60 = v300;
        void *v300 = sub_100018430;
        v60[1] = v59;
        swift_retain(v58);
        uint64_t v61 = v299;
        uint64_t v62 = v297;
        unint64_t v63 = v300;
        v300[2] = sub_100018460;
        v63[3] = v62;
        swift_retain(v61);
        uint64_t v64 = v298;
        uint64_t v65 = v299;
        v66 = v300;
        v300[4] = sub_1000184EC;
        v66[5] = v65;
        sub_100004A08();
        swift_bridgeObjectRelease(v64);
        if (os_log_type_enabled(v301, (os_log_type_t)v302))
        {
          uint64_t v67 = v334;
          v282 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
          uint64_t v281 = sub_100006E5C(&qword_100025B60);
          uint64_t v283 = sub_100006EC8(1LL, v281, v281);
          uint64_t v284 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
          v285 = &v405;
          v405 = v282;
          v286 = &v404;
          uint64_t v404 = v283;
          v287 = &v403;
          uint64_t v403 = v284;
          sub_100006F20(2LL, &v405);
          sub_100006F20(1LL, v285);
          v401 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100018430;
          uint64_t v402 = v296;
          sub_100006F34(&v401, (uint64_t)v285, (uint64_t)v286, (uint64_t)v287);
          uint64_t v288 = v67;
          if (v67)
          {
            __break(1u);
          }

          else
          {
            v401 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100018460;
            uint64_t v402 = v297;
            sub_100006F34(&v401, (uint64_t)&v405, (uint64_t)&v404, (uint64_t)&v403);
            uint64_t v280 = 0LL;
            v401 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000184EC;
            uint64_t v402 = v299;
            sub_100006F34(&v401, (uint64_t)&v405, (uint64_t)&v404, (uint64_t)&v403);
            _os_log_impl((void *)&_mh_execute_header, v301, (os_log_type_t)v302, "Using Memory model: %@", v282, v290);
            sub_100007088(v283, 1LL);
            sub_100007088(v284, 0LL);
            UnsafeMutablePointer.deallocate()();
            swift_release(v296);
            swift_release(v297);
            swift_release(v299);
          }
        }

        else
        {
          swift_release(v296);
          swift_release(v297);
          swift_release(v299);
        }

        v335(v367, v371);
        id v68 = v289;
        uint64_t v69 = MemoryScreenSaverView.init(model:fadeInOnStart:)(v289, v309 & 1);
        v279 = &v406;
        MemoryScreenSaverView.interactions.getter(v69);
        sub_100017C18(v279, v447);
        sub_100006E5C(&qword_100026070);
        sub_1000184F8(v354, v352);
        uint64_t v70 = (void *)_UIHostingView.__allocating_init(rootView:)(v352);
        id v71 = v446;
        id v446 = v70;

        sub_100018B54(v354);
      }

      else
      {
        swift_unknownObjectRetain(v310);
        uint64_t v72 = objc_opt_self(&OBJC_CLASS___TVISPhotoCollectionScreenSaver);
        uint64_t v278 = swift_dynamicCastObjCClass(v310, v72);
        if (v278)
        {
          v277 = (void *)v278;
        }

        else
        {
          v276 = 0LL;
          swift_unknownObjectRelease(v310);
          v277 = v276;
        }

        v275 = v277;
        if (v277)
        {
          v274 = v275;
          uint64_t v73 = v364;
          v253 = v275;
          v430 = v275;
          uint64_t v74 = sub_10000A1F8();
          v372(v73, v74, v371);
          id v75 = v253;
          uint64_t v254 = 24LL;
          uint64_t v262 = 7LL;
          uint64_t v76 = swift_allocObject(&unk_100020F60, 24LL, 7LL);
          id v77 = v326;
          uint64_t v256 = v76;
          *(void *)(v76 + 16) = v253;
          id v78 = v77;
          uint64_t v263 = swift_allocObject(&unk_100020F88, v254, v262);
          *(void *)(v263 + 16) = v326;
          sub_10000E484();
          uint64_t v80 = swift_bridgeObjectRelease(v79);
          v272 = (os_log_s *)Logger.logObject.getter(v80);
          int v273 = static os_log_type_t.default.getter();
          uint64_t v428 = 22LL;
          UnsignedInteger<>.init<A>(_:)(&v428, &type metadata for UInt32, &type metadata for Int, v373, v374, v376);
          uint32_t v255 = v429;
          uint64_t v259 = 17LL;
          uint64_t v81 = swift_allocObject(&unk_100020FB0, 17LL, v262);
          uint64_t v82 = v259;
          uint64_t v83 = v262;
          uint64_t v264 = v81;
          int v258 = 64;
          *(_BYTE *)(v81 + 16) = 64;
          uint64_t v84 = swift_allocObject(&unk_100020FD8, v82, v83);
          uint64_t v85 = v262;
          uint64_t v265 = v84;
          int v260 = 8;
          *(_BYTE *)(v84 + 16) = 8;
          uint64_t v261 = 32LL;
          uint64_t v86 = swift_allocObject(&unk_100021000, 32LL, v85);
          uint64_t v87 = v261;
          uint64_t v88 = v262;
          uint64_t v89 = v86;
          uint64_t v90 = v256;
          uint64_t v257 = v89;
          *(void *)(v89 + 16) = sub_10001810C;
          *(void *)(v89 + 24) = v90;
          uint64_t v91 = swift_allocObject(&unk_100021028, v87, v88);
          uint64_t v92 = v259;
          uint64_t v93 = v262;
          uint64_t v94 = v91;
          uint64_t v95 = v257;
          uint64_t v266 = v94;
          *(void *)(v94 + 16) = sub_1000181F4;
          *(void *)(v94 + 24) = v95;
          uint64_t v96 = swift_allocObject(&unk_100021050, v92, v93);
          uint64_t v97 = v259;
          uint64_t v98 = v262;
          uint64_t v267 = v96;
          *(_BYTE *)(v96 + 16) = v258;
          uint64_t v99 = swift_allocObject(&unk_100021078, v97, v98);
          uint64_t v100 = v261;
          uint64_t v101 = v262;
          uint64_t v268 = v99;
          *(_BYTE *)(v99 + 16) = v260;
          uint64_t v102 = swift_allocObject(&unk_1000210A0, v100, v101);
          uint64_t v103 = v387;
          uint64_t v104 = v102;
          uint64_t v105 = v263;
          uint64_t v270 = v104;
          *(void *)(v104 + 16) = sub_100018150;
          *(void *)(v104 + 24) = v105;
          uint64_t v269 = _allocateUninitializedArray<A>(_:)(6LL, v103);
          v271 = v106;
          swift_retain(v264);
          uint64_t v107 = v265;
          uint64_t v108 = v264;
          v109 = v271;
          void *v271 = sub_100018180;
          v109[1] = v108;
          swift_retain(v107);
          uint64_t v110 = v266;
          uint64_t v111 = v265;
          v112 = v271;
          v271[2] = sub_1000181B0;
          v112[3] = v111;
          swift_retain(v110);
          uint64_t v113 = v267;
          uint64_t v114 = v266;
          v115 = v271;
          v271[4] = sub_10001823C;
          v115[5] = v114;
          swift_retain(v113);
          uint64_t v116 = v268;
          uint64_t v117 = v267;
          v118 = v271;
          v271[6] = sub_100018270;
          v118[7] = v117;
          swift_retain(v116);
          uint64_t v119 = v270;
          uint64_t v120 = v268;
          v121 = v271;
          v271[8] = sub_1000182A0;
          v121[9] = v120;
          swift_retain(v119);
          uint64_t v122 = v269;
          uint64_t v123 = v270;
          v124 = v271;
          v271[10] = sub_1000182E4;
          v124[11] = v123;
          sub_100004A08();
          swift_bridgeObjectRelease(v122);
          if (os_log_type_enabled(v272, (os_log_type_t)v273))
          {
            uint64_t v125 = v334;
            v245 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(22LL, &type metadata for UInt8);
            uint64_t v244 = sub_100006E5C(&qword_100025B60);
            uint64_t v246 = sub_100006EC8(2LL, v244, v244);
            uint64_t v247 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
            v249 = &v414;
            v414 = v245;
            v250 = &v413;
            uint64_t v413 = v246;
            v251 = &v412;
            uint64_t v412 = v247;
            unsigned int v248 = 2;
            sub_100006F20(2LL, &v414);
            sub_100006F20(v248, v249);
            v410 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100018180;
            uint64_t v411 = v264;
            sub_100006F34(&v410, (uint64_t)v249, (uint64_t)v250, (uint64_t)v251);
            uint64_t v252 = v125;
            if (v125)
            {
              __break(1u);
            }

            else
            {
              v410 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000181B0;
              uint64_t v411 = v265;
              sub_100006F34(&v410, (uint64_t)&v414, (uint64_t)&v413, (uint64_t)&v412);
              uint64_t v243 = 0LL;
              v410 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001823C;
              uint64_t v411 = v266;
              sub_100006F34(&v410, (uint64_t)&v414, (uint64_t)&v413, (uint64_t)&v412);
              uint64_t v242 = 0LL;
              v410 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100018270;
              uint64_t v411 = v267;
              sub_100006F34(&v410, (uint64_t)&v414, (uint64_t)&v413, (uint64_t)&v412);
              uint64_t v241 = 0LL;
              v410 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000182A0;
              uint64_t v411 = v268;
              sub_100006F34(&v410, (uint64_t)&v414, (uint64_t)&v413, (uint64_t)&v412);
              uint64_t v240 = 0LL;
              v410 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000182E4;
              uint64_t v411 = v270;
              sub_100006F34(&v410, (uint64_t)&v414, (uint64_t)&v413, (uint64_t)&v412);
              _os_log_impl( (void *)&_mh_execute_header,  v272,  (os_log_type_t)v273,  "Using Photo Collection model: %@, with slide show style: %@",  v245,  v255);
              sub_100007088(v246, 2LL);
              sub_100007088(v247, 0LL);
              UnsafeMutablePointer.deallocate()();
              swift_release(v264);
              swift_release(v265);
              swift_release(v266);
              swift_release(v267);
              swift_release(v268);
              swift_release(v270);
            }
          }

          else
          {
            swift_release(v264);
            swift_release(v265);
            swift_release(v266);
            swift_release(v267);
            swift_release(v268);
            swift_release(v270);
          }

          v335(v364, v371);
          id v239 = [v326 slideShowStyle];
          id v425 = v239;
          id v126 = v239;
          if (v239)
          {
            id v238 = v239;
            id v234 = v239;
            id v235 = [v239 type];

            uint64_t v236 = (uint64_t)v235;
            int v237 = 0;
          }

          else
          {
            uint64_t v236 = 0LL;
            int v237 = 1;
          }

          int v233 = v237;
          uint64_t v232 = v236;
          v229 = (uint64_t *)&TVISPhotoSlideShowStyleTypeMemory;
          v230 = &v424;
          swift_beginAccess();
          uint64_t v231 = *v229;
          swift_endAccess(v230);
          uint64_t v420 = v231;
          char v421 = 0;
          uint64_t v422 = v232;
          char v423 = v233 & 1;
          sub_1000183A8((uint64_t)&v420, (uint64_t)v416);
          if ((v423 & 1) != 0)
          {
            int v228 = 0;
          }

          else
          {
            v226 = &v415;
            uint64_t v415 = v422;
            uint64_t v227 = type metadata accessor for TVISPhotoSlideShowStyleType(0LL);
            sub_100007CA4();
            int v228 = dispatch thunk of static Equatable.== infix(_:_:)(v416, v226);
          }

          if ((v228 & 1) != 0)
          {
            v225 = v417;
            sub_10000E4AC(v253, v307 & 1, v309 & 1, v417);
            sub_1000182F0(v225, &v426);
          }

          else
          {
            v224 = v419;
            sub_10000E600(v253, v239, v307 & 1, v419);
            sub_1000182F0(v224, &v426);
          }

          if (v426)
          {
            id v222 = v426;
            id v127 = v426;
            v223 = v222;
          }

          else
          {
            v223 = 0LL;
          }

          id v128 = v446;
          id v446 = v223;

          if (v426) {
            sub_100018004((uint64_t)&v427, (uint64_t)v418);
          }
          else {
            memset(v418, 0, sizeof(v418));
          }
          sub_100017C18(v418, v447);

          sub_100018358((uint64_t)&v426);
        }

        else
        {
          v129 = v362;
          uint64_t v130 = sub_10000A1F8();
          uint64_t v131 = v372(v129, v130, v371);
          v220 = (os_log_s *)Logger.logObject.getter(v131);
          int v219 = static os_log_type_t.error.getter();
          uint64_t v443 = 2LL;
          UnsignedInteger<>.init<A>(_:)(&v443, &type metadata for UInt32, &type metadata for Int, v373, v374, v376);
          uint32_t v218 = v444;
          uint64_t v221 = _allocateUninitializedArray<A>(_:)(0LL, v387);
          if (os_log_type_enabled(v220, (os_log_type_t)v219))
          {
            uint64_t v132 = v334;
            v208 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
            uint64_t v206 = sub_100006E5C(&qword_100025B60);
            uint64_t v207 = 0LL;
            uint64_t v209 = sub_100006EC8(0LL, v206, v206);
            uint64_t v210 = sub_100006EC8(v207, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
            v214 = &v434;
            v434 = v208;
            v215 = &v433;
            uint64_t v433 = v209;
            v212 = &v432;
            uint64_t v432 = v210;
            unsigned int v211 = 0;
            sub_100006F20(0LL, &v434);
            sub_100006F20(v211, v214);
            uint64_t v431 = v221;
            v213 = &v156;
            __chkstk_darwin(&v156);
            v133 = v215;
            v134 = &v156 - 6;
            v216 = &v156 - 6;
            v134[2] = (uint64_t)v214;
            v134[3] = (uint64_t)v133;
            v134[4] = v135;
            uint64_t v217 = sub_100006E5C(&qword_100025B68);
            unint64_t v136 = sub_100006FA4();
            Sequence.forEach(_:)(sub_1000180A4, v216, v217, v136);
            if (v132)
            {
              __break(1u);
            }

            else
            {
              _os_log_impl((void *)&_mh_execute_header, v220, (os_log_type_t)v219, "Unknown base model", v208, v218);
              uint64_t v205 = 0LL;
              sub_100007088(v209, 0LL);
              sub_100007088(v210, v205);
              UnsafeMutablePointer.deallocate()();
              swift_bridgeObjectRelease(v221);
            }
          }

          else
          {
            swift_bridgeObjectRelease(v221);
          }

          v335(v362, v371);
          memset(v442, 0, sizeof(v442));
          sub_100017C18(v442, v447);
          id v137 = v446;
          id v446 = 0LL;
        }
      }

      if (v447[3])
      {
        v204 = v435;
        sub_100018004((uint64_t)v447, (uint64_t)v435);
        uint64_t v202 = v436;
        uint64_t v203 = v437;
        sub_100018050(v204, v436);
        swift_getObjectType(v323);
        swift_unknownObjectRetain(v323);
        unsigned int v201 = [v323 isPreview];
        swift_unknownObjectRelease(v323);
        (*(void (**)(void, uint64_t))(v203 + 32))((v201 ^ 1) & 1, v202);
        sub_100017CE8(v204);
      }

      id v200 = v446;
      id v138 = v446;
      id v441 = v200;
      BOOL v199 = v200 != 0LL;
      BOOL v198 = v199;
      sub_100017C80(&v441);
      if (v198)
      {
        v196 = &v446;
        v191 = v446;
        id v139 = v446;
        sub_10000ED60(v191);

        v193 = &v439;
        v192 = &v440;
        swift_unknownObjectRetain(v356);
        uint64_t v439 = v356;
        v197 = v447;
        sub_100017D50(v447, v192);
        v194 = (uint64_t *)(v355 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state);
        v195 = &v438;
        swift_beginAccess();
        sub_100017DCC(v193, v194);
        swift_endAccess(v195);
        swift_unknownObjectRelease(v310);
        sub_100017C80(v196);
        sub_100017CA8(v197);
      }

      else
      {
        sub_10000DD54();
        swift_unknownObjectRelease(v310);
        sub_100017C80(&v446);
        sub_100017CA8(v447);
      }

      swift_unknownObjectRelease(v323);
    }

    else
    {
      v140 = v360;
      uint64_t v141 = sub_10000A1F8();
      uint64_t v142 = v372(v140, v141, v371);
      v189 = (os_log_s *)Logger.logObject.getter(v142);
      int v188 = static os_log_type_t.error.getter();
      uint64_t v455 = 2LL;
      UnsignedInteger<>.init<A>(_:)(&v455, &type metadata for UInt32, &type metadata for Int, v373, v374, v376);
      uint32_t v187 = v456;
      uint64_t v190 = _allocateUninitializedArray<A>(_:)(0LL, v387);
      if (os_log_type_enabled(v189, (os_log_type_t)v188))
      {
        uint64_t v143 = v334;
        v177 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
        uint64_t v175 = sub_100006E5C(&qword_100025B60);
        uint64_t v176 = 0LL;
        uint64_t v178 = sub_100006EC8(0LL, v175, v175);
        uint64_t v179 = sub_100006EC8(v176, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
        v183 = &v454;
        v454 = v177;
        v184 = &v453;
        uint64_t v453 = v178;
        v181 = &v452;
        uint64_t v452 = v179;
        unsigned int v180 = 0;
        sub_100006F20(0LL, &v454);
        sub_100006F20(v180, v183);
        uint64_t v451 = v190;
        v182 = &v156;
        __chkstk_darwin(&v156);
        v144 = v184;
        v145 = &v156 - 6;
        v185 = &v156 - 6;
        v145[2] = (uint64_t)v183;
        v145[3] = (uint64_t)v144;
        v145[4] = v146;
        uint64_t v186 = sub_100006E5C(&qword_100025B68);
        unint64_t v147 = sub_100006FA4();
        Sequence.forEach(_:)(sub_100017BEC, v185, v186, v147);
        if (v143)
        {
          __break(1u);
        }

        else
        {
          _os_log_impl( (void *)&_mh_execute_header,  v189,  (os_log_type_t)v188,  "Unknown environment when updating renderer",  v177,  v187);
          uint64_t v174 = 0LL;
          sub_100007088(v178, 0LL);
          sub_100007088(v179, v174);
          UnsafeMutablePointer.deallocate()();
          swift_bridgeObjectRelease(v190);
        }
      }

      else
      {
        swift_bridgeObjectRelease(v190);
      }

      v335(v360, v371);
      sub_10000DD54();
    }
  }

  else
  {
    v148 = v358;
    uint64_t v149 = sub_10000A1F8();
    uint64_t v150 = v372(v148, v149, v371);
    v172 = (os_log_s *)Logger.logObject.getter(v150);
    int v171 = static os_log_type_t.error.getter();
    uint64_t v463 = 2LL;
    UnsignedInteger<>.init<A>(_:)(&v463, &type metadata for UInt32, &type metadata for Int, v373, v374, v376);
    uint32_t v170 = v464;
    uint64_t v173 = _allocateUninitializedArray<A>(_:)(0LL, v387);
    if (os_log_type_enabled(v172, (os_log_type_t)v171))
    {
      uint64_t v151 = v334;
      v160 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v158 = sub_100006E5C(&qword_100025B60);
      uint64_t v159 = 0LL;
      uint64_t v161 = sub_100006EC8(0LL, v158, v158);
      uint64_t v162 = sub_100006EC8(v159, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v166 = &v462;
      v462 = v160;
      v167 = &v461;
      uint64_t v461 = v161;
      v164 = &v460;
      uint64_t v460 = v162;
      unsigned int v163 = 0;
      sub_100006F20(0LL, &v462);
      sub_100006F20(v163, v166);
      uint64_t v459 = v173;
      v165 = &v156;
      __chkstk_darwin(&v156);
      v152 = v167;
      v153 = &v156 - 6;
      v168 = &v156 - 6;
      v153[2] = (uint64_t)v166;
      v153[3] = (uint64_t)v152;
      v153[4] = v154;
      uint64_t v169 = sub_100006E5C(&qword_100025B68);
      unint64_t v155 = sub_100006FA4();
      Sequence.forEach(_:)(sub_100017BC0, v168, v169, v155);
      if (v151)
      {
        __break(1u);
      }

      else
      {
        _os_log_impl((void *)&_mh_execute_header, v172, (os_log_type_t)v171, "Unknown model", v160, v170);
        uint64_t v157 = 0LL;
        sub_100007088(v161, 0LL);
        sub_100007088(v162, v157);
        UnsafeMutablePointer.deallocate()();
        swift_bridgeObjectRelease(v173);
      }
    }

    else
    {
      swift_bridgeObjectRelease(v173);
    }

    v335(v358, v371);
    sub_10000DD54();
  }

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000DD08()
{
}

uint64_t sub_10000DD2C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1)._countAndFlagsBits;
}

void sub_10000DD54()
{
  uint64_t v44 = v0;
  uint64_t ObjectType = swift_getObjectType(v0);
  uint64_t v75 = 0LL;
  uint64_t v72 = 0LL;
  uint64_t v43 = 0LL;
  uint64_t v48 = type metadata accessor for Logger(0LL);
  uint64_t v47 = *(void *)(v48 - 8);
  unint64_t v45 = (*(void *)(v47 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v48);
  uint64_t v1 = (char *)&v28 - v45;
  uint64_t v46 = (char *)&v28 - v45;
  uint64_t v75 = v2;
  uint64_t v3 = sub_10000A1F8();
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 16))(v1, v3, v48);
  unint64_t v63 = (os_log_s *)Logger.logObject.getter(v4);
  int v64 = static os_log_type_t.debug.getter();
  uint64_t v51 = &v73;
  uint64_t v73 = 12LL;
  unint64_t v49 = sub_100006D24();
  unint64_t v50 = sub_100006D8C();
  unint64_t v5 = sub_100006DF4();
  UnsignedInteger<>.init<A>(_:)(v51, &type metadata for UInt32, &type metadata for Int, v49, v50, v5);
  uint32_t v52 = v74;
  uint64_t v53 = 17LL;
  uint64_t v55 = 7LL;
  uint64_t v6 = swift_allocObject(&unk_100021190, 17LL, 7LL);
  uint64_t v7 = v53;
  uint64_t v8 = v55;
  uint64_t v57 = v6;
  *(_BYTE *)(v6 + 16) = 32;
  uint64_t v9 = swift_allocObject(&unk_1000211B8, v7, v8);
  uint64_t v10 = v55;
  uint64_t v58 = v9;
  *(_BYTE *)(v9 + 16) = 8;
  uint64_t v54 = 32LL;
  uint64_t v11 = swift_allocObject(&unk_1000211E0, 32LL, v10);
  uint64_t v12 = v54;
  uint64_t v13 = v55;
  uint64_t v56 = v11;
  *(void *)(v11 + 16) = sub_10000F758;
  *(void *)(v11 + 24) = 0LL;
  uint64_t v14 = swift_allocObject(&unk_100021208, v12, v13);
  uint64_t v15 = v56;
  uint64_t v60 = v14;
  *(void *)(v14 + 16) = sub_100018F5C;
  *(void *)(v14 + 24) = v15;
  uint64_t v62 = sub_100006E5C(&qword_100025B58);
  uint64_t v59 = _allocateUninitializedArray<A>(_:)(3LL, v62);
  uint64_t v61 = v16;
  swift_retain(v57);
  uint64_t v17 = v58;
  uint64_t v18 = v57;
  uint64_t v19 = v61;
  *uint64_t v61 = sub_100018EE8;
  v19[1] = v18;
  swift_retain(v17);
  uint64_t v20 = v60;
  uint64_t v21 = v58;
  uint64_t v22 = v61;
  v61[2] = sub_100018F18;
  v22[3] = v21;
  swift_retain(v20);
  uint64_t v23 = v59;
  uint64_t v24 = v60;
  uint64_t v25 = v61;
  v61[4] = sub_100018FA4;
  v25[5] = v24;
  sub_100004A08();
  swift_bridgeObjectRelease(v23);
  if (os_log_type_enabled(v63, (os_log_type_t)v64))
  {
    uint64_t v26 = v43;
    uint64_t v35 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v34 = sub_100006E5C(&qword_100025B60);
    uint64_t v36 = sub_100006EC8(0LL, v34, v34);
    uint64_t v37 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v38 = &v69;
    uint64_t v69 = v35;
    uint64_t v39 = &v68;
    uint64_t v68 = v36;
    uint64_t v40 = &v67;
    uint64_t v67 = v37;
    sub_100006F20(2LL, &v69);
    sub_100006F20(1LL, v38);
    uint64_t v65 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100018EE8;
    uint64_t v66 = v57;
    sub_100006F34(&v65, (uint64_t)v38, (uint64_t)v39, (uint64_t)v40);
    uint64_t v41 = v26;
    if (v26)
    {
      __break(1u);
    }

    else
    {
      uint64_t v65 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100018F18;
      uint64_t v66 = v58;
      sub_100006F34(&v65, (uint64_t)&v69, (uint64_t)&v68, (uint64_t)&v67);
      uint64_t v33 = 0LL;
      uint64_t v65 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100018FA4;
      uint64_t v66 = v60;
      sub_100006F34(&v65, (uint64_t)&v69, (uint64_t)&v68, (uint64_t)&v67);
      _os_log_impl((void *)&_mh_execute_header, v63, (os_log_type_t)v64, "%s", v35, v52);
      sub_100007088(v36, 0LL);
      sub_100007088(v37, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v57);
      swift_release(v58);
      swift_release(v60);
    }
  }

  else
  {
    swift_release(v57);
    swift_release(v58);
    swift_release(v60);
  }

  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
  uint64_t v32 = (void *)sub_10000F784();
  uint64_t v72 = v32;
  id v27 = v32;
  sub_10000ED60(v32);

  uint64_t v29 = v71;
  v71[0] = 1LL;
  memset(&v71[1], 0, 40);
  uint64_t v30 = (uint64_t *)(v44 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state);
  uint64_t v31 = &v70;
  swift_beginAccess();
  sub_100017DCC(v29, v30);
  swift_endAccess(v31);
}

uint64_t sub_10000E3A8()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("updateRenderer(model:)", 0x16uLL, 1)._countAndFlagsBits;
}

void *sub_10000E3D4(void *a1)
{
  id v1 = a1;
  return a1;
}

void *sub_10000E3F8(void *a1)
{
  id v1 = a1;
  return a1;
}

id sub_10000E41C(void *a1)
{
  id v3 = [a1 slideShowStyle];
  if (v3) {
    return v3;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000E484()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1)._countAndFlagsBits;
}

void *sub_10000E4AC@<X0>(void *a1@<X0>, char a2@<W1>, char a3@<W2>, void *a4@<X8>)
{
  uint64_t v24 = a1;
  char v23 = a2 & 1;
  char v22 = a3 & 1;
  uint64_t v21 = v4;
  id v5 = a1;
  PhotoScreenSaverView.init(model:fadeInOnStart:)(a1, a3 & 1);
  sub_100006E5C(&qword_100026098);
  sub_100018FB0((uint64_t)__b, (uint64_t)v19);
  id v14 = (id)_UIHostingView.__allocating_init(rootView:)(v19);
  id v18 = v14;
  PhotoScreenSaverView.interactionHandler.getter();
  uint64_t v11 = v16;
  uint64_t v12 = v17;
  sub_100018050(v15, v16);
  (*(void (**)(void, uint64_t))(v12 + 40))(a2 & 1, v11);
  id v6 = v14;
  *a4 = v14;
  sub_100018004((uint64_t)v15, (uint64_t)(a4 + 1));
  sub_100017CE8(v15);

  __n128 result = __b;
  sub_100018FFC(__b);
  return result;
}

void sub_10000E600(void *a1@<X0>, void *a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  uint64_t v59 = a4;
  id v63 = a1;
  id v62 = a2;
  int v61 = a3;
  id v89 = 0LL;
  uint64_t v88 = 0LL;
  char v87 = 0;
  uint64_t v86 = 0LL;
  uint64_t v60 = 0LL;
  id v77 = 0LL;
  uint64_t v76 = 0LL;
  id v74 = 0LL;
  uint64_t v68 = 0LL;
  uint64_t v64 = type metadata accessor for Logger(0LL);
  uint64_t v65 = *(void *)(v64 - 8);
  unint64_t v66 = (*(void *)(v65 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v67 = (char *)&v28 - v66;
  id v89 = (id)__chkstk_darwin(v63);
  uint64_t v88 = v5;
  char v87 = v6 & 1;
  uint64_t v86 = v4;
  id v69 = [v89 collections];
  unint64_t v7 = sub_100019020();
  uint64_t v70 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v69, v7);
  swift_bridgeObjectRetain(v70);
  uint64_t v72 = &v84;
  uint64_t v84 = v70;
  uint64_t v71 = sub_100006E5C(&qword_1000260A8);
  unint64_t v8 = sub_100019084();
  Collection.first.getter(&v85, v71, v8);
  sub_1000190F4(v72);
  uint64_t v73 = v85;
  if (v85)
  {
    uint64_t v58 = v73;
    id v57 = v73;
    id v77 = v73;
    swift_bridgeObjectRelease(v70);

    uint64_t v49 = 0LL;
    uint64_t v54 = type metadata accessor for LegacyScreenSaverViewModel();
    uint64_t v56 = LegacyScreenSaverViewModel.__allocating_init(pausedOnStart:)(v61 & 1);
    uint64_t v76 = v56;
    id v51 = [v63 assets];
    unint64_t v9 = sub_100019148();
    uint64_t v50 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v51, v9);
    id v10 = v57;
    id v11 = v62;
    swift_retain(v56);
    uint64_t v55 = &v90;
    LegacyScreenSaverView.init(assets:collection:style:viewModel:)(v50, v57, v62, v56);

    sub_100006E5C(&qword_1000260C0);
    sub_1000191AC(v55);
    uint32_t v52 = __dst;
    memcpy(__dst, v55, sizeof(__dst));
    id v53 = (id)_UIHostingView.__allocating_init(rootView:)(__dst);
    id v74 = v53;
    id v12 = v53;
    uint64_t v13 = v56;
    *uint64_t v59 = v53;
    swift_retain(v13);
    id v14 = v53;
    uint64_t v15 = v59;
    uint64_t v16 = v56;
    v59[4] = v54;
    v15[5] = &protocol witness table for LegacyScreenSaverViewModel;
    v15[1] = v16;

    sub_100019218(v55);
    swift_release(v56);
  }

  else
  {
    uint64_t v17 = v67;
    swift_bridgeObjectRelease(v70);

    uint64_t v18 = sub_10000A1F8();
    uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v65 + 16))(v17, v18, v64);
    uint64_t v47 = (os_log_s *)Logger.logObject.getter(v19);
    int v46 = static os_log_type_t.error.getter();
    uint64_t v44 = &v82;
    uint64_t v82 = 2LL;
    unint64_t v42 = sub_100006D24();
    unint64_t v43 = sub_100006D8C();
    unint64_t v20 = sub_100006DF4();
    UnsignedInteger<>.init<A>(_:)(v44, &type metadata for UInt32, &type metadata for Int, v42, v43, v20);
    uint32_t v45 = v83;
    uint64_t v21 = sub_100006E5C(&qword_100025B58);
    uint64_t v48 = _allocateUninitializedArray<A>(_:)(0LL, v21);
    if (os_log_type_enabled(v47, (os_log_type_t)v46))
    {
      uint64_t v22 = v60;
      uint64_t v32 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v30 = sub_100006E5C(&qword_100025B60);
      uint64_t v31 = 0LL;
      uint64_t v33 = sub_100006EC8(0LL, v30, v30);
      uint64_t v34 = sub_100006EC8(v31, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      uint64_t v38 = &v81;
      uint64_t v81 = v32;
      uint64_t v39 = &v80;
      uint64_t v80 = v33;
      uint64_t v36 = &v79;
      uint64_t v79 = v34;
      unsigned int v35 = 0;
      sub_100006F20(0LL, &v81);
      sub_100006F20(v35, v38);
      uint64_t v78 = v48;
      uint64_t v37 = &v28;
      __chkstk_darwin(&v28);
      char v23 = v39;
      uint64_t v24 = &v28 - 6;
      uint64_t v40 = &v28 - 6;
      v24[2] = (uint64_t)v38;
      v24[3] = (uint64_t)v23;
      v24[4] = v25;
      uint64_t v41 = sub_100006E5C(&qword_100025B68);
      unint64_t v26 = sub_100006FA4();
      Sequence.forEach(_:)(sub_10001911C, v40, v41, v26);
      if (v22)
      {
        __break(1u);
      }

      else
      {
        _os_log_impl((void *)&_mh_execute_header, v47, (os_log_type_t)v46, "Missing collection in view model", v32, v45);
        uint64_t v29 = 0LL;
        sub_100007088(v33, 0LL);
        sub_100007088(v34, v29);
        UnsafeMutablePointer.deallocate()();
        swift_bridgeObjectRelease(v48);
      }
    }

    else
    {
      swift_bridgeObjectRelease(v48);
    }

    (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
    id v27 = v59;
    *uint64_t v59 = 0LL;
    v27[1] = 0LL;
    v27[2] = 0LL;
    v27[3] = 0LL;
    v27[4] = 0LL;
    v27[5] = 0LL;
  }

void sub_10000ED60(void *a1)
{
  id v84 = a1;
  uint64_t v115 = 0LL;
  uint64_t v114 = 0LL;
  id v112 = 0LL;
  id v107 = 0LL;
  uint64_t v97 = 0LL;
  uint64_t v83 = 0LL;
  uint64_t v82 = 0LL;
  uint64_t v85 = type metadata accessor for Logger(0LL);
  uint64_t v86 = *(void *)(v85 - 8);
  unint64_t v87 = (*(void *)(v86 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v88 = (char *)&v39 - v87;
  uint64_t v115 = __chkstk_darwin(v84);
  uint64_t v114 = v1;
  id v89 = (id *)(v1 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_renderer);
  char v90 = &v113;
  swift_beginAccess();
  id v91 = *v89;
  id v2 = v91;
  swift_endAccess(v90);
  if (v91)
  {
    id v81 = v91;
    id v3 = v88;
    id v64 = v91;
    id v112 = v91;
    uint64_t v4 = sub_10000A1F8();
    uint64_t v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v86 + 16))(v3, v4, v85);
    uint64_t v79 = (os_log_s *)Logger.logObject.getter(v5);
    int v80 = static os_log_type_t.debug.getter();
    uint64_t v67 = &v110;
    uint64_t v110 = 12LL;
    unint64_t v65 = sub_100006D24();
    unint64_t v66 = sub_100006D8C();
    unint64_t v6 = sub_100006DF4();
    UnsignedInteger<>.init<A>(_:)(v67, &type metadata for UInt32, &type metadata for Int, v65, v66, v6);
    uint32_t v68 = v111;
    uint64_t v69 = 17LL;
    uint64_t v71 = 7LL;
    uint64_t v7 = swift_allocObject(&unk_100021230, 17LL, 7LL);
    uint64_t v8 = v69;
    uint64_t v9 = v71;
    uint64_t v73 = v7;
    *(_BYTE *)(v7 + 16) = 32;
    uint64_t v10 = swift_allocObject(&unk_100021258, v8, v9);
    uint64_t v11 = v71;
    uint64_t v74 = v10;
    *(_BYTE *)(v10 + 16) = 8;
    uint64_t v70 = 32LL;
    uint64_t v12 = swift_allocObject(&unk_100021280, 32LL, v11);
    uint64_t v13 = v70;
    uint64_t v14 = v71;
    uint64_t v72 = v12;
    *(void *)(v12 + 16) = sub_10000F7D0;
    *(void *)(v12 + 24) = 0LL;
    uint64_t v15 = swift_allocObject(&unk_1000212A8, v13, v14);
    uint64_t v16 = v72;
    uint64_t v76 = v15;
    *(void *)(v15 + 16) = sub_100019320;
    *(void *)(v15 + 24) = v16;
    uint64_t v78 = sub_100006E5C(&qword_100025B58);
    uint64_t v75 = _allocateUninitializedArray<A>(_:)(3LL, v78);
    id v77 = v17;
    swift_retain(v73);
    uint64_t v18 = v74;
    uint64_t v19 = v73;
    unint64_t v20 = v77;
    *id v77 = sub_1000192AC;
    v20[1] = v19;
    swift_retain(v18);
    uint64_t v21 = v76;
    uint64_t v22 = v74;
    char v23 = v77;
    v77[2] = sub_1000192DC;
    v23[3] = v22;
    swift_retain(v21);
    uint64_t v24 = v75;
    uint64_t v25 = v76;
    unint64_t v26 = v77;
    v77[4] = sub_100019368;
    v26[5] = v25;
    sub_100004A08();
    swift_bridgeObjectRelease(v24);
    if (os_log_type_enabled(v79, (os_log_type_t)v80))
    {
      uint64_t v27 = v82;
      id v57 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v56 = sub_100006E5C(&qword_100025B60);
      uint64_t v58 = sub_100006EC8(0LL, v56, v56);
      uint64_t v59 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      uint64_t v60 = &v96;
      uint64_t v96 = v57;
      int v61 = &v95;
      uint64_t v95 = v58;
      id v62 = &v94;
      uint64_t v94 = v59;
      sub_100006F20(2LL, &v96);
      sub_100006F20(1LL, v60);
      uint64_t v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000192AC;
      uint64_t v93 = v73;
      sub_100006F34(&v92, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62);
      uint64_t v63 = v27;
      if (v27)
      {
        __break(1u);
      }

      else
      {
        uint64_t v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000192DC;
        uint64_t v93 = v74;
        sub_100006F34(&v92, (uint64_t)&v96, (uint64_t)&v95, (uint64_t)&v94);
        uint64_t v55 = 0LL;
        uint64_t v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019368;
        uint64_t v93 = v76;
        sub_100006F34(&v92, (uint64_t)&v96, (uint64_t)&v95, (uint64_t)&v94);
        _os_log_impl((void *)&_mh_execute_header, v79, (os_log_type_t)v80, "%s", v57, v68);
        sub_100007088(v58, 0LL);
        sub_100007088(v59, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v73);
        swift_release(v74);
        swift_release(v76);
      }
    }

    else
    {
      swift_release(v73);
      swift_release(v74);
      swift_release(v76);
    }

    (*(void (**)(char *, uint64_t))(v86 + 8))(v88, v85);
    id v50 = [v64 backgroundView];
    id v49 = [v50 subviews];
    unint64_t v28 = sub_100019374();
    uint64_t v51 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v49, v28);

    swift_bridgeObjectRetain(v51);
    id v53 = &v108;
    uint64_t v108 = v51;
    uint64_t v52 = sub_100006E5C(&qword_1000260D0);
    unint64_t v29 = sub_1000193D8();
    Collection.first.getter(&v109, v52, v29);
    sub_100019448(v53);
    uint64_t v54 = v109;
    if (v109)
    {
      uint64_t v48 = v54;
      id v47 = v54;
      uint64_t v97 = v54;
      swift_bridgeObjectRelease(v51);

      [v47 removeFromSuperview];
    }

    else
    {
      swift_bridgeObjectRelease(v51);
    }

    id v30 = v84;
    if (v84)
    {
      id v46 = v84;
      id v45 = v84;
      id v107 = v84;
      unint64_t v43 = &stru_100025000;
      id v40 = [v64 backgroundView];
      [v40 bounds];
      double v103 = v31;
      double v104 = v32;
      double v105 = v33;
      double v106 = v34;
      double v99 = v31;
      double v100 = v32;
      double v101 = v33;
      double v102 = v34;
      objc_msgSend(v45, "setFrame:", v31, v32, v33, v34);

      uint64_t v35 = type metadata accessor for AutoresizingMask(0LL);
      uint64_t v41 = 2LL;
      uint64_t v36 = _allocateUninitializedArray<A>(_:)(2LL, v35);
      uint64_t *v37 = v41;
      v37[1] = 16LL;
      sub_100004A08();
      uint64_t v42 = v36;
      unint64_t v38 = sub_100007DAC();
      SetAlgebra<>.init(arrayLiteral:)(v42, v35, v38);
      [v45 setAutoresizingMask:v98];
      id v44 = [v64 (SEL)v43[97].imp];
      [v44 addSubview:v45];
    }
  }

uint64_t sub_10000F758()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("switchToFallbackState()", 0x17uLL, 1)._countAndFlagsBits;
}

uint64_t sub_10000F784()
{
  uint64_t v2 = 0LL;
  sub_100006E5C(&qword_100026098);
  PhotoScreenSaverView.init()();
  return _UIHostingView.__allocating_init(rootView:)(v1);
}

uint64_t sub_10000F7D0()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transition(to:)", 0xFuLL, 1)._countAndFlagsBits;
}

uint64_t sub_10000F7FC()
{
  if (!"MemoryPoster.PosterPresenter")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_1000158E4( (uint64_t)"MemoryPoster.PosterPresenter",  28LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"MemoryPoster/PosterPresenter.swift",  34LL,  2,  v2,  0xFuLL,  0xDuLL);
  __break(1u);
  return result;
}

id sub_10000F92C()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000F9E8(void *a1, void *a2)
{
  id v131 = a1;
  id v139 = a2;
  uint64_t v159 = 0LL;
  uint64_t v158 = 0LL;
  uint64_t v157 = 0LL;
  uint64_t v128 = 0LL;
  unint64_t v129 = (*(void *)(*(void *)(sub_100006E5C(&qword_100025D78) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v130 = (uint64_t)&v67 - v129;
  uint64_t v132 = type metadata accessor for Logger(0LL);
  uint64_t v133 = *(void *)(v132 - 8);
  uint64_t v135 = *(void *)(v133 + 64);
  unint64_t v134 = (v135 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = __chkstk_darwin(v139);
  unint64_t v136 = (char *)&v67 - v134;
  unint64_t v137 = (v135 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v3);
  id v138 = (char *)&v67 - v137;
  uint64_t v159 = v5;
  uint64_t v158 = v4;
  uint64_t v157 = v2;
  swift_getObjectType(v4);
  swift_unknownObjectRetain(v139);
  unsigned int v140 = [v139 isSnapshot];
  swift_unknownObjectRelease(v139);
  if ((v140 & 1) != 0)
  {
    uint64_t v42 = v136;
    uint64_t v43 = sub_10000A1F8();
    uint64_t v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v133 + 16))(v42, v43, v132);
    char v90 = (os_log_s *)Logger.logObject.getter(v44);
    int v91 = static os_log_type_t.debug.getter();
    uint64_t v78 = &v155;
    uint64_t v155 = 12LL;
    unint64_t v76 = sub_100006D24();
    unint64_t v77 = sub_100006D8C();
    unint64_t v45 = sub_100006DF4();
    UnsignedInteger<>.init<A>(_:)(v78, &type metadata for UInt32, &type metadata for Int, v76, v77, v45);
    uint32_t v79 = v156;
    uint64_t v80 = 17LL;
    uint64_t v82 = 7LL;
    uint64_t v46 = swift_allocObject(&unk_1000212D0, 17LL, 7LL);
    uint64_t v47 = v80;
    uint64_t v48 = v82;
    uint64_t v84 = v46;
    *(_BYTE *)(v46 + 16) = 32;
    uint64_t v49 = swift_allocObject(&unk_1000212F8, v47, v48);
    uint64_t v50 = v82;
    uint64_t v85 = v49;
    *(_BYTE *)(v49 + 16) = 8;
    uint64_t v81 = 32LL;
    uint64_t v51 = swift_allocObject(&unk_100021320, 32LL, v50);
    uint64_t v52 = v81;
    uint64_t v53 = v82;
    uint64_t v83 = v51;
    *(void *)(v51 + 16) = sub_10001085C;
    *(void *)(v51 + 24) = 0LL;
    uint64_t v54 = swift_allocObject(&unk_100021348, v52, v53);
    uint64_t v55 = v83;
    uint64_t v87 = v54;
    *(void *)(v54 + 16) = sub_1000195E4;
    *(void *)(v54 + 24) = v55;
    uint64_t v89 = sub_100006E5C(&qword_100025B58);
    uint64_t v86 = _allocateUninitializedArray<A>(_:)(3LL, v89);
    uint64_t v88 = v56;
    swift_retain(v84);
    uint64_t v57 = v85;
    uint64_t v58 = v84;
    uint64_t v59 = v88;
    *uint64_t v88 = sub_100019570;
    v59[1] = v58;
    swift_retain(v57);
    uint64_t v60 = v87;
    uint64_t v61 = v85;
    id v62 = v88;
    v88[2] = sub_1000195A0;
    v62[3] = v61;
    swift_retain(v60);
    uint64_t v63 = v86;
    uint64_t v64 = v87;
    unint64_t v65 = v88;
    v88[4] = sub_10001962C;
    v65[5] = v64;
    sub_100004A08();
    swift_bridgeObjectRelease(v63);
    if (os_log_type_enabled(v90, (os_log_type_t)v91))
    {
      uint64_t v66 = v128;
      uint64_t v69 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v68 = sub_100006E5C(&qword_100025B60);
      uint64_t v70 = sub_100006EC8(0LL, v68, v68);
      uint64_t v71 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      uint64_t v72 = &v154;
      uint64_t v154 = v69;
      uint64_t v73 = &v153;
      uint64_t v153 = v70;
      uint64_t v74 = &v152;
      uint64_t v152 = v71;
      sub_100006F20(2LL, &v154);
      sub_100006F20(1LL, v72);
      uint64_t v150 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019570;
      uint64_t v151 = v84;
      sub_100006F34(&v150, (uint64_t)v72, (uint64_t)v73, (uint64_t)v74);
      uint64_t v75 = v66;
      if (v66)
      {
        __break(1u);
      }

      else
      {
        uint64_t v150 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000195A0;
        uint64_t v151 = v85;
        sub_100006F34(&v150, (uint64_t)&v154, (uint64_t)&v153, (uint64_t)&v152);
        uint64_t v67 = 0LL;
        uint64_t v150 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001962C;
        uint64_t v151 = v87;
        sub_100006F34(&v150, (uint64_t)&v154, (uint64_t)&v153, (uint64_t)&v152);
        _os_log_impl((void *)&_mh_execute_header, v90, (os_log_type_t)v91, "%s - skipped", v69, v79);
        sub_100007088(v70, 0LL);
        sub_100007088(v71, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v84);
        swift_release(v85);
        swift_release(v87);
      }
    }

    else
    {
      swift_release(v84);
      swift_release(v85);
      swift_release(v87);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v133 + 8))(v136, v132);
  }

  else
  {
    unint64_t v6 = v138;
    uint64_t v7 = sub_10000A1F8();
    uint64_t v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v133 + 16))(v6, v7, v132);
    uint64_t v125 = (os_log_s *)Logger.logObject.getter(v8);
    int v126 = static os_log_type_t.debug.getter();
    char v113 = &v148;
    uint64_t v148 = 12LL;
    unint64_t v111 = sub_100006D24();
    unint64_t v112 = sub_100006D8C();
    unint64_t v9 = sub_100006DF4();
    UnsignedInteger<>.init<A>(_:)(v113, &type metadata for UInt32, &type metadata for Int, v111, v112, v9);
    uint32_t v114 = v149;
    uint64_t v115 = 17LL;
    uint64_t v117 = 7LL;
    uint64_t v10 = swift_allocObject(&unk_100021370, 17LL, 7LL);
    uint64_t v11 = v115;
    uint64_t v12 = v117;
    uint64_t v119 = v10;
    *(_BYTE *)(v10 + 16) = 32;
    uint64_t v13 = swift_allocObject(&unk_100021398, v11, v12);
    uint64_t v14 = v117;
    uint64_t v120 = v13;
    *(_BYTE *)(v13 + 16) = 8;
    uint64_t v116 = 32LL;
    uint64_t v15 = swift_allocObject(&unk_1000213C0, 32LL, v14);
    uint64_t v16 = v116;
    uint64_t v17 = v117;
    uint64_t v118 = v15;
    *(void *)(v15 + 16) = sub_100010888;
    *(void *)(v15 + 24) = 0LL;
    uint64_t v18 = swift_allocObject(&unk_1000213E8, v16, v17);
    uint64_t v19 = v118;
    uint64_t v122 = v18;
    *(void *)(v18 + 16) = sub_1000196D4;
    *(void *)(v18 + 24) = v19;
    uint64_t v124 = sub_100006E5C(&qword_100025B58);
    uint64_t v121 = _allocateUninitializedArray<A>(_:)(3LL, v124);
    uint64_t v123 = v20;
    swift_retain(v119);
    uint64_t v21 = v120;
    uint64_t v22 = v119;
    char v23 = v123;
    *uint64_t v123 = sub_100019660;
    v23[1] = v22;
    swift_retain(v21);
    uint64_t v24 = v122;
    uint64_t v25 = v120;
    unint64_t v26 = v123;
    v123[2] = sub_100019690;
    v26[3] = v25;
    swift_retain(v24);
    uint64_t v27 = v121;
    uint64_t v28 = v122;
    unint64_t v29 = v123;
    v123[4] = sub_10001971C;
    v29[5] = v28;
    sub_100004A08();
    swift_bridgeObjectRelease(v27);
    if (os_log_type_enabled(v125, (os_log_type_t)v126))
    {
      uint64_t v30 = v128;
      double v104 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v103 = sub_100006E5C(&qword_100025B60);
      uint64_t v105 = sub_100006EC8(0LL, v103, v103);
      uint64_t v106 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      id v107 = &v145;
      v145 = v104;
      uint64_t v108 = &v144;
      uint64_t v144 = v105;
      v109 = &v143;
      uint64_t v143 = v106;
      sub_100006F20(2LL, &v145);
      sub_100006F20(1LL, v107);
      uint64_t v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019660;
      uint64_t v142 = v119;
      sub_100006F34(&v141, (uint64_t)v107, (uint64_t)v108, (uint64_t)v109);
      uint64_t v110 = v30;
      if (v30)
      {
        __break(1u);
      }

      else
      {
        uint64_t v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019690;
        uint64_t v142 = v120;
        sub_100006F34(&v141, (uint64_t)&v145, (uint64_t)&v144, (uint64_t)&v143);
        uint64_t v102 = 0LL;
        uint64_t v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001971C;
        uint64_t v142 = v122;
        sub_100006F34(&v141, (uint64_t)&v145, (uint64_t)&v144, (uint64_t)&v143);
        _os_log_impl((void *)&_mh_execute_header, v125, (os_log_type_t)v126, "%s", v104, v114);
        sub_100007088(v105, 0LL);
        sub_100007088(v106, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v119);
        swift_release(v120);
        swift_release(v122);
      }
    }

    else
    {
      swift_release(v119);
      swift_release(v120);
      swift_release(v122);
    }

    (*(void (**)(char *, uint64_t))(v133 + 8))(v138, v132);
    id v31 = v131;
    uint64_t v92 = (void **)&v127[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_renderer];
    uint64_t v93 = &v147;
    uint64_t v94 = 33LL;
    uint64_t v95 = 0LL;
    swift_beginAccess();
    double v32 = *v92;
    *uint64_t v92 = v131;

    swift_endAccess(v93);
    swift_unknownObjectRetain(v139);
    uint64_t v96 = &v127[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_environment];
    uint64_t v97 = &v146;
    swift_beginAccess();
    uint64_t v33 = *(void *)v96;
    *(void *)uint64_t v96 = v139;
    swift_unknownObjectRelease(v33);
    swift_endAccess(v97);
    uint64_t v34 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 56LL))(v130, 1LL);
    uint64_t v99 = 7LL;
    uint64_t v100 = swift_allocObject(&unk_100021410, 24LL, 7LL);
    uint64_t v98 = v100 + 16;
    uint64_t v35 = v127;
    swift_unknownObjectWeakInit(v98, v127);

    swift_retain(v100);
    swift_unknownObjectRetain(v139);
    uint64_t v36 = swift_allocObject(&unk_100021438, 48LL, v99);
    id v37 = v139;
    unint64_t v38 = (void *)v36;
    uint64_t v39 = v100;
    double v101 = v38;
    v38[2] = 0LL;
    v38[3] = 0LL;
    v38[4] = v39;
    v38[5] = v37;
    swift_release(v39);
    uint64_t v40 = sub_100011CB4(v130, (uint64_t)&unk_1000260F0, (uint64_t)v101, (uint64_t)&type metadata for () + 8);
    return swift_release(v40);
  }

uint64_t sub_10001085C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didInitializeWith:)", 0x1EuLL, 1)._countAndFlagsBits;
}

uint64_t sub_100010888()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didInitializeWith:)", 0x1EuLL, 1)._countAndFlagsBits;
}

uint64_t sub_1000108B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[56] = a5;
  v5[55] = a4;
  v5[45] = v5;
  v5[46] = 0LL;
  v5[47] = 0LL;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  v5[57] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[58] = v7;
  v5[59] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v5[46] = a4 + 16;
  v5[47] = a5;
  return swift_task_switch(sub_10001096C, 0LL);
}

uint64_t sub_10001096C()
{
  uint64_t v46 = v0[55];
  v0[45] = v0;
  swift_beginAccess(v46 + 16, v0 + 30, 32LL, 0LL);
  v0[48] = swift_unknownObjectWeakLoadStrong(v46 + 16);
  if (!v0[48])
  {
    sub_10001B218((id *)(v45 + 384));
    swift_endAccess(v45 + 240);
    uint64_t v44 = *(void *)(v45 + 440) + 16LL;
    swift_beginAccess(v44, v45 + 264, 32LL, 0LL);
    *(void *)(v45 + 392) = swift_unknownObjectWeakLoadStrong(v44);
    if (*(void *)(v45 + 392))
    {
      id v37 = *(char **)(v45 + 392);
      uint64_t v4 = v37;
      sub_10001B218((id *)(v45 + 392));
      swift_endAccess(v45 + 264);
      uint64_t v36 = (uint64_t *)&v37[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state];
      swift_beginAccess(&v37[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state], v45 + 288, 32LL, 0LL);
      sub_1000198B4(v36, (void *)(v45 + 64));
      swift_endAccess(v45 + 288);
    }

    else
    {
      sub_10001B218((id *)(v45 + 392));
      swift_endAccess(v45 + 264);
      *(void *)(v45 + 64) = 2LL;
      *(void *)(v45 + 72) = 0LL;
      *(void *)(v45 + 80) = 0LL;
      *(void *)(v45 + 88) = 0LL;
      *(void *)(v45 + 96) = 0LL;
      *(void *)(v45 + 104) = 0LL;
    }

    if (*(void *)(v45 + 64) == 2LL)
    {
      uint64_t v5 = sub_10001B3C0((void *)(v45 + 64));
    }

    else
    {
      sub_10000A54C((const void *)(v45 + 64), (void *)(v45 + 16));
      sub_1000198B4((uint64_t *)(v45 + 16), (void *)(v45 + 112));
      if (*(void *)(v45 + 112) > 1uLL)
      {
        uint64_t v35 = *(void *)(v45 + 112);
        sub_100017C18((const void *)(v45 + 120), (void *)(v45 + 160));
        swift_unknownObjectRelease(v35);
        sub_100017D50((void *)(v45 + 160), (void *)(v45 + 200));
        if (*(void *)(v45 + 224))
        {
          uint64_t v34 = *(void *)(v45 + 224);
          uint64_t v32 = *(void *)(v45 + 232);
          sub_100018050((void *)(v45 + 200), v34);
          uint64_t v7 = *(int **)(v32 + 48);
          uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t))((char *)v7 + *v7);
          uint64_t v8 = (void *)swift_task_alloc(v7[1]);
          *(void *)(v45 + 496) = v8;
          *uint64_t v8 = *(void *)(v45 + 360);
          v8[1] = sub_1000118C4;
          return v33(v34, v32);
        }

        uint64_t v6 = sub_100017CA8((void *)(v45 + 200));
        static IdlePosterContentAvailableNotification.notify()(v6);
        sub_100017CA8((void *)(v45 + 160));
        sub_100019470((void *)(v45 + 16));
        goto LABEL_17;
      }

      sub_100019470((void *)(v45 + 112));
      uint64_t v5 = sub_100019470((void *)(v45 + 16));
    }

    static IdlePosterContentAvailableNotification.notify()(v5);
LABEL_17:
    uint64_t v9 = *(void *)(v45 + 472);
    uint64_t v24 = *(void *)(v45 + 464);
    uint64_t v25 = *(void *)(v45 + 456);
    uint64_t v10 = sub_10000A1F8();
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v9, v10, v25);
    oslog = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v29 = static os_log_type_t.debug.getter();
    *(void *)(v45 + 400) = 2LL;
    unint64_t v26 = sub_100006D24();
    unint64_t v27 = sub_100006D8C();
    unint64_t v12 = sub_100006DF4();
    UnsignedInteger<>.init<A>(_:)(v45 + 400, &type metadata for UInt32, &type metadata for Int, v26, v27, v12);
    uint32_t size = *(_DWORD *)(v45 + 504);
    uint64_t v13 = sub_100006E5C(&qword_100025B58);
    uint64_t v31 = _allocateUninitializedArray<A>(_:)(0LL, v13);
    if (os_log_type_enabled(oslog, v29))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v18 = sub_100006E5C(&qword_100025B60);
      uint64_t v20 = sub_100006EC8(0LL, v18, v18);
      uint64_t v21 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      *(void *)(v45 + 408) = buf;
      *(void *)(v45 + 416) = v20;
      *(void *)(v45 + 424) = v21;
      sub_100006F20(0LL, (_BYTE **)(v45 + 408));
      sub_100006F20(0LL, (_BYTE **)(v45 + 408));
      *(void *)(v45 + 432) = v31;
      uint64_t v22 = (void *)swift_task_alloc(48LL);
      v22[2] = v45 + 408;
      v22[3] = v45 + 416;
      v22[4] = v45 + 424;
      uint64_t v23 = sub_100006E5C(&qword_100025B68);
      unint64_t v14 = sub_100006FA4();
      Sequence.forEach(_:)(sub_10001B464, v22, v23, v14);
      swift_task_dealloc(v22);
      _os_log_impl((void *)&_mh_execute_header, oslog, v29, "PosterPresenter initialization finishes.", buf, size);
      sub_100007088(v20, 0LL);
      sub_100007088(v21, 0LL);
      UnsafeMutablePointer.deallocate()();
    }

    swift_bridgeObjectRelease(v31);
    uint64_t v17 = *(void *)(v45 + 472);
    uint64_t v15 = *(void *)(v45 + 464);
    uint64_t v16 = *(void *)(v45 + 456);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
    swift_task_dealloc(v17);
    return (*(uint64_t (**)(void))(*(void *)(v45 + 360) + 8LL))();
  }

  uint64_t v42 = *(void **)(v45 + 448);
  uint64_t v41 = *(void **)(v45 + 384);
  *(void *)(v45 + 480) = v41;
  id v1 = v41;
  sub_10001B218((id *)(v45 + 384));
  swift_endAccess(v45 + 240);
  swift_getObjectType(v42);
  swift_unknownObjectRetain(v42);
  unsigned __int8 v43 = [v42 isPreview];
  swift_unknownObjectRelease(v42);
  if ((v43 & 1) != 0)
  {
    swift_beginAccess(&TVISAmbientSnapshotQueryIntentSwitcher, v45 + 336, 32LL, 0LL);
    uint64_t v39 = TVISAmbientSnapshotQueryIntentSwitcher;
    swift_endAccess(v45 + 336);
    uint64_t v40 = v39;
  }

  else
  {
    swift_beginAccess(&TVISAmbientSnapshotQueryIntentFullscreen, v45 + 312, 32LL, 0LL);
    uint64_t v38 = TVISAmbientSnapshotQueryIntentFullscreen;
    swift_endAccess(v45 + 312);
    uint64_t v40 = v38;
  }

  uint64_t v2 = (void *)swift_task_alloc(dword_100025FF4);
  *(void *)(v45 + 488) = v2;
  *uint64_t v2 = *(void *)(v45 + 360);
  v2[1] = sub_1000111D4;
  return sub_10000A5CC(v40);
}

uint64_t sub_1000111D4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 488LL);
  uint64_t v3 = *(void **)(*(void *)v0 + 480LL);
  *(void *)(*(void *)v0 + 360LL) = *(void *)v0;
  swift_task_dealloc(v1);

  return swift_task_switch(sub_100011250, 0LL);
}

uint64_t sub_100011250()
{
  v0[45] = v0;
  uint64_t v37 = v0[55];
  swift_beginAccess(v37 + 16, v0 + 33, 32LL, 0LL);
  v0[49] = swift_unknownObjectWeakLoadStrong(v37 + 16);
  if (v0[49])
  {
    uint64_t v35 = *(char **)(v36 + 392);
    uint64_t v1 = v35;
    sub_10001B218((id *)(v36 + 392));
    swift_endAccess(v36 + 264);
    uint64_t v34 = (uint64_t *)&v35[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state];
    swift_beginAccess(&v35[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state], v36 + 288, 32LL, 0LL);
    sub_1000198B4(v34, (void *)(v36 + 64));
    swift_endAccess(v36 + 288);
  }

  else
  {
    sub_10001B218((id *)(v36 + 392));
    swift_endAccess(v36 + 264);
    *(void *)(v36 + 64) = 2LL;
    *(void *)(v36 + 72) = 0LL;
    *(void *)(v36 + 80) = 0LL;
    *(void *)(v36 + 88) = 0LL;
    *(void *)(v36 + 96) = 0LL;
    *(void *)(v36 + 104) = 0LL;
  }

  if (*(void *)(v36 + 64) == 2LL)
  {
    uint64_t v2 = sub_10001B3C0((void *)(v36 + 64));
LABEL_11:
    static IdlePosterContentAvailableNotification.notify()(v2);
    goto LABEL_12;
  }

  sub_10000A54C((const void *)(v36 + 64), (void *)(v36 + 16));
  sub_1000198B4((uint64_t *)(v36 + 16), (void *)(v36 + 112));
  if (*(void *)(v36 + 112) <= 1uLL)
  {
    sub_100019470((void *)(v36 + 112));
    uint64_t v2 = sub_100019470((void *)(v36 + 16));
    goto LABEL_11;
  }

  uint64_t v33 = *(void *)(v36 + 112);
  sub_100017C18((const void *)(v36 + 120), (void *)(v36 + 160));
  swift_unknownObjectRelease(v33);
  sub_100017D50((void *)(v36 + 160), (void *)(v36 + 200));
  if (*(void *)(v36 + 224))
  {
    uint64_t v32 = *(void *)(v36 + 224);
    uint64_t v30 = *(void *)(v36 + 232);
    sub_100018050((void *)(v36 + 200), v32);
    uint64_t v4 = *(int **)(v30 + 48);
    uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
    uint64_t v5 = (void *)swift_task_alloc(v4[1]);
    *(void *)(v36 + 496) = v5;
    *uint64_t v5 = *(void *)(v36 + 360);
    v5[1] = sub_1000118C4;
    return v31(v32, v30);
  }

  uint64_t v3 = sub_100017CA8((void *)(v36 + 200));
  static IdlePosterContentAvailableNotification.notify()(v3);
  sub_100017CA8((void *)(v36 + 160));
  sub_100019470((void *)(v36 + 16));
LABEL_12:
  uint64_t v7 = *(void *)(v36 + 472);
  uint64_t v22 = *(void *)(v36 + 464);
  uint64_t v23 = *(void *)(v36 + 456);
  uint64_t v8 = sub_10000A1F8();
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v7, v8, v23);
  oslog = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  *(void *)(v36 + 400) = 2LL;
  unint64_t v24 = sub_100006D24();
  unint64_t v25 = sub_100006D8C();
  unint64_t v10 = sub_100006DF4();
  UnsignedInteger<>.init<A>(_:)(v36 + 400, &type metadata for UInt32, &type metadata for Int, v24, v25, v10);
  uint32_t size = *(_DWORD *)(v36 + 504);
  uint64_t v11 = sub_100006E5C(&qword_100025B58);
  uint64_t v29 = _allocateUninitializedArray<A>(_:)(0LL, v11);
  if (os_log_type_enabled(oslog, v27))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v16 = sub_100006E5C(&qword_100025B60);
    uint64_t v18 = sub_100006EC8(0LL, v16, v16);
    uint64_t v19 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    *(void *)(v36 + 408) = buf;
    *(void *)(v36 + 416) = v18;
    *(void *)(v36 + 424) = v19;
    sub_100006F20(0LL, (_BYTE **)(v36 + 408));
    sub_100006F20(0LL, (_BYTE **)(v36 + 408));
    *(void *)(v36 + 432) = v29;
    uint64_t v20 = (void *)swift_task_alloc(48LL);
    v20[2] = v36 + 408;
    v20[3] = v36 + 416;
    v20[4] = v36 + 424;
    uint64_t v21 = sub_100006E5C(&qword_100025B68);
    unint64_t v12 = sub_100006FA4();
    Sequence.forEach(_:)(sub_10001B464, v20, v21, v12);
    swift_task_dealloc(v20);
    _os_log_impl((void *)&_mh_execute_header, oslog, v27, "PosterPresenter initialization finishes.", buf, size);
    sub_100007088(v18, 0LL);
    sub_100007088(v19, 0LL);
    UnsafeMutablePointer.deallocate()();
  }

  swift_bridgeObjectRelease(v29);
  uint64_t v15 = *(void *)(v36 + 472);
  uint64_t v13 = *(void *)(v36 + 464);
  uint64_t v14 = *(void *)(v36 + 456);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  swift_task_dealloc(v15);
  return (*(uint64_t (**)(void))(*(void *)(v36 + 360) + 8LL))();
}

uint64_t sub_1000118C4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 496LL);
  *(void *)(*(void *)v0 + 360LL) = *(void *)v0;
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100011930, 0LL);
}

uint64_t sub_100011930()
{
  *(void *)(v0 + 360) = v0;
  uint64_t v1 = sub_100017CE8((void *)(v0 + 200));
  static IdlePosterContentAvailableNotification.notify()(v1);
  sub_100017CA8((void *)(v0 + 160));
  sub_100019470((void *)(v0 + 16));
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v19 = *(void *)(v0 + 464);
  uint64_t v20 = *(void *)(v0 + 456);
  uint64_t v3 = sub_10000A1F8();
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v2, v3, v20);
  unint64_t v25 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v24 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 400) = 2LL;
  unint64_t v21 = sub_100006D24();
  unint64_t v22 = sub_100006D8C();
  unint64_t v5 = sub_100006DF4();
  UnsignedInteger<>.init<A>(_:)(v0 + 400, &type metadata for UInt32, &type metadata for Int, v21, v22, v5);
  uint32_t v23 = *(_DWORD *)(v0 + 504);
  uint64_t v6 = sub_100006E5C(&qword_100025B58);
  uint64_t v26 = _allocateUninitializedArray<A>(_:)(0LL, v6);
  if (os_log_type_enabled(v25, v24))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v12 = sub_100006E5C(&qword_100025B60);
    uint64_t v14 = sub_100006EC8(0LL, v12, v12);
    uint64_t v15 = sub_100006EC8(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    *(void *)(v18 + 408) = buf;
    *(void *)(v18 + 416) = v14;
    *(void *)(v18 + 424) = v15;
    sub_100006F20(0LL, (_BYTE **)(v18 + 408));
    sub_100006F20(0LL, (_BYTE **)(v18 + 408));
    *(void *)(v18 + 432) = v26;
    uint64_t v16 = (void *)swift_task_alloc(48LL);
    v16[2] = v18 + 408;
    v16[3] = v18 + 416;
    v16[4] = v18 + 424;
    uint64_t v17 = sub_100006E5C(&qword_100025B68);
    unint64_t v7 = sub_100006FA4();
    Sequence.forEach(_:)(sub_10001B464, v16, v17, v7);
    swift_task_dealloc(v16);
    _os_log_impl((void *)&_mh_execute_header, v25, v24, "PosterPresenter initialization finishes.", buf, v23);
    sub_100007088(v14, 0LL);
    sub_100007088(v15, 0LL);
    UnsafeMutablePointer.deallocate()();
  }

  swift_bridgeObjectRelease(v26);
  uint64_t v11 = *(void *)(v18 + 472);
  uint64_t v9 = *(void *)(v18 + 464);
  uint64_t v10 = *(void *)(v18 + 456);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(*(void *)(v18 + 360) + 8LL))();
}

uint64_t sub_100011CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[4] = a4;
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1LL) == 1)
  {
    sub_100008A68(a1);
    uint64_t v16 = 0LL;
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a1, v21);
    uint64_t v16 = v15;
  }

  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(a3 + 24);
  swift_unknownObjectRetain(v14);
  if (v14)
  {
    uint64_t ObjectType = swift_getObjectType(v14);
    uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v13);
    uint64_t v10 = v5;
    swift_unknownObjectRelease(v14);
    uint64_t v11 = v9;
    uint64_t v12 = v10;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  unint64_t v7 = (void *)swift_allocObject(&unk_1000218B0, 40LL, 7LL);
  void v7[2] = a4;
  v7[3] = a2;
  v7[4] = a3;
  uint64_t v8 = 0LL;
  if (v11 != 0 || v12 != 0)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    v23[2] = v11;
    v23[3] = v12;
    uint64_t v8 = v23;
  }

  return swift_task_create(v16 | 0x1C00, v8, a4, &unk_1000262C0, v7);
}

void *sub_100011F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a1;
  uint64_t v31 = a2;
  uint64_t v27 = a3;
  unint64_t v25 = &protocol witness table for MainActor;
  uint64_t v48 = 0LL;
  uint64_t v47 = 0LL;
  uint64_t v46 = 0LL;
  uint64_t v45 = 0LL;
  unint64_t v28 = (*(void *)(*(void *)(sub_100006E5C(&qword_100025D78) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v31);
  uint64_t v29 = (char *)&v17 - v28;
  uint64_t v48 = v5;
  uint64_t v47 = v4;
  uint64_t v46 = v6;
  uint64_t v45 = v3;
  swift_unknownObjectRetain(v4);
  uint64_t v30 = (uint64_t *)(v3 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_environment);
  uint64_t v32 = &v44;
  uint64_t v33 = 0LL;
  swift_beginAccess();
  uint64_t v7 = *v30;
  *uint64_t v30 = v31;
  swift_unknownObjectRelease(v7);
  swift_endAccess(v32);
  uint64_t v34 = (uint64_t *)(v3 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state);
  uint64_t v35 = &v42;
  swift_beginAccess();
  sub_1000198B4(v34, &v40);
  swift_endAccess(v35);
  uint64_t v36 = v40;
  if (!v40 || v36 == 1) {
    return sub_100019470(&v40);
  }
  uint64_t v23 = v40;
  os_log_type_t v24 = v43;
  sub_100017C18(&v41, v43);
  swift_unknownObjectRelease(v23);
  sub_100017D50(v24, v38);
  if (v38[3])
  {
    uint64_t v22 = v39;
    sub_1000199B0(v38, v39);
    uint64_t v18 = 0LL;
    uint64_t v8 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 56LL))(v29, 1LL);
    uint64_t v20 = v37;
    sub_100018004((uint64_t)v22, (uint64_t)v37);
    swift_unknownObjectRetain(v31);
    type metadata accessor for MainActor(v18);
    uint64_t v19 = static MainActor.shared.getter();
    uint64_t v9 = swift_allocObject(&unk_100021460, 80LL, 7LL);
    uint64_t v10 = v25;
    uint64_t v11 = (void *)v9;
    uint64_t v12 = v20;
    uint64_t v21 = v11;
    v11[2] = v19;
    v11[3] = v10;
    sub_1000199B0(v12, v11 + 4);
    uint64_t v13 = (uint64_t)v21;
    uint64_t v14 = (uint64_t)v29;
    v21[9] = v31;
    uint64_t v15 = sub_100011CB4(v14, (uint64_t)&unk_100026100, v13, (uint64_t)&type metadata for () + 8);
    swift_release(v15);
    sub_100017CE8(v22);
  }

  else
  {
    sub_100017CA8(v38);
  }

  return sub_100017CA8(v43);
}

uint64_t sub_100012200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 104) = a5;
  *(void *)(v5 + 96) = a4;
  *(void *)(v5 + 64) = v5;
  *(void *)(v5 + 72) = 0LL;
  *(void *)(v5 + 80) = 0LL;
  *(_BYTE *)(v5 + 120) = 0;
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 80) = a5;
  uint64_t v7 = type metadata accessor for MainActor(0LL);
  *(void *)(v5 + 112) = static MainActor.shared.getter(v7);
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000122A0, v8);
}

uint64_t sub_1000122A0()
{
  uint64_t v19 = (void *)v0[13];
  uint64_t v1 = (void *)v0[12];
  v0[8] = v0;
  uint64_t v16 = v1[3];
  uint64_t v17 = v1[4];
  sub_100018050(v1, v16);
  swift_getObjectType(v19);
  swift_unknownObjectRetain(v19);
  unsigned int v15 = [v19 isPreview];
  swift_unknownObjectRelease(v19);
  (*(void (**)(void, uint64_t))(v17 + 32))((v15 ^ 1) & 1, v16);
  swift_getObjectType(v19);
  swift_unknownObjectRetain(v19);
  unsigned __int8 v18 = [v19 isPreview];
  swift_unknownObjectRelease(v19);
  swift_unknownObjectRetain(v19);
  if ((v18 & 1) != 1)
  {
    char v7 = 0;
    goto LABEL_15;
  }

  uint64_t v12 = *(void **)(v14 + 104);
  swift_getObjectType(v12);
  swift_unknownObjectRetain(v12);
  id v13 = [v12 context];
  swift_unknownObjectRelease(v12);
  if (v13)
  {
    id v9 = [v13 mode];

    id v10 = v9;
    char v11 = 0;
  }

  else
  {
    id v10 = 0LL;
    char v11 = 1;
  }

  *(void *)(v14 + 16) = v10;
  *(_BYTE *)(v14 + 24) = v11 & 1;
  *(void *)(v14 + 32) = 1LL;
  *(_BYTE *)(v14 + 40) = 0;
  if ((*(_BYTE *)(v14 + 24) & 1) != 0)
  {
    if ((*(_BYTE *)(v14 + 40) & 1) != 0)
    {
      char v8 = 1;
      goto LABEL_11;
    }

    goto LABEL_12;
  }

  sub_100018E34(v14 + 16, v14 + 48);
  if ((*(_BYTE *)(v14 + 40) & 1) != 0)
  {
LABEL_12:
    char v8 = 0;
    goto LABEL_11;
  }

  *(void *)(v14 + 88) = *(void *)(v14 + 32);
  type metadata accessor for PRRenderingMode(0LL);
  sub_100018E50();
  char v8 = dispatch thunk of static Equatable.== infix(_:_:)(v14 + 48, v14 + 88);
LABEL_11:
  char v7 = v8 ^ 1;
LABEL_15:
  uint64_t v6 = *(void *)(v14 + 112);
  uint64_t v3 = *(void **)(v14 + 96);
  swift_unknownObjectRelease(*(void *)(v14 + 104));
  *(_BYTE *)(v14 + 120) = v7 & 1;
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_100018050(v3, v4);
  (*(void (**)(void, uint64_t))(v5 + 40))(v7 & 1, v4);
  swift_release(v6);
  return (*(uint64_t (**)(void))(*(void *)(v14 + 64) + 8LL))();
}

void *sub_1000126F8(void *a1, void *a2)
{
  id v89 = a1;
  id v88 = a2;
  uint64_t v83 = &protocol witness table for MainActor;
  uint64_t v116 = 0LL;
  uint64_t v115 = 0LL;
  uint64_t v114 = 0LL;
  char v103 = 0;
  uint64_t v87 = 0LL;
  uint64_t v84 = 0LL;
  uint64_t v3 = sub_100006E5C(&qword_100025D78);
  unint64_t v85 = (*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v3);
  uint64_t v86 = (uint64_t)&v43 - v85;
  uint64_t v90 = type metadata accessor for Logger(0LL);
  uint64_t v91 = *(void *)(v90 - 8);
  unint64_t v92 = (*(void *)(v91 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v89);
  uint64_t v93 = (char *)&v43 - v92;
  uint64_t v116 = v4;
  uint64_t v115 = v5;
  uint64_t v114 = v2;
  uint64_t v94 = (uint64_t *)(v2 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state);
  uint64_t v95 = &v112;
  swift_beginAccess();
  sub_1000198B4(v94, &v110);
  swift_endAccess(v95);
  uint64_t v96 = v110;
  if (!v110 || v96 == 1) {
    return sub_100019470(&v110);
  }
  uint64_t v81 = v110;
  uint64_t v82 = v113;
  sub_100017C18(&v111, v113);
  swift_unknownObjectRelease(v81);
  sub_100017D50(v82, v108);
  if (v108[3])
  {
    uint64_t v6 = v93;
    sub_1000199B0(v108, __dst);
    uint64_t v7 = sub_10000A1F8();
    uint64_t v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 16))(v6, v7, v90);
    uint32_t v79 = (os_log_s *)Logger.logObject.getter(v8);
    int v80 = static os_log_type_t.debug.getter();
    uint64_t v67 = &v106;
    uint64_t v106 = 12LL;
    unint64_t v65 = sub_100006D24();
    unint64_t v66 = sub_100006D8C();
    unint64_t v9 = sub_100006DF4();
    UnsignedInteger<>.init<A>(_:)(v67, &type metadata for UInt32, &type metadata for Int, v65, v66, v9);
    uint32_t v68 = v107;
    uint64_t v69 = 17LL;
    uint64_t v71 = 7LL;
    uint64_t v10 = swift_allocObject(&unk_100021488, 17LL, 7LL);
    uint64_t v11 = v69;
    uint64_t v12 = v71;
    uint64_t v73 = v10;
    *(_BYTE *)(v10 + 16) = 32;
    uint64_t v13 = swift_allocObject(&unk_1000214B0, v11, v12);
    uint64_t v14 = v71;
    uint64_t v74 = v13;
    *(_BYTE *)(v13 + 16) = 8;
    uint64_t v70 = 32LL;
    uint64_t v15 = swift_allocObject(&unk_1000214D8, 32LL, v14);
    uint64_t v16 = v70;
    uint64_t v17 = v71;
    uint64_t v72 = v15;
    *(void *)(v15 + 16) = sub_100012EA8;
    *(void *)(v15 + 24) = 0LL;
    uint64_t v18 = swift_allocObject(&unk_100021500, v16, v17);
    uint64_t v19 = v72;
    uint64_t v76 = v18;
    *(void *)(v18 + 16) = sub_100019BCC;
    *(void *)(v18 + 24) = v19;
    uint64_t v78 = sub_100006E5C(&qword_100025B58);
    uint64_t v75 = _allocateUninitializedArray<A>(_:)(3LL, v78);
    unint64_t v77 = v20;
    swift_retain(v73);
    uint64_t v21 = v74;
    uint64_t v22 = v73;
    uint64_t v23 = v77;
    *unint64_t v77 = sub_100019B58;
    v23[1] = v22;
    swift_retain(v21);
    uint64_t v24 = v76;
    uint64_t v25 = v74;
    uint64_t v26 = v77;
    v77[2] = sub_100019B88;
    v26[3] = v25;
    swift_retain(v24);
    uint64_t v27 = v75;
    uint64_t v28 = v76;
    uint64_t v29 = v77;
    v77[4] = sub_100019C14;
    v29[5] = v28;
    sub_100004A08();
    swift_bridgeObjectRelease(v27);
    if (os_log_type_enabled(v79, (os_log_type_t)v80))
    {
      uint64_t v30 = v84;
      uint64_t v58 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v57 = sub_100006E5C(&qword_100025B60);
      uint64_t v59 = sub_100006EC8(0LL, v57, v57);
      uint64_t v60 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      uint64_t v61 = &v101;
      double v101 = v58;
      id v62 = &v100;
      uint64_t v100 = v59;
      uint64_t v63 = &v99;
      uint64_t v99 = v60;
      sub_100006F20(2LL, &v101);
      sub_100006F20(1LL, v61);
      uint64_t v97 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019B58;
      uint64_t v98 = v73;
      sub_100006F34(&v97, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63);
      uint64_t v64 = v30;
      if (v30)
      {
        __break(1u);
      }

      else
      {
        uint64_t v97 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019B88;
        uint64_t v98 = v74;
        sub_100006F34(&v97, (uint64_t)&v101, (uint64_t)&v100, (uint64_t)&v99);
        uint64_t v56 = 0LL;
        uint64_t v97 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019C14;
        uint64_t v98 = v76;
        sub_100006F34(&v97, (uint64_t)&v101, (uint64_t)&v100, (uint64_t)&v99);
        _os_log_impl((void *)&_mh_execute_header, v79, (os_log_type_t)v80, "%s", v58, v68);
        sub_100007088(v59, 0LL);
        sub_100007088(v60, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v73);
        swift_release(v74);
        swift_release(v76);
      }
    }

    else
    {
      swift_release(v73);
      swift_release(v74);
      swift_release(v76);
    }

    (*(void (**)(char *, uint64_t))(v91 + 8))(v93, v90);
    id v43 = [v89 backgroundView];
    id v44 = [v43 traitCollection];

    id v45 = [v44 layoutDirection];
    uint64_t v48 = &v105;
    id v105 = v45;
    uint64_t v46 = &v104;
    uint64_t v49 = 0LL;
    uint64_t v104 = 0LL;
    uint64_t v47 = type metadata accessor for UITraitEnvironmentLayoutDirection(0LL);
    unint64_t v31 = sub_100019C20();
    int v52 = == infix<A>(_:_:)(v48, v46, v47, v31, &protocol witness table for Int);
    unsigned int v51 = 1;
    char v103 = v52 & 1;
    uint64_t v32 = type metadata accessor for TaskPriority(v49);
    (*(void (**)(uint64_t, void))(*(void *)(v32 - 8) + 56LL))(v86, v51);
    id v33 = v88;
    uint64_t v55 = __dst;
    uint64_t v53 = v102;
    sub_100018004((uint64_t)__dst, (uint64_t)v102);
    type metadata accessor for MainActor(v49);
    uint64_t v50 = static MainActor.shared.getter();
    uint64_t v34 = swift_allocObject(&unk_100021528, 88LL, 7LL);
    uint64_t v35 = v83;
    id v36 = v88;
    char v37 = v51;
    char v38 = v52;
    uint64_t v39 = v34;
    uint64_t v40 = v53;
    uint64_t v54 = v39;
    *(void *)(v39 + 16) = v50;
    *(void *)(v39 + 24) = v35;
    *(void *)(v39 + 32) = v36;
    *(_BYTE *)(v39 + 40) = v38 & v37;
    sub_1000199B0(v40, (void *)(v39 + 48));
    uint64_t v41 = sub_100011CB4(v86, (uint64_t)&unk_100026118, v54, (uint64_t)&type metadata for () + 8);
    swift_release(v41);
    sub_100017CE8(v55);
    return sub_100017CA8(v113);
  }

  else
  {
    sub_100017CA8(v108);
    return sub_100017CA8(v113);
  }

uint64_t sub_100012EA8()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didReceive:)", 0x17uLL, 1)._countAndFlagsBits;
}

uint64_t sub_100012ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(void *)(v6 + 96) = a6;
  *(_BYTE *)(v6 + 113) = a5 & 1;
  *(void *)(v6 + 88) = a4;
  *(void *)(v6 + 16) = v6;
  *(void *)(v6 + 24) = 0LL;
  *(_BYTE *)(v6 + 112) = 0;
  *(void *)(v6 + 32) = 0LL;
  *(void *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 112) = a5 & 1;
  *(void *)(v6 + 32) = a6;
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  *(void *)(v6 + 104) = static MainActor.shared.getter(v8);
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  return swift_task_switch(sub_100012F94, v9);
}

uint64_t sub_100012F94()
{
  uint64_t v1 = *(void **)(v0 + 88);
  *(void *)(v0 + 16) = v0;
  id v30 = [v1 type];
  id v2 = v30;
  uint64_t v29 = PRRenderingEventTypeSwipeLeft;
  id v3 = PRRenderingEventTypeSwipeLeft;
  *(void *)(v0 + 40) = v29;
  *(void *)(v0 + 48) = v30;
  type metadata accessor for PRRenderingEventType(0LL);
  sub_100008EC0();
  char v31 = dispatch thunk of static Equatable.== infix(_:_:)(v0 + 40, v0 + 48);
  sub_10001B240((id *)(v0 + 40));
  if ((v31 & 1) != 0)
  {
    char v27 = *(_BYTE *)(v28 + 113);

    uint64_t v4 = *(void **)(v28 + 96);
    if ((v27 & 1) != 0)
    {
      uint64_t v26 = v4[3];
      uint64_t v25 = v4[4];
      sub_100018050(v4, v26);
      (*(void (**)(uint64_t))(v25 + 16))(v26);
    }

    else
    {
      uint64_t v24 = v4[3];
      uint64_t v23 = v4[4];
      sub_100018050(v4, v24);
      (*(void (**)(uint64_t))(v23 + 8))(v24);
    }
  }

  else
  {

    id v5 = v30;
    uint64_t v21 = PRRenderingEventTypeSwipeRight;
    id v6 = PRRenderingEventTypeSwipeRight;
    *(void *)(v28 + 56) = v21;
    *(void *)(v28 + 64) = v30;
    char v22 = dispatch thunk of static Equatable.== infix(_:_:)(v28 + 56, v28 + 64);
    sub_10001B240((id *)(v28 + 56));
    if ((v22 & 1) != 0)
    {
      char v20 = *(_BYTE *)(v28 + 113);

      uint64_t v7 = *(void **)(v28 + 96);
      if ((v20 & 1) != 0)
      {
        uint64_t v19 = v7[3];
        uint64_t v18 = v7[4];
        sub_100018050(v7, v19);
        (*(void (**)(uint64_t))(v18 + 8))(v19);
      }

      else
      {
        uint64_t v17 = v7[3];
        uint64_t v16 = v7[4];
        sub_100018050(v7, v17);
        (*(void (**)(uint64_t))(v16 + 16))(v17);
      }
    }

    else
    {

      id v8 = v30;
      uint64_t v14 = PRRenderingEventTypeTap;
      id v9 = PRRenderingEventTypeTap;
      *(void *)(v28 + 72) = v14;
      *(void *)(v28 + 80) = v30;
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)(v28 + 72, v28 + 80);
      sub_10001B240((id *)(v28 + 72));
      if ((v15 & 1) != 0)
      {
        uint64_t v11 = *(void **)(v28 + 96);

        uint64_t v13 = v11[3];
        uint64_t v12 = v11[4];
        sub_100018050(v11, v13);
        (*(void (**)(uint64_t))(v12 + 24))(v13);
      }

      else
      {
      }
    }
  }

  swift_release(*(void *)(v28 + 104));
  return (*(uint64_t (**)(void))(*(void *)(v28 + 16) + 8LL))();
}

uint64_t sub_100013428(uint64_t a1)
{
  uint64_t v50 = a1;
  uint64_t v83 = 0LL;
  uint64_t v82 = 0LL;
  uint64_t v48 = 0LL;
  uint64_t v54 = type metadata accessor for Logger(0LL);
  uint64_t v53 = *(void *)(v54 - 8);
  unint64_t v51 = (*(void *)(v53 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v1 = (char *)&v30 - v51;
  int v52 = (char *)&v30 - v51;
  uint64_t v83 = __chkstk_darwin(v50);
  uint64_t v82 = v2;
  uint64_t v3 = sub_10000A1F8();
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 16))(v1, v3, v54);
  uint64_t v69 = (os_log_s *)Logger.logObject.getter(v4);
  int v70 = static os_log_type_t.debug.getter();
  uint64_t v57 = &v80;
  uint64_t v80 = 12LL;
  unint64_t v55 = sub_100006D24();
  unint64_t v56 = sub_100006D8C();
  unint64_t v5 = sub_100006DF4();
  UnsignedInteger<>.init<A>(_:)(v57, &type metadata for UInt32, &type metadata for Int, v55, v56, v5);
  uint32_t v58 = v81;
  uint64_t v59 = 17LL;
  uint64_t v61 = 7LL;
  uint64_t v6 = swift_allocObject(&unk_100021550, 17LL, 7LL);
  uint64_t v7 = v59;
  uint64_t v8 = v61;
  uint64_t v63 = v6;
  *(_BYTE *)(v6 + 16) = 32;
  uint64_t v9 = swift_allocObject(&unk_100021578, v7, v8);
  uint64_t v10 = v61;
  uint64_t v64 = v9;
  *(_BYTE *)(v9 + 16) = 8;
  uint64_t v60 = 32LL;
  uint64_t v11 = swift_allocObject(&unk_1000215A0, 32LL, v10);
  uint64_t v12 = v60;
  uint64_t v13 = v61;
  uint64_t v62 = v11;
  *(void *)(v11 + 16) = sub_100013B68;
  *(void *)(v11 + 24) = 0LL;
  uint64_t v14 = swift_allocObject(&unk_1000215C8, v12, v13);
  uint64_t v15 = v62;
  uint64_t v66 = v14;
  *(void *)(v14 + 16) = sub_100019E84;
  *(void *)(v14 + 24) = v15;
  uint64_t v68 = sub_100006E5C(&qword_100025B58);
  uint64_t v65 = _allocateUninitializedArray<A>(_:)(3LL, v68);
  uint64_t v67 = v16;
  swift_retain(v63);
  uint64_t v17 = v64;
  uint64_t v18 = v63;
  uint64_t v19 = v67;
  *uint64_t v67 = sub_100019E10;
  v19[1] = v18;
  swift_retain(v17);
  uint64_t v20 = v66;
  uint64_t v21 = v64;
  char v22 = v67;
  v67[2] = sub_100019E40;
  v22[3] = v21;
  swift_retain(v20);
  uint64_t v23 = v65;
  uint64_t v24 = v66;
  uint64_t v25 = v67;
  v67[4] = sub_100019ECC;
  v25[5] = v24;
  sub_100004A08();
  swift_bridgeObjectRelease(v23);
  if (os_log_type_enabled(v69, (os_log_type_t)v70))
  {
    uint64_t v26 = v48;
    uint64_t v41 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v40 = sub_100006E5C(&qword_100025B60);
    uint64_t v42 = sub_100006EC8(0LL, v40, v40);
    uint64_t v43 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    id v44 = &v75;
    uint64_t v75 = v41;
    id v45 = &v74;
    uint64_t v74 = v42;
    uint64_t v46 = &v73;
    uint64_t v73 = v43;
    sub_100006F20(2LL, &v75);
    sub_100006F20(1LL, v44);
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019E10;
    uint64_t v72 = v63;
    sub_100006F34(&v71, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46);
    uint64_t v47 = v26;
    if (v26)
    {
      __break(1u);
    }

    else
    {
      uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019E40;
      uint64_t v72 = v64;
      sub_100006F34(&v71, (uint64_t)&v75, (uint64_t)&v74, (uint64_t)&v73);
      uint64_t v39 = 0LL;
      uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100019ECC;
      uint64_t v72 = v66;
      sub_100006F34(&v71, (uint64_t)&v75, (uint64_t)&v74, (uint64_t)&v73);
      _os_log_impl((void *)&_mh_execute_header, v69, (os_log_type_t)v70, "%s", v41, v58);
      sub_100007088(v42, 0LL);
      sub_100007088(v43, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v63);
      swift_release(v64);
      swift_release(v66);
    }
  }

  else
  {
    swift_release(v63);
    swift_release(v64);
    swift_release(v66);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
  id v30 = (void **)(v49 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_renderer);
  char v31 = &v79;
  uint64_t v34 = 33LL;
  uint64_t v35 = 0LL;
  swift_beginAccess();
  char v27 = *v30;
  *id v30 = 0LL;

  swift_endAccess(v31);
  uint64_t v32 = (uint64_t *)(v49 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_environment);
  id v33 = &v78;
  swift_beginAccess();
  uint64_t v28 = *v32;
  *uint64_t v32 = 0LL;
  swift_unknownObjectRelease(v28);
  swift_endAccess(v33);
  id v36 = v77;
  memset(v77, 0, sizeof(v77));
  char v37 = (uint64_t *)(v49 + OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state);
  char v38 = &v76;
  swift_beginAccess();
  sub_100017DCC(v36, v37);
  return swift_endAccess(v38);
}

uint64_t sub_100013B68()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rendererDidInvalidate(_:)", 0x19uLL, 1)._countAndFlagsBits;
}

uint64_t sub_100013D28()
{
  unint64_t v0 = sub_100019ED8();
  return _allocateUninitializedArray<A>(_:)(0LL, v0);
}

uint64_t sub_100013E9C()
{
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100013F64(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc(dword_10002612C);
  *(void *)(v10 + 48) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_100014004;
  return sub_100013E9C();
}

uint64_t sub_100014004()
{
  uint64_t v6 = *v0;
  uint64_t v1 = *(void *)(*v0 + 48);
  aBlock = *(void (***)(void))(*v0 + 40);
  uint64_t v3 = *(void **)(*v0 + 32);
  uint64_t v4 = *(void **)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);

  aBlock[2]();
  _Block_release(aBlock);
  return (*(uint64_t (**)(void))(*(void *)(v6 + 16) + 8LL))();
}

  ;
}

void sub_100014110(uint64_t a1, uint64_t a2)
{
  uint64_t v185 = a1;
  uint64_t v186 = a2;
  uint64_t v229 = 0LL;
  uint64_t v228 = 0LL;
  uint64_t v227 = 0LL;
  uint64_t v182 = 0LL;
  id v216 = 0LL;
  uint64_t v3 = sub_100006E5C(&qword_100025D78);
  unint64_t v183 = (*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v3);
  uint64_t v184 = (uint64_t)&v94 - v183;
  uint64_t v187 = 0LL;
  uint64_t v188 = type metadata accessor for Logger(0LL);
  uint64_t v189 = *(void *)(v188 - 8);
  uint64_t v193 = *(void *)(v189 + 64);
  unint64_t v190 = (v193 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v187);
  v191 = (char *)&v94 - v190;
  unint64_t v192 = (v193 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(v4);
  v194 = (char *)&v94 - v192;
  unint64_t v195 = (v193 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = __chkstk_darwin(v5);
  v196 = (char *)&v94 - v195;
  uint64_t v229 = v7;
  uint64_t v228 = v8;
  uint64_t v227 = v2;
  BOOL v199 = &v226;
  uint64_t v226 = 1LL;
  v197 = &v225;
  uint64_t v225 = v8;
  uint64_t updated = type metadata accessor for TVISAmbientPosterServiceSnapshotUpdateTrait(v6);
  sub_10001A094();
  if ((dispatch thunk of static Equatable.== infix(_:_:)(v199, v197) & 1) == 0)
  {
LABEL_14:
    uint64_t v150 = (id *)&v181[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_renderer];
    uint64_t v151 = &v224;
    swift_beginAccess();
    id v152 = *v150;
    id v34 = v152;
    swift_endAccess(v151);
    if (v152)
    {
      id v149 = v152;
      uint64_t v35 = v194;
      id v132 = v152;
      id v216 = v152;
      uint64_t v36 = sub_10000A1F8();
      uint64_t v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v189 + 16))(v35, v36, v188);
      char v147 = (os_log_s *)Logger.logObject.getter(v37);
      int v148 = static os_log_type_t.debug.getter();
      uint64_t v135 = &v214;
      uint64_t v214 = 12LL;
      unint64_t v133 = sub_100006D24();
      unint64_t v134 = sub_100006D8C();
      unint64_t v38 = sub_100006DF4();
      UnsignedInteger<>.init<A>(_:)(v135, &type metadata for UInt32, &type metadata for Int, v133, v134, v38);
      uint32_t v136 = v215;
      uint64_t v137 = 17LL;
      uint64_t v139 = 7LL;
      uint64_t v39 = swift_allocObject(&unk_1000216B8, 17LL, 7LL);
      uint64_t v40 = v137;
      uint64_t v41 = v139;
      uint64_t v141 = v39;
      *(_BYTE *)(v39 + 16) = 32;
      uint64_t v42 = swift_allocObject(&unk_1000216E0, v40, v41);
      uint64_t v43 = v139;
      uint64_t v142 = v42;
      *(_BYTE *)(v42 + 16) = 8;
      uint64_t v138 = 32LL;
      uint64_t v44 = swift_allocObject(&unk_100021708, 32LL, v43);
      uint64_t v45 = v138;
      uint64_t v46 = v139;
      uint64_t v140 = v44;
      *(void *)(v44 + 16) = sub_100015184;
      *(void *)(v44 + 24) = 0LL;
      uint64_t v47 = swift_allocObject(&unk_100021730, v45, v46);
      uint64_t v48 = v140;
      uint64_t v144 = v47;
      *(void *)(v47 + 16) = sub_10001A290;
      *(void *)(v47 + 24) = v48;
      uint64_t v146 = sub_100006E5C(&qword_100025B58);
      uint64_t v143 = _allocateUninitializedArray<A>(_:)(3LL, v146);
      v145 = v49;
      swift_retain(v141);
      uint64_t v50 = v142;
      uint64_t v51 = v141;
      int v52 = v145;
      void *v145 = sub_10001A21C;
      v52[1] = v51;
      swift_retain(v50);
      uint64_t v53 = v144;
      uint64_t v54 = v142;
      unint64_t v55 = v145;
      v145[2] = sub_10001A24C;
      v55[3] = v54;
      swift_retain(v53);
      uint64_t v56 = v143;
      uint64_t v57 = v144;
      uint32_t v58 = v145;
      v145[4] = sub_10001A2D8;
      v58[5] = v57;
      sub_100004A08();
      swift_bridgeObjectRelease(v56);
      if (os_log_type_enabled(v147, (os_log_type_t)v148))
      {
        uint64_t v59 = v182;
        uint64_t v125 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
        uint64_t v124 = sub_100006E5C(&qword_100025B60);
        uint64_t v126 = sub_100006EC8(0LL, v124, v124);
        uint64_t v127 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
        uint64_t v128 = &v213;
        v213 = v125;
        unint64_t v129 = &v212;
        uint64_t v212 = v126;
        uint64_t v130 = &v211;
        uint64_t v211 = v127;
        sub_100006F20(2LL, &v213);
        sub_100006F20(1LL, v128);
        uint64_t v209 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A21C;
        uint64_t v210 = v141;
        sub_100006F34(&v209, (uint64_t)v128, (uint64_t)v129, (uint64_t)v130);
        uint64_t v131 = v59;
        if (v59)
        {
          __break(1u);
        }

        else
        {
          uint64_t v209 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A24C;
          uint64_t v210 = v142;
          sub_100006F34(&v209, (uint64_t)&v213, (uint64_t)&v212, (uint64_t)&v211);
          uint64_t v123 = 0LL;
          uint64_t v209 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A2D8;
          uint64_t v210 = v144;
          sub_100006F34(&v209, (uint64_t)&v213, (uint64_t)&v212, (uint64_t)&v211);
          _os_log_impl((void *)&_mh_execute_header, v147, (os_log_type_t)v148, "%s", v125, v136);
          sub_100007088(v126, 0LL);
          sub_100007088(v127, 1LL);
          UnsafeMutablePointer.deallocate()();
          swift_release(v141);
          swift_release(v142);
          swift_release(v144);
        }
      }

      else
      {
        swift_release(v141);
        swift_release(v142);
        swift_release(v144);
      }

      (*(void (**)(char *, uint64_t))(v189 + 8))(v194, v188);
      uint64_t v60 = type metadata accessor for TaskPriority(0LL);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v60 - 8) + 56LL))(v184, 1LL);
      uint64_t v120 = 7LL;
      uint64_t v121 = swift_allocObject(&unk_100021410, 24LL, 7LL);
      uint64_t v119 = v121 + 16;
      uint64_t v61 = v181;
      swift_unknownObjectWeakInit(v119, v181);

      swift_retain(v121);
      id v62 = v132;
      uint64_t v63 = swift_allocObject(&unk_100021758, 48LL, v120);
      id v64 = v132;
      uint64_t v65 = (void *)v63;
      uint64_t v66 = v121;
      uint64_t v122 = v65;
      v65[2] = 0LL;
      v65[3] = 0LL;
      v65[4] = v66;
      v65[5] = v64;
      swift_release(v66);
      uint64_t v67 = sub_100006E5C(&qword_100026158);
      uint64_t v68 = sub_100011CB4(v184, (uint64_t)&unk_100026150, (uint64_t)v122, v67);
      swift_release(v68);
    }

    else
    {
      uint64_t v69 = v191;
      uint64_t v70 = sub_10000A1F8();
      uint64_t v71 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v189 + 16))(v69, v70, v188);
      uint64_t v117 = (os_log_s *)Logger.logObject.getter(v71);
      int v118 = static os_log_type_t.debug.getter();
      id v105 = &v222;
      uint64_t v222 = 12LL;
      unint64_t v103 = sub_100006D24();
      unint64_t v104 = sub_100006D8C();
      unint64_t v72 = sub_100006DF4();
      UnsignedInteger<>.init<A>(_:)(v105, &type metadata for UInt32, &type metadata for Int, v103, v104, v72);
      uint32_t v106 = v223;
      uint64_t v107 = 17LL;
      uint64_t v109 = 7LL;
      uint64_t v73 = swift_allocObject(&unk_100021618, 17LL, 7LL);
      uint64_t v74 = v107;
      uint64_t v75 = v109;
      uint64_t v111 = v73;
      *(_BYTE *)(v73 + 16) = 32;
      uint64_t v76 = swift_allocObject(&unk_100021640, v74, v75);
      uint64_t v77 = v109;
      uint64_t v112 = v76;
      *(_BYTE *)(v76 + 16) = 8;
      uint64_t v108 = 32LL;
      uint64_t v78 = swift_allocObject(&unk_100021668, 32LL, v77);
      uint64_t v79 = v108;
      uint64_t v80 = v109;
      uint64_t v110 = v78;
      *(void *)(v78 + 16) = sub_100015158;
      *(void *)(v78 + 24) = 0LL;
      uint64_t v81 = swift_allocObject(&unk_100021690, v79, v80);
      uint64_t v82 = v110;
      uint64_t v114 = v81;
      *(void *)(v81 + 16) = sub_10001A1A0;
      *(void *)(v81 + 24) = v82;
      uint64_t v116 = sub_100006E5C(&qword_100025B58);
      uint64_t v113 = _allocateUninitializedArray<A>(_:)(3LL, v116);
      uint64_t v115 = v83;
      swift_retain(v111);
      uint64_t v84 = v112;
      uint64_t v85 = v111;
      uint64_t v86 = v115;
      void *v115 = sub_10001A12C;
      v86[1] = v85;
      swift_retain(v84);
      uint64_t v87 = v114;
      uint64_t v88 = v112;
      id v89 = v115;
      v115[2] = sub_10001A15C;
      v89[3] = v88;
      swift_retain(v87);
      uint64_t v90 = v113;
      uint64_t v91 = v114;
      unint64_t v92 = v115;
      v115[4] = sub_10001A1E8;
      v92[5] = v91;
      sub_100004A08();
      swift_bridgeObjectRelease(v90);
      if (os_log_type_enabled(v117, (os_log_type_t)v118))
      {
        uint64_t v93 = v182;
        uint64_t v96 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
        uint64_t v95 = sub_100006E5C(&qword_100025B60);
        uint64_t v97 = sub_100006EC8(0LL, v95, v95);
        uint64_t v98 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
        uint64_t v99 = &v221;
        uint64_t v221 = v96;
        uint64_t v100 = &v220;
        uint64_t v220 = v97;
        double v101 = &v219;
        uint64_t v219 = v98;
        sub_100006F20(2LL, &v221);
        sub_100006F20(1LL, v99);
        uint64_t v217 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A12C;
        uint64_t v218 = v111;
        sub_100006F34(&v217, (uint64_t)v99, (uint64_t)v100, (uint64_t)v101);
        uint64_t v102 = v93;
        if (v93)
        {
          __break(1u);
        }

        else
        {
          uint64_t v217 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A15C;
          uint64_t v218 = v112;
          sub_100006F34(&v217, (uint64_t)&v221, (uint64_t)&v220, (uint64_t)&v219);
          uint64_t v94 = 0LL;
          uint64_t v217 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A1E8;
          uint64_t v218 = v114;
          sub_100006F34(&v217, (uint64_t)&v221, (uint64_t)&v220, (uint64_t)&v219);
          _os_log_impl((void *)&_mh_execute_header, v117, (os_log_type_t)v118, "%s - skipped; not rendering", v96, v106);
          sub_100007088(v97, 0LL);
          sub_100007088(v98, 1LL);
          UnsafeMutablePointer.deallocate()();
          swift_release(v111);
          swift_release(v112);
          swift_release(v114);
        }
      }

      else
      {
        swift_release(v111);
        swift_release(v112);
        swift_release(v114);
      }

      (*(void (**)(char *, uint64_t))(v189 + 8))(v191, v188);
    }

    return;
  }

  uint64_t v178 = (uint64_t *)&v181[OBJC_IVAR____TtC12MemoryPoster15PosterPresenter_state];
  uint64_t v179 = &v208;
  swift_beginAccess();
  sub_1000198B4(v178, v207);
  swift_endAccess(v179);
  uint64_t v180 = v207[0];
  if (v207[0] && v180 == 1)
  {
    sub_100019470(v207);
    goto LABEL_14;
  }

  uint64_t v9 = v196;
  sub_100019470(v207);
  uint64_t v10 = sub_10000A1F8();
  uint64_t v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v189 + 16))(v9, v10, v188);
  uint64_t v176 = (os_log_s *)Logger.logObject.getter(v11);
  int v177 = static os_log_type_t.debug.getter();
  v164 = &v205;
  uint64_t v205 = 12LL;
  unint64_t v162 = sub_100006D24();
  unint64_t v163 = sub_100006D8C();
  unint64_t v12 = sub_100006DF4();
  UnsignedInteger<>.init<A>(_:)(v164, &type metadata for UInt32, &type metadata for Int, v162, v163, v12);
  uint32_t v165 = v206;
  uint64_t v166 = 17LL;
  uint64_t v168 = 7LL;
  uint64_t v13 = swift_allocObject(&unk_100021780, 17LL, 7LL);
  uint64_t v14 = v166;
  uint64_t v15 = v168;
  uint64_t v170 = v13;
  *(_BYTE *)(v13 + 16) = 32;
  uint64_t v16 = swift_allocObject(&unk_1000217A8, v14, v15);
  uint64_t v17 = v168;
  uint64_t v171 = v16;
  *(_BYTE *)(v16 + 16) = 8;
  uint64_t v167 = 32LL;
  uint64_t v18 = swift_allocObject(&unk_1000217D0, 32LL, v17);
  uint64_t v19 = v167;
  uint64_t v20 = v168;
  uint64_t v169 = v18;
  *(void *)(v18 + 16) = sub_10001512C;
  *(void *)(v18 + 24) = 0LL;
  uint64_t v21 = swift_allocObject(&unk_1000217F8, v19, v20);
  uint64_t v22 = v169;
  uint64_t v173 = v21;
  *(void *)(v21 + 16) = sub_10001A4D0;
  *(void *)(v21 + 24) = v22;
  uint64_t v175 = sub_100006E5C(&qword_100025B58);
  uint64_t v172 = _allocateUninitializedArray<A>(_:)(3LL, v175);
  uint64_t v174 = v23;
  swift_retain(v170);
  uint64_t v24 = v171;
  uint64_t v25 = v170;
  uint64_t v26 = v174;
  *uint64_t v174 = sub_10001A45C;
  v26[1] = v25;
  swift_retain(v24);
  uint64_t v27 = v173;
  uint64_t v28 = v171;
  uint64_t v29 = v174;
  v174[2] = sub_10001A48C;
  v29[3] = v28;
  swift_retain(v27);
  uint64_t v30 = v172;
  uint64_t v31 = v173;
  uint64_t v32 = v174;
  v174[4] = sub_10001A518;
  v32[5] = v31;
  sub_100004A08();
  swift_bridgeObjectRelease(v30);
  if (os_log_type_enabled(v176, (os_log_type_t)v177))
  {
    uint64_t v33 = v182;
    uint64_t v155 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v154 = sub_100006E5C(&qword_100025B60);
    uint64_t v156 = sub_100006EC8(0LL, v154, v154);
    uint64_t v157 = sub_100006EC8(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v158 = &v204;
    v204 = v155;
    uint64_t v159 = &v203;
    uint64_t v203 = v156;
    v160 = &v202;
    uint64_t v202 = v157;
    sub_100006F20(2LL, &v204);
    sub_100006F20(1LL, v158);
    id v200 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A45C;
    uint64_t v201 = v170;
    sub_100006F34(&v200, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160);
    uint64_t v161 = v33;
    if (v33)
    {
      __break(1u);
    }

    else
    {
      id v200 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A48C;
      uint64_t v201 = v171;
      sub_100006F34(&v200, (uint64_t)&v204, (uint64_t)&v203, (uint64_t)&v202);
      uint64_t v153 = 0LL;
      id v200 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001A518;
      uint64_t v201 = v173;
      sub_100006F34(&v200, (uint64_t)&v204, (uint64_t)&v203, (uint64_t)&v202);
      _os_log_impl( (void *)&_mh_execute_header,  v176,  (os_log_type_t)v177,  "%s - skipped; current snapshot is valid",
        v155,
        v165);
      sub_100007088(v156, 0LL);
      sub_100007088(v157, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v170);
      swift_release(v171);
      swift_release(v173);
    }
  }

  else
  {
    swift_release(v170);
    swift_release(v171);
    swift_release(v173);
  }

  (*(void (**)(char *, uint64_t))(v189 + 8))(v196, v188);
}

uint64_t sub_10001512C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "service(_:didUpdateSnapshotWithTraits:)",  0x27uLL,  1)._countAndFlagsBits;
}

uint64_t sub_100015158()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "service(_:didUpdateSnapshotWithTraits:)",  0x27uLL,  1)._countAndFlagsBits;
}

uint64_t sub_100015184()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "service(_:didUpdateSnapshotWithTraits:)",  0x27uLL,  1)._countAndFlagsBits;
}

uint64_t sub_1000151B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a5;
  v5[16] = a4;
  v5[15] = a1;
  v5[11] = v5;
  v5[12] = 0LL;
  v5[13] = 0LL;
  v5[12] = a4 + 16;
  v5[13] = a5;
  return swift_task_switch(sub_1000151FC, 0LL);
}

uint64_t sub_1000151FC()
{
  uint64_t v13 = v0[16];
  v0[11] = v0;
  swift_beginAccess(v13 + 16, v0 + 2, 32LL, 0LL);
  v0[14] = swift_unknownObjectWeakLoadStrong(v13 + 16);
  if (v0[14])
  {
    uint64_t v8 = *(void **)(v12 + 136);
    uint64_t v7 = *(void **)(v12 + 112);
    *(void *)(v12 + 144) = v7;
    id v2 = v7;
    sub_10001B218((id *)(v12 + 112));
    swift_endAccess(v12 + 16);
    id v9 = [v8 environment];
    swift_getObjectType(v9);
    unsigned __int8 v10 = [v9 isPreview];
    swift_unknownObjectRelease(v9);
    if ((v10 & 1) != 0)
    {
      swift_beginAccess(&TVISAmbientSnapshotQueryIntentSwitcher, v12 + 64, 32LL, 0LL);
      uint64_t v5 = TVISAmbientSnapshotQueryIntentSwitcher;
      swift_endAccess(v12 + 64);
      uint64_t v6 = v5;
    }

    else
    {
      swift_beginAccess(&TVISAmbientSnapshotQueryIntentFullscreen, v12 + 40, 32LL, 0LL);
      uint64_t v4 = TVISAmbientSnapshotQueryIntentFullscreen;
      swift_endAccess(v12 + 40);
      uint64_t v6 = v4;
    }

    uint64_t v3 = (void *)swift_task_alloc(dword_100025FF4);
    *(void *)(v12 + 152) = v3;
    *uint64_t v3 = *(void *)(v12 + 88);
    v3[1] = sub_10001545C;
    return sub_10000A5CC(v6);
  }

  else
  {
    uint64_t v11 = *(_BYTE **)(v12 + 120);
    sub_10001B218((id *)(v12 + 112));
    swift_endAccess(v12 + 16);
    _BYTE *v11 = 1;
    return (*(uint64_t (**)(void))(*(void *)(v12 + 88) + 8LL))();
  }

uint64_t sub_10001545C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152LL);
  uint64_t v3 = *(void **)(*(void *)v0 + 144LL);
  *(void *)(*(void *)v0 + 88LL) = *(void *)v0;
  swift_task_dealloc(v1);

  return swift_task_switch(sub_1000154D8, 0LL);
}

uint64_t sub_1000154D8()
{
  uint64_t v1 = *(_BYTE **)(v0 + 120);
  *(void *)(v0 + 88) = v0;
  _BYTE *v1 = 0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 88) + 8LL))();
}

uint64_t sub_100015570(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1000155A0(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v6 = (a3 + 1);
  }

  else
  {
    int v8 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v6 = (v8 | (a3 >> 6)) + 33217;
    }

    else
    {
      int v7 = (v8 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v6 = (v7 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v6 = ((a3 >> 18) | ((v7 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }

  uint64_t v5 = 4 - ((uint64_t)__clz(v6) >> 3);
  uint64_t v9 = (v6 - 0x101010101010101LL) & ((1LL << ((8 * v5) & 0x3F)) - 1);
  if (v5 >= 0) {
    return a1(&v9, v5);
  }
  _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeBufferPointer with negative count",  39LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  1343LL,  0);
  __break(1u);
LABEL_12:
  LOBYTE(v4) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  v4,  3455LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1000158E4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v19 = a9;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  unint64_t v22 = a3;
  uint64_t v23 = a4;
  unint64_t v24 = a6;
  uint64_t v25 = a7;
  int v26 = a8;
  unint64_t v27 = a10;
  unint64_t v28 = a11;
  uint64_t v29 = "Fatal error";
  uint64_t v30 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v31 = "Swift/StaticString.swift";
  uint64_t v32 = "Not enough bits to represent the passed value";
  uint64_t v33 = "Swift/Integers.swift";
  id v34 = "UnsafeBufferPointer with negative count";
  uint64_t v35 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v36 = 0LL;
  unint64_t v38 = a6;
  uint64_t v39 = a7;
  char v40 = a8;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  unint64_t v43 = a10;
  unint64_t v44 = a11;
  if ((a5 & 1) != 0)
  {
    if (v22 <= 0xFFFFFFFF)
    {
      unsigned int v18 = v22;
      if ((v22 < 0xD800 || v18 > 0xDFFF) && v18 <= 0x10FFFF)
      {
        uint64_t v17 = &v16;
        __chkstk_darwin();
        uint64_t v14 = sub_10001B16C;
        uint64_t v15 = &v37;
        sub_1000155A0((uint64_t (*)(uint64_t *, uint64_t))sub_10001B1AC, (uint64_t)&v13, v11);
        return (uint64_t)v17;
      }

      LOBYTE(v13) = 2;
      _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v30, 57LL, 2LL, v31, 24LL, v13, 148LL, 0);
      __break(1u);
    }

    LOBYTE(v13) = 2;
    _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v32, 45LL, 2LL, v33, 20LL, v13, 3455LL, 0);
    __break(1u);
  }

  if (v22) {
    uint64_t v45 = v22;
  }
  else {
    uint64_t v45 = 0LL;
  }
  uint64_t v16 = v45;
  if (!v45)
  {
    LOBYTE(v13) = 2;
    _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v30, 57LL, 2LL, v31, 24LL, v13, 136LL, 0);
    __break(1u);
  }

  if (v23 >= 0) {
    return sub_100015CA8(v16, v23, v24, v25, v26, v20, v21, v27, v19, v28);
  }
  LOBYTE(v13) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v29, 11LL, 2LL, v34, 39LL, 2LL, v35, 31LL, v13, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_100015CA8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v19 = a9;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  unint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  unint64_t v26 = a8;
  unint64_t v27 = a10;
  unint64_t v28 = "Fatal error";
  uint64_t v29 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v30 = "Swift/StaticString.swift";
  uint64_t v31 = "Not enough bits to represent the passed value";
  uint64_t v32 = "Swift/Integers.swift";
  uint64_t v33 = "UnsafeBufferPointer with negative count";
  id v34 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v35 = 0LL;
  uint64_t v37 = a6;
  uint64_t v38 = a7;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  unint64_t v41 = a8;
  unint64_t v42 = a10;
  if ((a5 & 1) != 0)
  {
    if (v22 <= 0xFFFFFFFF)
    {
      unsigned int v18 = v22;
      if ((v22 < 0xD800 || v18 > 0xDFFF) && v18 <= 0x10FFFF)
      {
        uint64_t v17 = &v15;
        __chkstk_darwin();
        int v13 = sub_10001B1D4;
        uint64_t v14 = &v36;
        sub_1000155A0((uint64_t (*)(uint64_t *, uint64_t))sub_10001B1F0, (uint64_t)&v12, v10);
        return (uint64_t)v17;
      }

      LOBYTE(v12) = 2;
      _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 57LL, 2LL, v30, 24LL, v12, 148LL, 0);
      __break(1u);
    }

    LOBYTE(v12) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 45LL, 2LL, v32, 20LL, v12, 3455LL, 0);
    __break(1u);
  }

  if (v22) {
    uint64_t v43 = v22;
  }
  else {
    uint64_t v43 = 0LL;
  }
  uint64_t v16 = v43;
  if (!v43)
  {
    LOBYTE(v12) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 57LL, 2LL, v30, 24LL, v12, 136LL, 0);
    __break(1u);
  }

  if (v23 >= 0) {
    return sub_10001603C(v16, v23, v24, v25, v20, v21, v26, v27);
  }
  LOBYTE(v12) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v28, 11LL, 2LL, v33, 39LL, 2LL, v34, 31LL, v12, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001603C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  unint64_t v26 = a7;
  unint64_t v27 = a8;
  unint64_t v28 = "Fatal error";
  uint64_t v29 = "Not enough bits to represent the passed value";
  uint64_t v30 = "Swift/Integers.swift";
  uint64_t v31 = "Not enough bits to represent a signed value";
  uint64_t v32 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v33 = "Swift/AssertCommon.swift";
  if (a3)
  {
    uint64_t v19 = v22;
  }

  else
  {
    LOBYTE(v9) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 230LL, 0);
    __break(1u);
  }

  uint64_t v18 = v19;
  if (v23 >= (uint64_t)0xFFFFFFFF80000000LL)
  {
    if (v23 <= 0x7FFFFFFF)
    {
      unsigned int v17 = v23;
      if (v24)
      {
        uint64_t v16 = v24;
      }

      else
      {
        LOBYTE(v9) = 2;
        _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 231LL, 0);
        __break(1u);
      }

      uint64_t v15 = v16;
      if (v25 >= (uint64_t)0xFFFFFFFF80000000LL)
      {
        if (v25 <= 0x7FFFFFFF)
        {
          unsigned int v14 = v25;
          if (v20)
          {
            uint64_t v13 = v20;
          }

          else
          {
            LOBYTE(v9) = 2;
            _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 232LL, 0);
            __break(1u);
          }

          uint64_t v12 = v13;
          if (v21 >= (uint64_t)0xFFFFFFFF80000000LL)
          {
            if (v21 <= 0x7FFFFFFF)
            {
              unsigned int v11 = v21;
              if (v26 <= 0xFFFFFFFF)
              {
                unsigned int v10 = v26;
                if (v27 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile(v18, v17, v15, v14, v12, v11, v10, v27, 0);
                }
                LOBYTE(v9) = 2;
                _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3455LL, 0);
                __break(1u);
              }

              LOBYTE(v9) = 2;
              _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3455LL, 0);
              __break(1u);
            }

            LOBYTE(v9) = 2;
            _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
            __break(1u);
          }

          LOBYTE(v9) = 2;
          _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
          __break(1u);
        }

        LOBYTE(v9) = 2;
        _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
        __break(1u);
      }

      LOBYTE(v9) = 2;
      _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
      __break(1u);
    }

    LOBYTE(v9) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
    __break(1u);
  }

  LOBYTE(v9) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
  __break(1u);
  return result;
}

void *sub_100016584(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  int v4 = (void *)_swift_stdlib_bridgeErrorToNSError(v1);
  id v2 = v4;
  swift_unknownObjectRelease(v4);
  return v4;
}

uint64_t sub_1000165C4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000165E4(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100016668;
  return v5(a1);
}

uint64_t sub_100016668()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000166CC(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_1000166EC(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  uint64_t v10 = v5;
  uint64_t v6 = sub_100016768(v4, v5, a3);
  uint64_t v11 = *a1;
  uint64_t v7 = *a1 + 8LL;
  uint64_t v13 = v6;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v11, v7);
  swift_bridgeObjectRelease(v10);
  uint64_t result = a1;
  *a1 = v11 + 8;
  return result;
}

uint64_t sub_100016768(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_1000168D8((uint64_t)&v17, 0LL, 0LL, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType(v14);
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_10001B4FC((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }

    sub_10001B494(v12);
  }

  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_10001B4FC((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }

    swift_bridgeObjectRetain(a2);
    sub_10001B494(v13);
  }

  return v11;
}

uint64_t sub_1000168D8(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v25 = a6;
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }

      else
      {
        int64_t v16 = 0LL;
      }

      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v22[0] = a5;
          v22[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_100016C4C(v22, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter(0LL, v15, a2, a3);
          *uint64_t v17 = a2;
          uint64_t v11 = 0LL;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v22[2] = v11;
          v22[3] = v12;
          char v23 = v13 & 1;
          char v24 = v14 & 1;
          return (uint64_t)v11;
        }

        goto LABEL_28;
      }
    }

LABEL_13:
    uint64_t v6 = sub_100016C88(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0LL)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }

    __break(1u);
  }

  uint64_t result = _StringObject.sharedUTF8.getter(a5, a6);
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0LL;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }

  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }

  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_100016C4C(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_100016C88(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_100016D38(a1, a2);
  sub_100016EB0();
  uint64_t v4 = v6[2];
  sub_100016F24(v4);
  sub_100016FA4(v4, 0);
  sub_100017010();
  swift_retain(v6);
  uint64_t v5 = sub_10001701C((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1LL)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_100016D38(uint64_t a1, uint64_t a2)
{
  v10[2] = a2;
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }

  else if ((a2 & 0x2000000000000000LL) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }

  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }

  if (!v7) {
    return sub_100017198();
  }
  uint64_t v5 = sub_100017030(v7, 0LL);
  swift_retain(v5);
  swift_release(v5);
  uint64_t result = (void *)_StringGuts.copyUTF8(into:)(v5 + 4, v7, a1, a2);
  uint64_t v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRetain(0xE000000000000000LL);
    uint64_t result = v10;
    v10[0] = 0LL;
    v10[1] = 0xE000000000000000LL;
    sub_10001B570((uint64_t)v10);
    if (v6 == (void *)v7) {
      return v5;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_100016EB0()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_10001701C(*v3);
    uint64_t result = sub_1000171C4(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }

  return result;
}

uint64_t sub_100016F24(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24LL) >> 1 < result + 1)
  {
    uint64_t result = sub_1000171C4(*(void *)(*(void *)v1 + 24LL) >> 1 != 0LL, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }

  return result;
}

uint64_t sub_100016FA4(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release(v4);
  uint64_t v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release(v6);
}

void sub_100017010()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_10001701C(uint64_t a1)
{
  return sub_1000174C0(a1);
}

void *sub_100017030(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    uint64_t v2 = sub_100006E5C(&qword_1000262C8);
    uint64_t v6 = (void *)swift_allocObject(v2, v7 + 32, 7LL);
    if ((sub_10001B540() & 1) != 0)
    {
      size_t v4 = (size_t)v6 + sub_10001B54C(v6);
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }

    else
    {
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * v7;
    }

    swift_release(v6);
    return v6;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    return &_swiftEmptyArrayStorage;
  }

void *sub_100017198()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_1000171C4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result = swift_retain(a4);
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2LL) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }

      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }

    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    uint64_t v5 = sub_100006E5C(&qword_1000262C8);
    uint64_t v8 = (void *)swift_allocObject(v5, v9 + 32, 7LL);
    if ((sub_10001B540() & 1) != 0)
    {
      size_t v6 = (size_t)v8 + sub_10001B54C(v8);
      swift_retain(v8);
      v8[2] = v10;
      v8[3] = 2 * (v6 - (void)(v8 + 4));
    }

    else
    {
      swift_retain(v8);
      v8[2] = v10;
      v8[3] = 2 * v9;
    }

    swift_release(v8);
    uint64_t v7 = (char *)v8;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }

  if ((a1 & 1) != 0)
  {
    swift_release(a4);
    swift_bridgeObjectRelease(a4);
    sub_1000174FC((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0LL;
    swift_release(a4);
  }

  else
  {
    swift_bridgeObjectRelease(a4);
    swift_release(a4);
    swift_retain(a4);
    swift_release(a4);
    sub_1000174C8((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease(a4);
  }

  return (uint64_t)v7;
}

uint64_t sub_1000174C0(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_1000174C8(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_1000174FC(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

_BYTE **sub_1000175AC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1000175C0()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_1000175E8(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000175F0()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100017618(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100017620()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10001765C()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100017668()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_1000176A4(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_1000176B0()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_1000176F4(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100026004);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100017798;
  return sub_10000B5C4(a1, v5, v6, v7, v8);
}

uint64_t sub_100017798()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000177F8()
{
  return swift_deallocObject(v1, 24LL);
}

uint64_t sub_100017834()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_10000DD08();
  return result;
}

uint64_t sub_10001783C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100017864(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001786C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100017894(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001789C()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_1000178D8()
{
  return sub_100016584(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000178E4()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100017920()
{
  return sub_1000165C4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10001792C(uint64_t (*a1)(void))
{
  return a1();
}

void sub_10001794C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v7 = (id)a4();
  uint64_t v8 = *a1;
  uint64_t v9 = *a1 + 8;
  if (v7)
  {
    id v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v8, v9);
  }

  else
  {
    uint64_t v11 = 0LL;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8, v9);
  }

  *a1 = v8 + 8;
  size_t v4 = *a2;
  if (*a2)
  {
    *size_t v4 = v7;
    *a2 = v4 + 1;
  }

  else
  {
  }

uint64_t sub_100017A88()
{
  return swift_deallocObject(v2, 32LL);
}

void sub_100017AC4(uint64_t *a1, void **a2, uint64_t a3)
{
}

uint64_t sub_100017AD0()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100017AF8(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100017B00()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100017B28(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100017B30()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100017B6C()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100017B78()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100017BB4(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100017BC0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100017BEC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

void *sub_100017C18(const void *a1, void *a2)
{
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100017C80( id *a1)
{
}

void *sub_100017CA8(void *a1)
{
  if (a1[3]) {
    sub_100017CE8(a1);
  }
  return a1;
}

uint64_t sub_100017CE8(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

void *sub_100017D50(void *a1, void *a2)
{
  if (a1[3])
  {
    uint64_t v2 = a1[3];
    a2[3] = v2;
    a2[4] = a1[4];
    (**(void (***)(void))(v2 - 8))();
  }

  else
  {
    memcpy(a2, a1, 0x28uLL);
  }

  return a2;
}

uint64_t *sub_100017DCC(void *a1, uint64_t *a2)
{
  if ((unint64_t)*a2 < 2)
  {
    memcpy(a2, a1, 0x30uLL);
  }

  else if (*a1 < 2uLL)
  {
    sub_100017FB4(a2);
    memcpy(a2, a1, 0x30uLL);
  }

  else
  {
    uint64_t v2 = *a2;
    *a2 = *a1;
    swift_unknownObjectRelease(v2);
    __dst = a2 + 1;
    if (a2[4]) {
      sub_100017CE8(__dst);
    }
    memcpy(__dst, a1 + 1, 0x28uLL);
  }

  return a2;
}

void *sub_100017FB4(void *a1)
{
  if (a1[4]) {
    sub_100017CE8(a1 + 1);
  }
  return a1;
}

uint64_t sub_100018004(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void *sub_100018050(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80LL);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16LL) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t sub_1000180A4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1000180D0()
{
  return swift_deallocObject(v2, 24LL);
}

void *sub_10001810C()
{
  return sub_10000E3F8(*(void **)(v0 + 16));
}

uint64_t sub_100018114()
{
  return swift_deallocObject(v2, 24LL);
}

id sub_100018150()
{
  return sub_10000E41C(*(void **)(v0 + 16));
}

uint64_t sub_100018158()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100018180(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100018188()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_1000181B0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000181B8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000181F4()
{
  return sub_10001792C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100018200()
{
  return swift_deallocObject(v2, 32LL);
}

void sub_10001823C(uint64_t *a1, void **a2, uint64_t a3)
{
}

uint64_t sub_100018248()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100018270(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100018278()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_1000182A0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000182A8()
{
  return swift_deallocObject(v2, 32LL);
}

void sub_1000182E4(uint64_t *a1, void **a2, uint64_t a3)
{
}

void *sub_1000182F0(const void *a1, void *a2)
{
  return a2;
}

uint64_t sub_100018358(uint64_t a1)
{
  if (*(void *)a1)
  {

    sub_100017CE8((void *)(a1 + 8));
  }

  return a1;
}

uint64_t sub_1000183A8(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  *(void *)a2 = *(void *)a1;
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(a1 + 8);
  return result;
}

uint64_t sub_1000183C4()
{
  return swift_deallocObject(v2, 24LL);
}

void *sub_100018400()
{
  return sub_10000E3D4(*(void **)(v0 + 16));
}

uint64_t sub_100018408()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100018430(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100018438()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100018460(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100018468()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000184A4()
{
  return sub_10001792C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000184B0()
{
  return swift_deallocObject(v2, 32LL);
}

void sub_1000184EC(uint64_t *a1, void **a2, uint64_t a3)
{
}

void *sub_1000184F8(void *a1, void *a2)
{
  uint64_t v40 = *a1;
  swift_unknownObjectRetain(*a1);
  uint64_t v2 = a1[1];
  *a2 = v40;
  a2[1] = v2;
  uint64_t v41 = a1[2];
  swift_retain(v41);
  a2[2] = v41;
  swift_unknownObjectWeakCopyInit(a2 + 3, a1 + 3);
  a2[4] = a1[4];
  uint64_t v42 = a1[5];
  swift_retain(v42);
  a2[5] = v42;
  uint64_t v43 = a1[6];
  swift_retain(v43);
  a2[6] = v43;
  uint64_t v51 = (int *)type metadata accessor for MemoryScreenSaverView();
  uint64_t v44 = v51[7];
  uint64_t v46 = *(void (**)(void))(*(void *)(type metadata accessor for UUID(0LL) - 8) + 16LL);
  v46();
  uint64_t v47 = sub_100006E5C(&qword_100026078);
  uint64_t v49 = *(int *)(v47 + 28);
  uint64_t v50 = *(void *)((char *)a1 + v44 + v49);
  swift_retain(v50);
  *(void *)((char *)a2 + v44 + v49) = v50;
  uint64_t v52 = v51[8];
  if (*(void *)((char *)a1 + v52 + 24))
  {
    uint64_t v3 = *(void *)((char *)a1 + v52 + 24);
    size_t v4 = (char *)a2 + v52;
    *((void *)v4 + 3) = v3;
    *((void *)v4 + 4) = *(void *)((char *)a1 + v52 + 32);
    (**(void (***)(void))(v3 - 8))();
  }

  else
  {
    memcpy((char *)a2 + v52, (char *)a1 + v52, 0x28uLL);
  }

  uint64_t v29 = *(void *)((char *)a1 + v52 + 40);
  swift_retain(v29);
  *(void *)((char *)a2 + v52 + 40) = v29;
  uint64_t v32 = (void *)((char *)a2 + v51[9]);
  uint64_t v31 = (void *)((char *)a1 + v51[9]);
  uint64_t v30 = *v31;
  swift_retain(*v31);
  *uint64_t v32 = v30;
  uint64_t v33 = v31[1];
  swift_retain(v33);
  v32[1] = v33;
  char v36 = (char *)a2 + v51[10];
  id v34 = (char *)a1 + v51[10];
  v46();
  uint64_t v35 = *(int *)(v47 + 28);
  uint64_t v37 = *(void *)&v34[v35];
  swift_retain(v37);
  *(void *)&v36[v35] = v37;
  uint64_t v38 = (void *)((char *)a2 + v51[11]);
  uint64_t v39 = (void *)((char *)a1 + v51[11]);
  if (v39[3])
  {
    uint64_t v5 = v39[3];
    v38[3] = v5;
    v38[4] = v39[4];
    (**(void (***)(void))(v5 - 8))();
  }

  else
  {
    memcpy(v38, v39, 0x28uLL);
  }

  uint64_t v22 = v39[5];
  swift_retain(v22);
  void v38[5] = v22;
  uint64_t v6 = v51[12];
  char v23 = (char *)a2 + v6;
  *((_BYTE *)a2 + v6) = *((_BYTE *)a1 + v6);
  uint64_t v24 = *(void *)((char *)a1 + v6 + 8);
  swift_retain(v24);
  *((void *)v23 + 1) = v24;
  uint64_t v7 = v51[13];
  uint64_t v25 = (char *)a2 + v7;
  *((_BYTE *)a2 + v7) = *((_BYTE *)a1 + v7);
  uint64_t v26 = *(void *)((char *)a1 + v7 + 8);
  swift_retain(v26);
  *((void *)v25 + 1) = v26;
  __dst = (void *)((char *)a2 + v51[14]);
  __src = (void *)((char *)a1 + v51[14]);
  if (__src[3])
  {
    uint64_t v8 = __src[3];
    __dst[3] = v8;
    __dst[4] = __src[4];
    (**(void (***)(void))(v8 - 8))();
  }

  else
  {
    memcpy(__dst, __src, 0x28uLL);
  }

  uint64_t v19 = __src[5];
  swift_retain(v19);
  __dst[5] = v19;
  uint64_t v20 = (void *)((char *)a2 + v51[15]);
  uint64_t v21 = (void *)((char *)a1 + v51[15]);
  if (v21[3])
  {
    uint64_t v9 = v21[3];
    v20[3] = v9;
    v20[4] = v21[4];
    (**(void (***)(void))(v9 - 8))();
  }

  else
  {
    memcpy(v20, v21, 0x28uLL);
  }

  uint64_t v14 = v21[5];
  swift_retain(v14);
  v20[5] = v14;
  int64_t v15 = (char *)a2 + v51[16];
  uint64_t v16 = (char *)a1 + v51[16];
  uint64_t v17 = type metadata accessor for Date(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v18 + 48))(v16, 1LL))
  {
    uint64_t v10 = sub_100006E5C(&qword_100026080);
    memcpy(v15, v16, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
  }

  uint64_t v12 = *(int *)(sub_100006E5C(&qword_100026088) + 28);
  uint64_t v13 = *(void *)&v16[v12];
  swift_retain(v13);
  uint64_t result = a2;
  *(void *)&v15[v12] = v13;
  *((_BYTE *)a2 + v51[17]) = *((_BYTE *)a1 + v51[17]);
  *((_BYTE *)a2 + v51[18]) = *((_BYTE *)a1 + v51[18]);
  return result;
}

void *sub_100018B54(void *a1)
{
  uint64_t v14 = (int *)type metadata accessor for MemoryScreenSaverView();
  uint64_t v11 = v14[7];
  uint64_t v12 = *(void (**)(void))(*(void *)(type metadata accessor for UUID(0LL) - 8) + 8LL);
  v12();
  uint64_t v13 = sub_100006E5C(&qword_100026078);
  swift_release(*(void *)((char *)a1 + v11 + *(int *)(v13 + 28)));
  uint64_t v16 = v14[8];
  swift_release(*(void *)((char *)a1 + v16 + 40));
  uint64_t v8 = (void *)((char *)a1 + v14[9]);
  swift_release(*v8);
  swift_release(v8[1]);
  uint64_t v9 = (char *)a1 + v14[10];
  v12();
  swift_release(*(void *)&v9[*(int *)(v13 + 28)]);
  uint64_t v10 = (void *)((char *)a1 + v14[11]);
  if (v10[3]) {
    sub_100017CE8(v10);
  }
  swift_release(v10[5]);
  swift_release(*(void *)((char *)a1 + v14[12] + 8));
  swift_release(*(void *)((char *)a1 + v14[13] + 8));
  uint64_t v7 = (void *)((char *)a1 + v14[14]);
  if (v7[3]) {
    sub_100017CE8(v7);
  }
  swift_release(v7[5]);
  uint64_t v6 = (void *)((char *)a1 + v14[15]);
  if (v6[3]) {
    sub_100017CE8(v6);
  }
  swift_release(v6[5]);
  uint64_t v3 = (char *)a1 + v14[16];
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v1 = sub_100006E5C(&qword_100026088);
  swift_release(*(void *)&v3[*(int *)(v1 + 28)]);
  return a1;
}

uint64_t sub_100018E34(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  *(void *)a2 = *(void *)a1;
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(a1 + 8);
  return result;
}

unint64_t sub_100018E50()
{
  uint64_t v3 = qword_100026090;
  if (!qword_100026090)
  {
    uint64_t v0 = type metadata accessor for PRRenderingMode(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E2D4, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100026090);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100018EC0()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100018EE8(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100018EF0()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100018F18(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100018F20()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100018F5C()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100018F68()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100018FA4(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100018FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100018FFC( void *a1)
{
}

unint64_t sub_100019020()
{
  uint64_t v3 = qword_1000260A0;
  if (!qword_1000260A0)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___TVISPhotoCollectionCollection);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000260A0);
    return ObjCClassMetadata;
  }

  return v3;
}

unint64_t sub_100019084()
{
  uint64_t v3 = qword_1000260B0;
  if (!qword_1000260B0)
  {
    uint64_t v0 = sub_100007014(&qword_1000260A8);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000260B0);
    return WitnessTable;
  }

  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000190F4( void *a1)
{
}

uint64_t sub_10001911C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_100019148()
{
  uint64_t v3 = qword_1000260B8;
  if (!qword_1000260B8)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___TVISPhotoCollectionAsset);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000260B8);
    return ObjCClassMetadata;
  }

  return v3;
}

void *sub_1000191AC(void *a1)
{
  id v4 = (id)a1[1];
  id v5 = (id)a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  swift_bridgeObjectRetain(*a1);
  id v1 = v4;
  id v2 = v5;
  swift_retain(v6);
  swift_retain(v7);
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100019218( void *a1)
{
  id v1 = (id)a1[1];
  id v2 = (id)a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  swift_bridgeObjectRelease(*a1);

  swift_release(v3);
  swift_release(v4);
}

uint64_t sub_100019284()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_1000192AC(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000192B4()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_1000192DC(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000192E4()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100019320()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10001932C()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100019368(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_100019374()
{
  uint64_t v3 = qword_1000260C8;
  if (!qword_1000260C8)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___UIView);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000260C8);
    return ObjCClassMetadata;
  }

  return v3;
}

unint64_t sub_1000193D8()
{
  uint64_t v3 = qword_1000260D8;
  if (!qword_1000260D8)
  {
    uint64_t v0 = sub_100007014(&qword_1000260D0);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000260D8);
    return WitnessTable;
  }

  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100019448( void *a1)
{
}

void *sub_100019470(void *a1)
{
  if (*a1 >= 2uLL)
  {
    swift_unknownObjectRelease(*a1);
    if (a1[4]) {
      sub_100017CE8(a1 + 1);
    }
  }

  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000194F8( id *a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100019520( void *a1)
{
}

uint64_t sub_100019548()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100019570(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100019578()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_1000195A0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000195A8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000195E4()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000195F0()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10001962C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100019638()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100019660(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100019668()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100019690(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100019698()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000196D4()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000196E0()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10001971C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100019728()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t sub_100019764()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_1000197B0(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_1000260EC);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100019854;
  return sub_1000108B4(a1, v5, v6, v7, v8);
}

uint64_t sub_100019854()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

void *sub_1000198B4(uint64_t *a1, void *a2)
{
  if ((unint64_t)*a1 < 2)
  {
    memcpy(a2, a1, 0x30uLL);
  }

  else
  {
    uint64_t v4 = *a1;
    swift_unknownObjectRetain();
    *a2 = v4;
    __dst = a2 + 1;
    __src = a1 + 1;
    if (a1[4])
    {
      uint64_t v2 = a1[4];
      a2[4] = v2;
      a2[5] = a1[5];
      (**(void (***)(void *, void *))(v2 - 8))(__dst, __src);
    }

    else
    {
      memcpy(__dst, __src, 0x28uLL);
    }
  }

  return a2;
}

void *sub_1000199B0(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t sub_1000199E8()
{
  return swift_deallocObject(v2, 80LL);
}

uint64_t sub_100019A34(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[9];
  uint64_t v3 = (void *)swift_task_alloc(dword_1000260FC);
  *(void *)(v2 + 2sub_100017CE8(v0 + 4) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100019AD0;
  return sub_100012200(a1, v5, v6, (uint64_t)(v1 + 4), v7);
}

uint64_t sub_100019AD0()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100019B30()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100019B58(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100019B60()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100019B88(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100019B90()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100019BCC()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100019BD8()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100019C14(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_100019C20()
{
  uint64_t v3 = qword_100026108;
  if (!qword_100026108)
  {
    uint64_t v0 = type metadata accessor for UITraitEnvironmentLayoutDirection(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E1CC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100026108);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100019C90()
{
  sub_100017CE8((void *)(v0 + 48));
  return swift_deallocObject(v2, 88LL);
}

uint64_t sub_100019CDC(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + 32);
  char v8 = *(_BYTE *)(v1 + 40);
  uint64_t v3 = (void *)swift_task_alloc(dword_100026114);
  *(void *)(v2 + 2sub_100017CE8(v0 + 4) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100019D88;
  return sub_100012ED4(a1, v5, v6, v7, v8 & 1, v1 + 48);
}

uint64_t sub_100019D88()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100019DE8()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100019E10(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100019E18()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100019E40(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100019E48()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100019E84()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100019E90()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100019ECC(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_100019ED8()
{
  uint64_t v3 = qword_100026120;
  if (!qword_100026120)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PREditingLook);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100026120);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_100019F3C()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_100019F88()
{
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  uint64_t v6 = (void *)v0[2];
  uint64_t v4 = (const void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_100026134);
  *(void *)(v1 + 2sub_100017CE8(v0 + 4) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10001A034;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_100026130 + dword_100026130))( v6,  v4,  v5);
}

uint64_t sub_10001A034()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

unint64_t sub_10001A094()
{
  uint64_t v3 = qword_100026140;
  if (!qword_100026140)
  {
    uint64_t updated = type metadata accessor for TVISAmbientPosterServiceSnapshotUpdateTrait(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001E1A0, updated);
    atomic_store(WitnessTable, (unint64_t *)&qword_100026140);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10001A104()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10001A12C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001A134()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10001A15C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001A164()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10001A1A0()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10001A1AC()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10001A1E8(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10001A1F4()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10001A21C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001A224()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10001A24C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001A254()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10001A290()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10001A29C()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10001A2D8(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10001A2E4()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10001A330(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_10002614C);
  *(void *)(v2 + 2sub_100017CE8(v0 + 4) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10001A3D4;
  return sub_1000151B0(a1, v5, v6, v7, v8);
}

uint64_t sub_10001A3D4()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10001A434()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10001A45C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001A464()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10001A48C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175AC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001A494()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10001A4D0()
{
  return sub_1000166CC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10001A4DC()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10001A518(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000166EC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t type metadata accessor for PosterPresenter()
{
  return objc_opt_self(&OBJC_CLASS____TtC12MemoryPoster15PosterPresenter);
}

uint64_t sub_10001A548(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  swift_retain(*a2);
  *a1 = v4;
  return *a1 + 16LL;
}

void *sub_10001A584(void *result)
{
  uint64_t v1 = result;
  if (*result >= 2uLL)
  {
    uint64_t result = (void *)swift_unknownObjectRelease(*result);
    if (v1[4]) {
      return (void *)sub_100017CE8(v1 + 1);
    }
  }

  return result;
}

void *sub_10001A608(void *a1, uint64_t *a2)
{
  if ((unint64_t)*a2 < 2)
  {
    memcpy(a1, a2, 0x30uLL);
  }

  else
  {
    uint64_t v4 = *a2;
    swift_unknownObjectRetain();
    *a1 = v4;
    __dst = a1 + 1;
    __src = a2 + 1;
    if (a2[4])
    {
      uint64_t v2 = a2[4];
      a1[4] = v2;
      a1[5] = a2[5];
      (**(void (***)(void *, void *))(v2 - 8))(__dst, __src);
    }

    else
    {
      memcpy(__dst, __src, 0x28uLL);
    }
  }

  return a1;
}

uint64_t *sub_10001A704(uint64_t *a1, void *a2)
{
  if ((unint64_t)*a1 < 2)
  {
    if (*a2 < 2uLL)
    {
      memcpy(a1, a2, 0x30uLL);
    }

    else
    {
      uint64_t v6 = *a2;
      swift_unknownObjectRetain(*a2);
      *a1 = v6;
      uint64_t v7 = a1 + 1;
      __src = a2 + 1;
      if (a2[4])
      {
        uint64_t v4 = a2[4];
        a1[4] = v4;
        a1[5] = a2[5];
        (**(void (***)(void *, void *))(v4 - 8))(v7, __src);
      }

      else
      {
        memcpy(v7, __src, 0x28uLL);
      }
    }
  }

  else if (*a2 < 2uLL)
  {
    sub_100017FB4(a1);
    memcpy(a1, a2, 0x30uLL);
  }

  else
  {
    uint64_t v9 = *a2;
    swift_unknownObjectRetain(*a2);
    uint64_t v2 = *a1;
    *a1 = v9;
    swift_unknownObjectRelease(v2);
    __dst = a1 + 1;
    uint64_t v11 = a2 + 1;
    if (a1[4])
    {
      if (a2[4])
      {
        sub_10001A980(__dst, v11);
      }

      else
      {
        sub_100017CE8(__dst);
        memcpy(__dst, v11, 0x28uLL);
      }
    }

    else if (a2[4])
    {
      uint64_t v3 = a2[4];
      a1[4] = v3;
      a1[5] = a2[5];
      (**(void (***)(void *, void *))(v3 - 8))(__dst, v11);
    }

    else
    {
      memcpy(__dst, v11, 0x28uLL);
    }
  }

  return a1;
}

void *sub_10001A980(void *result, void *a2)
{
  uint64_t v10 = result;
  if (result != a2)
  {
    uint64_t v8 = result[3];
    uint64_t v9 = a2[3];
    if (v8 == v9)
    {
      if ((*(_DWORD *)(*(void *)(v8 - 8) + 80LL) & 0x20000) != 0)
      {
        uint64_t v6 = *result;
        uint64_t v7 = *a2;
        swift_retain(*a2);
        uint64_t result = (void *)swift_release(v6);
        *uint64_t v10 = v7;
      }

      else
      {
        return (void *)(*(uint64_t (**)(void *, void *))(*(void *)(v8 - 8) + 24LL))(result, a2);
      }
    }

    else
    {
      result[3] = v9;
      result[4] = a2[4];
      BOOL v5 = (*(_DWORD *)(*(void *)(v9 - 8) + 80LL) & 0x20000) == 0;
      if ((*(_DWORD *)(*(void *)(v8 - 8) + 80LL) & 0x20000) != 0)
      {
        uint64_t v3 = *result;
        if ((*(_DWORD *)(*(void *)(v9 - 8) + 80LL) & 0x20000) != 0)
        {
          uint64_t v2 = *a2;
          swift_retain(*a2);
          *uint64_t v10 = v2;
        }

        else
        {
          (*(void (**)(void *, void *))(*(void *)(v9 - 8) + 16LL))(result, a2);
        }

        return (void *)swift_release(v3);
      }

      else
      {
        (*(void (**)(_BYTE *, void *))(*(void *)(v8 - 8) + 32LL))(v12, result);
        if (v5)
        {
          (*(void (**)(void *, void *))(*(void *)(v9 - 8) + 16LL))(v10, a2);
        }

        else
        {
          uint64_t v4 = *a2;
          swift_retain(*a2);
          *uint64_t v10 = v4;
        }

        return (void *)(*(uint64_t (**)(_BYTE *))(*(void *)(v8 - 8) + 8LL))(v12);
      }
    }
  }

  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001AB68( void *a1, const void *a2)
{
}

uint64_t *sub_10001AB94(uint64_t *a1, void *a2)
{
  if ((unint64_t)*a1 < 2)
  {
    memcpy(a1, a2, 0x30uLL);
  }

  else if (*a2 < 2uLL)
  {
    sub_100017FB4(a1);
    memcpy(a1, a2, 0x30uLL);
  }

  else
  {
    uint64_t v2 = *a1;
    *a1 = *a2;
    swift_unknownObjectRelease(v2);
    __dst = a1 + 1;
    if (a1[4]) {
      sub_100017CE8(__dst);
    }
    memcpy(__dst, a2 + 1, 0x28uLL);
  }

  return a1;
}

uint64_t sub_10001AD7C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 48))
    {
      int v5 = *(_DWORD *)a1 + 2147483645;
    }

    else
    {
      int v4 = -1;
      if (!HIDWORD(*(void *)a1)) {
        int v4 = *(void *)a1;
      }
      int v2 = v4 - 2;
      if (v4 - 2 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }

  else
  {
    int v5 = -1;
  }

  return (v5 + 1);
}

uint64_t sub_10001AEB0(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFD;
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = a2 - 2147483646;
    *(void *)(result + 8) = 0LL;
    *(void *)(result + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
    *(void *)(result + 2sub_100017CE8(v0 + 4) = 0LL;
    *(void *)(result + 32) = 0LL;
    *(void *)(result + 40) = 0LL;
    if (a3 > 0x7FFFFFFD)
    {
      if (v3) {
        *(_BYTE *)(result + 48) = 1;
      }
      else {
        __break(1u);
      }
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFD)
    {
      if (v3) {
        *(_BYTE *)(result + 48) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }

  return result;
}

uint64_t sub_10001B0CC(uint64_t a1)
{
  uint64_t v1 = sub_100006E5C(&qword_100026188);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48LL))(a1, 2LL);
}

uint64_t sub_10001B110(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = sub_100006E5C(&qword_100026188);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, a2, 2LL);
}

void *type metadata accessor for PosterPresenter.State()
{
  return &unk_100021890;
}

uint64_t sub_10001B16C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100015CA8( a1,  a2,  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(_BYTE *)(v3 + 32),  *(void *)(v3 + 40),  *(void *)(v3 + 48),  *(void *)(v3 + 56),  a3,  *(void *)(v3 + 64));
}

uint64_t sub_10001B1AC(uint64_t a1, uint64_t a2)
{
  return sub_100015570(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_10001B1D4(uint64_t a1, uint64_t a2)
{
  return sub_10001603C( a1,  a2,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void *)(v2 + 48),  *(void *)(v2 + 56));
}

uint64_t sub_10001B1F0(uint64_t a1, uint64_t a2)
{
  return sub_100015570(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001B218( id *a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001B240( id *a1)
{
}

uint64_t sub_10001B268()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_10001B2AC(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  int v5 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc(dword_1000262BC);
  *(void *)(v2 + 2sub_100017CE8(v0 + 4) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10001B360;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000262B8 + dword_1000262B8))(a1, v5);
}

uint64_t sub_10001B360()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

void *sub_10001B3C0(void *a1)
{
  if (*a1 > 2uLL)
  {
    swift_unknownObjectRelease(*a1);
    if (a1[4]) {
      sub_100017CE8(a1 + 1);
    }
  }

  return a1;
}

uint64_t sub_10001B464(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_100006F34(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10001B494(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t sub_10001B4FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 2sub_100017CE8(v0 + 4) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_10001B540()
{
  return 1LL;
}

size_t sub_10001B54C(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001B570( uint64_t a1)
{
}
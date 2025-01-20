uint64_t sub_100002BD8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  os_log_s *v19;
  os_log_type_t v20;
  BOOL v21;
  uint8_t *v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  os_log_s *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v65;
  void (**v66)(char *, uint64_t, uint64_t, uint64_t);
  Class isa;
  NSUUID v68;
  void (**v69)(char *, uint64_t, uint64_t, uint64_t);
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  char *v74;
  void (**v75)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  id aBlock;
  void v86[4];
  uint64_t v87;
  v79 = a2;
  v80 = a3;
  sub_100003B38((uint64_t *)&unk_1000216E0);
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v76 = (uint64_t)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = __chkstk_darwin(v5);
  v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))((char *)&v73 - v8);
  __chkstk_darwin(v7);
  v11 = (char *)&v73 - v10;
  v12 = type metadata accessor for Logger(0LL);
  v13 = *(void *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v77 = v15;
  v78 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  v17 = (char *)&v73 - v16;
  if (qword_100021328 != -1) {
    swift_once(&qword_100021328, sub_100004188);
  }
  v81 = v3;
  Logger.init(_:)((id)qword_100021EF8);
  v18 = a1;
  v83 = v17;
  v19 = (os_log_s *)Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  v21 = os_log_type_enabled(v19, v20);
  v82 = v13;
  if (v21)
  {
    v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v74 = (char *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)v22 = 138412290;
    v75 = v9;
    aBlock = (uint64_t)v18;
    v23 = v18;
    v9 = v75;
    UnsafeMutableRawBufferPointer.copyMemory(from:)((id *)&aBlock, v86, v22 + 4, v22 + 12);
    v24 = v74;
    *(void *)v74 = v18;

    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Received Stop Announcement Intent: %@", v22, 0xCu);
    v25 = sub_100003B38((uint64_t *)&unk_100021700);
    swift_arrayDestroy(v24, 1LL, v25);
    swift_slowDealloc(v24, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  else
  {
  }

  v26 = type metadata accessor for UUID(0LL);
  v75 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v26 - 8);
  v75[7](v11, 1LL, 1LL, v26);
  v27 = [v18 _metadata];
  v28 = v83;
  if (v27)
  {
    v29 = v27;
    v30 = [v27 endpointId];

    if (v30)
    {
      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      v33 = v32;

      UUID.init(uuidString:)(v31, v33);
      swift_bridgeObjectRelease(v33);
      sub_100003C5C((uint64_t)v11);
      sub_100003CE4((uint64_t)v9, (uint64_t)v11);
    }
  }

  v34 = v18;
  v35 = (os_log_s *)Logger.logObject.getter(v34);
  v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    v74 = v11;
    v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v38 = swift_slowAlloc(32LL, -1LL);
    v84 = v38;
    *(_DWORD *)v37 = 136315138;
    v39 = [v34 _metadata];
    v40 = v39;
    if (v39)
    {
      v41 = [v39 endpointId];

      if (v41)
      {
        v40 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
        v43 = v42;

LABEL_16:
        aBlock = (uint64_t)v40;
        v86[0] = v43;
        v44 = sub_100003B38((uint64_t *)&unk_100021460);
        v45 = String.init<A>(describing:)((id *)&aBlock, v44);
        v47 = v46;
        aBlock = sub_100015F1C(v45, v46, &v84);
        UnsafeMutableRawBufferPointer.copyMemory(from:)((id *)&aBlock, v86, v37 + 4, v37 + 12);

        swift_bridgeObjectRelease(v47);
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "EndpointID = %s", v37, 0xCu);
        swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v38, -1LL, -1LL);
        swift_slowDealloc(v37, -1LL, -1LL);

        v11 = v74;
        v28 = v83;
        goto LABEL_17;
      }

      v40 = 0LL;
    }

    v43 = 0LL;
    goto LABEL_16;
  }

LABEL_17:
  v48 = OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession;
  v49 = v81;
  v50 = v82;
  v51 = *(void **)(v81 + OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession);
  if (v51) {
    goto LABEL_18;
  }
  v65 = v76;
  sub_100003C9C((uint64_t)v11, v76);
  v66 = v75;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v75[6])(v65, 1LL, v26) == 1)
  {
    isa = 0LL;
  }

  else
  {
    v68.super.isa = UUID._bridgeToObjectiveC()().super.isa;
    v69 = v66;
    isa = v68.super.isa;
    ((void (*)(uint64_t, uint64_t))v69[1])(v65, v26);
  }

  v70 = [objc_allocWithZone((Class)ANLocalPlaybackSession) initWithEndpointIdentifier:isa];

  v71 = *(void **)(v49 + v48);
  *(void *)(v49 + v48) = v70;

  v72 = *(void **)(v49 + v48);
  if (v72)
  {
    [v72 setDelegate:v49];
    v51 = *(void **)(v49 + v48);
    if (v51)
    {
LABEL_18:
      v52 = (void *)objc_opt_self(&OBJC_CLASS___ANPlaybackCommand);
      v53 = v51;
      v54 = [v52 stopCommand];
      v55 = v78;
      (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v78, v28, v12);
      v56 = *(unsigned __int8 *)(v50 + 80);
      v57 = (v56 + 16) & ~v56;
      v58 = (v77 + v57 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      v59 = swift_allocObject(&unk_10001C868, v58 + 16, v56 | 7);
      (*(void (**)(uint64_t, char *, uint64_t))(v50 + 32))(v59 + v57, v55, v12);
      v60 = (void *)(v59 + v58);
      v61 = v80;
      *v60 = v79;
      v60[1] = v61;
      v86[3] = sub_100003BF0;
      v87 = v59;
      aBlock = (uint64_t)_NSConcreteStackBlock;
      v86[0] = 1107296256LL;
      v86[1] = sub_10000BD28;
      v86[2] = &unk_10001C880;
      v62 = _Block_copy(&aBlock);
      v63 = v87;
      swift_retain(v61);
      swift_release(v63);
      [v53 sendPlaybackCommand:v54 completionHandler:v62];
      _Block_release(v62);
    }
  }

  sub_100003C5C((uint64_t)v11);
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v28, v12);
}

void sub_1000032A0(uint64_t a1, uint64_t a2, void (*a3)(id))
{
  if (a1)
  {
    ((void (*)(void))swift_errorRetain)();
    swift_errorRetain(a1);
    uint64_t v5 = swift_errorRetain(a1);
    v6 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v9 = swift_slowAlloc(32LL, -1LL);
      uint64_t v29 = v9;
      *(_DWORD *)v8 = 136315138;
      swift_getErrorValue(a1, v28, v27);
      uint64_t v10 = Error.localizedDescription.getter(v27[1], v27[2]);
      unint64_t v12 = v11;
      uint64_t v26 = sub_100015F1C(v10, v11, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, v27, v8 + 4, v8 + 12);
      swift_bridgeObjectRelease(v12);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Stop Announcement failed with error: %s", v8, 0xCu);
      swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1LL, -1LL);
      swift_slowDealloc(v8, -1LL, -1LL);
      swift_errorRelease(a1);
    }

    else
    {
      swift_errorRelease(a1);

      swift_errorRelease(a1);
      uint64_t v13 = swift_errorRelease(a1);
    }
  }

  else
  {
    v14 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Stop Announcement completed successfully", v16, 2u);
      swift_slowDealloc(v16, -1LL, -1LL);
    }
  }

  v17 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)v19 = 134217984;
    if (qword_100021338 != -1) {
      swift_once(&qword_100021338, sub_1000042E0);
    }
    uint64_t v20 = *(void *)(qword_100021F08 + 16);
    if ((unint64_t)v20 >> 62)
    {
      if (v20 < 0) {
        uint64_t v25 = *(void *)(qword_100021F08 + 16);
      }
      else {
        uint64_t v25 = v20 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(*(void *)(qword_100021F08 + 16));
      uint64_t v21 = _CocoaArrayWrapper.endIndex.getter(v25);
      swift_bridgeObjectRelease(v20);
    }

    else
    {
      uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v29 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v19 + 4, v19 + 12);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Records in Stop Response: %ld", v19, 0xCu);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  id v22 = [objc_allocWithZone(INStopAnnouncementIntentResponse) initWithCode:3 userActivity:0];
  if (qword_100021338 != -1) {
    swift_once(&qword_100021338, sub_1000042E0);
  }
  uint64_t v23 = *(void *)(qword_100021F08 + 16);
  sub_100003D2C();
  swift_bridgeObjectRetain(v23);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  [v22 setStoppedAnnouncementRecords:isa];

  a3(v22);
}

id sub_10000373C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StopAnnouncementIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for StopAnnouncementIntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler);
}

void type metadata accessor for ANPlaybackOptions(uint64_t a1)
{
}

void *sub_10000382C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_10000383C(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_100003848(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_100003850@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100003864@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100003878@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10000388C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1000038BC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1000038E8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_10000390C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100003920(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100003934(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100003948@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10000395C(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_100003970(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_100003984(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_100003998()
{
  return *v0 == 0LL;
}

uint64_t sub_1000039A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_1000039C0(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1000039D4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_1000039E0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000039F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100003B00(a1);
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_100003A30()
{
  return sub_100003A78(&qword_100021438, (uint64_t)&unk_100017930);
}

uint64_t sub_100003A54()
{
  return sub_100003A78(&qword_100021440, (uint64_t)&unk_1000178FC);
}

uint64_t sub_100003A78(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ANPlaybackOptions(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100003AB8()
{
  return sub_100003A78(&qword_100021448, (uint64_t)&unk_10001795C);
}

uint64_t sub_100003ADC()
{
  return sub_100003A78((unint64_t *)&unk_100021450, (uint64_t)&unk_100017998);
}

uint64_t sub_100003B00(uint64_t a1)
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

uint64_t sub_100003B38(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100003B78()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

void sub_100003BF0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for Logger(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_1000032A0(a1, v1 + v4, *(void (**)(id))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL)));
}

uint64_t sub_100003C44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003C54(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100003C5C(uint64_t a1)
{
  uint64_t v2 = sub_100003B38((uint64_t *)&unk_1000216E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100003C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003B38((uint64_t *)&unk_1000216E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003B38((uint64_t *)&unk_1000216E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_100003D2C()
{
  unint64_t result = qword_100021470;
  if (!qword_100021470)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___INAnnouncementRecord);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021470);
  }

  return result;
}

uint64_t sub_100003D68()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100003D8C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

void type metadata accessor for INDeviceIdiom(uint64_t a1)
{
}

__n128 sub_100003DB0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_100003DC8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100003DE8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

void sub_100003E3C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100003E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  __chkstk_darwin(a1);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, a1);
  uint64_t v8 = _getErrorEmbeddedNSError<A>(_:)(v6, a1, a2);
  if (v8)
  {
    uint64_t v9 = v8;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  }

  else
  {
    uint64_t v9 = swift_allocError(a1, a2, 0LL, 0LL);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v10, v6, a1);
  }

  unint64_t v11 = (void *)_convertErrorToNSError(_:)(v9);
  swift_errorRelease(v9);
  id v12 = [v11 code];

  return sub_100003F90((uint64_t)v12);
}

uint64_t sub_100003F90(uint64_t a1)
{
  uint64_t v1 = a1 - 1009;
  uint64_t result = 8LL;
  switch(v1)
  {
    case 0LL:
    case 6LL:
      uint64_t result = 6LL;
      break;
    case 8LL:
      return result;
    case 22LL:
      uint64_t result = 7LL;
      break;
    case 23LL:
      uint64_t result = 12LL;
      break;
    case 24LL:
      uint64_t result = 10LL;
      break;
    case 25LL:
    case 40LL:
      uint64_t result = 9LL;
      break;
    case 26LL:
      uint64_t result = 11LL;
      break;
    case 34LL:
      uint64_t result = 13LL;
      break;
    case 38LL:
      uint64_t result = 14LL;
      break;
    default:
      uint64_t result = 4LL;
      break;
  }

  return result;
}

uint64_t sub_100004000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  __chkstk_darwin();
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, a1);
  uint64_t v8 = _getErrorEmbeddedNSError<A>(_:)(v6, a1, a2);
  if (v8)
  {
    uint64_t v9 = v8;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  }

  else
  {
    uint64_t v9 = swift_allocError(a1, a2, 0LL, 0LL);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v10, v6, a1);
  }

  unint64_t v11 = (void *)_convertErrorToNSError(_:)(v9);
  swift_errorRelease(v9);
  id v12 = [v11 code];

  if (v12 == (id)1027) {
    return 3LL;
  }
  else {
    return 4LL;
  }
}

uint64_t sub_100004108()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000422C(v0, qword_100021EE0);
  sub_10000426C(v0, (uint64_t)qword_100021EE0);
  if (qword_100021330 != -1) {
    swift_once(&qword_100021330, sub_100004284);
  }
  return Logger.init(_:)((id)qword_100021F00);
}

uint64_t sub_100004188()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000022LL,  0x8000000100018E00LL,  0x6148746E65746E49LL,  0xED000072656C646ELL);
  qword_100021EF8 = result;
  return result;
}

unint64_t sub_1000041F0()
{
  unint64_t result = qword_100021550;
  if (!qword_100021550)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021550);
  }

  return result;
}

uint64_t *sub_10000422C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000426C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100004284()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000022LL,  0x8000000100018E00LL,  0x7974696C697455LL,  0xE700000000000000LL);
  qword_100021F00 = result;
  return result;
}

uint64_t sub_1000042E0()
{
  uint64_t AnnouncementHistory = type metadata accessor for ReadAnnouncementHistory();
  uint64_t result = swift_allocObject(AnnouncementHistory, 24LL, 7LL);
  *(void *)(result + 16) = &_swiftEmptyArrayStorage;
  qword_100021F08 = result;
  return result;
}

uint64_t sub_100004314()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for ReadAnnouncementHistory()
{
  return objc_opt_self(&OBJC_CLASS____TtC23AnnounceIntentExtension23ReadAnnouncementHistory);
}

id sub_100004358()
{
  id v1 = [v0 homeName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = v2;

  id v4 = objc_allocWithZone(&OBJC_CLASS___INSpeakableString);
  swift_bridgeObjectRetain(v3);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  id v6 = [v4 initWithSpokenPhrase:v5];

  LOWORD(v17) = 0;
  id v7 = objc_msgSend( objc_allocWithZone(INHomeFilter),  "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room :isExcludeFilter:hasAllQuantifier:",  0,  0,  1,  37,  0,  37,  v6,  0,  0,  0,  v17);
  swift_bridgeObjectRelease(v3);

  id v8 = v7;
  id v9 = [v0 announcementID];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  id v12 = [v0 audioFileDuration];
  id v13 = objc_allocWithZone(&OBJC_CLASS___INAnnouncementRecord);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  id v15 = [v13 initWithOriginator:v8 identifier:v14 duration:v12];

  return v15;
}

id sub_1000044F8(void *a1)
{
  uint64_t v3 = sub_100003B38((uint64_t *)&unk_1000216E0);
  uint64_t v4 = __chkstk_darwin(v3);
  id v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)&v39 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v39 - v10;
  id v12 = [a1 recipients];
  if (!v12) {
    return 0LL;
  }
  id v13 = v12;
  unint64_t v14 = sub_1000047FC();
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, v14);

  v16 = (void *)sub_10000BD7C(v15);
  swift_bridgeObjectRelease(v15);
  id v17 = [v16 roomNames];
  uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v17, &type metadata for String);

  uint64_t v19 = *(void *)(v18 + 16);
  swift_bridgeObjectRelease(v18);
  if (v19 != 1)
  {

    return 0LL;
  }

  id v20 = [v16 roomNames];
  uint64_t v21 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v20, &type metadata for String);

  if (!v21[2])
  {

    swift_bridgeObjectRelease(v21);
    return 0LL;
  }

  v40 = v1;
  uint64_t v23 = v21[4];
  uint64_t v22 = v21[5];
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v21);
  uint64_t v24 = type metadata accessor for UUID(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v11, 1LL, 1LL, v24);
  id v26 = [a1 _metadata];
  uint64_t v27 = (uint64_t)v11;
  if (v26)
  {
    v28 = v26;
    id v29 = [v26 endpointId];

    if (v29)
    {
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
      uint64_t v39 = v23;
      uint64_t v32 = v31;

      UUID.init(uuidString:)(v30, v32);
      swift_bridgeObjectRelease(v32);
      sub_100003C5C(v27);
      sub_100003CE4((uint64_t)v9, v27);
    }
  }

  sub_100003C9C(v27, (uint64_t)v6);
  uint64_t v33 = v27;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v6, 1LL, v24) == 1)
  {
    Class isa = 0LL;
  }

  else
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v24);
  }

  v37 = v40;
  NSString v38 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  id v35 = [v37 isEndpointWithUUID:isa inRoomWithName:v38];

  sub_100003C5C(v33);
  return v35;
}

unint64_t sub_1000047FC()
{
  unint64_t result = qword_100021A40;
  if (!qword_100021A40)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___INHomeFilter);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021A40);
  }

  return result;
}

uint64_t sub_100004838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[41] = a3;
  v4[42] = a4;
  v4[39] = a1;
  v4[40] = a2;
  unint64_t v5 = (*(void *)(*(void *)(sub_100003B38((uint64_t *)&unk_1000216E0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[43] = swift_task_alloc(v5);
  v4[44] = swift_task_alloc(v5);
  uint64_t v6 = type metadata accessor for UUID(0LL);
  v4[45] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[46] = v7;
  unint64_t v8 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[47] = swift_task_alloc(v8);
  v4[48] = swift_task_alloc(v8);
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v4[49] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[50] = v10;
  v4[51] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100004908, 0LL, 0LL);
}

uint64_t sub_100004908()
{
  v57 = v0 + 38;
  if (qword_100021320 != -1) {
    swift_once(&qword_100021320, sub_100004108);
  }
  uint64_t v1 = v0[50];
  uint64_t v2 = v0[51];
  uint64_t v3 = v0[49];
  uint64_t v4 = v0[45];
  uint64_t v5 = v0[46];
  uint64_t v6 = v0[44];
  uint64_t v7 = v0[42];
  uint64_t v8 = sub_10000426C(v3, (uint64_t)qword_100021EE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v8, v3);
  sub_100003C9C(v7, v6);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  v0[52] = v9;
  if (v9(v6, 1LL, v4) == 1)
  {
    uint64_t v10 = sub_100003C5C(v0[44]);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Using Default AF Context", v13, 2u);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    id v14 = [(id)objc_opt_self(AFInstanceContext) defaultContext];
  }

  else
  {
    uint64_t v16 = v0[47];
    uint64_t v15 = v0[48];
    uint64_t v18 = v0[45];
    uint64_t v17 = v0[46];
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 32))(v15, v0[44], v18);
    uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v15, v18);
    id v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v21 = static os_log_type_t.default.getter();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v24 = v0[46];
    uint64_t v23 = v0[47];
    uint64_t v25 = v0[45];
    if (v22)
    {
      id v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v27 = swift_slowAlloc(32LL, -1LL);
      uint64_t v58 = v27;
      *(_DWORD *)id v26 = 136315138;
      unint64_t v28 = sub_100005B94();
      uint64_t v29 = dispatch thunk of CustomStringConvertible.description.getter(v25, v28);
      unint64_t v31 = v30;
      v0[38] = sub_100015F1C(v29, v30, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v57, v0 + 39, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease(v31);
      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
      v32(v23, v25);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Creating AF Context with Endpoint ID: %s", v26, 0xCu);
      swift_arrayDestroy(v27, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1LL, -1LL);
      swift_slowDealloc(v26, -1LL, -1LL);
    }

    else
    {

      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
      v32(v23, v25);
    }

    uint64_t v33 = v0[48];
    uint64_t v34 = v0[45];
    id v35 = objc_allocWithZone(&OBJC_CLASS___AFInstanceContext);
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v14 = [v35 initWithEndpointUUID:isa];

    v32(v33, v34);
  }

  v0[53] = v14;
  uint64_t v37 = v0[41];
  id v38 = [objc_allocWithZone(AFMultiUserConnection) initWithConnectionFactory:v14];
  uint64_t v39 = v38;
  v0[54] = v38;
  if (v37)
  {
    unint64_t v40 = v0[41];
    uint64_t v41 = swift_bridgeObjectRetain_n(v40, 2LL);
    v42 = (os_log_s *)Logger.logObject.getter(v41);
    os_log_type_t v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = v0[40];
      v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v46 = swift_slowAlloc(32LL, -1LL);
      uint64_t v58 = v46;
      *(_DWORD *)v45 = 136315138;
      swift_bridgeObjectRetain(v40);
      v0[37] = sub_100015F1C(v44, v40, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 37, v57, v45 + 4, v45 + 12);
      swift_bridgeObjectRelease_n(v40, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Translating sharedUserID %s to Home User ID", v45, 0xCu);
      swift_arrayDestroy(v46, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1LL, -1LL);
      swift_slowDealloc(v45, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v40, 2LL);
    }

    v50 = v0 + 2;
    NSString v53 = String._bridgeToObjectiveC()();
    v0[55] = v53;
    v0[7] = v0 + 32;
    v0[2] = v0;
    v0[3] = sub_100004ED8;
    uint64_t v54 = swift_continuation_init(v0 + 2, 1LL);
    v0[23] = _NSConcreteStackBlock;
    v55 = v0 + 23;
    v55[1] = 0x40000000LL;
    v55[2] = sub_100005B0C;
    v55[3] = &unk_10001CAD0;
    v55[4] = v54;
    [v39 getHomeUserIdForSharedUserId:v53 completion:v55];
  }

  else
  {
    v47 = (os_log_s *)Logger.logObject.getter(v38);
    uint64_t v48 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v47, (os_log_type_t)v48))
    {
      v49 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v49 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  (os_log_type_t)v48,  "Shared User ID is nil. Falling back to Home User ID of Recognized User",  v49,  2u);
      swift_slowDealloc(v49, -1LL, -1LL);
    }

    v50 = v0 + 10;
    v0[15] = v0 + 30;
    v0[10] = v0;
    v0[11] = sub_1000051E0;
    uint64_t v51 = swift_continuation_init(v0 + 10, 1LL);
    v0[18] = _NSConcreteStackBlock;
    v52 = v0 + 18;
    v52[1] = 0x40000000LL;
    v52[2] = sub_100005B0C;
    v52[3] = &unk_10001CAB8;
    v52[4] = v51;
    objc_msgSend(v39, "an_getHomeUserIdOfRecognizedUserWithCompletion:", v52);
  }

  return swift_continuation_await(v50);
}

uint64_t sub_100004ED8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 448LL) = v1;
  if (v1) {
    uint64_t v2 = sub_1000054E0;
  }
  else {
    uint64_t v2 = sub_100004F38;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100004F38()
{
  uint64_t v2 = *(void *)(v0 + 256);
  unint64_t v1 = *(void *)(v0 + 264);

  uint64_t v3 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 416);
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 344);
  UUID.init(uuidString:)(v2, v1);
  if (v3(v5, 1LL, v4) == 1)
  {
    sub_100003C5C(*(void *)(v0 + 344));
    uint64_t v6 = swift_bridgeObjectRetain(v1);
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.error.getter();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = *(void **)(v0 + 424);
    uint64_t v12 = *(void *)(v0 + 400);
    uint64_t v11 = *(void *)(v0 + 408);
    uint64_t v13 = *(void *)(v0 + 392);
    if (v9)
    {
      uint64_t v33 = *(void *)(v0 + 392);
      unint64_t v31 = *(void **)(v0 + 432);
      uint64_t v32 = *(void *)(v0 + 408);
      id v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v15 = swift_slowAlloc(32LL, -1LL);
      uint64_t v34 = v15;
      *(_DWORD *)id v14 = 136315138;
      swift_bridgeObjectRetain(v1);
      *(void *)(v0 + 272) = sub_100015F1C(v2, v1, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 272, v0 + 280, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease_n(v1, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "Failed to translate Home User ID UUID String to UUID: %s",  v14,  0xCu);
      uint64_t v16 = 1LL;
      swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v14, -1LL, -1LL);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v32, v33);
    }

    else
    {

      swift_bridgeObjectRelease_n(v1, 2LL);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      uint64_t v16 = 1LL;
    }
  }

  else
  {
    uint64_t v17 = *(void **)(v0 + 424);
    uint64_t v19 = *(void *)(v0 + 400);
    uint64_t v18 = *(void *)(v0 + 408);
    uint64_t v20 = *(void *)(v0 + 392);
    uint64_t v21 = *(void *)(v0 + 360);
    uint64_t v22 = *(void *)(v0 + 368);
    uint64_t v23 = *(void *)(v0 + 344);
    uint64_t v24 = *(void *)(v0 + 312);

    swift_bridgeObjectRelease(v1);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v24, v23, v21);
    uint64_t v16 = 0LL;
  }

  uint64_t v25 = *(void *)(v0 + 408);
  uint64_t v27 = *(void *)(v0 + 376);
  uint64_t v26 = *(void *)(v0 + 384);
  uint64_t v29 = *(void *)(v0 + 344);
  uint64_t v28 = *(void *)(v0 + 352);
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 368) + 56LL))( *(void *)(v0 + 312),  v16,  1LL,  *(void *)(v0 + 360));
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000051E0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112LL);
  *(void *)(*(void *)v0 + 456LL) = v1;
  if (v1) {
    uint64_t v2 = sub_1000057F8;
  }
  else {
    uint64_t v2 = sub_100005240;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100005240()
{
  uint64_t v2 = *(void *)(v0 + 240);
  unint64_t v1 = *(void *)(v0 + 248);
  uint64_t v3 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 416);
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 344);
  UUID.init(uuidString:)(v2, v1);
  if (v3(v5, 1LL, v4) == 1)
  {
    sub_100003C5C(*(void *)(v0 + 344));
    uint64_t v6 = swift_bridgeObjectRetain(v1);
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.error.getter();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = *(void **)(v0 + 424);
    uint64_t v12 = *(void *)(v0 + 400);
    uint64_t v11 = *(void *)(v0 + 408);
    uint64_t v13 = *(void *)(v0 + 392);
    if (v9)
    {
      uint64_t v33 = *(void *)(v0 + 392);
      unint64_t v31 = *(void **)(v0 + 432);
      uint64_t v32 = *(void *)(v0 + 408);
      id v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v15 = swift_slowAlloc(32LL, -1LL);
      uint64_t v34 = v15;
      *(_DWORD *)id v14 = 136315138;
      swift_bridgeObjectRetain(v1);
      *(void *)(v0 + 272) = sub_100015F1C(v2, v1, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 272, v0 + 280, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease_n(v1, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "Failed to translate Home User ID UUID String to UUID: %s",  v14,  0xCu);
      uint64_t v16 = 1LL;
      swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v14, -1LL, -1LL);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v32, v33);
    }

    else
    {

      swift_bridgeObjectRelease_n(v1, 2LL);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      uint64_t v16 = 1LL;
    }
  }

  else
  {
    uint64_t v17 = *(void **)(v0 + 424);
    uint64_t v19 = *(void *)(v0 + 400);
    uint64_t v18 = *(void *)(v0 + 408);
    uint64_t v20 = *(void *)(v0 + 392);
    uint64_t v21 = *(void *)(v0 + 360);
    uint64_t v22 = *(void *)(v0 + 368);
    uint64_t v23 = *(void *)(v0 + 344);
    uint64_t v24 = *(void *)(v0 + 312);

    swift_bridgeObjectRelease(v1);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v24, v23, v21);
    uint64_t v16 = 0LL;
  }

  uint64_t v25 = *(void *)(v0 + 408);
  uint64_t v27 = *(void *)(v0 + 376);
  uint64_t v26 = *(void *)(v0 + 384);
  uint64_t v29 = *(void *)(v0 + 344);
  uint64_t v28 = *(void *)(v0 + 352);
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 368) + 56LL))( *(void *)(v0 + 312),  v16,  1LL,  *(void *)(v0 + 360));
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000054E0()
{
  unint64_t v1 = *(void **)(v0 + 440);
  swift_willThrow();

  uint64_t v2 = *(void *)(v0 + 448);
  uint64_t v3 = *(void *)(v0 + 328);
  swift_bridgeObjectRetain(v3);
  swift_errorRetain(v2);
  swift_bridgeObjectRetain(v3);
  uint64_t v4 = swift_errorRetain(v2);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v32 = *(void *)(v0 + 408);
    uint64_t v28 = *(void **)(v0 + 432);
    uint64_t v29 = *(void *)(v0 + 400);
    unint64_t v30 = *(void **)(v0 + 424);
    uint64_t v31 = *(void *)(v0 + 392);
    uint64_t v7 = *(void *)(v0 + 320);
    uint64_t v8 = *(void *)(v0 + 328);
    uint64_t v9 = swift_slowAlloc(22LL, -1LL);
    uint64_t v26 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v27 = swift_slowAlloc(32LL, -1LL);
    *(void *)(v0 + 224) = v7;
    uint64_t v33 = v27;
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v0 + 232) = v8;
    swift_bridgeObjectRetain(v3);
    uint64_t v10 = sub_100003B38((uint64_t *)&unk_100021460);
    uint64_t v11 = String.init<A>(describing:)(v0 + 224, v10);
    unint64_t v13 = v12;
    *(void *)(v0 + 288) = sub_100015F1C(v11, v12, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease_n(v3, 2LL);
    *(_WORD *)(v9 + 12) = 2112;
    swift_errorRetain(v2);
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError(v2);
    *(void *)(v0 + 280) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v9 + 14, v9 + 22);
    *uint64_t v26 = v14;
    swift_errorRelease(v2);
    swift_errorRelease(v2);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "Failed to obtain HomeUserID for Shared User ID: %s. Error = %@",  (uint8_t *)v9,  0x16u);
    uint64_t v15 = sub_100003B38(&qword_100021700);
    swift_arrayDestroy(v26, 1LL, v15);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_arrayDestroy(v27, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);

    swift_errorRelease(v2);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v32, v31);
  }

  else
  {
    uint64_t v16 = *(void **)(v0 + 424);
    uint64_t v18 = *(void *)(v0 + 400);
    uint64_t v17 = *(void *)(v0 + 408);
    uint64_t v19 = *(void *)(v0 + 392);

    swift_errorRelease(v2);
    swift_errorRelease(v2);
    swift_bridgeObjectRelease_n(v3, 2LL);
    swift_errorRelease(v2);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }

  uint64_t v20 = *(void *)(v0 + 408);
  uint64_t v22 = *(void *)(v0 + 376);
  uint64_t v21 = *(void *)(v0 + 384);
  uint64_t v24 = *(void *)(v0 + 344);
  uint64_t v23 = *(void *)(v0 + 352);
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 368) + 56LL))( *(void *)(v0 + 312),  1LL,  1LL,  *(void *)(v0 + 360));
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000057F8()
{
  uint64_t v1 = *(void *)(v0 + 328);
  swift_willThrow();
  uint64_t v2 = *(void *)(v0 + 456);
  swift_bridgeObjectRetain(v1);
  swift_errorRetain(v2);
  swift_bridgeObjectRetain(v1);
  uint64_t v3 = swift_errorRetain(v2);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v31 = *(void *)(v0 + 408);
    uint64_t v27 = *(void **)(v0 + 432);
    uint64_t v28 = *(void *)(v0 + 400);
    uint64_t v29 = *(void **)(v0 + 424);
    uint64_t v30 = *(void *)(v0 + 392);
    uint64_t v6 = *(void *)(v0 + 320);
    uint64_t v7 = *(void *)(v0 + 328);
    uint64_t v8 = swift_slowAlloc(22LL, -1LL);
    uint64_t v25 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v26 = swift_slowAlloc(32LL, -1LL);
    *(void *)(v0 + 224) = v6;
    uint64_t v32 = v26;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v0 + 232) = v7;
    swift_bridgeObjectRetain(v1);
    uint64_t v9 = sub_100003B38((uint64_t *)&unk_100021460);
    uint64_t v10 = String.init<A>(describing:)(v0 + 224, v9);
    unint64_t v12 = v11;
    *(void *)(v0 + 288) = sub_100015F1C(v10, v11, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease_n(v1, 2LL);
    *(_WORD *)(v8 + 12) = 2112;
    swift_errorRetain(v2);
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError(v2);
    *(void *)(v0 + 280) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v8 + 14, v8 + 22);
    *uint64_t v25 = v13;
    swift_errorRelease(v2);
    swift_errorRelease(v2);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "Failed to obtain HomeUserID for Shared User ID: %s. Error = %@",  (uint8_t *)v8,  0x16u);
    uint64_t v14 = sub_100003B38(&qword_100021700);
    swift_arrayDestroy(v25, 1LL, v14);
    swift_slowDealloc(v25, -1LL, -1LL);
    swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);

    swift_errorRelease(v2);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v31, v30);
  }

  else
  {
    uint64_t v15 = *(void **)(v0 + 424);
    uint64_t v17 = *(void *)(v0 + 400);
    uint64_t v16 = *(void *)(v0 + 408);
    uint64_t v18 = *(void *)(v0 + 392);

    swift_errorRelease(v2);
    swift_errorRelease(v2);
    swift_bridgeObjectRelease_n(v1, 2LL);
    swift_errorRelease(v2);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }

  uint64_t v19 = *(void *)(v0 + 408);
  uint64_t v21 = *(void *)(v0 + 376);
  uint64_t v20 = *(void *)(v0 + 384);
  uint64_t v23 = *(void *)(v0 + 344);
  uint64_t v22 = *(void *)(v0 + 352);
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 368) + 56LL))( *(void *)(v0 + 312),  1LL,  1LL,  *(void *)(v0 + 360));
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005B0C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_100003B38((uint64_t *)&unk_100021A60);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
    unint64_t v11 = *(uint64_t **)(*(void *)(v3 + 64) + 40LL);
    *unint64_t v11 = v10;
    v11[1] = v12;
    return swift_continuation_throwingResume(v3);
  }

unint64_t sub_100005B94()
{
  unint64_t result = qword_100021618;
  if (!qword_100021618)
  {
    uint64_t v1 = type metadata accessor for UUID(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UUID, v1);
    atomic_store(result, (unint64_t *)&qword_100021618);
  }

  return result;
}

uint64_t sub_100005BDC(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  return swift_task_switch(sub_100005BF4, 0LL, 0LL);
}

uint64_t sub_100005BF4()
{
  id v1 = objc_allocWithZone(&OBJC_CLASS___AVURLAsset);
  URL._bridgeToObjectiveC()(v2);
  uint64_t v4 = v3;
  v0[9] = [v1 initWithURL:v3 options:0];

  sub_100003B38(&qword_100021628);
  uint64_t v5 = static AVPartialAsyncProperty<A>.duration.getter();
  v0[10] = v5;
  uint64_t v6 = (void *)swift_task_alloc(async function pointer to AVAsynchronousKeyValueLoading.load<A>(_:)[1]);
  v0[11] = v6;
  void *v6 = v0;
  v6[1] = sub_100005CB4;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 2, v5);
}

uint64_t sub_100005CB4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 88);
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_100005D7C;
  }

  else
  {
    swift_release(*(void *)(v2 + 80));
    uint64_t v4 = sub_100005D20;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100005D20()
{
  id v1 = *(void **)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v2;
  double Seconds = CMTimeGetSeconds((CMTime *)(v0 + 40));

  return (*(uint64_t (**)(double))(v0 + 8))(Seconds);
}

uint64_t sub_100005D7C()
{
  uint64_t v1 = *(void *)(v0 + 80);

  swift_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100005DB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100003B38(&qword_1000216F0);
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
    unint64_t result = sub_1000149AC(v7, v8);
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

uint64_t sub_100005ED0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100003B38((uint64_t *)&unk_100021AA0);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler____lazy_storage___logger;
  swift_beginAccess( v1 + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler____lazy_storage___logger,  v14,  0LL,  0LL);
  sub_100007758(v9, (uint64_t)v8, (uint64_t *)&unk_100021AA0);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  sub_10000779C((uint64_t)v8);
  if (qword_100021328 != -1) {
    swift_once(&qword_100021328, sub_100004188);
  }
  Logger.init(_:)((id)qword_100021EF8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0LL, 1LL, v10);
  swift_beginAccess(v9, v13, 33LL, 0LL);
  sub_1000077DC((uint64_t)v6, v9);
  return swift_endAccess(v13);
}

uint64_t sub_100006068@<X0>(void *a1@<X0>, char **a2@<X8>)
{
  uint64_t v3 = v2;
  v128 = a2;
  uint64_t v130 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v130 - 8);
  uint64_t v6 = __chkstk_darwin(v130);
  uint64_t v126 = (uint64_t)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v120 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v120 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v120 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v120 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v120 - v20;
  sub_100005ED0((uint64_t)&v120 - v20);
  id v22 = a1;
  uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
  os_log_type_t v24 = static os_log_type_t.default.getter();
  BOOL v25 = os_log_type_enabled(v23, v24);
  v127 = v10;
  v129 = v3;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc(22LL, -1LL);
    uint64_t v27 = swift_slowAlloc(8LL, -1LL);
    v122 = v19;
    uint64_t v28 = (void *)v27;
    uint64_t v120 = swift_slowAlloc(32LL, -1LL);
    v135[0] = v120;
    *(_DWORD *)uint64_t v26 = 138412546;
    uint64_t v121 = v5;
    id v133 = v22;
    v123 = v13;
    id v29 = v22;
    v125 = v16;
    id v30 = v22;
    id v31 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v134, v26 + 4, v26 + 12);
    void *v28 = v30;

    *(_WORD *)(v26 + 12) = 2080;
    id v133 = [v31 _idiom];
    type metadata accessor for INDeviceIdiom(0LL);
    uint64_t v33 = String.init<A>(describing:)(&v133, v32);
    unint64_t v35 = v34;
    id v133 = (id)sub_100015F1C(v33, v34, v135);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v134, v26 + 14, v26 + 22);

    id v22 = v30;
    uint64_t v16 = v125;
    unint64_t v36 = v35;
    uint64_t v13 = v123;
    swift_bridgeObjectRelease(v36);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Resolving %@ for idiom %s", (uint8_t *)v26, 0x16u);
    uint64_t v37 = sub_100003B38((uint64_t *)&qword_100021700);
    swift_arrayDestroy(v28, 1LL, v37);
    id v38 = v28;
    uint64_t v19 = v122;
    swift_slowDealloc(v38, -1LL, -1LL);
    uint64_t v39 = v120;
    swift_arrayDestroy(v120, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v39, -1LL, -1LL);
    uint64_t v40 = v26;
    uint64_t v3 = v129;
    swift_slowDealloc(v40, -1LL, -1LL);

    uint64_t v41 = *(char **)(v121 + 8);
  }

  else
  {

    uint64_t v41 = *(char **)(v5 + 8);
  }

  ((void (*)(char *, uint64_t))v41)(v21, v130);
  if (![v22 _idiom])
  {
    uint64_t v42 = sub_100005ED0((uint64_t)v19);
    os_log_type_t v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "idiom is unknown", v45, 2u);
      swift_slowDealloc(v45, -1LL, -1LL);
    }

    ((void (*)(char *, uint64_t))v41)(v19, v130);
  }

  id v46 = [v22 identifier];
  p_ivar_lyt = &ReadAnnouncementIntentHandler.ivar_lyt;
  if (v46)
  {
    uint64_t v48 = v46;
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
    unint64_t v51 = v50;

    v52 = (unint64_t *)&v3[OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers];
    swift_beginAccess( &v3[OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers],  &v131,  0LL,  0LL);
    unint64_t v53 = *v52;
    if (*(void *)(v53 + 16))
    {
      swift_bridgeObjectRetain(v51);
      swift_bridgeObjectRetain(v53);
      unint64_t v54 = sub_1000149AC(v49, v51);
      if ((v55 & 1) != 0)
      {
        v56 = (char *)*(id *)(*(void *)(v53 + 56) + 8 * v54);
        swift_bridgeObjectRelease(v51);
        swift_bridgeObjectRelease(v53);
        sub_100005ED0((uint64_t)v16);
        uint64_t v57 = swift_bridgeObjectRetain(v51);
        uint64_t v58 = (os_log_s *)Logger.logObject.getter(v57);
        os_log_type_t v59 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v58, v59))
        {
          uint64_t v60 = swift_slowAlloc(12LL, -1LL);
          v125 = v16;
          v61 = (uint8_t *)v60;
          uint64_t v62 = swift_slowAlloc(32LL, -1LL);
          id v124 = v22;
          uint64_t v63 = v62;
          v135[0] = v62;
          v123 = v56;
          *(_DWORD *)v61 = 136315138;
          swift_bridgeObjectRetain(v51);
          id v133 = (id)sub_100015F1C(v49, v51, v135);
          uint64_t v64 = v130;
          p_ivar_lyt = (void **)(&ReadAnnouncementIntentHandler + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v134, v61 + 4, v61 + 12);
          swift_bridgeObjectRelease_n(v51, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v58,  v59,  "Found recent intent handler for identifier: %s",  v61,  0xCu);
          swift_arrayDestroy(v63, 1LL, (char *)&type metadata for Any + 8);
          uint64_t v65 = v63;
          id v22 = v124;
          swift_slowDealloc(v65, -1LL, -1LL);
          swift_slowDealloc(v61, -1LL, -1LL);

          ((void (*)(char *, uint64_t))v41)(v125, v64);
          v136 = v123;
        }

        else
        {

          swift_bridgeObjectRelease_n(v51, 2LL);
          ((void (*)(char *, uint64_t))v41)(v16, v130);
          v136 = v56;
        }

        uint64_t v3 = v129;
        goto LABEL_33;
      }

      swift_bridgeObjectRelease_n(v51, 2LL);
      unint64_t v66 = v53;
    }

    else
    {
      unint64_t v66 = v51;
    }

    swift_bridgeObjectRelease(v66);
  }

  uint64_t v67 = objc_opt_self(&OBJC_CLASS___INReadAnnouncementIntent);
  if (swift_dynamicCastObjCClass(v22, v67))
  {
    AnnouncementIntentHandler = (objc_class *)type metadata accessor for ReadAnnouncementIntentHandler(0LL);
LABEL_26:
    v136 = (char *)[objc_allocWithZone(AnnouncementIntentHandler) init];
    goto LABEL_27;
  }

  uint64_t v69 = objc_opt_self(&OBJC_CLASS___INSendAnnouncementIntent);
  if (swift_dynamicCastObjCClass(v22, v69))
  {
    AnnouncementIntentHandler = (objc_class *)type metadata accessor for SendAnnouncementIntentHandler(0LL);
    goto LABEL_26;
  }

  uint64_t v70 = objc_opt_self(&OBJC_CLASS___INStopAnnouncementIntent);
  if (swift_dynamicCastObjCClass(v22, v70))
  {
    AnnouncementIntentHandler = (objc_class *)type metadata accessor for StopAnnouncementIntentHandler();
    goto LABEL_26;
  }

  uint64_t v71 = objc_opt_self(&OBJC_CLASS___INPlayAnnouncementSoundIntent);
  if (swift_dynamicCastObjCClass(v22, v71))
  {
    AnnouncementIntentHandler = (objc_class *)type metadata accessor for PlayAnnouncementSoundIntentHandler();
    goto LABEL_26;
  }

  v136 = v3;
  v119 = v3;
LABEL_27:
  sub_100005ED0((uint64_t)v13);
  id v72 = v22;
  v73 = (os_log_s *)Logger.logObject.getter(v72);
  os_log_type_t v74 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v73, v74))
  {
    v75 = v41;
    v76 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v77 = swift_slowAlloc(32LL, -1LL);
    v135[0] = v77;
    *(_DWORD *)v76 = 136315138;
    id v78 = [v72 identifier];
    id v124 = v22;
    if (v78)
    {
      v79 = v78;
      uint64_t v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(v78);
      unint64_t v82 = v81;
    }

    else
    {
      unint64_t v82 = 0xE300000000000000LL;
      uint64_t v80 = 7104878LL;
    }

    uint64_t v41 = v75;
    id v133 = (id)sub_100015F1C(v80, v82, v135);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v134, v76 + 4, v76 + 12);

    swift_bridgeObjectRelease(v82);
    _os_log_impl((void *)&_mh_execute_header, v73, v74, "Created new intent handler for identifier: %s", v76, 0xCu);
    swift_arrayDestroy(v77, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v77, -1LL, -1LL);
    swift_slowDealloc(v76, -1LL, -1LL);

    ((void (*)(char *, uint64_t))v75)(v13, v130);
    uint64_t v3 = v129;
    id v22 = v124;
    p_ivar_lyt = &ReadAnnouncementIntentHandler.ivar_lyt;
  }

  else
  {

    ((void (*)(char *, uint64_t))v41)(v13, v130);
  }

LABEL_33:
  v83 = (uint64_t *)((char *)p_ivar_lyt[198] + (void)v3);
  swift_beginAccess(v83, v135, 0LL, 0LL);
  uint64_t v84 = *v83;
  uint64_t v85 = swift_bridgeObjectRetain(*v83);
  uint64_t v86 = sub_100006D00(v85, (void **)&v136);
  unint64_t v88 = v87;
  v90 = v89;
  swift_bridgeObjectRelease(v84);
  if (v88)
  {
    v91 = v136;
    swift_beginAccess(v83, &v133, 33LL, 0LL);
    swift_bridgeObjectRetain(v88);
    v92 = v91;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v83);
    uint64_t v132 = *v83;
    uint64_t *v83 = 0x8000000000000000LL;
    sub_100007B74((uint64_t)v92, v86, v88, isUniquelyReferenced_nonNull_native);
    uint64_t v94 = *v83;
    uint64_t *v83 = v132;
    swift_bridgeObjectRelease(v88);
    swift_bridgeObjectRelease(v94);
    swift_endAccess(&v133);
    uint64_t v95 = (uint64_t)v127;
    sub_100005ED0((uint64_t)v127);
    swift_bridgeObjectRetain_n(v88, 2LL);
    id v96 = v90;
    v97 = (os_log_s *)Logger.logObject.getter(v96);
    os_log_type_t v98 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v97, v98))
    {
      v99 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v100 = (id)swift_slowAlloc(32LL, -1LL);
      id v133 = v100;
      v125 = v41;
      *(_DWORD *)v99 = 136315138;
      swift_bridgeObjectRetain(v88);
      uint64_t v132 = sub_100015F1C(v86, v88, (uint64_t *)&v133);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v132, &v133, v99 + 4, v99 + 12);

      swift_bridgeObjectRelease_n(v88, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v97, v98, "Updated recent intent handler for identifier: %s", v99, 0xCu);
      swift_arrayDestroy(v100, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v100, -1LL, -1LL);
      swift_slowDealloc(v99, -1LL, -1LL);

      swift_bridgeObjectRelease(v88);
      ((void (*)(char *, uint64_t))v125)(v127, v130);
    }

    else
    {

      swift_bridgeObjectRelease_n(v88, 3LL);
      ((void (*)(uint64_t, uint64_t))v41)(v95, v130);
    }
  }

  else
  {
    id v101 = [v22 identifier];
    if (v101)
    {
      v102 = v101;
      v125 = v41;
      uint64_t v103 = static String._unconditionallyBridgeFromObjectiveC(_:)(v101);
      unint64_t v105 = v104;

      v106 = v136;
      swift_beginAccess(v83, &v133, 33LL, 0LL);
      swift_bridgeObjectRetain(v105);
      v107 = v106;
      char v108 = swift_isUniquelyReferenced_nonNull_native(*v83);
      uint64_t v132 = *v83;
      uint64_t *v83 = 0x8000000000000000LL;
      sub_100007B74((uint64_t)v107, v103, v105, v108);
      uint64_t v109 = *v83;
      uint64_t *v83 = v132;
      swift_bridgeObjectRelease(v105);
      swift_bridgeObjectRelease(v109);
      swift_endAccess(&v133);
      uint64_t v110 = v126;
      sub_100005ED0(v126);
      uint64_t v111 = swift_bridgeObjectRetain(v105);
      v112 = (os_log_s *)Logger.logObject.getter(v111);
      os_log_type_t v113 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v112, v113))
      {
        v114 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        id v115 = (id)swift_slowAlloc(32LL, -1LL);
        id v133 = v115;
        *(_DWORD *)v114 = 136315138;
        swift_bridgeObjectRetain(v105);
        uint64_t v132 = sub_100015F1C(v103, v105, (uint64_t *)&v133);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v132, &v133, v114 + 4, v114 + 12);
        swift_bridgeObjectRelease_n(v105, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v112,  v113,  "Added new intent handler to recents for identifier: %s",  v114,  0xCu);
        swift_arrayDestroy(v115, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v115, -1LL, -1LL);
        swift_slowDealloc(v114, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v105, 2LL);
      }

      ((void (*)(uint64_t, uint64_t))v125)(v110, v130);
    }
  }

  v116 = v136;
  uint64_t result = sub_100007E80(0LL, (unint64_t *)&qword_1000216F8, &OBJC_CLASS___INExtension_ptr);
  v118 = v128;
  v128[3] = (char *)result;
  *v118 = v116;
  return result;
}

    uint64_t v11 = (v24 - 1) & v24;
    uint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    id v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    id v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      unint64_t v34 = v33;
    }

    Hasher.init(_seed:)(v40, *(void *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    uint64_t v16 = result & ~v15;
    uint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      uint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v26 = 0;
      uint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        uint64_t v28 = v17 == v27;
        if (v17 == v27) {
          uint64_t v17 = 0LL;
        }
        v26 |= v28;
        id v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      uint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    char *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  unint64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v23 = -1LL << v35;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  uint64_t result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_100006D00(uint64_t a1, void **a2)
{
  uint64_t v3 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v4 = -1LL;
  if (v3 < 64) {
    uint64_t v4 = ~(-1LL << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t j = 0LL;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (unint64_t i = v8 | (j << 6); ; unint64_t i = __clz(__rbit64(v11)) + (j << 6))
  {
    uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    uint64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * i);
    sub_100007E80(0LL, &qword_100021708, &OBJC_CLASS___NSObject_ptr);
    uint64_t v17 = *a2;
    swift_bridgeObjectRetain(v14);
    id v18 = v16;
    id v19 = v17;
    char v20 = static NSObject.== infix(_:_:)(v18, v19);

    if ((v20 & 1) != 0)
    {
      swift_release(a1);
      return v15;
    }

    uint64_t result = swift_bridgeObjectRelease(v14);
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = j + 1;
    if (__OFADD__(j, 1LL)) {
      break;
    }
    if (v10 >= v22) {
      goto LABEL_24;
    }
    unint64_t v11 = *(void *)(v21 + 8 * v10);
    ++j;
    if (v11) {
      goto LABEL_19;
    }
    int64_t j = v10 + 1;
    if (v10 + 1 >= v22) {
      goto LABEL_24;
    }
    unint64_t v11 = *(void *)(v21 + 8 * j);
    if (v11) {
      goto LABEL_19;
    }
    int64_t j = v10 + 2;
    if (v10 + 2 >= v22) {
      goto LABEL_24;
    }
    unint64_t v11 = *(void *)(v21 + 8 * j);
    if (v11) {
      goto LABEL_19;
    }
    int64_t j = v10 + 3;
    if (v10 + 3 >= v22) {
      goto LABEL_24;
    }
    unint64_t v11 = *(void *)(v21 + 8 * j);
    if (v11) {
      goto LABEL_19;
    }
    int64_t v12 = v10 + 4;
    if (v12 >= v22)
    {
LABEL_24:
      swift_release(a1);
      return 0LL;
    }

    unint64_t v11 = *(void *)(v21 + 8 * v12);
    for (int64_t j = v12; !v11; ++v12)
    {
      int64_t j = v12 + 1;
      if (__OFADD__(v12, 1LL)) {
        goto LABEL_27;
      }
      if (j >= v22) {
        goto LABEL_24;
      }
      unint64_t v11 = *(void *)(v21 + 8 * j);
    }

LABEL_19:
    unint64_t v5 = (v11 - 1) & v11;
  }

  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

id sub_100007034()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000070A0()
{
  return type metadata accessor for IntentHandler(0LL);
}

uint64_t type metadata accessor for IntentHandler(uint64_t a1)
{
  uint64_t result = qword_100021668;
  if (!qword_100021668) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for IntentHandler);
  }
  return result;
}

void sub_1000070E4(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_100007160(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
  }

void sub_100007160(uint64_t a1)
{
  if (!qword_100021860)
  {
    uint64_t v2 = type metadata accessor for Logger(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100021860);
    }
  }

void sub_1000071B4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100003B38((uint64_t *)&unk_1000216E0);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v11);
  v56 = (char *)&v52 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v52 - v16;
  sub_100005ED0((uint64_t)&v52 - v16);
  uint64_t v18 = swift_bridgeObjectRetain_n(a2, 2LL);
  id v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.default.getter();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v57 = a1;
  if (v21)
  {
    uint64_t v53 = v3;
    uint64_t v22 = swift_slowAlloc(12LL, -1LL);
    unint64_t v54 = v8;
    uint64_t v55 = v9;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc(32LL, -1LL);
    uint64_t v52 = v10;
    uint64_t v25 = v24;
    v60[0] = v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v58 = sub_100015F1C(a1, a2, v60);
    uint64_t v3 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v23 + 4, v23 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Transaction Did Complete for Intent Identifier: %s", v23, 0xCu);
    swift_arrayDestroy(v25, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1LL, -1LL);
    uint64_t v26 = v23;
    unint64_t v8 = v54;
    uint64_t v9 = v55;
    swift_slowDealloc(v26, -1LL, -1LL);

    uint64_t v27 = *(void (**)(char *, uint64_t))(v52 + 8);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
    uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
  }

  v27(v17, v9);
  id v28 = [(id)objc_opt_self(ANDefaults) sharedInstance];
  unsigned __int8 v29 = [v28 BOOLForDefault:ANDefaultPlaybackStatusReturnsImmediately];

  id v30 = (uint64_t *)(v3 + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers);
  swift_beginAccess(v3 + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers, v60, 0LL, 0LL);
  uint64_t v31 = *v30;
  if (*(void *)(*v30 + 16))
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(v31);
    unint64_t v32 = sub_1000149AC(v57, a2);
    if ((v33 & 1) != 0)
    {
      id v34 = *(id *)(*(void *)(v31 + 56) + 8 * v32);
      swift_bridgeObjectRelease(a2);
      swift_bridgeObjectRelease(v31);
      uint64_t AnnouncementIntentHandler = type metadata accessor for ReadAnnouncementIntentHandler(0LL);
      uint64_t v36 = swift_dynamicCastClass(v34, AnnouncementIntentHandler);
      if (v36 && (v29 & 1) == 0)
      {
        uint64_t v37 = v36;
        uint64_t v38 = sub_100005ED0((uint64_t)v56);
        uint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
        os_log_type_t v40 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v39, v40))
        {
          uint64_t v41 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v41 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  v40,  "Intent Handler is Read Announcement Intent Handler",  v41,  2u);
          swift_slowDealloc(v41, -1LL, -1LL);
        }

        v27(v56, v9);
        uint64_t v42 = sub_100005ED0((uint64_t)v13);
        os_log_type_t v43 = (os_log_s *)Logger.logObject.getter(v42);
        os_log_type_t v44 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v43, v44))
        {
          v45 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)v45 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "Requesting announced to stop playing announcements.",  v45,  2u);
          swift_slowDealloc(v45, -1LL, -1LL);
        }

        v27(v13, v9);
        uint64_t v46 = v37 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier;
        swift_beginAccess( v37 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier,  &v58,  0LL,  0LL);
        sub_100007758(v46, (uint64_t)v8, (uint64_t *)&unk_1000216E0);
        uint64_t v47 = type metadata accessor for UUID(0LL);
        uint64_t v48 = *(void *)(v47 - 8);
        Class isa = 0LL;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v8, 1LL, v47) != 1)
        {
          Class isa = UUID._bridgeToObjectiveC()().super.isa;
          (*(void (**)(char *, uint64_t))(v48 + 8))(v8, v47);
        }

        id v50 = [objc_allocWithZone(ANLocalPlaybackSession) initWithEndpointIdentifier:isa];

        id v51 = [(id)objc_opt_self(ANPlaybackCommand) stopCommand];
        [v50 sendPlaybackCommand:v51 completionHandler:0];
      }

      else
      {
      }
    }

    else
    {
      swift_bridgeObjectRelease(a2);
      swift_bridgeObjectRelease(v31);
    }
  }

uint64_t sub_100007758(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003B38(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000779C(uint64_t a1)
{
  uint64_t v2 = sub_100003B38((uint64_t *)&unk_100021AA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000077DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003B38((uint64_t *)&unk_100021AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

void *sub_100007824(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100007848(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

Swift::Int sub_100007868(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100003B38(&qword_1000216F0);
  char v39 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v37) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

void sub_100007B74(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000149AC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100007CD0();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }

LABEL_11:
    v18[(v12 >> 6) + 8] |= 1LL << v12;
    int64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
    *int64_t v22 = a2;
    v22[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v23 = v18[2];
    BOOL v24 = __OFADD__(v23, 1LL);
    uint64_t v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain(a3);
      return;
    }

    goto LABEL_14;
  }

  sub_100007868(v15, a4 & 1);
  unint64_t v20 = sub_1000149AC(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    unint64_t v12 = v20;
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

id sub_100007CD0()
{
  uint64_t v1 = v0;
  sub_100003B38(&qword_1000216F0);
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

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
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

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    id result = v20;
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100007E80(uint64_t a1, unint64_t *a2, void *a3)
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

void *sub_100007EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int64_t v9 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  if (a2)
  {
    id v10 = objc_allocWithZone(&OBJC_CLASS___INSpeakableString);
    swift_bridgeObjectRetain(a2);
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
    id v12 = [v10 initWithSpokenPhrase:v11];
  }

  else
  {
    id v12 = 0LL;
  }

  uint64_t v13 = *(void *)(a3 + 16);
  unint64_t v14 = &_swiftEmptyArrayStorage;
  if (v13)
  {
    uint64_t v71 = &_swiftEmptyArrayStorage;
    id v72 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v13);
    unint64_t v15 = (uint64_t *)(a3 + 40);
    do
    {
      uint64_t v16 = *v15;
      id v17 = objc_allocWithZone((Class)v9[131]);
      swift_bridgeObjectRetain(v16);
      id v18 = v12;
      NSString v19 = String._bridgeToObjectiveC()();
      id v20 = [v17 initWithSpokenPhrase:v19];

      LOWORD(v68) = 0;
      id v21 = objc_msgSend( objc_allocWithZone(INHomeFilter),  "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group :room:isExcludeFilter:hasAllQuantifier:",  0,  0,  1,  37,  0,  37,  v18,  0,  0,  v20,  v68);
      swift_bridgeObjectRelease(v16);

      int64_t v9 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v22 = v71[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v22);
      uint64_t v23 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v21);
      specialized ContiguousArray._endMutation()(v23);
      v15 += 2;
      --v13;
    }

    while (v13);
    unint64_t v14 = v71;
    goto LABEL_10;
  }

  if (*(void *)(a4 + 16))
  {
    id v72 = &_swiftEmptyArrayStorage;
LABEL_10:
    sub_1000085F0((uint64_t)v14);
    uint64_t v24 = *(void *)(a4 + 16);
    uint64_t v25 = &_swiftEmptyArrayStorage;
    if (v24)
    {
      uint64_t v71 = &_swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v24);
      char v26 = (uint64_t *)(a4 + 40);
      do
      {
        uint64_t v27 = *v26;
        id v28 = objc_allocWithZone((Class)v9[131]);
        id v29 = v12;
        swift_bridgeObjectRetain(v27);
        NSString v30 = String._bridgeToObjectiveC()();
        id v31 = [v28 initWithSpokenPhrase:v30];

        LOWORD(v68) = 0;
        id v32 = objc_msgSend( objc_allocWithZone(INHomeFilter),  "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:gro up:room:isExcludeFilter:hasAllQuantifier:",  0,  0,  1,  37,  0,  37,  v29,  v31,  0,  0,  v68);
        swift_bridgeObjectRelease(v27);

        int64_t v9 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        uint64_t v33 = v71[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v33);
        uint64_t v34 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v32);
        specialized ContiguousArray._endMutation()(v34);
        v26 += 2;
        --v24;
      }

      while (v24);
      uint64_t v25 = v71;
    }

    sub_1000085F0((uint64_t)v25);

    return v72;
  }

  if (qword_100021320 != -1) {
    swift_once(&qword_100021320, sub_100004108);
  }
  uint64_t v37 = type metadata accessor for Logger(0LL);
  sub_10000426C(v37, (uint64_t)qword_100021EE0);
  swift_bridgeObjectRetain_n(a3, 2LL);
  uint64_t v38 = swift_bridgeObjectRetain_n(a4, 2LL);
  char v39 = (void *)Logger.logObject.getter(v38);
  os_log_type_t v40 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled((os_log_t)v39, v40))
  {

    swift_bridgeObjectRelease_n(a4, 2LL);
    uint64_t v53 = swift_bridgeObjectRelease_n(a3, 2LL);
    if (a2) {
      goto LABEL_20;
    }
LABEL_24:

    return &_swiftEmptyArrayStorage;
  }

  os_log_type_t type = v40;
  uint64_t v41 = swift_slowAlloc(32LL, -1LL);
  uint64_t v70 = (void *)swift_slowAlloc(96LL, -1LL);
  id v72 = v70;
  *(_DWORD *)uint64_t v41 = 136446722;
  uint64_t v42 = _typeName(_:qualified:)(v5, 0LL);
  unint64_t v44 = v43;
  uint64_t v71 = (void *)sub_100015F1C(v42, v43, (uint64_t *)&v72);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v41 + 4, v41 + 12);
  swift_bridgeObjectRelease(v44);
  *(_WORD *)(v41 + 12) = 2080;
  uint64_t v45 = swift_bridgeObjectRetain(a3);
  uint64_t v46 = Array.description.getter(v45, &type metadata for String);
  unint64_t v48 = v47;
  swift_bridgeObjectRelease(a3);
  uint64_t v71 = (void *)sub_100015F1C(v46, v48, (uint64_t *)&v72);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v41 + 14, v41 + 22);
  swift_bridgeObjectRelease_n(a3, 2LL);
  swift_bridgeObjectRelease(v48);
  *(_WORD *)(v41 + 22) = 2080;
  uint64_t v49 = swift_bridgeObjectRetain(a4);
  uint64_t v50 = Array.description.getter(v49, &type metadata for String);
  unint64_t v52 = v51;
  swift_bridgeObjectRelease(a4);
  uint64_t v71 = (void *)sub_100015F1C(v50, v52, (uint64_t *)&v72);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v41 + 24, v41 + 32);
  swift_bridgeObjectRelease_n(a4, 2LL);
  swift_bridgeObjectRelease(v52);
  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v39,  type,  "(%{public}s) Rooms and Zones empty: %s, %s",  (uint8_t *)v41,  0x20u);
  swift_arrayDestroy(v70, 3LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v70, -1LL, -1LL);
  swift_slowDealloc(v41, -1LL, -1LL);

  if (!a2) {
    goto LABEL_24;
  }
LABEL_20:
  unint64_t v54 = (os_log_s *)Logger.logObject.getter(v53);
  os_log_type_t v55 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v57 = (void *)swift_slowAlloc(32LL, -1LL);
    id v72 = v57;
    *(_DWORD *)v56 = 136446210;
    uint64_t v58 = _typeName(_:qualified:)(v5, 0LL);
    unint64_t v60 = v59;
    uint64_t v71 = (void *)sub_100015F1C(v58, v59, (uint64_t *)&v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v56 + 4, v56 + 12);
    swift_bridgeObjectRelease(v60);
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "(%{public}s) Creating filter with Home only", v56, 0xCu);
    swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v57, -1LL, -1LL);
    swift_slowDealloc(v56, -1LL, -1LL);
  }

  uint64_t v61 = sub_100003B38(&qword_100021770);
  uint64_t v62 = (_OWORD *)swift_allocObject(v61, 40LL, 7LL);
  v62[1] = xmmword_100017BB0;
  id v63 = objc_allocWithZone(&OBJC_CLASS___INSpeakableString);
  swift_bridgeObjectRetain(a2);
  NSString v64 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v65 = [v63 initWithSpokenPhrase:v64];

  LOWORD(v68) = 0;
  id v66 = objc_msgSend( objc_allocWithZone(INHomeFilter),  "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:roo m:isExcludeFilter:hasAllQuantifier:",  0,  0,  1,  37,  0,  37,  v65,  0,  0,  0,  v68);

  *((void *)v62 + 4) = v66;
  id v72 = v62;
  specialized Array._endMutation()(v67);
  uint64_t v35 = v72;

  return v35;
}

uint64_t sub_1000085F0(uint64_t a1)
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
    uint64_t result = sub_1000087A8(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
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

uint64_t sub_1000087A8(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_1000089A0();
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_100003B38(&qword_100021778);
          BOOL v13 = sub_100014CC8(v18, i, a3);
          id v15 = *v14;
          ((void (*)(void (**)(id *), void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
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

  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1000047FC();
    swift_arrayInitWithCopy(a1);
    return a3;
  }

LABEL_26:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

    uint64_t v53 = *(void *)(v0 + 280);
    swift_bridgeObjectRelease(v4);
    unint64_t v54 = sub_10000C0D0(v53);
    os_log_type_t v55 = (os_log_s *)Logger.logObject.getter(v54);
    v56 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  v56,  "Contains Recipients with no announcement identifier. Unable to determine context for home.",  v57,  2u);
      swift_slowDealloc(v57, -1LL, -1LL);
    }

    uint64_t v58 = *(void *)(v0 + 280);
    unint64_t v59 = *(void *)(v0 + 248);
    unint64_t v60 = *(void *)(v0 + 256);

    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v58, v59);
    uint64_t v61 = sub_100003B38(&qword_100021770);
    id v21 = swift_allocObject(v61, 40LL, 7LL);
    *(_OWORD *)(v21 + 16) = xmmword_100017BB0;
    uint64_t v62 = sub_100007E80(0LL, &qword_100021A80, &OBJC_CLASS___INSendAnnouncementRecipientResolutionResult_ptr);
    uint64_t v23 = [(id)swift_getObjCClassFromMetadata(v62) unsupported];
    goto LABEL_29;
  }

  uint64_t v12 = *(void *)(v0 + 272);
  swift_bridgeObjectRelease(v4);
  BOOL v13 = sub_10000C0D0(v12);
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  id v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Recipients contain home name. No additional resolution required.",  v16,  2u);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  uint64_t v17 = *(void *)(v0 + 272);
  uint64_t v18 = *(void *)(v0 + 248);
  NSString v19 = *(void *)(v0 + 256);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  id v20 = sub_100003B38(&qword_100021770);
  id v21 = swift_allocObject(v20, 40LL, 7LL);
  *(_OWORD *)(v21 + 16) = xmmword_100017BB0;
  uint64_t v22 = sub_100007E80(0LL, &qword_100021A80, &OBJC_CLASS___INSendAnnouncementRecipientResolutionResult_ptr);
  uint64_t v23 = [(id)swift_getObjCClassFromMetadata(v22) notRequired];
LABEL_29:
  id v63 = v23;
  *(void *)(v21 + 32) = v63;
  specialized Array._endMutation()(v63);
  NSString v64 = *(void *)(v0 + 272);
  id v65 = *(void *)(v0 + 264);
  swift_task_dealloc(*(void *)(v0 + 280));
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
}

        uint64_t v9 = (v19 - 1) & v19;
        uint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      id v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
      uint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
      uint64_t v25 = result & ~v24;
      char v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        uint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v27 = 0;
        id v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          id v29 = v26 == v28;
          if (v26 == v28) {
            char v26 = 0LL;
          }
          v27 |= v29;
          NSString v30 = *(void *)(v11 + 8 * v26);
        }

        while (v30 == -1);
        uint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      id v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
      *id v15 = v22;
      v15[1] = v23;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    uint64_t v10 = (v19 - 1) & v19;
    uint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    id v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    uint64_t result = Hasher._finalize()();
    uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
    uint64_t v25 = result & ~v24;
    char v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      uint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v27 = 0;
      id v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        id v29 = v26 == v28;
        if (v26 == v28) {
          char v26 = 0LL;
        }
        v27 |= v29;
        NSString v30 = *(void *)(v11 + 8 * v26);
      }

      while (v30 == -1);
      uint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    id v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
    *id v15 = v22;
    v15[1] = v23;
    ++*(void *)(v6 + 16);
  }

  id v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_38;
  }

  NSString v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    BOOL v13 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    BOOL v13 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_36;
    }
    NSString v19 = *(void *)(v8 + 8 * v13);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

unint64_t sub_1000089A0()
{
  unint64_t result = qword_100021780;
  if (!qword_100021780)
  {
    uint64_t v1 = sub_1000089EC(&qword_100021778);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021780);
  }

  return result;
}

uint64_t sub_1000089EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100008A30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100003B38((uint64_t *)&unk_100021AA0);
  uint64_t v4 = __chkstk_darwin(v3);
  unint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler____lazy_storage___logger;
  swift_beginAccess( v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler____lazy_storage___logger,  v14,  0LL,  0LL);
  sub_100007758(v9, (uint64_t)v8, (uint64_t *)&unk_100021AA0);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  sub_10000BCE0((uint64_t)v8, (uint64_t *)&unk_100021AA0);
  if (qword_100021328 != -1) {
    swift_once(&qword_100021328, sub_100004188);
  }
  Logger.init(_:)((id)qword_100021EF8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0LL, 1LL, v10);
  swift_beginAccess(v9, v13, 33LL, 0LL);
  sub_10000BA50((uint64_t)v6, v9, (uint64_t *)&unk_100021AA0);
  return swift_endAccess(v13);
}

id sub_100008BD8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReadAnnouncementIntentHandler(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100008C10()
{
  uint64_t v1 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce);
  if (v2)
  {
    [v2 setDelegate:0];
    uint64_t v3 = *(void **)(v0 + v1);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  *(void *)(v0 + v1) = 0LL;

  uint64_t v4 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession;
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession);
  if (v5)
  {
    [v5 setDelegate:0];
    uint64_t v5 = *(void **)(v0 + v4);
  }

  *(void *)(v0 + v4) = 0LL;
}

uint64_t sub_100008D3C()
{
  return type metadata accessor for ReadAnnouncementIntentHandler(0LL);
}

uint64_t type metadata accessor for ReadAnnouncementIntentHandler(uint64_t a1)
{
  uint64_t result = qword_100021838;
  if (!qword_100021838) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ReadAnnouncementIntentHandler);
  }
  return result;
}

uint64_t sub_100008D80(uint64_t a1)
{
  v2[18] = a1;
  v2[19] = v1;
  unint64_t v3 = (*(void *)(*(void *)(sub_100003B38((uint64_t *)&unk_1000216E0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[20] = swift_task_alloc(v3);
  v2[21] = swift_task_alloc(v3);
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v2[22] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[23] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[24] = swift_task_alloc(v6);
  v2[25] = swift_task_alloc(v6);
  v2[26] = swift_task_alloc(v6);
  v2[27] = swift_task_alloc(v6);
  return swift_task_switch(sub_100008E3C, 0LL, 0LL);
}

uint64_t sub_100008E3C()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce;
  unint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce);
  uint64_t v105 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce;
  uint64_t v106 = v0 + 136;
  if (v3) {
    goto LABEL_2;
  }
  uint64_t v107 = v0 + 64;
  uint64_t v8 = (id *)(v0 + 144);
  uint64_t v7 = *(void **)(v0 + 144);
  sub_100008A30(*(void *)(v0 + 216));
  uint64_t v9 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v104 = v1;
    id v11 = *v8;
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    BOOL v13 = (void *)swift_slowAlloc(32LL, -1LL);
    uint64_t v109 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    id v14 = [v11 _metadata];
    id v15 = v14;
    if (v14)
    {
      id v16 = [v14 endpointId];

      if (v16)
      {
        uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
        id v15 = v18;
      }

      else
      {
        uint64_t v17 = 0LL;
        id v15 = 0LL;
      }
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    uint64_t v101 = *(void *)(v0 + 184);
    uint64_t v102 = *(void *)(v0 + 176);
    uint64_t v103 = *(void *)(v0 + 216);
    uint64_t v23 = *(void **)(v0 + 144);
    *(void *)(v0 + 88) = v17;
    *(void *)(v0 + 96) = v15;
    uint64_t v24 = sub_100003B38((uint64_t *)&unk_100021460);
    uint64_t v25 = String.init<A>(describing:)(v0 + 88, v24);
    unint64_t v27 = v26;
    *(void *)(v0 + 136) = sub_100015F1C(v25, v26, (uint64_t *)&v109);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v106, v0 + 144, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease(v27);

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "EndpointID = %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);

    (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v103, v102);
    uint64_t v1 = v104;
    uint64_t v2 = v105;
  }

  else
  {
    uint64_t v19 = *(void *)(v0 + 216);
    uint64_t v21 = *(void *)(v0 + 176);
    uint64_t v20 = *(void *)(v0 + 184);
    uint64_t v22 = *(void **)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }

  id v28 = [*v8 _metadata];
  if (v28
    && (id v29 = v28, v30 = [v28 endpointId], v29, v30))
  {
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
    uint64_t v33 = v32;

    UUID.init(uuidString:)(v31, v33);
    swift_bridgeObjectRelease(v33);
  }

  else
  {
    uint64_t v34 = *(void *)(v0 + 168);
    uint64_t v35 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56LL))(v34, 1LL, 1LL, v35);
  }

  uint64_t v37 = *(void *)(v0 + 160);
  uint64_t v36 = *(void *)(v0 + 168);
  uint64_t v38 = *(void *)(v0 + 152)
      + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier;
  swift_beginAccess(v38, v107, 33LL, 0LL);
  sub_10000BA50(v36, v38, (uint64_t *)&unk_1000216E0);
  swift_endAccess(v107);
  sub_100007758(v38, v37, (uint64_t *)&unk_1000216E0);
  uint64_t v39 = type metadata accessor for UUID(0LL);
  uint64_t v40 = *(void *)(v39 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v37, 1LL, v39) != 1)
  {
    uint64_t v42 = *(void *)(v0 + 160);
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v39);
  }

  id v43 = [objc_allocWithZone(ANAnnounce) initWithEndpointIdentifier:isa];

  unint64_t v44 = *(void **)(v1 + v2);
  *(void *)(v1 + v2) = v43;

  uint64_t v45 = *(void **)(v1 + v2);
  if (!v45) {
    goto LABEL_19;
  }
  [v45 setDelegate:*(void *)(v0 + 152)];
  unint64_t v3 = *(void **)(v1 + v2);
  if (v3)
  {
LABEL_2:
    id v4 = [v3 unplayedAnnouncements];
    uint64_t v5 = sub_100007E80(0LL, (unint64_t *)&unk_100021920, &OBJC_CLASS___ANAnnouncementContext_ptr);
    unint64_t v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);
  }

  else
  {
LABEL_19:
    unint64_t v6 = &_swiftEmptyArrayStorage;
  }

  uint64_t v46 = (uint64_t *)(v0 + 104);
  char v108 = (uint64_t *)(v0 + 120);
  uint64_t v51 = *(void *)(v0 + 208);
  uint64_t v47 = *(void *)(v0 + 152);
  *(void *)(v0 + 104) = v6;
  uint64_t v48 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions;
  *(void *)(v47 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions) = 128LL;
  uint64_t v49 = sub_100008A30(v51);
  uint64_t v50 = (os_log_s *)Logger.logObject.getter(v49);
  LOBYTE(v51) = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v50, (os_log_type_t)v51)) {
    goto LABEL_24;
  }
  uint64_t v104 = v1;
  unint64_t v52 = (uint64_t *)(v0 + 112);
  uint64_t v53 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  *(_DWORD *)uint64_t v53 = 134217984;
  swift_beginAccess(v0 + 104, v0 + 16, 0LL, 0LL);
  uint64_t v1 = *v46;
  uint64_t v54 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    uint64_t *v52 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v52, v108, v53 + 4, v53 + 12);
    _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v51, "Unheard Announcements (%ld)", v53, 0xCu);
    swift_slowDealloc(v53, -1LL, -1LL);
    uint64_t v1 = v104;
LABEL_24:
    uint64_t v55 = *(void *)(v0 + 208);
    uint64_t v56 = *(void *)(v0 + 176);
    uint64_t v57 = *(void *)(v0 + 184);

    unint64_t v52 = *(uint64_t **)(v57 + 8);
    ((void (*)(uint64_t, uint64_t))v52)(v55, v56);
    swift_beginAccess(v0 + 104, v0 + 40, 1LL, 0LL);
    uint64_t v58 = *(void *)(v0 + 104);
    if ((unint64_t)v58 >> 62)
    {
      if (v58 < 0) {
        uint64_t v79 = *(void *)(v0 + 104);
      }
      else {
        uint64_t v79 = v58 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(*(void *)(v0 + 104));
      uint64_t v80 = _CocoaArrayWrapper.endIndex.getter(v79);
      swift_bridgeObjectRelease(v58);
      uint64_t v53 = (uint8_t *)(v0 + 128);
      if (v80) {
        goto LABEL_36;
      }
    }

    else
    {
      uint64_t v53 = (uint8_t *)(v0 + 128);
      if (*(void *)((v58 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
        goto LABEL_36;
      }
    }

    unint64_t v59 = *(void **)(v1 + v105);
    if (v59)
    {
      id v60 = [v59 receivedAnnouncements];
      uint64_t v61 = sub_100007E80(0LL, (unint64_t *)&unk_100021920, &OBJC_CLASS___ANAnnouncementContext_ptr);
      uint64_t v62 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v60, v61);
    }

    else
    {
      uint64_t v62 = &_swiftEmptyArrayStorage;
    }

    uint64_t v63 = *v46;
    *uint64_t v46 = (uint64_t)v62;
    swift_bridgeObjectRelease(v63);
    uint64_t v64 = *(void *)(v47 + v48);
    if ((v64 & 0x40) == 0) {
      *(void *)(v47 + v48) = v64 | 0x40;
    }
    uint64_t v65 = sub_100008A30(*(void *)(v0 + 200));
    id v66 = (os_log_s *)Logger.logObject.getter(v65);
    os_log_type_t v67 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v68 = 134217984;
      uint64_t v47 = *v46;
      if ((unint64_t)*v46 >> 62)
      {
        if (v47 < 0) {
          uint64_t v100 = *v46;
        }
        else {
          uint64_t v100 = v47 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(*v46);
        uint64_t v69 = _CocoaArrayWrapper.endIndex.getter(v100);
        swift_bridgeObjectRelease(v47);
      }

      else
      {
        uint64_t v69 = *(void *)((v47 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      }

      *char v108 = v69;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v108, v53, v68 + 4, v68 + 12);
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "All Announcements (%ld)", v68, 0xCu);
      swift_slowDealloc(v68, -1LL, -1LL);
    }

    uint64_t v70 = *(void *)(v0 + 200);
    uint64_t v71 = *(void *)(v0 + 176);

    ((void (*)(uint64_t, uint64_t))v52)(v70, v71);
LABEL_36:
    uint64_t v48 = *v46;
    if ((unint64_t)*v46 >> 62)
    {
      if (v48 < 0) {
        uint64_t v81 = *v46;
      }
      else {
        uint64_t v81 = v48 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(*v46);
      uint64_t v51 = _CocoaArrayWrapper.endIndex.getter(v81);
      if (!v51)
      {
LABEL_54:
        swift_bridgeObjectRelease(v48);
        uint64_t v78 = (uint64_t)&_swiftEmptyArrayStorage;
        goto LABEL_55;
      }
    }

    else
    {
      uint64_t v51 = *(void *)((v48 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      swift_bridgeObjectRetain(*v46);
      if (!v51) {
        goto LABEL_54;
      }
    }

    uint64_t v109 = &_swiftEmptyArrayStorage;
    uint64_t v50 = (os_log_s *)&v109;
    specialized ContiguousArray.reserveCapacity(_:)(v51);
    if ((v51 & 0x8000000000000000LL) == 0) {
      break;
    }
    __break(1u);
LABEL_64:
    if (v1 < 0) {
      uint64_t v98 = v1;
    }
    else {
      uint64_t v98 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v54 = _CocoaArrayWrapper.endIndex.getter(v98);
    swift_bridgeObjectRelease(v1);
  }

  uint64_t v72 = 0LL;
  do
  {
    if ((v48 & 0xC000000000000001LL) != 0) {
      id v73 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v72, v48);
    }
    else {
      id v73 = *(id *)(v48 + 8 * v72 + 32);
    }
    os_log_type_t v74 = v73;
    ++v72;
    id v75 = sub_100004358();

    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v76 = v109[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v76);
    uint64_t v77 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v76, v75);
    specialized ContiguousArray._endMutation()(v77);
  }

  while (v51 != v72);
  uint64_t v78 = (uint64_t)v109;
  swift_bridgeObjectRelease(v48);
LABEL_55:
  if (qword_100021338 != -1) {
    swift_once(&qword_100021338, sub_1000042E0);
  }
  uint64_t v82 = *(void *)(v0 + 192);
  uint64_t v83 = *(void *)(qword_100021F08 + 16);
  *(void *)(qword_100021F08 + 16) = v78;
  swift_bridgeObjectRetain(v78);
  swift_bridgeObjectRelease(v83);
  id v84 = [objc_allocWithZone(INReadAnnouncementIntentResponse) initWithCode:1 userActivity:0];
  sub_100007E80(0LL, (unint64_t *)&qword_100021470, &OBJC_CLASS___INAnnouncementRecord_ptr);
  Class v85 = Array._bridgeToObjectiveC()().super.isa;
  [v84 setAnnouncementRecords:v85];

  sub_100008A30(v82);
  uint64_t v86 = swift_bridgeObjectRetain(v78);
  unint64_t v87 = (os_log_s *)Logger.logObject.getter(v86);
  os_log_type_t v88 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v87, v88))
  {
    v89 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)v89 = 134217984;
    if ((unint64_t)v78 >> 62)
    {
      if (v78 < 0) {
        uint64_t v99 = v78;
      }
      else {
        uint64_t v99 = v78 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v78);
      uint64_t v90 = _CocoaArrayWrapper.endIndex.getter(v99);
      swift_bridgeObjectRelease(v78);
    }

    else
    {
      uint64_t v90 = *(void *)((v78 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    swift_bridgeObjectRelease(v78);
    *(void *)uint64_t v53 = v90;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v53, v106, v89 + 4, v89 + 12);
    swift_bridgeObjectRelease(v78);
    _os_log_impl( (void *)&_mh_execute_header,  v87,  v88,  "Confirmed Read Announcement Intent with announcement count: %ld",  v89,  0xCu);
    swift_slowDealloc(v89, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v78, 2LL);
  }

  uint64_t v91 = *(void *)(v0 + 208);
  uint64_t v92 = *(void *)(v0 + 216);
  uint64_t v94 = *(void *)(v0 + 192);
  uint64_t v93 = *(void *)(v0 + 200);
  uint64_t v95 = *(void *)(v0 + 168);
  uint64_t v96 = *(void *)(v0 + 160);
  ((void (*)(uint64_t, void))v52)(v94, *(void *)(v0 + 176));
  swift_bridgeObjectRelease(*(void *)(v0 + 104));
  swift_task_dealloc(v92);
  swift_task_dealloc(v91);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  return (*(uint64_t (**)(id))(v0 + 8))(v84);
}

uint64_t sub_1000099D4(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_10002184C;
  id v7 = a1;
  a3;
  uint64_t v8 = (void *)swift_task_alloc(v6);
  v3[5] = v8;
  void *v8 = v3;
  v8[1] = sub_10000BD1C;
  return sub_100008D80((uint64_t)v7);
}

uint64_t sub_100009A50(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = sub_100003B38((uint64_t *)&unk_1000218C8);
  v2[14] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v4 = (*(void *)(*(void *)(sub_100003B38((uint64_t *)&unk_1000216E0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[15] = swift_task_alloc(v4);
  v2[16] = swift_task_alloc(v4);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v2[17] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[18] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[19] = swift_task_alloc(v7);
  v2[20] = swift_task_alloc(v7);
  v2[21] = swift_task_alloc(v7);
  v2[22] = swift_task_alloc(v7);
  v2[23] = swift_task_alloc(v7);
  v2[24] = swift_task_alloc(v7);
  return swift_task_switch(sub_100009B48, 0LL, 0LL);
}

uint64_t sub_100009B48()
{
  uint64_t v2 = (id *)(v0 + 12);
  uint64_t v1 = (void *)v0[12];
  sub_100008A30(v0[24]);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  v145 = v0;
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (void *)v0[12];
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v142 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v6 = 138412290;
    v0[11] = v5;
    id v7 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 11, v2, v6 + 4, v6 + 12);
    void *v142 = v5;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received Read Announcement Intent: %@", v6, 0xCu);
    uint64_t v8 = sub_100003B38(&qword_100021700);
    swift_arrayDestroy(v142, 1LL, v8);
    swift_slowDealloc(v142, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {
    id v9 = *v2;
  }

  os_log_type_t v10 = (id *)(v0 + 12);

  v143 = *(void (**)(uint64_t, uint64_t))(v0[18] + 8LL);
  v143(v0[24], v0[17]);
  if (qword_100021338 != -1) {
    swift_once(&qword_100021338, sub_1000042E0);
  }
  id v11 = v0 + 10;
  uint64_t v12 = *(void *)(qword_100021F08 + 16);
  v0[25] = v12;
  unint64_t v13 = (unint64_t)v12 >> 62;
  if (!((unint64_t)v12 >> 62))
  {
    uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v12);
    if (v14) {
      goto LABEL_8;
    }
LABEL_72:
    unint64_t v26 = v145;
    sub_100008A30(v145[19]);
    uint64_t v117 = swift_bridgeObjectRetain_n(v12, 2LL);
    v118 = (os_log_s *)Logger.logObject.getter(v117);
    os_log_type_t v119 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v118, v119))
    {
      uint64_t v120 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v120 = 134217984;
      if (v13)
      {
        if (v12 < 0) {
          uint64_t v122 = v12;
        }
        else {
          uint64_t v122 = v12 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v12);
        uint64_t v121 = _CocoaArrayWrapper.endIndex.getter(v122);
        swift_bridgeObjectRelease(v12);
      }

      else
      {
        uint64_t v121 = *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      }

      swift_bridgeObjectRelease(v12);
      v145[10] = v121;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v11, v145 + 11, v120 + 4, v120 + 12);
      swift_bridgeObjectRelease(v12);
      _os_log_impl((void *)&_mh_execute_header, v118, v119, "No announcements to play back. (%ld)", v120, 0xCu);
      swift_slowDealloc(v120, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v12, 2LL);
    }

    v143(v145[19], v145[17]);
    id v123 = [objc_allocWithZone(INReadAnnouncementIntentResponse) initWithCode:3 userActivity:0];
    sub_100007E80(0LL, (unint64_t *)&qword_100021470, &OBJC_CLASS___INAnnouncementRecord_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12);
    id v144 = v123;
    [v123 setAnnouncementRecords:isa];
LABEL_82:
    uint64_t v125 = v26[23];
    uint64_t v124 = v26[24];
    uint64_t v127 = v26[21];
    uint64_t v126 = v26[22];
    v128 = v26;
    uint64_t v129 = v26[20];
    uint64_t v130 = v128[19];
    uint64_t v131 = v128[15];
    uint64_t v132 = v128[16];
    uint64_t v146 = v128[14];

    swift_task_dealloc(v124);
    swift_task_dealloc(v125);
    swift_task_dealloc(v126);
    swift_task_dealloc(v127);
    swift_task_dealloc(v129);
    swift_task_dealloc(v130);
    swift_task_dealloc(v132);
    swift_task_dealloc(v131);
    swift_task_dealloc(v146);
    return ((uint64_t (*)(id))v128[1])(v144);
  }

  if (v12 < 0) {
    uint64_t v116 = v12;
  }
  else {
    uint64_t v116 = v12 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(v12, 2LL);
  uint64_t v14 = _CocoaArrayWrapper.endIndex.getter(v116);
  swift_bridgeObjectRelease(v12);
  if (!v14) {
    goto LABEL_72;
  }
LABEL_8:
  v139 = (uint64_t *)(v10 - 4);
  v141 = v10;
  id v15 = (uint64_t *)(v10 - 3);
  id v16 = (void *)v145[12];
  id v17 = [(id)objc_opt_self(ANDefaults) sharedInstance];
  unsigned int v140 = [v17 BOOLForDefault:ANDefaultPlaybackStatusReturnsImmediately];

  if ([v16 _idiom] != (id)5)
  {
    sub_100008A30(v145[22]);
    uint64_t v23 = swift_bridgeObjectRetain_n(v12, 2LL);
    uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.default.getter();
    unint64_t v26 = v145;
    if (os_log_type_enabled(v24, v25))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)unint64_t v27 = 134217984;
      id v28 = v141;
      if (v13)
      {
        if (v12 < 0) {
          uint64_t v44 = v12;
        }
        else {
          uint64_t v44 = v12 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v12);
        uint64_t v29 = _CocoaArrayWrapper.endIndex.getter(v44);
        swift_bridgeObjectRelease(v12);
      }

      else
      {
        uint64_t v29 = *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      }

      swift_bridgeObjectRelease(v12);
      uint64_t *v139 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v139, v15, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease(v12);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Requesting playback for announcements (%ld)", v27, 0xCu);
      swift_slowDealloc(v27, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v12, 2LL);
      id v28 = v141;
    }

    uint64_t v45 = v145[13];
    v143(v145[22], v145[17]);
    uint64_t v46 = *(void *)(v45 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions);
    if ((v46 & 0x20) == 0) {
      *(void *)(v45 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions) = v46 | 0x20;
    }
    id v47 = [*v28 startAnnouncementIdentifier];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
      uint64_t v51 = v50;

      uint64_t v52 = sub_100003B38((uint64_t *)&unk_100021900);
      uint64_t v33 = (char *)swift_allocObject(v52, 48LL, 7LL);
      *((_OWORD *)v33 + 1) = xmmword_100017BC0;
      *((void *)v33 + 4) = v49;
      *((void *)v33 + 5) = v51;
    }

    else
    {
      uint64_t v33 = (char *)&_swiftEmptyArrayStorage;
    }

LABEL_46:
    uint64_t v53 = v26[13];
    uint64_t v54 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession;
    if (*(void *)(v53 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession))
    {
LABEL_63:
      uint64_t v94 = (void *)objc_opt_self(&OBJC_CLASS___ANPlaybackCommand);
      uint64_t v95 = *(void *)(v53 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions);
      Class v96 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v33);
      id v97 = [v94 playCommandWithOptions:v95 announcementIdentifiers:v96];
      v26[26] = v97;

      if (!v140)
      {
        id v115 = (void *)swift_task_alloc(dword_1000218DC);
        v26[27] = v115;
        *id v115 = v26;
        v115[1] = sub_10000A96C;
        return sub_10000AB8C((uint64_t)v97);
      }

      uint64_t v98 = sub_100008A30(v26[20]);
      uint64_t v99 = (os_log_s *)Logger.logObject.getter(v98);
      os_log_type_t v100 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v99, v100))
      {
        uint64_t v101 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v101 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v99,  v100,  "Not waiting for playback to complete. Returning success early.",  v101,  2u);
        swift_slowDealloc(v101, -1LL, -1LL);
      }

      uint64_t v102 = v26[20];
      uint64_t v103 = v26[17];
      uint64_t v104 = (void *)v26[13];
      uint64_t v105 = v26[14];

      v143(v102, v103);
      uint64_t v106 = type metadata accessor for TaskPriority(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v106 - 8) + 56LL))(v105, 1LL, 1LL, v106);
      uint64_t v107 = (void *)swift_allocObject(&unk_10001CAF8, 48LL, 7LL);
      v107[2] = 0LL;
      v107[3] = 0LL;
      v107[4] = v104;
      v107[5] = v97;
      id v108 = v104;
      id v109 = v97;
      uint64_t v110 = sub_10000B0E4(v105, (uint64_t)&unk_1000218F0, (uint64_t)v107);
      swift_release(v110);
      uint64_t v111 = v26[25];
      id v112 = [objc_allocWithZone(INReadAnnouncementIntentResponse) initWithCode:3 userActivity:0];
      sub_100007E80(0LL, (unint64_t *)&qword_100021470, &OBJC_CLASS___INAnnouncementRecord_ptr);
      Class v113 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v111);
      id v144 = v112;
      [v112 setAnnouncementRecords:v113];

      Class isa = (Class)v26[26];
      goto LABEL_82;
    }

    uint64_t v55 = v28 - 10;
    uint64_t v56 = v28;
    uint64_t v57 = (void *)v26[12];
    sub_100008A30(v26[21]);
    uint64_t v58 = (void *)Logger.logObject.getter(v57);
    os_log_type_t v59 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled((os_log_t)v58, v59))
    {
      uint64_t v68 = v26[21];
      uint64_t v69 = v26[17];
      uint64_t v70 = (void *)v26[12];

      v143(v68, v69);
      goto LABEL_55;
    }

    v138 = v55;
    v135 = v56 - 7;
    v136 = v56 - 5;
    id v60 = *v56;
    uint64_t v61 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v62 = swift_slowAlloc(32LL, -1LL);
    uint64_t v147 = v62;
    *(_DWORD *)uint64_t v61 = 136315138;
    id v63 = [v60 _metadata];
    uint64_t v64 = v63;
    uint64_t v137 = v62;
    if (v63)
    {
      id v65 = [v63 endpointId];

      if (v65)
      {
        uint64_t v64 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v65);
        uint64_t v67 = v66;

LABEL_54:
        uint64_t v133 = v145[17];
        uint64_t v134 = v145[21];
        uint64_t v71 = (void *)v145[12];
        v145[5] = v64;
        v145[6] = v67;
        unint64_t v26 = v145;
        uint64_t v72 = sub_100003B38((uint64_t *)&unk_100021460);
        uint64_t v73 = String.init<A>(describing:)(v135, v72);
        unint64_t v75 = v74;
        v145[7] = sub_100015F1C(v73, v74, &v147);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v136, v139, v61 + 4, v61 + 12);

        swift_bridgeObjectRelease(v75);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v58, v59, "EndpointID = %s", v61, 0xCu);
        swift_arrayDestroy(v137, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v137, -1LL, -1LL);
        swift_slowDealloc(v61, -1LL, -1LL);

        v143(v134, v133);
        uint64_t v55 = v138;
LABEL_55:
        id v76 = [*v141 _metadata];
        if (v76
          && (uint64_t v77 = v76,
              id v78 = [v76 endpointId],
              v77,
              v78))
        {
          uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)(v78);
          uint64_t v81 = v80;

          UUID.init(uuidString:)(v79, v81);
          swift_bridgeObjectRelease(v81);
        }

        else
        {
          uint64_t v82 = v26[16];
          uint64_t v83 = type metadata accessor for UUID(0LL);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 56LL))(v82, 1LL, 1LL, v83);
        }

        uint64_t v85 = v26[15];
        uint64_t v84 = v26[16];
        uint64_t v86 = v26[13] + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier;
        swift_beginAccess(v86, v55, 33LL, 0LL);
        sub_10000BA50(v84, v86, (uint64_t *)&unk_1000216E0);
        swift_endAccess(v55);
        sub_100007758(v86, v85, (uint64_t *)&unk_1000216E0);
        uint64_t v87 = type metadata accessor for UUID(0LL);
        uint64_t v88 = *(void *)(v87 - 8);
        Class v89 = 0LL;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v88 + 48))(v85, 1LL, v87) != 1)
        {
          uint64_t v90 = v26[15];
          Class v89 = UUID._bridgeToObjectiveC()().super.isa;
          (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v90, v87);
        }

        id v91 = [objc_allocWithZone(ANLocalPlaybackSession) initWithEndpointIdentifier:v89];

        uint64_t v92 = *(void **)(v53 + v54);
        *(void *)(v53 + v54) = v91;

        uint64_t v93 = *(void **)(v53 + v54);
        uint64_t v53 = v26[13];
        if (v93)
        {
          [v93 setDelegate:v26[13]];
          uint64_t v53 = v26[13];
        }

        goto LABEL_63;
      }

      uint64_t v64 = 0LL;
    }

    uint64_t v67 = 0LL;
    goto LABEL_54;
  }

  sub_100008A30(v145[23]);
  uint64_t v18 = swift_bridgeObjectRetain_n(v12, 2LL);
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v21 = 134217984;
    if (v13)
    {
      if (v12 < 0) {
        uint64_t v30 = v12;
      }
      else {
        uint64_t v30 = v12 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v12);
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter(v30);
      swift_bridgeObjectRelease(v12);
    }

    else
    {
      uint64_t v22 = *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    swift_bridgeObjectRelease(v12);
    *id v15 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v15, v11, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease(v12);
    _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "Requesting playback (CarPlay) for announcements (%ld)",  v21,  0xCu);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v12, 2LL);
  }

  uint64_t result = ((uint64_t (*)(void, void))v143)(v145[23], v145[17]);
  if (v14 >= 1)
  {
    swift_bridgeObjectRetain(v12);
    uint64_t v32 = 0LL;
    uint64_t v33 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if ((v12 & 0xC000000000000001LL) != 0) {
        id v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v32, v12);
      }
      else {
        id v34 = *(id *)(v12 + 8 * v32 + 32);
      }
      uint64_t v35 = v34;
      id v36 = [v34 identifier];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
        uint64_t v40 = v39;

        if ((swift_isUniquelyReferenced_nonNull_native(v33) & 1) == 0) {
          uint64_t v33 = sub_10000B710(0LL, *((void *)v33 + 2) + 1LL, 1, v33);
        }
        unint64_t v42 = *((void *)v33 + 2);
        unint64_t v41 = *((void *)v33 + 3);
        if (v42 >= v41 >> 1) {
          uint64_t v33 = sub_10000B710((char *)(v41 > 1), v42 + 1, 1, v33);
        }
        *((void *)v33 + 2) = v42 + 1;
        id v43 = &v33[16 * v42];
        *((void *)v43 + 4) = v38;
        *((void *)v43 + 5) = v40;
      }

      else
      {
      }

      ++v32;
    }

    while (v14 != v32);
    swift_bridgeObjectRelease(v12);
    unint64_t v26 = v145;
    id v28 = v141;
    goto LABEL_46;
  }

  __break(1u);
  return result;
}

uint64_t sub_10000A96C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 216LL);
  *(void *)(*(void *)v1 + 224LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10000A9C8, 0LL, 0LL);
}

uint64_t sub_10000A9C8()
{
  uint64_t v1 = *(void *)(v0 + 200);
  id v13 = [objc_allocWithZone(INReadAnnouncementIntentResponse) initWithCode:*(void *)(v0 + 224) userActivity:0];
  sub_100007E80(0LL, (unint64_t *)&qword_100021470, &OBJC_CLASS___INAnnouncementRecord_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v1);
  [v13 setAnnouncementRecords:isa];

  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v6 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 176);
  uint64_t v8 = *(void *)(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 112);

  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(id))(v0 + 8))(v13);
}

uint64_t sub_10000AAF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_1000218DC);
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_10000AB44;
  return sub_10000AB8C(a5);
}

uint64_t sub_10000AB44()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000AB8C(uint64_t a1)
{
  v2[24] = a1;
  v2[25] = v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[26] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[27] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[28] = swift_task_alloc(v5);
  v2[29] = swift_task_alloc(v5);
  return swift_task_switch(sub_10000ABFC, 0LL, 0LL);
}

uint64_t sub_10000ABFC()
{
  *(void *)(v0 + 240) = v1;
  if (v1)
  {
    uint64_t v2 = v0 + 16;
    uint64_t v3 = *(void *)(v0 + 192);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_10000AD6C;
    uint64_t v4 = swift_continuation_init(v0 + 16, 1LL);
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    unint64_t v5 = (void *)(v0 + 80);
    v5[1] = 0x40000000LL;
    v5[2] = sub_100015930;
    v5[3] = &unk_10001CB38;
    v5[4] = v4;
    [v1 sendPlaybackCommand:v3 completionHandler:v5];
    return swift_continuation_await(v2);
  }

  else
  {
    uint64_t v7 = sub_100008A30(*(void *)(v0 + 232));
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Playback Completed", v10, 2u);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    uint64_t v11 = *(void *)(v0 + 232);
    uint64_t v12 = *(void *)(v0 + 208);
    uint64_t v13 = *(void *)(v0 + 216);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    uint64_t v14 = *(void *)(v0 + 224);
    swift_task_dealloc(*(void *)(v0 + 232));
    swift_task_dealloc(v14);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(3LL);
  }

uint64_t sub_10000AD6C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 248LL) = v1;
  if (v1) {
    uint64_t v2 = sub_10000AEB0;
  }
  else {
    uint64_t v2 = sub_10000ADCC;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10000ADCC()
{
  uint64_t v1 = sub_100008A30(*(void *)(v0 + 232));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Playback Completed", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v6 = *(void *)(v0 + 208);
  uint64_t v7 = *(void *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  uint64_t v8 = *(void *)(v0 + 224);
  swift_task_dealloc(*(void *)(v0 + 232));
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(3LL);
}

uint64_t sub_10000AEB0()
{
  uint64_t v2 = *(void **)(v0 + 240);
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 224);
  swift_willThrow();

  sub_100008A30(v3);
  swift_errorRetain(v1);
  uint64_t v4 = swift_errorRetain(v1);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 248);
    uint64_t v21 = *(void *)(v0 + 216);
    uint64_t v22 = *(void *)(v0 + 208);
    uint64_t v23 = *(void *)(v0 + 224);
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v24 = v9;
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_getErrorValue(v7, v0 + 176, v0 + 144);
    uint64_t v10 = Error.localizedDescription.getter(*(void *)(v0 + 152), *(void *)(v0 + 160));
    unint64_t v12 = v11;
    *(void *)(v0 + 184) = sub_100015F1C(v10, v11, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Playback Error: %{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  }

  else
  {
    uint64_t v13 = *(void *)(v0 + 248);
    uint64_t v15 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 224);
    uint64_t v16 = *(void *)(v0 + 208);
    swift_errorRelease(v13);
    swift_errorRelease(v13);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }

  uint64_t v17 = *(void *)(v0 + 248);
  swift_getErrorValue(v17, v0 + 168, v0 + 120);
  uint64_t v18 = sub_100004000(*(void *)(v0 + 128), *(void *)(v0 + 136));
  swift_errorRelease(v17);
  uint64_t v19 = *(void *)(v0 + 224);
  swift_task_dealloc(*(void *)(v0 + 232));
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v18);
}

uint64_t sub_10000B0E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000BCE0(a1, (uint64_t *)&unk_1000218C8);
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
  uint64_t v17 = swift_allocObject(&unk_10001CB20, 32LL, 7LL);
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

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100021918, v17);
}

uint64_t sub_10000B360(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_100021854;
  id v7 = a1;
  a3;
  uint64_t v8 = (void *)swift_task_alloc(v6);
  v3[5] = v8;
  void *v8 = v3;
  v8[1] = sub_10000B3DC;
  return sub_100009A50((uint64_t)v7);
}

uint64_t sub_10000B3DC(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v4 = *(void **)(*v1 + 24);
  uint64_t v7 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 40));

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

void sub_10000B51C(uint64_t a1)
{
  v6[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v6[1] = "\b";
  v6[2] = "\b";
  sub_10000B5E0(319LL, &qword_100021858, (uint64_t (*)(uint64_t))&type metadata accessor for UUID);
  if (v3 <= 0x3F)
  {
    v6[3] = *(void *)(v2 - 8) + 64LL;
    sub_10000B5E0( 319LL,  (unint64_t *)&qword_100021860,  (uint64_t (*)(uint64_t))&type metadata accessor for Logger);
    if (v5 <= 0x3F)
    {
      v6[4] = *(void *)(v4 - 8) + 64LL;
      swift_updateClassMetadata2(a1, 256LL, 5LL, v6, a1 + 80);
    }
  }

void sub_10000B5E0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  if (!*a2)
  {
    uint64_t v5 = a3(255LL);
    unint64_t v6 = type metadata accessor for Optional(a1, v5);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }

uint64_t sub_10000B660(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000B6C4;
  return v6(a1);
}

uint64_t sub_10000B6C4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_10000B710(char *result, int64_t a2, char a3, char *a4)
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
      uint64_t v10 = sub_100003B38((uint64_t *)&unk_100021900);
      unint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
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
      unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
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

    sub_10000B8C8(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_10000B81C()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000B850()
{
  uint64_t v2 = *(void *)(v0 + 40);
  unint64_t v3 = (void *)swift_task_alloc(dword_1000218EC);
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_10000AB44;
  uint64_t v4 = (void *)swift_task_alloc(dword_1000218DC);
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000AB44;
  return sub_10000AB8C(v2);
}

uint64_t sub_10000B8C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10000B9BC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000B9E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_100021914);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10000AB44;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100021910 + dword_100021910))(a1, v4);
}

uint64_t sub_10000BA50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003B38(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000BA98()
{
  uint64_t v2 = (void *)v0[2];
  unint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100021934);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000BD20;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100021930 + dword_100021930))(v2, v3, v4);
}

uint64_t sub_10000BB08()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100021BA4);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000BD20;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100021BA0 + dword_100021BA0))(v2, v3, v4);
}

uint64_t sub_10000BB84(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_100021BB4);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000BD20;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100021BB0 + dword_100021BB0))( a1,  v4,  v5,  v6);
}

uint64_t sub_10000BC0C()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10000BC40()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100021954);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000BD20;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100021950 + dword_100021950))(v2, v3, v4);
}

uint64_t sub_10000BCB4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000BCE0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003B38(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void sub_10000BD28(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void *))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4(a2);
  swift_release(v3);
}

uint64_t sub_10000BD7C(uint64_t a1)
{
  uint64_t v39 = &_swiftEmptySetSingleton;
  uint64_t v40 = &_swiftEmptySetSingleton;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = swift_bridgeObjectRetain(a1);
    if (v2) {
      goto LABEL_3;
    }
LABEL_25:
    swift_bridgeObjectRelease(a1);
    unint64_t v5 = 0xE000000000000000LL;
    unint64_t v27 = &_swiftEmptySetSingleton;
    id v28 = &_swiftEmptySetSingleton;
LABEL_26:
    id v30 = [objc_allocWithZone(ANHomeContext) init];
    NSString v31 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
    [v30 setHomeName:v31];

    uint64_t v32 = sub_100014BE4((uint64_t)v28);
    swift_bridgeObjectRelease(v28);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_release(v32);
    [v30 setZoneNames:isa];

    id v34 = sub_100014BE4((uint64_t)v27);
    swift_bridgeObjectRelease(v27);
    Class v35 = Array._bridgeToObjectiveC()().super.isa;
    swift_release(v34);
    [v30 setRoomNames:v35];

    return (uint64_t)v30;
  }

  if (a1 < 0) {
    uint64_t v29 = a1;
  }
  else {
    uint64_t v29 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v29);
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_25;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v36 = 0LL;
    uint64_t v4 = 0LL;
    unint64_t v5 = 0xE000000000000000LL;
    do
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v7 = v6;
      id v8 = [v6 zone];
      if (v8)
      {
        uint64_t v9 = v8;
        id v10 = [v8 spokenPhrase];

        uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
        uint64_t v13 = v12;

        sub_100013DAC(&v37, v11, v13);
        swift_bridgeObjectRelease(v38);
      }

      id v14 = [v7 room];
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = [v14 spokenPhrase];

        uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
        uint64_t v19 = v18;

        sub_100013DAC(&v37, v17, v19);
        swift_bridgeObjectRelease(v38);
      }

      id v20 = [v7 home];
      if (v20)
      {
        uint64_t v21 = v20;
        id v22 = [v20 spokenPhrase];

        uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
        unint64_t v25 = v24;

        uint64_t v26 = HIBYTE(v5) & 0xF;
        if ((v5 & 0x2000000000000000LL) == 0) {
          uint64_t v26 = v36 & 0xFFFFFFFFFFFFLL;
        }
        if (v26)
        {
          swift_bridgeObjectRelease(v25);
        }

        else
        {
          swift_bridgeObjectRelease(v5);
          uint64_t v36 = v23;
          unint64_t v5 = v25;
        }
      }

      else
      {
      }

      ++v4;
    }

    while (v2 != v4);
    swift_bridgeObjectRelease(a1);
    unint64_t v27 = v39;
    id v28 = v40;
    goto LABEL_26;
  }

  __break(1u);
  return result;
}

uint64_t sub_10000C0D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100003B38((uint64_t *)&unk_100021AA0);
  uint64_t v4 = __chkstk_darwin(v3);
  id v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v4);
  id v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler____lazy_storage___logger;
  swift_beginAccess( v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler____lazy_storage___logger,  v14,  0LL,  0LL);
  sub_100007758(v9, (uint64_t)v8, (uint64_t *)&unk_100021AA0);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  sub_10000BCE0((uint64_t)v8, (uint64_t *)&unk_100021AA0);
  if (qword_100021328 != -1) {
    swift_once(&qword_100021328, sub_100004188);
  }
  Logger.init(_:)((id)qword_100021EF8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0LL, 1LL, v10);
  swift_beginAccess(v9, v13, 33LL, 0LL);
  sub_1000077DC((uint64_t)v6, v9);
  return swift_endAccess(v13);
}

id sub_10000C2EC()
{
  uint64_t v1 = OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce];
  if (v2)
  {
    [v2 setDelegate:0];
    uint64_t v3 = *(void **)&v0[v1];
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  *(void *)&v0[v1] = 0LL;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for SendAnnouncementIntentHandler(0LL);
  return objc_msgSendSuper2(&v5, "dealloc");
}

uint64_t sub_10000C428()
{
  return type metadata accessor for SendAnnouncementIntentHandler(0LL);
}

uint64_t type metadata accessor for SendAnnouncementIntentHandler(uint64_t a1)
{
  uint64_t result = qword_100021A08;
  if (!qword_100021A08) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SendAnnouncementIntentHandler);
  }
  return result;
}

uint64_t sub_10000C46C(uint64_t a1)
{
  v2[31] = a1;
  v2[32] = v1;
  uint64_t v3 = sub_100003B38((uint64_t *)&unk_100021A30);
  v2[33] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  v2[34] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[35] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[36] = swift_task_alloc(v6);
  v2[37] = swift_task_alloc(v6);
  uint64_t v7 = type metadata accessor for Logger(0LL);
  v2[38] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[39] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[40] = swift_task_alloc(v9);
  v2[41] = swift_task_alloc(v9);
  v2[42] = swift_task_alloc(v9);
  v2[43] = swift_task_alloc(v9);
  v2[44] = swift_task_alloc(v9);
  v2[45] = swift_task_alloc(v9);
  v2[46] = swift_task_alloc(v9);
  v2[47] = swift_task_alloc(v9);
  v2[48] = swift_task_alloc(v9);
  return swift_task_switch(sub_10000C58C, 0LL, 0LL);
}

uint64_t sub_10000C58C()
{
  uint64_t v1 = (id *)(v0 + 248);
  uint64_t v2 = *(void **)(v0 + 248);
  uint64_t v3 = (const void *)(v0 + 80);
  sub_10000C0D0(*(void *)(v0 + 384));
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v97 = *(void *)(v0 + 312);
    uint64_t v99 = *(void *)(v0 + 304);
    uint64_t v101 = *(void *)(v0 + 384);
    unint64_t v6 = *(void **)(v0 + 248);
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v106 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = sub_10000D97C();
    unint64_t v11 = v10;
    *(void *)(v0 + 208) = sub_100015F1C(v9, v10, &v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v7 + 4, v7 + 12);

    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Resolving Announcement: %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    uint64_t v12 = v7;
    uint64_t v3 = (const void *)(v0 + 80);
    swift_slowDealloc(v12, -1LL, -1LL);

    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
    v13(v101, v99);
  }

  else
  {
    uint64_t v14 = *(void *)(v0 + 384);
    uint64_t v15 = *(void *)(v0 + 304);
    uint64_t v16 = *(void *)(v0 + 312);
    uint64_t v17 = *(void **)(v0 + 248);

    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v13(v14, v15);
  }

  *(void *)(v0 + 392) = v13;
  uint64_t v18 = *(void **)(v0 + 248);
  sub_10000C0D0(*(void *)(v0 + 376));
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = *v1;
    id v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    uint64_t v106 = v23;
    *(_DWORD *)id v22 = 136315138;
    id v24 = [v21 _metadata];
    uint64_t v102 = v13;
    if (v24
      && (unint64_t v25 = v24, v26 = [v24 endpointId], v25, v26))
    {
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      unint64_t v29 = v28;
    }

    else
    {
      uint64_t v27 = 0LL;
      unint64_t v29 = 0xE000000000000000LL;
    }

    uint64_t v96 = *(void *)(v0 + 304);
    uint64_t v98 = *(void *)(v0 + 376);
    uint64_t v33 = *(void **)(v0 + 248);
    *(void *)(v0 + 240) = sub_100015F1C(v27, v29, &v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v0 + 248, v22 + 4, v22 + 12);

    swift_bridgeObjectRelease(v29);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Endpoint %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);

    uint64_t v13 = v102;
    v102(v98, v96);
    uint64_t v3 = (const void *)(v0 + 80);
  }

  else
  {
    uint64_t v30 = *(void *)(v0 + 376);
    uint64_t v31 = *(void *)(v0 + 304);
    uint64_t v32 = *(void **)(v0 + 248);

    v13(v30, v31);
  }

  Class v35 = *(void **)(v0 + 248);
  uint64_t v34 = *(void *)(v0 + 256);
  uint64_t v36 = (void *)sub_100014FB8(v35);
  uint64_t v37 = swift_allocObject(&unk_10001CC68, 24LL, 7LL);
  swift_unknownObjectWeakInit(v37 + 16, v34);
  *(void *)(v0 + 112) = sub_1000156DC;
  *(void *)(v0 + 120) = v37;
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 1107296256LL;
  *(void *)(v0 + 96) = sub_10000BD28;
  *(void *)(v0 + 104) = &unk_10001CCC0;
  uint64_t v38 = _Block_copy(v3);
  uint64_t v39 = *(void *)(v0 + 120);
  id v40 = v36;
  swift_release(v39);
  [v40 prewarmWithHandler:v38];
  _Block_release(v38);

  id v41 = [v35 announcement];
  *(void *)(v0 + 400) = v41;
  if (v41)
  {
    unint64_t v42 = v41;
    id v43 = [*v1 isReply];
    if (v43 && (uint64_t v44 = v43, v45 = [v43 BOOLValue], v44, v45))
    {
      id v46 = [v42 identifier];
      *(void *)(v0 + 408) = v46;
      if (v46)
      {
        id v47 = v46;
        uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
        *(void *)(v0 + 416) = v48;
        *(void *)(v0 + 424) = v49;
        uint64_t v50 = HIBYTE(v49) & 0xF;
        if ((v49 & 0x2000000000000000LL) == 0) {
          uint64_t v50 = v48 & 0xFFFFFFFFFFFFLL;
        }
        if (v50)
        {
          uint64_t v51 = v0 + 16;
          uint64_t v52 = (void *)sub_100014FB8(*(void **)(v0 + 248));
          *(void *)(v0 + 432) = v52;
          *(void *)(v0 + 56) = v0 + 192;
          *(void *)(v0 + 16) = v0;
          *(void *)(v0 + 24) = sub_10000CEC4;
          uint64_t v53 = swift_continuation_init(v0 + 16, 0LL);
          *(void *)(v0 + 128) = _NSConcreteStackBlock;
          uint64_t v54 = (void *)(v0 + 128);
          v54[1] = 0x40000000LL;
          v54[2] = sub_10000DF60;
          v54[3] = &unk_10001CCE8;
          v54[4] = v53;
          [v52 announcementForID:v47 reply:v54];
          return swift_continuation_await(v51);
        }

        swift_bridgeObjectRelease(v49);
      }

      uint64_t v81 = sub_10000C0D0(*(void *)(v0 + 360));
      uint64_t v82 = (os_log_s *)Logger.logObject.getter(v81);
      os_log_type_t v83 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v82, v83))
      {
        uint64_t v84 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v84 = 0;
        _os_log_impl((void *)&_mh_execute_header, v82, v83, "Announcement Identifier is empty for reply", v84, 2u);
        swift_slowDealloc(v84, -1LL, -1LL);
      }

      uint64_t v85 = *(void *)(v0 + 360);
      uint64_t v86 = *(void *)(v0 + 304);

      v13(v85, v86);
      id v100 =  [(id)objc_opt_self(INSendAnnouncementAnnouncementResolutionResult) unsupportedForReason:1];
    }

    else
    {
      id v56 = [*(id *)(v0 + 400) speechDataURL];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v59 = *(void *)(v0 + 280);
        uint64_t v58 = *(void *)(v0 + 288);
        uint64_t v61 = *(void *)(v0 + 264);
        uint64_t v60 = *(void *)(v0 + 272);
        static URL._unconditionallyBridgeFromObjectiveC(_:)(v56);

        uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 32);
        v62(v61, v58, v60);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v61, 0LL, 1LL, v60);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v61, 1LL, v60) != 1)
        {
          v62(*(void *)(v0 + 296), *(void *)(v0 + 264), *(void *)(v0 + 272));
          uint64_t v104 = (uint64_t (*)(void))((char *)&dword_100021620 + dword_100021620);
          id v63 = (void *)swift_task_alloc(unk_100021624);
          *(void *)(v0 + 440) = v63;
          *id v63 = v0;
          v63[1] = sub_10000D348;
          return v104(*(void *)(v0 + 296));
        }
      }

      else
      {
        (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 280) + 56LL))( *(void *)(v0 + 264),  1LL,  1LL,  *(void *)(v0 + 272));
      }

      uint64_t v71 = *(void *)(v0 + 328);
      sub_10000BCE0(*(void *)(v0 + 264), (uint64_t *)&unk_100021A30);
      uint64_t v72 = sub_10000C0D0(v71);
      uint64_t v73 = (os_log_s *)Logger.logObject.getter(v72);
      os_log_type_t v74 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v73, v74))
      {
        unint64_t v75 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)unint64_t v75 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v73,  v74,  "Resolving Announcement failed for no Speech Data URL.",  v75,  2u);
        swift_slowDealloc(v75, -1LL, -1LL);
      }

      uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
      id v76 = *(void **)(v0 + 400);
      uint64_t v78 = *(void *)(v0 + 328);
      uint64_t v79 = *(void *)(v0 + 304);

      v77(v78, v79);
      uint64_t v80 = sub_100007E80(0LL, &qword_100021A98, &OBJC_CLASS___INSendAnnouncementAnnouncementResolutionResult_ptr);
      id v100 = [(id)swift_getObjCClassFromMetadata(v80) needsValue];
    }
  }

  else
  {
    uint64_t v64 = sub_10000C0D0(*(void *)(v0 + 320));
    id v65 = (os_log_s *)Logger.logObject.getter(v64);
    os_log_type_t v66 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v67 = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "Announcement is empty. Needs value.", v67, 2u);
      swift_slowDealloc(v67, -1LL, -1LL);
    }

    uint64_t v68 = *(void *)(v0 + 320);
    uint64_t v69 = *(void *)(v0 + 304);

    v13(v68, v69);
    uint64_t v70 = sub_100007E80(0LL, &qword_100021A98, &OBJC_CLASS___INSendAnnouncementAnnouncementResolutionResult_ptr);
    id v100 = [(id)swift_getObjCClassFromMetadata(v70) needsValue];
  }

  uint64_t v87 = *(void *)(v0 + 376);
  uint64_t v89 = *(void *)(v0 + 360);
  uint64_t v88 = *(void *)(v0 + 368);
  uint64_t v91 = *(void *)(v0 + 344);
  uint64_t v90 = *(void *)(v0 + 352);
  uint64_t v93 = *(void *)(v0 + 328);
  uint64_t v92 = *(void *)(v0 + 336);
  uint64_t v94 = *(void *)(v0 + 320);
  uint64_t v95 = *(void *)(v0 + 296);
  uint64_t v103 = *(void *)(v0 + 288);
  uint64_t v105 = *(void *)(v0 + 264);
  swift_task_dealloc(*(void *)(v0 + 384));
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v103);
  swift_task_dealloc(v105);
  return (*(uint64_t (**)(id))(v0 + 8))(v100);
}

uint64_t sub_10000CEC4()
{
  return swift_task_switch(sub_10000CF10, 0LL, 0LL);
}

uint64_t sub_10000CF10()
{
  uint64_t v1 = *(void **)(v0 + 408);
  uint64_t v2 = *(void **)(v0 + 192);

  uint64_t v3 = *(void *)(v0 + 424);
  if (v2)
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 424));
    id v4 = [*(id *)(v0 + 400) speechDataURL];
    if (v4)
    {
      os_log_type_t v5 = v4;
      uint64_t v7 = *(void *)(v0 + 280);
      uint64_t v6 = *(void *)(v0 + 288);
      uint64_t v9 = *(void *)(v0 + 264);
      uint64_t v8 = *(void *)(v0 + 272);
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v4);

      unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
      v10(v9, v6, v8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0LL, 1LL, v8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1LL, v8) != 1)
      {
        v10(*(void *)(v0 + 296), *(void *)(v0 + 264), *(void *)(v0 + 272));
        uint64_t v48 = (uint64_t (*)(void))((char *)&dword_100021620 + dword_100021620);
        unint64_t v11 = (void *)swift_task_alloc(unk_100021624);
        *(void *)(v0 + 440) = v11;
        *unint64_t v11 = v0;
        v11[1] = sub_10000D348;
        return v48(*(void *)(v0 + 296));
      }
    }

    else
    {
      (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 280) + 56LL))( *(void *)(v0 + 264),  1LL,  1LL,  *(void *)(v0 + 272));
    }

    uint64_t v21 = *(void *)(v0 + 328);
    sub_10000BCE0(*(void *)(v0 + 264), (uint64_t *)&unk_100021A30);
    uint64_t v22 = sub_10000C0D0(v21);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Resolving Announcement failed for no Speech Data URL.",  v25,  2u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    id v26 = *(void **)(v0 + 400);
    uint64_t v28 = *(void *)(v0 + 328);
    uint64_t v29 = *(void *)(v0 + 304);

    v27(v28, v29);
    uint64_t v30 = sub_100007E80(0LL, &qword_100021A98, &OBJC_CLASS___INSendAnnouncementAnnouncementResolutionResult_ptr);
    id v31 = [(id)swift_getObjCClassFromMetadata(v30) needsValue];
  }

  else
  {
    sub_10000C0D0(*(void *)(v0 + 368));
    uint64_t v13 = swift_bridgeObjectRetain(v3);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.error.getter();
    BOOL v16 = os_log_type_enabled(v14, v15);
    unint64_t v17 = *(void *)(v0 + 424);
    if (v16)
    {
      uint64_t v18 = *(void *)(v0 + 416);
      uint64_t v46 = *(void *)(v0 + 368);
      unint64_t v49 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
      uint64_t v44 = *(void *)(v0 + 304);
      uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v20 = swift_slowAlloc(32LL, -1LL);
      uint64_t v51 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      swift_bridgeObjectRetain(v17);
      *(void *)(v0 + 232) = sub_100015F1C(v18, v17, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease_n(v17, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Could not find reply-to announcement: %s", v19, 0xCu);
      swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v19, -1LL, -1LL);

      v49(v46, v44);
    }

    else
    {
      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
      uint64_t v33 = *(void *)(v0 + 368);
      uint64_t v34 = *(void *)(v0 + 304);
      swift_bridgeObjectRelease_n(*(void *)(v0 + 424), 2LL);

      v32(v33, v34);
    }

    id v26 = *(void **)(v0 + 400);
    id v31 = [(id)objc_opt_self(INSendAnnouncementAnnouncementResolutionResult) unsupportedForReason:1];
  }

  id v50 = v31;

  uint64_t v35 = *(void *)(v0 + 376);
  uint64_t v37 = *(void *)(v0 + 360);
  uint64_t v36 = *(void *)(v0 + 368);
  uint64_t v39 = *(void *)(v0 + 344);
  uint64_t v38 = *(void *)(v0 + 352);
  uint64_t v41 = *(void *)(v0 + 328);
  uint64_t v40 = *(void *)(v0 + 336);
  uint64_t v42 = *(void *)(v0 + 320);
  uint64_t v43 = *(void *)(v0 + 296);
  uint64_t v45 = *(void *)(v0 + 288);
  uint64_t v47 = *(void *)(v0 + 264);
  swift_task_dealloc(*(void *)(v0 + 384));
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v45);
  swift_task_dealloc(v47);
  return (*(uint64_t (**)(id))(v0 + 8))(v50);
}

uint64_t sub_10000D348(double a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 440);
  *(double *)(v3 + 448) = a1;
  *(void *)(v3 + 456) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    os_log_type_t v5 = sub_10000D6B4;
  }
  else {
    os_log_type_t v5 = sub_10000D3B0;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_10000D3B0()
{
  uint64_t v1 = sub_10000C0D0(*(void *)(v0 + 352));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(v0 + 448);
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)os_log_type_t v5 = 134349056;
    *(void *)(v0 + 200) = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Speech Data Length: %{public}f", v5, 0xCu);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  double v6 = *(double *)(v0 + 448);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
  uint64_t v8 = *(void *)(v0 + 352);
  uint64_t v9 = *(void *)(v0 + 304);

  v7(v8, v9);
  if (v6 >= 60.0)
  {
    uint64_t v15 = sub_10000C0D0(*(void *)(v0 + 336));
    BOOL v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v18 = 67240192;
      *(_DWORD *)(v0 + 464) = 60;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 464, v0 + 468, v18 + 4, v18 + 8);
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Speech Data Length Exceeds Maximum (%{public}d seconds). Requires Confirmation.",  v18,  8u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    uint64_t v19 = *(void **)(v0 + 400);
    uint64_t v21 = *(void *)(v0 + 336);
    uint64_t v23 = *(void *)(v0 + 296);
    uint64_t v22 = *(void *)(v0 + 304);
    uint64_t v24 = *(void *)(v0 + 272);
    uint64_t v25 = *(void *)(v0 + 280);

    v20(v21, v22);
    id v38 =  [(id)objc_opt_self(INSendAnnouncementAnnouncementResolutionResult) confirmationRequiredWithAnnouncementToConfirm:v19 forReason:1];

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  }

  else
  {
    unint64_t v10 = *(void **)(v0 + 400);
    uint64_t v11 = *(void *)(v0 + 296);
    uint64_t v13 = *(void *)(v0 + 272);
    uint64_t v12 = *(void *)(v0 + 280);
    uint64_t v14 = sub_100007E80(0LL, &qword_100021A98, &OBJC_CLASS___INSendAnnouncementAnnouncementResolutionResult_ptr);
    id v38 = [(id)swift_getObjCClassFromMetadata(v14) successWithResolvedAnnouncement:v10];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }

  uint64_t v26 = *(void *)(v0 + 376);
  uint64_t v28 = *(void *)(v0 + 360);
  uint64_t v27 = *(void *)(v0 + 368);
  uint64_t v30 = *(void *)(v0 + 344);
  uint64_t v29 = *(void *)(v0 + 352);
  uint64_t v32 = *(void *)(v0 + 328);
  uint64_t v31 = *(void *)(v0 + 336);
  uint64_t v33 = *(void *)(v0 + 320);
  uint64_t v34 = *(void *)(v0 + 296);
  uint64_t v36 = *(void *)(v0 + 288);
  uint64_t v37 = *(void *)(v0 + 264);
  swift_task_dealloc(*(void *)(v0 + 384));
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  return (*(uint64_t (**)(id))(v0 + 8))(v38);
}

uint64_t sub_10000D6B4()
{
  uint64_t v1 = *(void *)(v0 + 456);
  sub_10000C0D0(*(void *)(v0 + 344));
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  os_log_type_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 456);
    uint64_t v33 = *(void *)(v0 + 344);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    uint64_t v31 = *(void *)(v0 + 304);
    double v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v37 = v7;
    *(_DWORD *)double v6 = 136446210;
    swift_getErrorValue(v5, v0 + 224, v0 + 168);
    uint64_t v8 = Error.localizedDescription.getter(*(void *)(v0 + 176), *(void *)(v0 + 184));
    unint64_t v10 = v9;
    *(void *)(v0 + 216) = sub_100015F1C(v8, v9, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v10);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to retrieve duration %{public}s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    v35(v33, v31);
  }

  else
  {
    uint64_t v11 = *(void *)(v0 + 456);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    uint64_t v13 = *(void *)(v0 + 344);
    uint64_t v14 = *(void *)(v0 + 304);
    swift_errorRelease(v11);
    swift_errorRelease(v11);

    v12(v13, v14);
  }

  uint64_t v15 = *(void *)(v0 + 456);
  BOOL v16 = *(void **)(v0 + 400);
  uint64_t v17 = *(void *)(v0 + 296);
  uint64_t v18 = *(void *)(v0 + 272);
  uint64_t v19 = *(void *)(v0 + 280);
  uint64_t v20 = sub_100007E80(0LL, &qword_100021A98, &OBJC_CLASS___INSendAnnouncementAnnouncementResolutionResult_ptr);
  id v36 = [(id)swift_getObjCClassFromMetadata(v20) unsupported];

  swift_errorRelease(v15);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  uint64_t v21 = *(void *)(v0 + 376);
  uint64_t v23 = *(void *)(v0 + 360);
  uint64_t v22 = *(void *)(v0 + 368);
  uint64_t v25 = *(void *)(v0 + 344);
  uint64_t v24 = *(void *)(v0 + 352);
  uint64_t v27 = *(void *)(v0 + 328);
  uint64_t v26 = *(void *)(v0 + 336);
  uint64_t v28 = *(void *)(v0 + 320);
  uint64_t v29 = *(void *)(v0 + 296);
  uint64_t v32 = *(void *)(v0 + 288);
  uint64_t v34 = *(void *)(v0 + 264);
  swift_task_dealloc(*(void *)(v0 + 384));
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v32);
  swift_task_dealloc(v34);
  return (*(uint64_t (**)(id))(v0 + 8))(v36);
}

uint64_t sub_10000D97C()
{
  uint64_t v1 = v0;
  uint64_t v2 = 7104878LL;
  uint64_t v3 = sub_100003B38((uint64_t *)&unk_100021A30);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v67 = 0LL;
  unint64_t v68 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(143LL);
  v70[0] = v67;
  v70[1] = v68;
  v6._countAndFlagsBits = 0xD000000000000013LL;
  v6._object = (void *)0x8000000100019240LL;
  String.append(_:)(v6);
  id v7 = [v0 identifier];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    uint64_t v11 = v10;
  }

  else
  {
    uint64_t v11 = (void *)0xE300000000000000LL;
    uint64_t v9 = 7104878LL;
  }

  v12._countAndFlagsBits = v9;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v11);
  v13._countAndFlagsBits = 0x656970696365520ALL;
  v13._object = (void *)0xED0000203A73746ELL;
  String.append(_:)(v13);
  id v14 = [v1 recipients];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
    uint64_t v17 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);
  }

  else
  {
    uint64_t v17 = &_swiftEmptyArrayStorage;
  }

  uint64_t v18 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
  v19._countAndFlagsBits = Array.description.getter(v17, v18);
  object = v19._object;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(object);
  v21._countAndFlagsBits = 0xD00000000000001ALL;
  v21._object = (void *)0x8000000100019260LL;
  String.append(_:)(v21);
  id v22 = [v1 announcement];
  if (v22
    && (uint64_t v23 = v22, v24 = [v22 identifier], v23, v24))
  {
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    uint64_t v27 = v26;
  }

  else
  {
    uint64_t v27 = (void *)0xE300000000000000LL;
    uint64_t v25 = 7104878LL;
  }

  uint64_t v28 = 0x65736C6166LL;
  v29._countAndFlagsBits = v25;
  v29._object = v27;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(v27);
  v30._countAndFlagsBits = 0x6C7065522073490ALL;
  v30._object = (void *)0xEB00000000203A79LL;
  String.append(_:)(v30);
  id v31 = [v1 isReply];
  if (v31 && (uint64_t v32 = v31, v33 = [v31 BOOLValue], v32, (v33 & 1) != 0))
  {
    unint64_t v34 = 0xE400000000000000LL;
    uint64_t v35 = 1702195828LL;
  }

  else
  {
    unint64_t v34 = 0xE500000000000000LL;
    uint64_t v35 = 0x65736C6166LL;
  }

  unint64_t v36 = v34;
  String.append(_:)(*(Swift::String *)&v35);
  swift_bridgeObjectRelease(v34);
  v37._countAndFlagsBits = 0xD000000000000012LL;
  v37._object = (void *)0x8000000100019280LL;
  String.append(_:)(v37);
  uint64_t v69 = v3;
  id v38 = sub_100015638(&v67);
  id v39 = [v1 announcement];
  if (v39)
  {
    uint64_t v40 = v39;
    id v41 = [v39 speechDataURL];

    if (v41)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v41);

      uint64_t v42 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56LL))(v5, 0LL, 1LL, v42);
    }

    else
    {
      uint64_t v44 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56LL))(v5, 1LL, 1LL, v44);
    }

    sub_100015740((uint64_t)v5, (uint64_t)v38, (uint64_t *)&unk_100021A30);
  }

  else
  {
    uint64_t v43 = ((uint64_t (*)(void))type metadata accessor for URL)();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56LL))(v38, 1LL, 1LL, v43);
  }

  _print_unlocked<A, B>(_:_:)( &v67,  v70,  (char *)&type metadata for Any + 8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  sub_100007848(&v67);
  v45._object = (void *)0x80000001000192A0LL;
  v45._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v45);
  id v46 = [v1 announcement];
  if (v46
    && (uint64_t v47 = v46,
        id v48 = [v46 speechDataTranscription],
        v47,
        v48))
  {

    unint64_t v49 = (void *)0xE400000000000000LL;
    uint64_t v28 = 1702195828LL;
  }

  else
  {
    unint64_t v49 = (void *)0xE500000000000000LL;
  }

  v50._countAndFlagsBits = v28;
  v50._object = v49;
  String.append(_:)(v50);
  swift_bridgeObjectRelease(v49);
  v51._countAndFlagsBits = 0x6874676E654C202CLL;
  v51._object = (void *)0xEA00000000002820LL;
  String.append(_:)(v51);
  id v52 = [v1 announcement];
  uint64_t v53 = v52;
  if (v52)
  {
    id v54 = [v52 speechDataTranscription];

    if (v54)
    {
      uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
      uint64_t v57 = v56;

      uint64_t v53 = (void *)String.count.getter(v55, v57);
      swift_bridgeObjectRelease(v57);
    }

    else
    {
      uint64_t v53 = 0LL;
    }
  }

  uint64_t v67 = v53;
  v58._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  uint64_t v59 = v58._object;
  String.append(_:)(v58);
  swift_bridgeObjectRelease(v59);
  v60._countAndFlagsBits = 0x696F70646E450A29LL;
  v60._object = (void *)0xEE00203A4449746ELL;
  String.append(_:)(v60);
  id v61 = [v1 _endpointId];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
    uint64_t v64 = v63;
  }

  else
  {
    uint64_t v64 = (void *)0xE300000000000000LL;
  }

  v65._countAndFlagsBits = v2;
  v65._object = v64;
  String.append(_:)(v65);
  swift_bridgeObjectRelease(v64);
  return v70[0];
}

uint64_t sub_10000DF60(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  Swift::String v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40LL);
  id v4 = a2;
  sub_100015740((uint64_t)&v6, v3, &qword_100021A90);
  return swift_continuation_resume(v2);
}

uint64_t sub_10000E0E0(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_100021A1C;
  id v7 = a1;
  a3;
  uint64_t v8 = (void *)swift_task_alloc(v6);
  v3[5] = v8;
  void *v8 = v3;
  v8[1] = sub_10000B3DC;
  return sub_10000C46C((uint64_t)v7);
}

uint64_t sub_10000E15C(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[11] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[12] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[13] = swift_task_alloc(v5);
  v2[14] = swift_task_alloc(v5);
  return swift_task_switch(sub_10000E1CC, 0LL, 0LL);
}

uint64_t sub_10000E1CC()
{
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = (const void *)(v0 + 16);
  sub_10000C0D0(*(void *)(v0 + 112));
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v42 = *(void *)(v0 + 96);
    uint64_t v43 = *(void *)(v0 + 88);
    uint64_t v44 = *(void *)(v0 + 112);
    unint64_t v5 = *(void **)(v0 + 72);
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v45 = swift_slowAlloc(32LL, -1LL);
    uint64_t v7 = v45;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_10000D97C();
    unint64_t v10 = v9;
    *(void *)(v0 + 64) = sub_100015F1C(v8, v9, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v6 + 4, v6 + 12);

    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Resolving Recipients: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v11 = v7;
    uint64_t v2 = (const void *)(v0 + 16);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    Swift::String v12 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v12(v44, v43);
  }

  else
  {
    uint64_t v13 = *(void *)(v0 + 112);
    uint64_t v14 = *(void *)(v0 + 88);
    uint64_t v15 = *(void *)(v0 + 96);
    uint64_t v16 = *(void **)(v0 + 72);

    Swift::String v12 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v12(v13, v14);
  }

  uint64_t v18 = *(void **)(v0 + 72);
  uint64_t v17 = *(void *)(v0 + 80);
  Swift::String v19 = (void *)sub_100014FB8(v18);
  uint64_t v20 = swift_allocObject(&unk_10001CC68, 24LL, 7LL);
  swift_unknownObjectWeakInit(v20 + 16, v17);
  *(void *)(v0 + 48) = sub_1000156DC;
  *(void *)(v0 + 56) = v20;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256LL;
  *(void *)(v0 + 32) = sub_10000BD28;
  *(void *)(v0 + 40) = &unk_10001CC80;
  Swift::String v21 = _Block_copy(v2);
  uint64_t v22 = *(void *)(v0 + 56);
  id v23 = v19;
  swift_release(v22);
  [v23 prewarmWithHandler:v21];
  _Block_release(v21);

  id v24 = (id)sub_100014FB8(v18);
  LOBYTE(v23) = sub_1000044F8(v18);

  if ((v23 & 1) != 0)
  {
    uint64_t v25 = sub_10000C0D0(*(void *)(v0 + 104));
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "Attempting to announce to the same room containing self",  v28,  2u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    uint64_t v29 = *(void *)(v0 + 104);
    uint64_t v30 = *(void *)(v0 + 88);

    v12(v29, v30);
    uint64_t v31 = sub_100003B38(&qword_100021770);
    uint64_t v32 = swift_allocObject(v31, 40LL, 7LL);
    *(_OWORD *)(v32 + 16) = xmmword_100017BB0;
    id v33 =  [(id)objc_opt_self(INSendAnnouncementRecipientResolutionResult) unsupportedForReason:2];
    *(void *)(v32 + 32) = v33;
    uint64_t v45 = v32;
    specialized Array._endMutation()(v33);
    uint64_t v34 = v45;
    uint64_t v35 = *(void *)(v0 + 104);
    swift_task_dealloc(*(void *)(v0 + 112));
    swift_task_dealloc(v35);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v34);
  }

  else
  {
    id v37 = [*(id *)(v0 + 72) isReply];
    if (v37 && (id v38 = v37, v39 = [v37 BOOLValue], v38, v39))
    {
      uint64_t v40 = (void *)swift_task_alloc(dword_100021A7C);
      *(void *)(v0 + 120) = v40;
      void *v40 = v0;
      v40[1] = sub_10000E62C;
      return sub_10000E9C4(*(void *)(v0 + 72));
    }

    else
    {
      id v41 = (void *)swift_task_alloc(dword_100021A74);
      *(void *)(v0 + 128) = v41;
      *id v41 = v0;
      v41[1] = sub_10000E688;
      return sub_10000F5C4(*(void *)(v0 + 72));
    }
  }

uint64_t sub_10000E62C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v7 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 120));
  uint64_t v5 = v3 + 104;
  uint64_t v4 = *(void *)(v3 + 104);
  swift_task_dealloc(*(void *)(v5 + 8));
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(uint64_t))(v7 + 8))(a1);
}

uint64_t sub_10000E688(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v7 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 128));
  uint64_t v5 = v3 + 104;
  uint64_t v4 = *(void *)(v3 + 104);
  swift_task_dealloc(*(void *)(v5 + 8));
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(uint64_t))(v7 + 8))(a1);
}

uint64_t sub_10000E6E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = a2 + 16;
  if (a1)
  {
    swift_beginAccess(v11, v32, 0LL, 0LL);
    uint64_t result = swift_unknownObjectWeakLoadStrong(v11);
    if (result)
    {
      uint64_t v13 = (void *)result;
      swift_errorRetain(a1);
      sub_10000C0D0((uint64_t)v10);

      swift_errorRetain(a1);
      uint64_t v14 = swift_errorRetain(a1);
      uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v18 = swift_slowAlloc(32LL, -1LL);
        uint64_t v31 = v18;
        *(_DWORD *)uint64_t v17 = 136446210;
        os_log_type_t v27 = v17 + 4;
        swift_getErrorValue(a1, v30, v29);
        uint64_t v19 = Error.localizedDescription.getter(v29[1], v29[2]);
        unint64_t v21 = v20;
        uint64_t v28 = sub_100015F1C(v19, v20, &v31);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, v29, v27, v17 + 12);
        swift_bridgeObjectRelease(v21);
        swift_errorRelease(a1);
        swift_errorRelease(a1);
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Prewarm Completed with Error %{public}s", v17, 0xCu);
        swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v18, -1LL, -1LL);
        swift_slowDealloc(v17, -1LL, -1LL);

        swift_errorRelease(a1);
      }

      else
      {
        swift_errorRelease(a1);
        swift_errorRelease(a1);
        swift_errorRelease(a1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
  }

  else
  {
    swift_beginAccess(v11, v32, 0LL, 0LL);
    uint64_t result = swift_unknownObjectWeakLoadStrong(v11);
    if (result)
    {
      uint64_t v22 = (void *)result;
      sub_10000C0D0((uint64_t)v8);

      id v24 = (os_log_s *)Logger.logObject.getter(v23);
      os_log_type_t v25 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Prewarm Completed", v26, 2u);
        swift_slowDealloc(v26, -1LL, -1LL);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }

  return result;
}

uint64_t sub_10000E9C4(uint64_t a1)
{
  v2[29] = a1;
  v2[30] = v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[31] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[32] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[33] = swift_task_alloc(v5);
  v2[34] = swift_task_alloc(v5);
  v2[35] = swift_task_alloc(v5);
  return swift_task_switch(sub_10000EA40, 0LL, 0LL);
}

uint64_t sub_10000EA40()
{
  id v1 = [*(id *)(v0 + 232) recipients];
  if (!v1)
  {
    uint64_t v24 = sub_10000C0D0(*(void *)(v0 + 264));
    os_log_type_t v25 = (os_log_s *)Logger.logObject.getter(v24);
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      os_log_type_t v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)os_log_type_t v27 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "Skipping Resolve Recipients for Reply without recipients",  v27,  2u);
      swift_slowDealloc(v27, -1LL, -1LL);
    }

    uint64_t v29 = *(void *)(v0 + 256);
    uint64_t v28 = *(void *)(v0 + 264);
    uint64_t v30 = *(void *)(v0 + 248);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    uint64_t v31 = sub_100003B38(&qword_100021770);
    uint64_t v21 = swift_allocObject(v31, 40LL, 7LL);
    *(_OWORD *)(v21 + 16) = xmmword_100017BB0;
    uint64_t v32 = sub_100007E80(0LL, &qword_100021A80, &OBJC_CLASS___INSendAnnouncementRecipientResolutionResult_ptr);
    id v23 = [(id)swift_getObjCClassFromMetadata(v32) notRequired];
    goto LABEL_29;
  }

  uint64_t v2 = v1;
  uint64_t v3 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(void *)(v0 + 288) = v4;

  uint64_t v5 = swift_bridgeObjectRetain(v4);
  uint64_t v6 = (void *)sub_10000BD7C(v5);
  swift_bridgeObjectRelease(v4);
  id v7 = [v6 homeName];

  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  unint64_t v10 = v9;

  swift_bridgeObjectRelease(v10);
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000LL) == 0) {
    uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (!v11)
  {
    id v33 = [*(id *)(v0 + 232) announcement];
    if (v33)
    {
      uint64_t v34 = v33;
      id v35 = [v33 identifier];

      if (v35)
      {
        uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
        uint64_t v38 = v37;

        *(void *)(v0 + 192) = v36;
        *(void *)(v0 + 200) = v38;
        if (!v38) {
          goto LABEL_26;
        }
LABEL_25:
        uint64_t v46 = v0 + 16;
        uint64_t v47 = (void *)sub_100014FB8(*(void **)(v0 + 232));
        *(void *)(v0 + 296) = v47;
        id v48 = v47;
        NSString v49 = String._bridgeToObjectiveC()();
        *(void *)(v0 + 304) = v49;
        swift_bridgeObjectRelease(v38);
        *(void *)(v0 + 56) = v0 + 224;
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 24) = sub_10000F0AC;
        uint64_t v50 = swift_continuation_init(v0 + 16, 0LL);
        *(void *)(v0 + 80) = _NSConcreteStackBlock;
        Swift::String v51 = (void *)(v0 + 80);
        v51[1] = 0x40000000LL;
        v51[2] = sub_10000DF60;
        v51[3] = &unk_10001CCA8;
        v51[4] = v50;
        [v48 announcementForID:v49 reply:v51];
        return swift_continuation_await(v46);
      }
    }

    id v39 = [objc_allocWithZone(ANLocalPlaybackSession) init];
    id v40 = [v39 lastPlayedAnnouncementInfo];

    uint64_t v41 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v40,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
    *(void *)(v0 + 208) = static String._unconditionallyBridgeFromObjectiveC(_:)(ANAnnouncementInfoAnnouncementIDKey);
    *(void *)(v0 + 216) = v42;
    AnyHashable.init<A>(_:)(v0 + 208, &type metadata for String, &protocol witness table for String);
    if (*(void *)(v41 + 16) && (unint64_t v43 = sub_100014A10(v0 + 120), (v44 & 1) != 0))
    {
      sub_10001567C(*(void *)(v41 + 56) + 32 * v43, v0 + 160);
    }

    else
    {
      *(_OWORD *)(v0 + 160) = 0u;
      *(_OWORD *)(v0 + 176) = 0u;
    }

    uint64_t v45 = (void *)(v0 + 192);
    swift_bridgeObjectRelease(v41);
    sub_10001570C(v0 + 120);
    if (*(void *)(v0 + 184))
    {
      if (swift_dynamicCast( v0 + 192,  v0 + 160,  (char *)&type metadata for Any + 8,  &type metadata for String,  6LL))
      {
        uint64_t v38 = *(void *)(v0 + 200);
        if (!v38) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }

      void *v45 = 0LL;
      *(void *)(v0 + 200) = 0LL;
    }

    else
    {
      sub_10000BCE0(v0 + 160, &qword_100021A88);
      void *v45 = 0LL;
      *(void *)(v0 + 200) = 0LL;
    }

uint64_t sub_10000F0AC()
{
  return swift_task_switch(sub_10000F0F8, 0LL, 0LL);
}

uint64_t sub_10000F0F8()
{
  id v1 = *(void **)(v0 + 224);
  uint64_t v2 = *(void **)(v0 + 304);

  if (!v1)
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 288));
LABEL_25:
    uint64_t v33 = sub_100003B38(&qword_100021770);
    uint64_t v32 = (id *)swift_allocObject(v33, 40LL, 7LL);
    *((_OWORD *)v32 + 1) = xmmword_100017BB0;
    uint64_t v34 = sub_100007E80(0LL, &qword_100021A80, &OBJC_CLASS___INSendAnnouncementRecipientResolutionResult_ptr);
    id v35 = [(id)swift_getObjCClassFromMetadata(v34) unsupported];
    v32[4] = v35;
    specialized Array._endMutation()(v35);
LABEL_33:
    uint64_t v37 = *(void *)(v0 + 272);
    uint64_t v38 = *(void *)(v0 + 264);
    swift_task_dealloc(*(void *)(v0 + 280));
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    return (*(uint64_t (**)(id *))(v0 + 8))(v32);
  }

  id v3 = [(id)sub_100014FB8(*(void **)(v0 + 232)) contextFromAnnouncement:v1];
  uint64_t v4 = *(void *)(v0 + 288);
  if (!v3)
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 288));

    goto LABEL_25;
  }

  uint64_t v41 = v0;
  id v40 = v3;
  id v5 = [v3 homeName];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  uint64_t v7 = v6;

  id v8 = objc_allocWithZone(&OBJC_CLASS___INSpeakableString);
  swift_bridgeObjectRetain(v7);
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  id v10 = [v8 initWithSpokenPhrase:v9];

  LOWORD(v39) = 0;
  id v11 = objc_msgSend( objc_allocWithZone(INHomeFilter),  "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:roo m:isExcludeFilter:hasAllQuantifier:",  0,  0,  1,  37,  0,  37,  v10,  0,  0,  0,  v39);

  swift_bridgeObjectRelease(v7);
  uint64_t v42 = v4;
  id v12 = v11;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v14 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v13 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v14 >= v13 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1LL);
  }
  uint64_t v15 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
  specialized Array._endMutation()(v15);
  if ((unint64_t)v4 >> 62)
  {
    if (v4 >= 0) {
      v4 &= 0xFFFFFFFFFFFFFF8uLL;
    }
    swift_bridgeObjectRetain(v42);
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v4);
  }

  else
  {
    uint64_t v16 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v4);
  }

  if (v16)
  {
    uint64_t result = specialized ContiguousArray.reserveCapacity(_:)(v16);
    if (v16 < 0)
    {
      __break(1u);
      goto LABEL_38;
    }

    uint64_t v18 = (void *)objc_opt_self(&OBJC_CLASS___INHomeFilterResolutionResult);
    uint64_t v19 = 0LL;
    do
    {
      if ((v42 & 0xC000000000000001LL) != 0) {
        id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v19, v42);
      }
      else {
        id v20 = *(id *)(v42 + 8 * v19 + 32);
      }
      uint64_t v21 = v20;
      ++v19;
      id v22 = [v18 successWithResolvedHomeFilter:v20];

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      id v23 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v23);
      uint64_t v24 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v22);
      specialized ContiguousArray._endMutation()(v24);
    }

    while (v16 != v19);
    swift_bridgeObjectRelease(v42);
    if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
    {
LABEL_16:
      uint64_t v25 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (v25) {
        goto LABEL_17;
      }
LABEL_31:

      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      uint64_t v32 = _swiftEmptyArrayStorage;
LABEL_32:
      swift_bridgeObjectRelease(v42);
      uint64_t v0 = v41;
      goto LABEL_33;
    }
  }

  else
  {
    swift_bridgeObjectRelease(v42);
  }

  else {
    uint64_t v36 = (id *)((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL);
  }
  swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
  uint64_t v25 = _CocoaArrayWrapper.endIndex.getter(v36);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  if (!v25) {
    goto LABEL_31;
  }
LABEL_17:
  uint64_t result = specialized ContiguousArray.reserveCapacity(_:)(v25);
  if ((v25 & 0x8000000000000000LL) == 0)
  {
    uint64_t v26 = 0LL;
    do
    {
      else {
        id v27 = _swiftEmptyArrayStorage[v26 + 4];
      }
      uint64_t v28 = v27;
      ++v26;
      id v29 = [objc_allocWithZone(INSendAnnouncementRecipientResolutionResult) initWithHomeFilterResolutionResult:v27];

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      id v30 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v30);
      uint64_t v31 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v29);
      specialized ContiguousArray._endMutation()(v31);
    }

    while (v25 != v26);
    uint64_t v32 = _swiftEmptyArrayStorage;

    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    goto LABEL_32;
  }

LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000F5C4(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[7] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[8] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[9] = swift_task_alloc(v5);
  v2[10] = swift_task_alloc(v5);
  v2[11] = swift_task_alloc(v5);
  v2[12] = swift_task_alloc(v5);
  v2[13] = swift_task_alloc(v5);
  v2[14] = swift_task_alloc(v5);
  v2[15] = swift_task_alloc(v5);
  return swift_task_switch(sub_10000F670, 0LL, 0LL);
}

uint64_t sub_10000F670()
{
  v153 = (uint64_t *)(v0 + 32);
  id v1 = [*(id *)(v0 + 40) recipients];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

    id v157 = (id)sub_10000BD7C(v4);
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    id v157 = [objc_allocWithZone(ANHomeContext) init];
  }

  uint64_t v5 = *(void *)(v0 + 120);
  id v6 = [(id)sub_100014FB8(*(void **)(v0 + 40)) homeNamesForContext:v157];
  uint64_t v7 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for String);

  sub_10000C0D0(v5);
  uint64_t v8 = swift_bridgeObjectRetain_n(v7, 2LL);
  NSString v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = *(void *)(v0 + 120);
  uint64_t v13 = *(void *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 64);
  v155 = (id *)(v0 + 40);
  v152 = (uint64_t *)(v0 + 24);
  if (v11)
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v149 = v13;
    uint64_t v16 = (id *)swift_slowAlloc(32LL, -1LL);
    v158 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v17 = swift_bridgeObjectRetain(v7);
    uint64_t v18 = Array.description.getter(v17, &type metadata for String);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease(v7);
    uint64_t *v153 = sub_100015F1C(v18, v20, (uint64_t *)&v158);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v153, v155, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease_n(v7, 2LL);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Found Homes: %s", v15, 0xCu);
    swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(v12, v149);
  }

  else
  {
    swift_bridgeObjectRelease_n(v7, 2LL);

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(v12, v13);
  }

  uint64_t v22 = v7[2];
  if (v22 == 1)
  {
    uint64_t v33 = sub_10000C0D0(*(void *)(v0 + 104));
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Found Single Home", v36, 2u);
      swift_slowDealloc(v36, -1LL, -1LL);
    }

    uint64_t v37 = *(void *)(v0 + 104);
    uint64_t v38 = *(void *)(v0 + 56);
    uint64_t v39 = *(void **)(v0 + 40);

    v21(v37, v38);
    id v40 = &StopAnnouncementIntentHandler;
    id v41 = [v39 recipients];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
      uint64_t v44 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v42, v43);
    }

    else
    {
      v158 = _swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(1LL);
      uint64_t v61 = v7[5];
      id v62 = objc_allocWithZone(&OBJC_CLASS___INSpeakableString);
      swift_bridgeObjectRetain(v61);
      NSString v63 = String._bridgeToObjectiveC()();
      id v64 = [v62 initWithSpokenPhrase:v63];

      LOWORD(v145) = 0;
      id v65 = objc_msgSend( objc_allocWithZone(INHomeFilter),  "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group :room:isExcludeFilter:hasAllQuantifier:",  0,  0,  1,  37,  0,  37,  v64,  0,  0,  0,  v145);

      uint64_t v66 = swift_bridgeObjectRelease(v61);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v66);
      id v67 = v158[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v67);
      uint64_t v68 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v67, v65);
      specialized ContiguousArray._endMutation()(v68);
      uint64_t v44 = (uint64_t)v158;
    }

    sub_10000C0D0(*(void *)(v0 + 96));
    uint64_t v69 = swift_bridgeObjectRetain_n(v44, 2LL);
    uint64_t v70 = (os_log_s *)Logger.logObject.getter(v69);
    os_log_type_t v71 = static os_log_type_t.default.getter();
    BOOL v72 = os_log_type_enabled(v70, v71);
    uint64_t v73 = *(void *)(v0 + 96);
    uint64_t v74 = *(void *)(v0 + 56);
    if (v72)
    {
      uint64_t v148 = *(void *)(v0 + 56);
      unint64_t v75 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v151 = v21;
      uint64_t v146 = (id *)swift_slowAlloc(32LL, -1LL);
      v158 = v146;
      *(_DWORD *)unint64_t v75 = 136315138;
      uint64_t v76 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
      uint64_t v77 = swift_bridgeObjectRetain(v44);
      uint64_t v78 = Array.description.getter(v77, v76);
      uint64_t v79 = v7;
      unint64_t v81 = v80;
      swift_bridgeObjectRelease(v44);
      uint64_t *v152 = sub_100015F1C(v78, v81, (uint64_t *)&v158);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v152, v153, v75 + 4, v75 + 12);
      unint64_t v82 = v81;
      uint64_t v7 = v79;
      swift_bridgeObjectRelease(v82);
      swift_bridgeObjectRelease_n(v44, 2LL);
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "Resolved Recipients: %s", v75, 0xCu);
      swift_arrayDestroy(v146, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v21 = v151;
      swift_slowDealloc(v146, -1LL, -1LL);
      os_log_type_t v83 = v75;
      id v40 = &StopAnnouncementIntentHandler;
      swift_slowDealloc(v83, -1LL, -1LL);

      uint64_t v84 = v73;
      uint64_t v85 = v148;
    }

    else
    {
      swift_bridgeObjectRelease_n(v44, 2LL);

      uint64_t v84 = v73;
      uint64_t v85 = v74;
    }

    v21(v84, v85);
    id v86 = [*v155 (SEL)v40[384].count];
    if (!v86) {
      goto LABEL_32;
    }
    id v87 = *v155;

    id v88 = [v87 (SEL)v40[384].count];
    if (!v88) {
      goto LABEL_31;
    }
    uint64_t v89 = v88;
    uint64_t v90 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
    uint64_t v91 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v89, v90);

    uint64_t v92 = *(void *)((v91 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    while (1)
    {
      swift_bridgeObjectRelease(v91);
      if (v92)
      {
LABEL_31:
        swift_bridgeObjectRelease(v7);
      }

      else
      {
LABEL_32:
        if (!v7[2])
        {
          uint64_t result = swift_bridgeObjectRelease(v7);
          __break(1u);
          return result;
        }

        uint64_t v93 = *(void **)(v0 + 40);
        uint64_t v94 = v7[4];
        uint64_t v95 = v7[5];
        swift_bridgeObjectRetain(v95);
        swift_bridgeObjectRelease(v7);
        char v96 = sub_100013B48(v94, v95, v93);
        swift_bridgeObjectRelease(v95);
        if ((v96 & 1) != 0)
        {
          uint64_t v97 = *(void *)(v0 + 88);
          swift_bridgeObjectRelease(v44);
          uint64_t v98 = sub_10000C0D0(v97);
          uint64_t v99 = (os_log_s *)Logger.logObject.getter(v98);
          os_log_type_t v100 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v99, v100))
          {
            uint64_t v101 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)uint64_t v101 = 0;
            _os_log_impl((void *)&_mh_execute_header, v99, v100, "Announce Disabled for all Recipients", v101, 2u);
            swift_slowDealloc(v101, -1LL, -1LL);
          }

          uint64_t v102 = *(void *)(v0 + 88);
          uint64_t v103 = *(void *)(v0 + 56);

          v21(v102, v103);
          uint64_t v104 = sub_100003B38(&qword_100021770);
          uint64_t v31 = (id *)swift_allocObject(v104, 40LL, 7LL);
          *((_OWORD *)v31 + 1) = xmmword_100017BB0;
          id v32 = [(id)objc_opt_self(INSendAnnouncementRecipientResolutionResult) unsupportedForReason:4];
LABEL_37:
          id v105 = v32;
          v31[4] = v105;
          v158 = v31;
          specialized Array._endMutation()(v105);
          uint64_t v106 = v158;
          goto LABEL_52;
        }
      }

      if ((unint64_t)v44 >> 62)
      {
        if (v44 < 0) {
          uint64_t v143 = v44;
        }
        else {
          uint64_t v143 = v44 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v44);
        uint64_t v107 = _CocoaArrayWrapper.endIndex.getter(v143);
        swift_bridgeObjectRelease(v44);
        if (!v107)
        {
LABEL_58:

          swift_bridgeObjectRelease(v44);
          uint64_t v106 = _swiftEmptyArrayStorage;
          goto LABEL_53;
        }
      }

      else
      {
        uint64_t v107 = *(void *)((v44 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        if (!v107) {
          goto LABEL_58;
        }
      }

      uint64_t v154 = v0;
      v158 = _swiftEmptyArrayStorage;
      uint64_t v91 = (uint64_t)&v158;
      specialized ContiguousArray.reserveCapacity(_:)(v107);
      if ((v107 & 0x8000000000000000LL) == 0)
      {
        id v108 = (void *)objc_opt_self(&OBJC_CLASS___INHomeFilterResolutionResult);
        uint64_t v109 = 0LL;
        unint64_t v110 = v44 & 0xC000000000000001LL;
        uint64_t v111 = v44;
        do
        {
          if (v110) {
            id v112 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v109, v44);
          }
          else {
            id v112 = *(id *)(v44 + 8 * v109 + 32);
          }
          Class v113 = v112;
          ++v109;
          id v114 = [v108 successWithResolvedHomeFilter:v112];
          id v115 = [objc_allocWithZone(INSendAnnouncementRecipientResolutionResult) initWithHomeFilterResolutionResult:v114];

          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v116);
          id v117 = v158[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v117);
          uint64_t v118 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v117, v115);
          specialized ContiguousArray._endMutation()(v118);
          uint64_t v44 = v111;
        }

        while (v107 != v109);
        uint64_t v106 = v158;

        swift_bridgeObjectRelease(v111);
        uint64_t v0 = v154;
        goto LABEL_53;
      }

      __break(1u);
LABEL_60:
      if (v91 < 0) {
        uint64_t v144 = v91;
      }
      else {
        uint64_t v144 = v91 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v91);
      uint64_t v92 = _CocoaArrayWrapper.endIndex.getter(v144);
      swift_bridgeObjectRelease(v91);
    }
  }

  if (!v22)
  {
    uint64_t v23 = *(void *)(v0 + 112);
    swift_bridgeObjectRelease(v7);
    uint64_t v24 = sub_10000C0D0(v23);
    uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Did not find any Homes", v27, 2u);
      swift_slowDealloc(v27, -1LL, -1LL);
    }

    uint64_t v28 = *(void *)(v0 + 112);
    uint64_t v29 = *(void *)(v0 + 56);

    v21(v28, v29);
    uint64_t v30 = sub_100003B38(&qword_100021770);
    uint64_t v31 = (id *)swift_allocObject(v30, 40LL, 7LL);
    *((_OWORD *)v31 + 1) = xmmword_100017BB0;
    id v32 = [(id)objc_opt_self(INSendAnnouncementRecipientResolutionResult) unsupportedForReason:1];
    goto LABEL_37;
  }

  uint64_t v45 = sub_10000C0D0(*(void *)(v0 + 80));
  uint64_t v46 = (os_log_s *)Logger.logObject.getter(v45);
  os_log_type_t v47 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v46, v47))
  {
    id v48 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v48 = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Found Multiple Homes. Need to disambiguate", v48, 2u);
    swift_slowDealloc(v48, -1LL, -1LL);
  }

  uint64_t v49 = *(void *)(v0 + 80);
  uint64_t v50 = *(void *)(v0 + 56);

  v150 = v21;
  v21(v49, v50);
  v158 = _swiftEmptyArrayStorage;
  uint64_t v51 = v7[2];
  if (v51)
  {
    sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
    swift_bridgeObjectRetain(v7);
    uint64_t v147 = v7;
    id v52 = v7 + 5;
    do
    {
      uint64_t v53 = *(v52 - 1);
      uint64_t v54 = *v52;
      swift_bridgeObjectRetain(*v52);
      id v55 = [v157 roomNames];
      uint64_t v56 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v55, &type metadata for String);

      id v57 = [v157 zoneNames];
      uint64_t v58 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v57, &type metadata for String);

      uint64_t v59 = sub_100007EB8(v53, v54, v56, v58);
      swift_bridgeObjectRelease(v58);
      swift_bridgeObjectRelease(v56);
      swift_bridgeObjectRelease(v54);
      sub_1000085F0((uint64_t)v59);
      v52 += 2;
      --v51;
    }

    while (v51);
    swift_bridgeObjectRelease_n(v147, 2LL);
    uint64_t v60 = v158;
  }

  else
  {
    swift_bridgeObjectRelease(v7);
    uint64_t v60 = _swiftEmptyArrayStorage;
  }

  uint64_t v119 = *(void *)(v0 + 72);
  uint64_t v120 = (void *)objc_opt_self(&OBJC_CLASS___INHomeFilterResolutionResult);
  sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v60);
  id v122 = [v120 disambiguationWithHomeFiltersToDisambiguate:isa];

  id v123 = [objc_allocWithZone(INSendAnnouncementRecipientResolutionResult) initWithHomeFilterResolutionResult:v122];
  sub_10000C0D0(v119);
  id v124 = v123;
  uint64_t v125 = (os_log_s *)Logger.logObject.getter(v124);
  os_log_type_t v126 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v125, v126))
  {
    uint64_t v127 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    id v156 = v122;
    v128 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v127 = 138412290;
    *(void *)(v0 + 16) = v124;
    id v129 = v124;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v152, v127 + 4, v127 + 12);
    void *v128 = v124;

    _os_log_impl((void *)&_mh_execute_header, v125, v126, "Disambiguation Result: %@", v127, 0xCu);
    uint64_t v130 = sub_100003B38(&qword_100021700);
    swift_arrayDestroy(v128, 1LL, v130);
    uint64_t v131 = v128;
    id v122 = v156;
    swift_slowDealloc(v131, -1LL, -1LL);
    swift_slowDealloc(v127, -1LL, -1LL);
  }

  else
  {

    uint64_t v125 = (os_log_s *)v124;
  }

  uint64_t v132 = *(void *)(v0 + 72);
  uint64_t v133 = *(void *)(v0 + 56);

  v150(v132, v133);
  uint64_t v134 = sub_100003B38(&qword_100021770);
  v135 = (id *)swift_allocObject(v134, 40LL, 7LL);
  *((_OWORD *)v135 + 1) = xmmword_100017BB0;
  v135[4] = v124;
  v158 = v135;
  specialized Array._endMutation()(v135);
  uint64_t v106 = v158;

LABEL_52:
LABEL_53:
  uint64_t v136 = *(void *)(v0 + 112);
  uint64_t v138 = *(void *)(v0 + 96);
  uint64_t v137 = *(void *)(v0 + 104);
  uint64_t v140 = *(void *)(v0 + 80);
  uint64_t v139 = *(void *)(v0 + 88);
  uint64_t v141 = *(void *)(v0 + 72);
  swift_task_dealloc(*(void *)(v0 + 120));
  swift_task_dealloc(v136);
  swift_task_dealloc(v137);
  swift_task_dealloc(v138);
  swift_task_dealloc(v139);
  swift_task_dealloc(v140);
  swift_task_dealloc(v141);
  return (*(uint64_t (**)(id *))(v0 + 8))(v106);
}

uint64_t sub_100010624(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_100021A24;
  id v7 = a1;
  a3;
  uint64_t v8 = (void *)swift_task_alloc(v6);
  v3[5] = v8;
  void *v8 = v3;
  v8[1] = sub_1000106A0;
  return sub_10000E15C((uint64_t)v7);
}

uint64_t sub_1000106A0(uint64_t a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v4 = *(void **)(*v1 + 24);
  uint64_t v8 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 40));

  sub_100007E80(0LL, &qword_100021A80, &OBJC_CLASS___INSendAnnouncementRecipientResolutionResult_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  ((void (**)(void, Class))v3)[2](v3, isa);

  _Block_release(v3);
  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t sub_10001074C(uint64_t a1)
{
  v2[47] = a1;
  v2[48] = v1;
  uint64_t v3 = type metadata accessor for UUID(0LL);
  v2[49] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[50] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[51] = swift_task_alloc(v5);
  v2[52] = swift_task_alloc(v5);
  unint64_t v6 = (*(void *)(*(void *)(sub_100003B38((uint64_t *)&unk_1000216E0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[53] = swift_task_alloc(v6);
  v2[54] = swift_task_alloc(v6);
  v2[55] = swift_task_alloc(v6);
  uint64_t v7 = sub_100003B38((uint64_t *)&unk_100021A30);
  v2[56] = v7;
  unint64_t v8 = (*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[57] = swift_task_alloc(v8);
  v2[58] = swift_task_alloc(v8);
  v2[59] = swift_task_alloc(v8);
  v2[60] = swift_task_alloc(v8);
  uint64_t v9 = type metadata accessor for URL(0LL);
  v2[61] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[62] = v10;
  v2[63] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Logger(0LL);
  v2[64] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[65] = v12;
  unint64_t v13 = (*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[66] = swift_task_alloc(v13);
  v2[67] = swift_task_alloc(v13);
  v2[68] = swift_task_alloc(v13);
  v2[69] = swift_task_alloc(v13);
  v2[70] = swift_task_alloc(v13);
  v2[71] = swift_task_alloc(v13);
  v2[72] = swift_task_alloc(v13);
  v2[73] = swift_task_alloc(v13);
  v2[74] = swift_task_alloc(v13);
  v2[75] = swift_task_alloc(v13);
  v2[76] = swift_task_alloc(v13);
  v2[77] = swift_task_alloc(v13);
  v2[78] = swift_task_alloc(v13);
  v2[79] = swift_task_alloc(v13);
  return swift_task_switch(sub_10001093C, 0LL, 0LL);
}

uint64_t sub_10001093C()
{
  uint64_t v1 = *(void **)(v0 + 376);
  sub_10000C0D0(*(void *)(v0 + 632));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v59 = *(void *)(v0 + 632);
    uint64_t v55 = *(void *)(v0 + 520);
    uint64_t v57 = *(void *)(v0 + 512);
    uint64_t v4 = *(void **)(v0 + 376);
    unint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v62 = v6;
    *(_DWORD *)unint64_t v5 = 136315138;
    uint64_t v7 = sub_10000D97C();
    unint64_t v9 = v8;
    *(void *)(v0 + 352) = sub_100015F1C(v7, v8, &v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 352, v0 + 360, v5 + 4, v5 + 12);
    swift_bridgeObjectRelease(v9);

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Received Send Announcement Intent: %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    v10(v59, v57);
  }

  else
  {
    uint64_t v11 = *(void *)(v0 + 632);
    uint64_t v12 = *(void *)(v0 + 520);
    uint64_t v13 = *(void *)(v0 + 512);
    uint64_t v14 = *(void **)(v0 + 376);

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v10(v11, v13);
  }

  *(void *)(v0 + 640) = v10;
  id v15 = [*(id *)(v0 + 376) announcement];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = [v15 speechDataURL];

    uint64_t v18 = *(void *)(v0 + 488);
    uint64_t v19 = *(void *)(v0 + 496);
    uint64_t v20 = *(void *)(v0 + 472);
    if (v17)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v17);

      uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
      v21(v20, 0LL, 1LL, v18);
    }

    else
    {
      uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
      v21(*(void *)(v0 + 472), 1LL, 1LL, v18);
    }

    *(void *)(v0 + 648) = v21;
    uint64_t v22 = *(void *)(v0 + 488);
    uint64_t v23 = *(void *)(v0 + 496);
    uint64_t v24 = *(void *)(v0 + 480);
    sub_100015740(*(void *)(v0 + 472), v24, (uint64_t *)&unk_100021A30);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v24, 1LL, v22) != 1)
    {
      (*(void (**)(void, void, void))(*(void *)(v0 + 496) + 32LL))( *(void *)(v0 + 504),  *(void *)(v0 + 480),  *(void *)(v0 + 488));
      uint64_t v61 = (uint64_t (*)(void))((char *)&dword_100021620 + dword_100021620);
      uint64_t v42 = (void *)swift_task_alloc(unk_100021624);
      *(void *)(v0 + 656) = v42;
      void *v42 = v0;
      v42[1] = sub_100010E20;
      return v61(*(void *)(v0 + 504));
    }
  }

  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 496) + 56LL))( *(void *)(v0 + 480),  1LL,  1LL,  *(void *)(v0 + 488));
  }

  uint64_t v25 = *(void *)(v0 + 536);
  sub_10000BCE0(*(void *)(v0 + 480), (uint64_t *)&unk_100021A30);
  uint64_t v26 = sub_10000C0D0(v25);
  id v27 = (os_log_s *)Logger.logObject.getter(v26);
  os_log_type_t v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "No speech data URL", v29, 2u);
    swift_slowDealloc(v29, -1LL, -1LL);
  }

  uint64_t v30 = *(void *)(v0 + 536);
  uint64_t v31 = *(void *)(v0 + 512);

  v10(v30, v31);
  id v60 = [objc_allocWithZone(INSendAnnouncementIntentResponse) initWithCode:4 userActivity:0];
  uint64_t v32 = *(void *)(v0 + 624);
  uint64_t v33 = *(void *)(v0 + 616);
  uint64_t v34 = *(void *)(v0 + 608);
  uint64_t v35 = *(void *)(v0 + 600);
  uint64_t v36 = *(void *)(v0 + 592);
  uint64_t v37 = *(void *)(v0 + 584);
  uint64_t v38 = *(void *)(v0 + 576);
  uint64_t v39 = *(void *)(v0 + 568);
  uint64_t v40 = *(void *)(v0 + 560);
  uint64_t v43 = *(void *)(v0 + 552);
  uint64_t v44 = *(void *)(v0 + 544);
  uint64_t v45 = *(void *)(v0 + 536);
  uint64_t v46 = *(void *)(v0 + 528);
  uint64_t v47 = *(void *)(v0 + 504);
  uint64_t v48 = *(void *)(v0 + 480);
  uint64_t v49 = *(void *)(v0 + 472);
  uint64_t v50 = *(void *)(v0 + 464);
  uint64_t v51 = *(void *)(v0 + 456);
  uint64_t v52 = *(void *)(v0 + 440);
  uint64_t v53 = *(void *)(v0 + 432);
  uint64_t v54 = *(void *)(v0 + 424);
  uint64_t v56 = *(void *)(v0 + 416);
  uint64_t v58 = *(void *)(v0 + 408);
  swift_task_dealloc(*(void *)(v0 + 632));
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  swift_task_dealloc(v56);
  swift_task_dealloc(v58);
  return (*(uint64_t (**)(id))(v0 + 8))(v60);
}

uint64_t sub_100010E20(double a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 656);
  *(double *)(v3 + 664) = a1;
  *(void *)(v3 + 672) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    unint64_t v5 = sub_100011558;
  }
  else {
    unint64_t v5 = sub_100010E88;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100010E88()
{
  uint64_t v83 = v0 + 368;
  uint64_t v1 = (id *)(v0 + 376);
  uint64_t v2 = *(void **)(v0 + 376);
  sub_10000C0D0(*(void *)(v0 + 624));
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = *v1;
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v84 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    id v8 = [v5 announcement];
    if (v8)
    {
      unint64_t v9 = v8;
      id v10 = [v8 speechDataURL];

      if (v10)
      {
        static URL._unconditionallyBridgeFromObjectiveC(_:)(v10);

        uint64_t v11 = 0LL;
      }

      else
      {
        uint64_t v11 = 1LL;
      }

      uint64_t v17 = *(void *)(v0 + 456);
      uint64_t v16 = *(void *)(v0 + 464);
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 648))(v17, v11, 1LL, *(void *)(v0 + 488));
      sub_100015740(v17, v16, (uint64_t *)&unk_100021A30);
    }

    else
    {
      (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 648))( *(void *)(v0 + 464),  1LL,  1LL,  *(void *)(v0 + 488));
    }

    unint64_t v82 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v18 = *(void *)(v0 + 624);
    uint64_t v19 = *(void *)(v0 + 512);
    uint64_t v20 = *(void **)(v0 + 376);
    uint64_t v21 = String.init<A>(describing:)(*(void *)(v0 + 464), *(void *)(v0 + 448));
    unint64_t v23 = v22;
    *(void *)(v0 + 368) = sub_100015F1C(v21, v22, &v84);
    uint64_t v1 = (id *)(v0 + 376);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v83, v0 + 376, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v23);

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Speech Data URL: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    v82(v18, v19);
  }

  else
  {
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v13 = *(void *)(v0 + 624);
    uint64_t v14 = *(void *)(v0 + 512);
    id v15 = *(void **)(v0 + 376);

    v12(v13, v14);
  }

  uint64_t v24 = sub_10000C0D0(*(void *)(v0 + 608));
  uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = *(void *)(v0 + 664);
    os_log_type_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)os_log_type_t v28 = 134217984;
    *(void *)(v0 + 360) = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 360, v83, v28 + 4, v28 + 12);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Speech Data Length: %f", v28, 0xCu);
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  uint64_t v30 = *(void *)(v0 + 608);
  uint64_t v31 = *(void *)(v0 + 600);
  uint64_t v32 = *(void *)(v0 + 512);
  uint64_t v33 = *(void **)(v0 + 376);

  v29(v30, v32);
  sub_10000C0D0(v31);
  uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
  os_log_type_t v35 = static os_log_type_t.default.getter();
  BOOL v36 = os_log_type_enabled(v34, v35);
  uint64_t v37 = *(void **)(v0 + 376);
  if (!v36)
  {

    id v44 = *v1;
    uint64_t v34 = (os_log_s *)*v1;
    goto LABEL_21;
  }

  uint64_t v38 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
  *(_DWORD *)uint64_t v38 = 67109120;
  id v39 = [v37 announcement];
  id v40 = *v1;
  if (v39)
  {
    id v41 = v39;
    id v42 = [v39 speechDataTranscription];

    if (!v42)
    {
      int v43 = 0;
      goto LABEL_20;
    }

    int v43 = 1;
    id v40 = v42;
  }

  else
  {
    int v43 = 0;
  }

LABEL_20:
  uint64_t v45 = *(void **)(v0 + 376);
  *(_DWORD *)(v0 + 736) = v43;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 736, v0 + 740, v38 + 4, v38 + 8);

  _os_log_impl((void *)&_mh_execute_header, v34, v35, "Transcription: %{BOOL}d", v38, 8u);
  swift_slowDealloc(v38, -1LL, -1LL);
  id v44 = *(id *)(v0 + 376);
LABEL_21:
  uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  uint64_t v47 = *(void *)(v0 + 600);
  uint64_t v48 = *(void *)(v0 + 512);

  v46(v47, v48);
  URL._bridgeToObjectiveC()(v49);
  uint64_t v51 = v50;
  id v52 = [(id)objc_opt_self(ANAnnouncementContent) contentWithAudioFileURL:v50];
  *(void *)(v0 + 680) = v52;

  id v53 = [v44 announcement];
  NSString v54 = v53;
  if (v53)
  {
    id v55 = [v53 speechDataTranscription];

    if (v55)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
      uint64_t v57 = v56;

      NSString v54 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v57);
    }

    else
    {
      NSString v54 = 0LL;
    }
  }

  id v58 = *v1;
  objc_msgSend(v52, "setTranscription:", v54, v82);

  id v59 = [v58 _metadata];
  if (v59)
  {
    id v60 = v59;
    id v61 = [v59 endpointId];

    if (v61)
    {
      uint64_t v62 = *(void *)(v0 + 440);
      uint64_t v64 = *(void *)(v0 + 392);
      uint64_t v63 = *(void *)(v0 + 400);
      uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
      uint64_t v67 = v66;

      UUID.init(uuidString:)(v65, v67);
      swift_bridgeObjectRelease(v67);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v62, 1LL, v64) == 1)
      {
        Class isa = 0LL;
      }

      else
      {
        uint64_t v69 = *(void *)(v0 + 440);
        uint64_t v71 = *(void *)(v0 + 392);
        uint64_t v70 = *(void *)(v0 + 400);
        Class isa = UUID._bridgeToObjectiveC()().super.isa;
        (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
      }

      [v52 setEndpointIdentifier:isa];
    }
  }

  id v72 = [*v1 sharedUserID];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
    uint64_t v76 = v75;
  }

  else
  {
    uint64_t v74 = 0LL;
    uint64_t v76 = 0LL;
  }

  *(void *)(v0 + 688) = v76;
  id v77 = [v52 endpointIdentifier];
  if (v77)
  {
    uint64_t v78 = v77;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v79 = 0LL;
  }

  else
  {
    uint64_t v79 = 1LL;
  }

  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 400) + 56LL))( *(void *)(v0 + 424),  v79,  1LL,  *(void *)(v0 + 392));
  unint64_t v80 = (void *)swift_task_alloc(dword_100021614);
  *(void *)(v0 + 696) = v80;
  *unint64_t v80 = v0;
  v80[1] = sub_1000118CC;
  return sub_100004838(*(void *)(v0 + 432), v74, v76, *(void *)(v0 + 424));
}

uint64_t sub_100011558()
{
  uint64_t v1 = *(void *)(v0 + 672);
  sub_10000C0D0(*(void *)(v0 + 616));
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 672);
    uint64_t v43 = *(void *)(v0 + 616);
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v41 = *(void *)(v0 + 512);
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v47 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_getErrorValue(v5, v0 + 320, v0 + 152);
    uint64_t v8 = Error.localizedDescription.getter(*(void *)(v0 + 160), *(void *)(v0 + 168));
    unint64_t v10 = v9;
    *(void *)(v0 + 256) = sub_100015F1C(v8, v9, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 256, v0 + 264, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v10);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to retrieve duration %{public}s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    v45(v43, v41);
  }

  else
  {
    uint64_t v11 = *(void *)(v0 + 672);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v13 = *(void *)(v0 + 616);
    uint64_t v14 = *(void *)(v0 + 512);
    swift_errorRelease(v11);
    swift_errorRelease(v11);

    v12(v13, v14);
  }

  uint64_t v15 = *(void *)(v0 + 672);
  uint64_t v17 = *(void *)(v0 + 496);
  uint64_t v16 = *(void *)(v0 + 504);
  uint64_t v18 = *(void *)(v0 + 488);
  id v46 = [objc_allocWithZone(INSendAnnouncementIntentResponse) initWithCode:4 userActivity:0];
  swift_errorRelease(v15);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  uint64_t v19 = *(void *)(v0 + 624);
  uint64_t v20 = *(void *)(v0 + 616);
  uint64_t v21 = *(void *)(v0 + 608);
  uint64_t v22 = *(void *)(v0 + 600);
  uint64_t v23 = *(void *)(v0 + 592);
  uint64_t v24 = *(void *)(v0 + 584);
  uint64_t v25 = *(void *)(v0 + 576);
  uint64_t v26 = *(void *)(v0 + 568);
  uint64_t v27 = *(void *)(v0 + 560);
  uint64_t v29 = *(void *)(v0 + 552);
  uint64_t v30 = *(void *)(v0 + 544);
  uint64_t v31 = *(void *)(v0 + 536);
  uint64_t v32 = *(void *)(v0 + 528);
  uint64_t v33 = *(void *)(v0 + 504);
  uint64_t v34 = *(void *)(v0 + 480);
  uint64_t v35 = *(void *)(v0 + 472);
  uint64_t v36 = *(void *)(v0 + 464);
  uint64_t v37 = *(void *)(v0 + 456);
  uint64_t v38 = *(void *)(v0 + 440);
  uint64_t v39 = *(void *)(v0 + 432);
  uint64_t v40 = *(void *)(v0 + 424);
  uint64_t v42 = *(void *)(v0 + 416);
  uint64_t v44 = *(void *)(v0 + 408);
  swift_task_dealloc(*(void *)(v0 + 632));
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v42);
  swift_task_dealloc(v44);
  return (*(uint64_t (**)(id))(v0 + 8))(v46);
}

uint64_t sub_1000118CC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 688LL);
  uint64_t v2 = *(void *)(*(void *)v0 + 424LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 696LL));
  swift_bridgeObjectRelease(v1);
  sub_10000BCE0(v2, (uint64_t *)&unk_1000216E0);
  return swift_task_switch(sub_100011940, 0LL, 0LL);
}

uint64_t sub_100011940()
{
  uint64_t v1 = v0 + 344;
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v4 = *(void *)(v0 + 400);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1LL, v3) == 1)
  {
    sub_10000BCE0(v2, (uint64_t *)&unk_1000216E0);
  }

  else
  {
    uint64_t v5 = *(void *)(v0 + 592);
    uint64_t v7 = *(void *)(v0 + 408);
    uint64_t v6 = *(void *)(v0 + 416);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v6, v2, v3);
    sub_10000C0D0(v5);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, v6, v3);
    unint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v10 = static os_log_type_t.default.getter();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v13 = *(void *)(v0 + 592);
    uint64_t v15 = *(void *)(v0 + 400);
    uint64_t v14 = *(void *)(v0 + 408);
    uint64_t v16 = *(void *)(v0 + 392);
    if (v11)
    {
      uint64_t v197 = *(void *)(v0 + 512);
      v192 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
      uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v206 = swift_slowAlloc(32LL, -1LL);
      uint64_t v18 = v206;
      *(_DWORD *)uint64_t v17 = 136315138;
      unint64_t v19 = sub_100005B94();
      uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter(v16, v19);
      unint64_t v22 = v21;
      *(void *)(v0 + 344) = sub_100015F1C(v20, v21, &v206);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 344, v0 + 352, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease(v22);
      uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v23(v14, v16);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "MU HMUser ID: %s", v17, 0xCu);
      swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v24 = v18;
      uint64_t v1 = v0 + 344;
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);

      v192(v13, v197);
    }

    else
    {
      uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      uint64_t v25 = *(void *)(v0 + 512);
      v23(*(void *)(v0 + 408), *(void *)(v0 + 392));

      v12(v13, v25);
    }

    uint64_t v26 = *(void **)(v0 + 680);
    uint64_t v27 = *(void *)(v0 + 416);
    uint64_t v28 = *(void *)(v0 + 392);
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v26 setHomeKitUserIdentifier:isa];

    v23(v27, v28);
  }

  id v30 = [*(id *)(v0 + 376) isReply];
  if (v30)
  {
    uint64_t v31 = v30;
    unsigned int v32 = [v30 BOOLValue];

    if (v32)
    {
      id v33 = [*(id *)(v0 + 376) recipients];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
        uint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v34, v35);

        id v37 = (id)sub_10000BD7C(v36);
        swift_bridgeObjectRelease(v36);
        id v38 = [v37 homeName];
        static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        uint64_t v40 = v39;

        id v41 = [v37 zoneNames];
        uint64_t v42 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v41, &type metadata for String);

        id v43 = [v37 roomNames];
        uint64_t v44 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v43, &type metadata for String);

        NSString v45 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v40);
        v46.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v42);
        v47.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v44);
        id v48 = [(id)objc_opt_self(ANAnnouncementDestination) destinationWithHomeName:v45 zoneNames:v46.super.isa roomNames:v47.super.isa];
LABEL_26:
        id v104 = v48;

        goto LABEL_27;
      }

      id v91 = [*(id *)(v0 + 376) announcement];
      NSString v92 = v91;
      if (v91)
      {
        id v93 = [v91 identifier];

        if (v93)
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)(v93);
          uint64_t v95 = v94;

          NSString v92 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v95);
        }

        else
        {
          NSString v92 = 0LL;
        }
      }

      uint64_t v140 = *(void **)(v0 + 376);
      id v104 =  [(id)objc_opt_self(ANAnnouncementDestination) destinationWithReplyToAnnouncementIdentifier:v92];

      id v141 = [v140 announcement];
      if (v141)
      {
        v142 = v141;
        id v143 = [v141 identifier];

        if (v143)
        {
          uint64_t v144 = static String._unconditionallyBridgeFromObjectiveC(_:)(v143);
          unint64_t v146 = v145;

          uint64_t v147 = HIBYTE(v146) & 0xF;
          if ((v146 & 0x2000000000000000LL) == 0) {
            uint64_t v147 = v144 & 0xFFFFFFFFFFFFLL;
          }
          if (v147)
          {
            uint64_t v205 = v1;
            sub_10000C0D0(*(void *)(v0 + 584));
            uint64_t v148 = swift_bridgeObjectRetain(v146);
            uint64_t v149 = (os_log_s *)Logger.logObject.getter(v148);
            os_log_type_t v150 = static os_log_type_t.default.getter();
            BOOL v151 = os_log_type_enabled(v149, v150);
            v152 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
            uint64_t v153 = *(void *)(v0 + 584);
            uint64_t v154 = *(void *)(v0 + 512);
            if (v151)
            {
              uint64_t v201 = *(void *)(v0 + 512);
              v155 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
              v196 = v152;
              uint64_t v156 = swift_slowAlloc(32LL, -1LL);
              uint64_t v206 = v156;
              *(_DWORD *)v155 = 136315138;
              swift_bridgeObjectRetain(v146);
              *(void *)(v0 + 336) = sub_100015F1C(v144, v146, &v206);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 336, v205, v155 + 4, v155 + 12);
              swift_bridgeObjectRelease_n(v146, 3LL);
              _os_log_impl((void *)&_mh_execute_header, v149, v150, "Sending Reply to Announcement: %s", v155, 0xCu);
              swift_arrayDestroy(v156, 1LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v156, -1LL, -1LL);
              swift_slowDealloc(v155, -1LL, -1LL);

              v196(v153, v201);
            }

            else
            {
              swift_bridgeObjectRelease_n(v146, 2LL);

              v152(v153, v154);
            }

            goto LABEL_27;
          }

          swift_bridgeObjectRelease(v146);
        }
      }

      uint64_t v169 = sub_10000C0D0(*(void *)(v0 + 576));
      v170 = (os_log_s *)Logger.logObject.getter(v169);
      os_log_type_t v171 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v170, v171))
      {
        v172 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v172 = 0;
        _os_log_impl((void *)&_mh_execute_header, v170, v171, "Sending Reply to latest Announcement", v172, 2u);
        swift_slowDealloc(v172, -1LL, -1LL);
      }

      v173 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
      uint64_t v174 = *(void *)(v0 + 576);
      uint64_t v175 = *(void *)(v0 + 512);

      v173(v174, v175);
LABEL_27:
      *(void *)(v0 + 704) = v104;
      id v105 =  [(id)objc_opt_self(ANAnnouncementRequest) requestWithContent:*(void *)(v0 + 680) destination:v104];
      *(void *)(v0 + 712) = v105;
      if (![v104 type])
      {
        id v106 = [v104 roomObjects];
        uint64_t v107 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v106, (char *)&type metadata for Any + 8);

        uint64_t v108 = *(void *)(v107 + 16);
        swift_bridgeObjectRelease(v107);
        if (v108
          || (id v109 = [v104 zoneObjects],
              uint64_t v110 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v109, (char *)&type metadata for Any + 8),
              v109,
              uint64_t v111 = *(void *)(v110 + 16),
              swift_bridgeObjectRelease(v110),
              v111))
        {
          sub_10000C0D0(*(void *)(v0 + 560));
          id v112 = v104;
          Class v113 = (os_log_s *)Logger.logObject.getter(v112);
          os_log_type_t v114 = static os_log_type_t.default.getter();
          BOOL v115 = os_log_type_enabled(v113, v114);
          uint64_t v116 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
          uint64_t v117 = *(void *)(v0 + 560);
          uint64_t v118 = *(void *)(v0 + 512);
          if (!v115)
          {

            v116(v117, v118);
            goto LABEL_34;
          }

          os_log_type_t typea = v114;
          uint64_t v119 = swift_slowAlloc(42LL, -1LL);
          uint64_t v188 = swift_slowAlloc(64LL, -1LL);
          *(_DWORD *)uint64_t v119 = 134349826;
          uint64_t v204 = v117;
          uint64_t v206 = v188;
          uint64_t v200 = v118;
          id v120 = [v112 roomObjects];
          v195 = v116;
          loga = v113;
          uint64_t v121 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v120, (char *)&type metadata for Any + 8);

          uint64_t v122 = *(void *)(v121 + 16);
          swift_bridgeObjectRelease(v121);

          *(void *)(v0 + 288) = v122;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v119 + 4, v119 + 12);

          *(_WORD *)(v119 + 12) = 2080;
          id v123 = [v112 roomObjects];
          uint64_t v124 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v123, (char *)&type metadata for Any + 8);

          uint64_t v125 = Array.description.getter(v124, (char *)&type metadata for Any + 8);
          unint64_t v127 = v126;
          swift_bridgeObjectRelease(v124);
          *(void *)(v0 + 296) = sub_100015F1C(v125, v127, &v206);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 296, v0 + 304, v119 + 14, v119 + 22);
          swift_bridgeObjectRelease(v127);

          *(_WORD *)(v119 + 22) = 2050;
          id v128 = [v112 zoneObjects];
          uint64_t v129 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v128, (char *)&type metadata for Any + 8);

          uint64_t v130 = *(void *)(v129 + 16);
          swift_bridgeObjectRelease(v129);

          *(void *)(v0 + 304) = v130;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 304, v0 + 312, v119 + 24, v119 + 32);

          *(_WORD *)(v119 + 32) = 2080;
          id v131 = [v112 zoneObjects];
          uint64_t v132 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v131, (char *)&type metadata for Any + 8);

          uint64_t v133 = Array.description.getter(v132, (char *)&type metadata for Any + 8);
          unint64_t v135 = v134;
          swift_bridgeObjectRelease(v132);
          *(void *)(v0 + 312) = sub_100015F1C(v133, v135, &v206);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 312, v0 + 320, v119 + 34, v119 + 42);
          swift_bridgeObjectRelease(v135);

          _os_log_impl( (void *)&_mh_execute_header,  loga,  typea,  "Sending Announcement to Rooms (%{public}ld) = %s, Zones (%{public}ld) = %s ",  (uint8_t *)v119,  0x2Au);
          swift_arrayDestroy(v188, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v188, -1LL, -1LL);
          swift_slowDealloc(v119, -1LL, -1LL);
        }

        else
        {
          sub_10000C0D0(*(void *)(v0 + 552));
          id v157 = v104;
          v158 = (os_log_s *)Logger.logObject.getter(v157);
          os_log_type_t v159 = static os_log_type_t.default.getter();
          BOOL v160 = os_log_type_enabled(v158, v159);
          v161 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
          uint64_t v162 = *(void *)(v0 + 552);
          uint64_t v163 = *(void *)(v0 + 512);
          if (!v160)
          {

            v161(v162, v163);
            goto LABEL_34;
          }

          uint64_t v204 = *(void *)(v0 + 552);
          uint64_t v200 = *(void *)(v0 + 512);
          v195 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
          v164 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t typeb = swift_slowAlloc(32LL, -1LL);
          uint64_t v206 = typeb;
          *(_DWORD *)v164 = 136315138;
          id v165 = [v157 homeObject];
          _bridgeAnyObjectToAny(_:)((void *)(v0 + 120));
          swift_unknownObjectRelease(v165);
          uint64_t v166 = String.init<A>(describing:)(v0 + 120, (char *)&type metadata for Any + 8);
          unint64_t v168 = v167;
          *(void *)(v0 + 328) = sub_100015F1C(v166, v167, &v206);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 328, v0 + 336, v164 + 4, v164 + 12);
          swift_bridgeObjectRelease(v168);

          _os_log_impl( (void *)&_mh_execute_header,  v158,  v159,  "[No Room or Zone Names] Sending Announcement to %s",  v164,  0xCu);
          swift_arrayDestroy(typeb, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(typeb, -1LL, -1LL);
          swift_slowDealloc(v164, -1LL, -1LL);
        }

        v195(v204, v200);
      }

LABEL_34:
      uint64_t v136 = v0 + 16;
      uint64_t v137 = (void *)sub_100014FB8(*(void **)(v0 + 376));
      *(void *)(v0 + 720) = v137;
      *(void *)(v0 + 56) = v0 + 224;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_100012C5C;
      uint64_t v138 = swift_continuation_init(v0 + 16, 1LL);
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      uint64_t v139 = (void *)(v0 + 80);
      v139[1] = 0x40000000LL;
      v139[2] = sub_1000134C8;
      v139[3] = &unk_10001CC40;
      v139[4] = v138;
      [v137 sendRequest:v105 completion:v139];
      return swift_continuation_await(v136);
    }
  }

  uint64_t v49 = *(void **)(v0 + 376);
  id v50 = (id)sub_100014FB8(v49);
  id v51 = [v49 recipients];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
    uint64_t v54 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v52, v53);

    id v55 = (id)sub_10000BD7C(v54);
    swift_bridgeObjectRelease(v54);
  }

  else
  {
    id v55 = [objc_allocWithZone(ANHomeContext) init];
  }

  id v56 = [v50 homeNamesForContext:v55];

  uint64_t v57 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v56, &type metadata for String);
  if (*(void *)(v57 + 16) == 1LL)
  {
    uint64_t v58 = *(void *)(v57 + 40);
    id v59 = *(void **)(v0 + 376);
    swift_bridgeObjectRetain(v58);
    swift_bridgeObjectRelease(v57);
    id v60 = [v59 recipients];
    if (v60)
    {
      id v61 = v60;
      uint64_t v62 = sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
      uint64_t v63 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v61, v62);

      id v37 = (id)sub_10000BD7C(v63);
      swift_bridgeObjectRelease(v63);
    }

    else
    {
      id v37 = [objc_allocWithZone(ANHomeContext) init];
    }

    NSString v96 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v58);
    [v37 setHomeName:v96];

    id v97 = [v37 homeName];
    static String._unconditionallyBridgeFromObjectiveC(_:)(v97);
    uint64_t v99 = v98;

    id v100 = [v37 zoneNames];
    uint64_t v101 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v100, &type metadata for String);

    id v102 = [v37 roomNames];
    uint64_t v103 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v102, &type metadata for String);

    NSString v45 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v99);
    v46.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v101);
    v47.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v103);
    id v48 = [(id)objc_opt_self(ANAnnouncementDestination) destinationWithHomeName:v45 zoneNames:v46.super.isa roomNames:v47.super.isa];
    goto LABEL_26;
  }

  sub_10000C0D0(*(void *)(v0 + 568));
  uint64_t v64 = swift_bridgeObjectRetain(v57);
  uint64_t v65 = (os_log_s *)Logger.logObject.getter(v64);
  os_log_type_t v66 = static os_log_type_t.error.getter();
  BOOL v67 = os_log_type_enabled(v65, v66);
  uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  uint64_t v69 = *(void *)(v0 + 568);
  uint64_t v70 = *(void *)(v0 + 512);
  if (v67)
  {
    v202 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v198 = *(void *)(v0 + 512);
    uint64_t v71 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v72 = swift_slowAlloc(32LL, -1LL);
    uint64_t v206 = v72;
    *(_DWORD *)uint64_t v71 = 136315138;
    uint64_t v73 = swift_bridgeObjectRetain(v57);
    uint64_t v74 = Array.description.getter(v73, &type metadata for String);
    uint64_t v193 = v69;
    unint64_t v76 = v75;
    swift_bridgeObjectRelease(v57);
    *(void *)(v0 + 240) = sub_100015F1C(v74, v76, &v206);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v0 + 248, v71 + 4, v71 + 12);
    swift_bridgeObjectRelease(v76);
    swift_bridgeObjectRelease_n(v57, 2LL);
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Did not find exactly one home for recipients: %s", v71, 0xCu);
    swift_arrayDestroy(v72, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v72, -1LL, -1LL);
    swift_slowDealloc(v71, -1LL, -1LL);

    v202(v193, v198);
  }

  else
  {
    swift_bridgeObjectRelease_n(v57, 2LL);

    v68(v69, v70);
  }

  id v77 = *(void **)(v0 + 680);
  uint64_t v79 = *(void *)(v0 + 496);
  uint64_t v78 = *(void *)(v0 + 504);
  uint64_t v80 = *(void *)(v0 + 488);
  id v203 = [objc_allocWithZone(INSendAnnouncementIntentResponse) initWithCode:4 userActivity:0];

  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v78, v80);
  uint64_t v81 = *(void *)(v0 + 624);
  uint64_t v82 = *(void *)(v0 + 616);
  uint64_t v83 = *(void *)(v0 + 608);
  uint64_t v84 = *(void *)(v0 + 600);
  uint64_t v85 = *(void *)(v0 + 592);
  uint64_t v86 = *(void *)(v0 + 584);
  uint64_t v87 = *(void *)(v0 + 576);
  uint64_t v88 = *(void *)(v0 + 568);
  uint64_t v89 = *(void *)(v0 + 560);
  uint64_t v176 = *(void *)(v0 + 552);
  uint64_t v177 = *(void *)(v0 + 544);
  uint64_t v178 = *(void *)(v0 + 536);
  uint64_t v179 = *(void *)(v0 + 528);
  uint64_t v180 = *(void *)(v0 + 504);
  uint64_t v181 = *(void *)(v0 + 480);
  uint64_t v182 = *(void *)(v0 + 472);
  uint64_t v183 = *(void *)(v0 + 464);
  uint64_t v184 = *(void *)(v0 + 456);
  os_log_t log = *(os_log_t *)(v0 + 440);
  uint64_t v187 = *(void *)(v0 + 432);
  *(void *)os_log_type_t type = *(void *)(v0 + 424);
  uint64_t v194 = *(void *)(v0 + 416);
  uint64_t v199 = *(void *)(v0 + 408);
  swift_task_dealloc(*(void *)(v0 + 632));
  swift_task_dealloc(v81);
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  swift_task_dealloc(v84);
  swift_task_dealloc(v85);
  swift_task_dealloc(v86);
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  swift_task_dealloc(v89);
  swift_task_dealloc(v176);
  swift_task_dealloc(v177);
  swift_task_dealloc(v178);
  swift_task_dealloc(v179);
  swift_task_dealloc(v180);
  swift_task_dealloc(v181);
  swift_task_dealloc(v182);
  swift_task_dealloc(v183);
  swift_task_dealloc(v184);
  swift_task_dealloc(log);
  swift_task_dealloc(v187);
  swift_task_dealloc(*(void *)type);
  swift_task_dealloc(v194);
  swift_task_dealloc(v199);
  return (*(uint64_t (**)(id))(v0 + 8))(v203);
}

uint64_t sub_100012C5C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 728LL) = v1;
  if (v1) {
    uint64_t v2 = sub_1000130E4;
  }
  else {
    uint64_t v2 = sub_100012CBC;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100012CBC()
{
  uint64_t v1 = *(void *)(v0 + 544);
  uint64_t v2 = *(void **)(v0 + 224);

  sub_10000C0D0(v1);
  id v3 = v2;
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  uint64_t v54 = v3;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v49 = *(void *)(v0 + 544);
    id v52 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v46 = *(void *)(v0 + 512);
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v56 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    id v8 = v3;
    id v9 = [v8 description];
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    unint64_t v12 = v11;

    *(void *)(v0 + 280) = sub_100015F1C(v10, v12, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v12);

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Announcement sent successfully! Result = %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    v52(v49, v46);
  }

  else
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v14 = *(void *)(v0 + 544);
    uint64_t v15 = *(void *)(v0 + 512);

    v13(v14, v15);
  }

  uint64_t v16 = *(void **)(v0 + 712);
  uint64_t v17 = *(void **)(v0 + 680);
  uint64_t v18 = *(void *)(v0 + 496);
  NSArray v47 = *(void **)(v0 + 704);
  uint64_t v50 = *(void *)(v0 + 504);
  uint64_t v44 = *(void *)(v0 + 488);
  unint64_t v19 = *(void **)(v0 + 384);
  id v53 = [objc_allocWithZone(INSendAnnouncementIntentResponse) initWithCode:3 userActivity:0];
  id v20 = [v54 destination];
  uint64_t v21 = sub_100013554();

  id v22 = v19;
  sub_1000153D8(v21, (uint64_t)v22);

  sub_100007E80(0LL, (unint64_t *)&qword_100021470, &OBJC_CLASS___INAnnouncementRecord_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  [v53 setSentAnnouncements:isa];

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v50, v44);
  uint64_t v24 = *(void *)(v0 + 624);
  uint64_t v25 = *(void *)(v0 + 616);
  uint64_t v26 = *(void *)(v0 + 608);
  uint64_t v27 = *(void *)(v0 + 600);
  uint64_t v28 = *(void *)(v0 + 592);
  uint64_t v29 = *(void *)(v0 + 584);
  uint64_t v30 = *(void *)(v0 + 576);
  uint64_t v31 = *(void *)(v0 + 568);
  uint64_t v32 = *(void *)(v0 + 560);
  uint64_t v34 = *(void *)(v0 + 552);
  uint64_t v35 = *(void *)(v0 + 544);
  uint64_t v36 = *(void *)(v0 + 536);
  uint64_t v37 = *(void *)(v0 + 528);
  uint64_t v38 = *(void *)(v0 + 504);
  uint64_t v39 = *(void *)(v0 + 480);
  uint64_t v40 = *(void *)(v0 + 472);
  uint64_t v41 = *(void *)(v0 + 464);
  uint64_t v42 = *(void *)(v0 + 456);
  uint64_t v43 = *(void *)(v0 + 440);
  uint64_t v45 = *(void *)(v0 + 432);
  uint64_t v48 = *(void *)(v0 + 424);
  uint64_t v51 = *(void *)(v0 + 416);
  uint64_t v55 = *(void *)(v0 + 408);
  swift_task_dealloc(*(void *)(v0 + 632));
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v45);
  swift_task_dealloc(v48);
  swift_task_dealloc(v51);
  swift_task_dealloc(v55);
  return (*(uint64_t (**)(id))(v0 + 8))(v53);
}

uint64_t sub_1000130E4()
{
  uint64_t v1 = *(void *)(v0 + 728);
  uint64_t v2 = *(void **)(v0 + 720);
  uint64_t v3 = *(void *)(v0 + 528);
  swift_willThrow();

  swift_getErrorValue(v1, v0 + 232, v0 + 200);
  uint64_t v4 = sub_100003E8C(*(void *)(v0 + 208), *(void *)(v0 + 216));
  sub_10000C0D0(v3);
  swift_errorRetain(v1);
  uint64_t v5 = swift_errorRetain(v1);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(v0 + 728);
    uint64_t v49 = *(void *)(v0 + 528);
    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v47 = *(void *)(v0 + 512);
    uint64_t v9 = swift_slowAlloc(22LL, -1LL);
    uint64_t v53 = v4;
    uint64_t v55 = swift_slowAlloc(32LL, -1LL);
    uint64_t v10 = v55;
    *(_DWORD *)uint64_t v9 = 136446466;
    swift_getErrorValue(v8, v0 + 248, v0 + 176);
    uint64_t v11 = Error.localizedDescription.getter(*(void *)(v0 + 184), *(void *)(v0 + 192));
    unint64_t v13 = v12;
    *(void *)(v0 + 264) = sub_100015F1C(v11, v12, &v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 264, v0 + 272, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    *(_WORD *)(v9 + 12) = 2050;
    *(void *)(v0 + 272) = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 272, v0 + 280, v9 + 14, v9 + 22);
    _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "Send Announcement failed with error: %{public}s, Intent Response Code: %{public}ld",  (uint8_t *)v9,  0x16u);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v14 = v10;
    uint64_t v4 = v53;
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);

    v51(v49, v47);
  }

  else
  {
    uint64_t v15 = *(void *)(v0 + 728);
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v17 = *(void *)(v0 + 528);
    uint64_t v18 = *(void *)(v0 + 512);
    swift_errorRelease(v15);
    swift_errorRelease(v15);

    v16(v17, v18);
  }

  uint64_t v19 = *(void *)(v0 + 728);
  id v20 = *(void **)(v0 + 712);
  uint64_t v21 = *(void **)(v0 + 704);
  id v22 = *(void **)(v0 + 680);
  uint64_t v24 = *(void *)(v0 + 496);
  uint64_t v23 = *(void *)(v0 + 504);
  uint64_t v25 = *(void *)(v0 + 488);
  id v54 = [objc_allocWithZone(INSendAnnouncementIntentResponse) initWithCode:v4 userActivity:0];

  swift_errorRelease(v19);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  uint64_t v26 = *(void *)(v0 + 624);
  uint64_t v27 = *(void *)(v0 + 616);
  uint64_t v28 = *(void *)(v0 + 608);
  uint64_t v29 = *(void *)(v0 + 600);
  uint64_t v30 = *(void *)(v0 + 592);
  uint64_t v31 = *(void *)(v0 + 584);
  uint64_t v32 = *(void *)(v0 + 576);
  uint64_t v33 = *(void *)(v0 + 568);
  uint64_t v34 = *(void *)(v0 + 560);
  uint64_t v36 = *(void *)(v0 + 552);
  uint64_t v37 = *(void *)(v0 + 544);
  uint64_t v38 = *(void *)(v0 + 536);
  uint64_t v39 = *(void *)(v0 + 528);
  uint64_t v40 = *(void *)(v0 + 504);
  uint64_t v41 = *(void *)(v0 + 480);
  uint64_t v42 = *(void *)(v0 + 472);
  uint64_t v43 = *(void *)(v0 + 464);
  uint64_t v44 = *(void *)(v0 + 456);
  uint64_t v45 = *(void *)(v0 + 440);
  uint64_t v46 = *(void *)(v0 + 432);
  uint64_t v48 = *(void *)(v0 + 424);
  uint64_t v50 = *(void *)(v0 + 416);
  uint64_t v52 = *(void *)(v0 + 408);
  swift_task_dealloc(*(void *)(v0 + 632));
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v48);
  swift_task_dealloc(v50);
  swift_task_dealloc(v52);
  return (*(uint64_t (**)(id))(v0 + 8))(v54);
}

uint64_t sub_1000134C8(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    uint64_t v5 = sub_100003B38((uint64_t *)&unk_100021A60);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *os_log_type_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else if (a2)
  {
    **(void **)(*(void *)(v3 + 64) + 40LL) = a2;
    id v9 = a2;
    return swift_continuation_throwingResume(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100013554()
{
  uint64_t v1 = v0;
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if ([v0 type]) {
    return (uint64_t)v2;
  }
  id v3 = [v0 homeObject];
  _bridgeAnyObjectToAny(_:)(v31);
  swift_unknownObjectRelease(v3);
  uint64_t v4 = (void *)v30[1];
  id v5 = [v1 roomObjects];
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, (char *)&type metadata for Any + 8);

  os_log_type_t v7 = sub_100013BEC(v6);
  swift_bridgeObjectRelease(v6);
  if (!v7)
  {
    id v20 = v4;
LABEL_19:
    swift_bridgeObjectRelease(v20);
    return (uint64_t)v2;
  }

  id v8 = [v1 zoneObjects];
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, (char *)&type metadata for Any + 8);

  uint64_t v10 = sub_100013BEC(v9);
  swift_bridgeObjectRelease(v9);
  if (!v10)
  {
    swift_bridgeObjectRelease(v4);
    id v20 = v7;
    goto LABEL_19;
  }

  if (!v7[2] && !v10[2])
  {
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v7);
    id v21 = objc_allocWithZone(&OBJC_CLASS___INSpeakableString);
    swift_bridgeObjectRetain(v4);
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    id v23 = [v21 initWithSpokenPhrase:v22];

    LOWORD(v29) = 0;
    id v24 = objc_msgSend( objc_allocWithZone(INHomeFilter),  "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:r oom:isExcludeFilter:hasAllQuantifier:",  0,  0,  1,  37,  0,  37,  v23,  0,  0,  0,  v29);
    swift_bridgeObjectRelease(v4);

    uint64_t v25 = sub_100003B38(&qword_100021770);
    uint64_t v26 = swift_allocObject(v25, 40LL, 7LL);
    *(_OWORD *)(v26 + 16) = xmmword_100017BB0;
    id v27 = [objc_allocWithZone(INAnnouncementRecord) initWithOriginator:v24 identifier:0 duration:0];
    *(void *)(v26 + 32) = v27;
    v31[0] = v26;
    specialized Array._endMutation()(v27);
    uint64_t v2 = (void *)v31[0];

    return (uint64_t)v2;
  }

  swift_bridgeObjectRelease(v4);
  sub_100007E80(0LL, (unint64_t *)&qword_100021A40, &OBJC_CLASS___INHomeFilter_ptr);
  uint64_t v11 = (uint64_t)sub_100007EB8(0LL, 0LL, (uint64_t)v7, (uint64_t)v10);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v7);
  if (!((unint64_t)v11 >> 62))
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v12) {
      goto LABEL_9;
    }
LABEL_18:
    id v20 = (void *)v11;
    goto LABEL_19;
  }

  if (v11 < 0) {
    uint64_t v28 = v11;
  }
  else {
    uint64_t v28 = v11 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v11);
  uint64_t v12 = _CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v11);
  if (!v12) {
    goto LABEL_18;
  }
LABEL_9:
  v31[0] = &_swiftEmptyArrayStorage;
  uint64_t result = specialized ContiguousArray.reserveCapacity(_:)(v12);
  if ((v12 & 0x8000000000000000LL) == 0)
  {
    uint64_t v14 = 0LL;
    do
    {
      if ((v11 & 0xC000000000000001LL) != 0) {
        id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, v11);
      }
      else {
        id v15 = *(id *)(v11 + 8 * v14 + 32);
      }
      uint64_t v16 = v15;
      ++v14;
      id v17 = [objc_allocWithZone(INAnnouncementRecord) initWithOriginator:v15 identifier:0 duration:0];

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v18 = *(void *)(v31[0] + 16LL);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
      uint64_t v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v17);
      specialized ContiguousArray._endMutation()(v19);
    }

    while (v12 != v14);
    uint64_t v2 = (void *)v31[0];
    goto LABEL_18;
  }

  __break(1u);
  return result;
}

void sub_100013A54(uint64_t a1)
{
  v4[0] = "\b";
  sub_100007160(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
  }

uint64_t sub_100013ACC(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_100021A2C;
  id v7 = a1;
  a3;
  id v8 = (void *)swift_task_alloc(v6);
  v3[5] = v8;
  void *v8 = v3;
  v8[1] = sub_10000BD1C;
  return sub_10001074C((uint64_t)v7);
}

uint64_t sub_100013B48(int a1, int a2, id a3)
{
  id v4 = [a3 _idiom];
  id v5 = (id)sub_100014FB8(a3);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = &selRef_isAnnounceEnabledForAnyAccessoryOrUserInHome_;
  if (v4 != (id)4) {
    id v7 = &selRef_isAnnounceEnabledForAnyAccessoryInHome_;
  }
  unsigned int v8 = objc_msgSend(v5, *v7, v6);

  return v8 ^ 1;
}

void *sub_100013BEC(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v14 = &_swiftEmptyArrayStorage;
  sub_100014828(0, v2, 0);
  unint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_10001567C(i, (uint64_t)v13);
      if (!swift_dynamicCast( &v11,  v13,  (char *)&type metadata for Any + 8,  &type metadata for String,  6LL)) {
        break;
      }
      uint64_t v5 = v11;
      uint64_t v6 = v12;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_100014828(0, v3[2] + 1LL, 1);
        unint64_t v3 = v14;
      }

      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_100014828(v7 > 1, v8 + 1, 1);
        unint64_t v3 = v14;
      }

      v3[2] = v8 + 1;
      uint64_t v9 = (char *)&v3[2 * v8];
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

uint64_t sub_100013DAC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v22, *(void *)(*v3 + 40LL));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v22, a2, a3);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain(v15);
      return 0LL;
    }

    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }

  swift_bridgeObjectRelease(v7);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v22[0] = *v3;
  *unint64_t v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_100014234(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v21 = *v3;
  *unint64_t v3 = v22[0];
  swift_bridgeObjectRelease(v21);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

Swift::Int sub_100013F58(uint64_t a1)
{
  int64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100003B38((uint64_t *)&unk_100021A50);
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
                int64_t v2 = v32;
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

uint64_t sub_100014234(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_100013F58(v11);
  }

  else
  {
    if (v10 > v9)
    {
      Swift::Int result = (uint64_t)sub_1000143CC();
      goto LABEL_22;
    }

    sub_10001457C(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v26, *(void *)(*v4 + 40));
  String.hash(into:)(v26, v8, a2);
  Swift::Int result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    unint64_t v16 = (void *)(v15 + 16 * a3);
    BOOL v17 = *v16 == v8 && v16[1] == a2;
    if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v18 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v18;
        if (((*(void *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v19 = (void *)(v15 + 16 * a3);
        if (*v19 != v8 || v19[1] != a2)
        {
          Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_21;
      }
    }
  }

LABEL_22:
  uint64_t v21 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v22 = (uint64_t *)(*(void *)(v21 + 48) + 16 * a3);
  *uint64_t v22 = v8;
  v22[1] = a2;
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v24 = __OFADD__(v23, 1LL);
  uint64_t v25 = v23 + 1;
  if (v24) {
    __break(1u);
  }
  else {
    *(void *)(v21 + 16) = v25;
  }
  return result;
}

void *sub_1000143CC()
{
  uint64_t v1 = v0;
  sub_100003B38((uint64_t *)&unk_100021A50);
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
    BOOL v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
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

  Swift::Int result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

Swift::Int sub_10001457C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100003B38((uint64_t *)&unk_100021A50);
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

uint64_t sub_100014828(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100014844(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100014844(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100003B38((uint64_t *)&unk_100021900);
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

  unint64_t v14 = v11 + 32;
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

unint64_t sub_1000149AC(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100014A40(a1, a2, v5);
}

unint64_t sub_100014A10(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100014B20(a1, v4);
}

unint64_t sub_100014A40(uint64_t a1, uint64_t a2, uint64_t a3)
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
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_100014B20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100015784(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10001570C((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

void *sub_100014BE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_100003B38((uint64_t *)&unk_100021900);
  unint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  void v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_100014DBC((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_100015674(v8);
  if (v7 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }

  return v4;
}

void (*sub_100014CC8( void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100014D48(v6, a2, a3);
  return sub_100014D1C;
}

void sub_100014D1C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_100014D48(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_100014DB4;
  }

  __break(1u);
  return result;
}

void sub_100014DB4(id *a1)
{
}

uint64_t sub_100014DBC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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

  BOOL v11 = a2;
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
    *BOOL v11 = *v20;
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

uint64_t sub_100014FB8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100003B38((uint64_t *)&unk_1000216E0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v47 - v8;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce;
  uint64_t result = *(void *)(v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce);
  if (result) {
    return result;
  }
  sub_10000C0D0((uint64_t)v13);
  id v16 = a1;
  int64_t v17 = (void *)Logger.logObject.getter(v16);
  int v53 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled((os_log_t)v17, (os_log_type_t)v53))
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    goto LABEL_10;
  }

  os_log_t v50 = (os_log_t)v17;
  uint64_t v18 = swift_slowAlloc(12LL, -1LL);
  id v52 = v16;
  int64_t v19 = (uint8_t *)v18;
  uint64_t v48 = swift_slowAlloc(32LL, -1LL);
  uint64_t v56 = v48;
  uint64_t v49 = v19;
  *(_DWORD *)int64_t v19 = 136315138;
  id v20 = [v52 _metadata];
  uint64_t v21 = v20;
  uint64_t v51 = v9;
  if (!v20) {
    goto LABEL_8;
  }
  id v22 = [v20 endpointId];

  if (!v22)
  {
    uint64_t v21 = 0LL;
LABEL_8:
    uint64_t v24 = 0LL;
    goto LABEL_9;
  }

  uint64_t v21 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v24 = v23;

LABEL_9:
  unint64_t v25 = v49;
  uint64_t v54 = (uint64_t)v21;
  uint64_t v55 = v24;
  uint64_t v26 = sub_100003B38((uint64_t *)&unk_100021460);
  uint64_t v27 = String.init<A>(describing:)(&v54, v26);
  unint64_t v29 = v28;
  uint64_t v54 = sub_100015F1C(v27, v28, &v56);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v25 + 4, v25 + 12);
  id v30 = v52;

  swift_bridgeObjectRelease(v29);
  os_log_t v31 = v50;
  _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v53, "EndpointID = %s", v25, 0xCu);
  uint64_t v32 = v48;
  swift_arrayDestroy(v48, 1LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v32, -1LL, -1LL);
  uint64_t v33 = v25;
  id v16 = v30;
  swift_slowDealloc(v33, -1LL, -1LL);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  unint64_t v9 = v51;
LABEL_10:
  id v34 = [v16 _metadata];
  if (v34
    && (uint64_t v35 = v34, v36 = [v34 endpointId], v35, v36))
  {
    uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
    uint64_t v39 = v38;

    UUID.init(uuidString:)(v37, v39);
    swift_bridgeObjectRelease(v39);
  }

  else
  {
    uint64_t v40 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56LL))(v9, 1LL, 1LL, v40);
  }

  sub_100007758((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_1000216E0);
  uint64_t v41 = type metadata accessor for UUID(0LL);
  uint64_t v42 = *(void *)(v41 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v7, 1LL, v41) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v41);
  }

  id v44 = [objc_allocWithZone(ANAnnounce) initWithEndpointIdentifier:isa];

  uint64_t v45 = *(void **)(v2 + v14);
  *(void *)(v2 + v14) = v44;

  uint64_t v46 = *(void **)(v2 + v14);
  if (v46) {
    [v46 setDelegate:v2];
  }
  sub_10000BCE0((uint64_t)v9, (uint64_t *)&unk_1000216E0);
  uint64_t result = *(void *)(v2 + v14);
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000153D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v32 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v29 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v8; uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v24))
  {
    v26[1] = v3;
    unint64_t v31 = a1 & 0xC000000000000001LL;
    uint64_t v10 = 4LL;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v27 = v9;
    uint64_t v3 = (uint64_t)v29;
    uint64_t v28 = v6;
    uint64_t v30 = v8;
    while (1)
    {
      id v12 = v31 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10 - 4, a1) : *(id *)(a1 + 8 * v10);
      uint64_t v13 = v12;
      uint64_t v14 = v10 - 3;
      if (__OFADD__(v10 - 4, 1LL)) {
        break;
      }
      sub_10000C0D0(v3);
      unint64_t v15 = v13;
      uint64_t v11 = (os_log_s *)Logger.logObject.getter(v15);
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v11, v16))
      {
        uint64_t v17 = swift_slowAlloc(12LL, -1LL);
        uint64_t v18 = a2;
        uint64_t v19 = a1;
        id v20 = (os_log_s **)swift_slowAlloc(8LL, -1LL);
        *(_DWORD *)uint64_t v17 = v27;
        *(void *)(v17 + 4) = v15;
        *id v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v16,  "Intent Response Announcement Record: %@",  (uint8_t *)v17,  0xCu);
        uint64_t v21 = sub_100003B38(&qword_100021700);
        swift_arrayDestroy(v20, 1LL, v21);
        id v22 = v20;
        a1 = v19;
        a2 = v18;
        uint64_t v6 = v28;
        swift_slowDealloc(v22, -1LL, -1LL);
        uint64_t v23 = v17;
        uint64_t v3 = (uint64_t)v29;
        swift_slowDealloc(v23, -1LL, -1LL);
      }

      else
      {

        uint64_t v11 = v15;
      }

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v3, v6);
      ++v10;
      if (v14 == v30) {
        return swift_bridgeObjectRelease(a1);
      }
    }

    __break(1u);
LABEL_14:
    if (a1 < 0) {
      uint64_t v24 = a1;
    }
    else {
      uint64_t v24 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

  return swift_bridgeObjectRelease(a1);
}

void *sub_100015638(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_100015674(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001567C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000156B8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000156DC(uint64_t a1)
{
  return sub_10000E6E4(a1, v1);
}

uint64_t sub_1000156F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015704(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10001570C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100015740(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003B38(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_100015784(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000157C4()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100021AB4);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000BD20;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100021AB0 + dword_100021AB0))(v2, v3, v4);
}

uint64_t sub_10001583C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100021AC4);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000BD20;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100021AC0 + dword_100021AC0))(v2, v3, v4);
}

uint64_t sub_1000158B4()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100021AE4);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000AB44;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100021AE0 + dword_100021AE0))(v2, v3, v4);
}

uint64_t sub_100015930(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2) {
    return swift_continuation_throwingResume(*(void *)(a1 + 32));
  }
  uint64_t v4 = sub_100003B38((uint64_t *)&unk_100021A60);
  uint64_t v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0LL, 0LL);
  void *v6 = a2;
  id v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

uint64_t sub_100015AD4(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = unk_100021BD4;
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)&dword_100021BD0 + dword_100021BD0);
  id v7 = a1;
  id v8 = a3;
  __int128 v9 = (void *)swift_task_alloc(v6);
  v3[5] = v9;
  *__int128 v9 = v3;
  v9[1] = sub_10000B3DC;
  return v11((uint64_t)v7);
}

id sub_100015B9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlayAnnouncementSoundIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PlayAnnouncementSoundIntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC23AnnounceIntentExtension34PlayAnnouncementSoundIntentHandler);
}

uint64_t sub_100015BEC()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100015C20()
{
  objc_super v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100021B94);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000AB44;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100021B90 + dword_100021B90))(v2, v3, v4);
}

uint64_t sub_100015C8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000BD20;
  return v6();
}

uint64_t sub_100015CE4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  id v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000BD20;
  return v7();
}

uint64_t sub_100015D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000BCE0(a1, (uint64_t *)&unk_1000218C8);
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
  uint64_t v17 = swift_allocObject(&unk_10001CEF0, 32LL, 7LL);
  *(void *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
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

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100021BC8, v17);
}

uint64_t sub_100015E88()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100015EAC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100021BC4);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AB44;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100021BC0 + dword_100021BC0))(a1, v4);
}

uint64_t sub_100015F1C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100015FEC(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001567C((uint64_t)v12, *a3);
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
      sub_10001567C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100007848(v12);
  return v7;
}

uint64_t sub_100015FEC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000161A4(a5, a6);
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

uint64_t sub_1000161A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100016238(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100016410(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100016410(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100016238(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_1000163AC(v4, 0LL);
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

void *sub_1000163AC(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100003B38(&qword_100021BD8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100016410(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100003B38(&qword_100021BD8);
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

uint64_t sub_10001655C(uint64_t a1)
{
  v1[22] = a1;
  unint64_t v2 = (*(void *)(*(void *)(sub_100003B38((uint64_t *)&unk_1000216E0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[23] = swift_task_alloc(v2);
  v1[24] = swift_task_alloc(v2);
  v1[25] = swift_task_alloc(v2);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v1[26] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[27] = v4;
  v1[28] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000165FC, 0LL, 0LL);
}

uint64_t sub_1000165FC()
{
  if (qword_100021328 != -1) {
    swift_once(&qword_100021328, sub_100004188);
  }
  uint64_t v1 = *(void **)(v0 + 176);
  Logger.init(_:)((id)qword_100021EF8);
  unint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void **)(v0 + 176);
  if (v4)
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    id v44 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)unint64_t v6 = 138412290;
    *(void *)(v0 + 168) = v5;
    id v7 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176, v6 + 4, v6 + 12);
    *id v44 = v5;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Received Play Announcement Sound Intent: %@", v6, 0xCu);
    uint64_t v8 = sub_100003B38(&qword_100021700);
    swift_arrayDestroy(v44, 1LL, v8);
    swift_slowDealloc(v44, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {

    unint64_t v2 = (os_log_s *)v5;
  }

  if ([*(id *)(v0 + 176) soundType] == (id)1)
  {
    uint64_t v9 = *(void *)(v0 + 200);
    uint64_t v10 = *(void **)(v0 + 176);
    id v11 = [objc_allocWithZone(ANTonePlayerService) init];
    *(void *)(v0 + 232) = v11;
    uint64_t v12 = type metadata accessor for UUID(0LL);
    uint64_t v13 = *(void *)(v12 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v9, 1LL, 1LL, v12);
    id v14 = [v10 _metadata];
    if (v14)
    {
      uint64_t v15 = v14;
      id v16 = [v14 endpointId];

      if (v16)
      {
        uint64_t v18 = *(void *)(v0 + 192);
        uint64_t v17 = *(void *)(v0 + 200);
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
        uint64_t v21 = v20;

        UUID.init(uuidString:)(v19, v21);
        swift_bridgeObjectRelease(v21);
        sub_10000BCE0(v17, (uint64_t *)&unk_1000216E0);
        sub_100003CE4(v18, v17);
      }
    }

    id v22 = objc_msgSend(*(id *)(v0 + 176), "audioSessionID", v44);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)unint64_t v25 = 67109120;
      *(_DWORD *)(v0 + 256) = (_DWORD)v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 256, v0 + 260, v25 + 4, v25 + 8);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Siri Audio Session ID: %u", v25, 8u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    uint64_t v26 = *(void *)(v0 + 200);
    uint64_t v27 = *(void *)(v0 + 184);

    sub_100003C9C(v26, v27);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v27, 1LL, v12) == 1)
    {
      Class isa = 0LL;
    }

    else
    {
      uint64_t v34 = *(void *)(v0 + 184);
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v34, v12);
    }

    uint64_t v35 = v0 + 16;
    *(void *)(v0 + 240) = isa;
    *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_100016B4C;
    uint64_t v36 = swift_continuation_init(v0 + 16, 1LL);
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    uint64_t v37 = (void *)(v0 + 80);
    v37[1] = 0x40000000LL;
    v37[2] = sub_100015930;
    v37[3] = &unk_10001CF08;
    v37[4] = v36;
    [v11 playTone:0 audioSessionID:v22 endpointUUID:isa completionHandler:v37];
    return swift_continuation_await(v35);
  }

  else
  {
    unint64_t v29 = (os_log_s *)Logger.logObject.getter(*(id *)(v0 + 176));
    os_log_type_t v30 = static os_log_type_t.error.getter();
    BOOL v31 = os_log_type_enabled(v29, v30);
    uint64_t v32 = *(void **)(v0 + 176);
    if (v31)
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v33 = 134217984;
      *(void *)(v0 + 152) = [v32 soundType];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v33 + 4, v33 + 12);

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Unsupported Sound Type: %ld", v33, 0xCu);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    else
    {
    }

    id v39 = [objc_allocWithZone(INPlayAnnouncementSoundIntentResponse) initWithCode:4 userActivity:0];
    uint64_t v40 = *(void *)(v0 + 224);
    uint64_t v41 = *(void *)(v0 + 200);
    uint64_t v43 = *(void *)(v0 + 184);
    uint64_t v42 = *(void *)(v0 + 192);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 216) + 8LL))(v40, *(void *)(v0 + 208));
    swift_task_dealloc(v40);
    swift_task_dealloc(v41);
    swift_task_dealloc(v42);
    swift_task_dealloc(v43);
    return (*(uint64_t (**)(id))(v0 + 8))(v39);
  }

uint64_t sub_100016B4C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 248LL) = v1;
  if (v1) {
    unint64_t v2 = sub_100016C68;
  }
  else {
    unint64_t v2 = sub_100016BAC;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100016BAC()
{
  uint64_t v1 = *(void **)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 200);
  id v3 = [objc_allocWithZone(INPlayAnnouncementSoundIntentResponse) initWithCode:3 userActivity:0];

  sub_10000BCE0(v2, (uint64_t *)&unk_1000216E0);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v5 = *(void *)(v0 + 200);
  uint64_t v7 = *(void *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 192);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 216) + 8LL))(v4, *(void *)(v0 + 208));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(id))(v0 + 8))(v3);
}

uint64_t sub_100016C68()
{
  uint64_t v2 = *(void **)(v0 + 240);
  uint64_t v1 = *(void *)(v0 + 248);
  swift_willThrow();

  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 248);
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v21 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue(v6, v0 + 144, v0 + 120);
    uint64_t v9 = Error.localizedDescription.getter(*(void *)(v0 + 128), *(void *)(v0 + 136));
    unint64_t v11 = v10;
    *(void *)(v0 + 160) = sub_100015F1C(v9, v10, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v11);
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to Play Announcement Sound: %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_errorRelease(v6);
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 248);
    swift_errorRelease(v12);

    swift_errorRelease(v12);
    swift_errorRelease(v12);
  }

  uint64_t v13 = *(void **)(v0 + 232);
  uint64_t v14 = *(void *)(v0 + 200);
  id v15 = [objc_allocWithZone(INPlayAnnouncementSoundIntentResponse) initWithCode:3 userActivity:0];

  sub_10000BCE0(v14, (uint64_t *)&unk_1000216E0);
  uint64_t v16 = *(void *)(v0 + 224);
  uint64_t v17 = *(void *)(v0 + 200);
  uint64_t v19 = *(void *)(v0 + 184);
  uint64_t v18 = *(void *)(v0 + 192);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 216) + 8LL))(v16, *(void *)(v0 + 208));
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(id))(v0 + 8))(v15);
}
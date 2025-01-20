uint64_t sub_1000034D8()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_100003558(v0, qword_100008170);
  sub_100003598(v0, (uint64_t)qword_100008170);
  if (qword_100008120 != -1) {
    swift_once(&qword_100008120, sub_1000035B0);
  }
  return Logger.init(_:)((id)qword_100008188);
}

uint64_t *sub_100003558(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003598(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000035B0()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000014LL,  0x8000000100003D50LL,  0xD000000000000014LL,  0x8000000100003D70LL);
  qword_100008188 = result;
  return result;
}

unint64_t sub_100003610()
{
  unint64_t result = qword_100008140;
  if (!qword_100008140)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008140);
  }

  return result;
}

uint64_t sub_10000364C()
{
  uint64_t result = static PlayVideoIntentHandler.handlerForIntentExtension()();
  qword_100008190 = result;
  return result;
}

uint64_t sub_10000367C()
{
  uint64_t result = PlayLiveServiceIntentHandler.__allocating_init()();
  qword_100008198 = result;
  return result;
}

uint64_t sub_1000036AC()
{
  uint64_t result = WatchSportsEventIntentHandler.__allocating_init()();
  qword_1000081A0 = result;
  return result;
}

id sub_1000036DC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin();
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = static os_signpost_type_t.event.getter(v8);
  if (qword_100008120 != -1) {
    swift_once(&qword_100008120, sub_1000035B0);
  }
  uint64_t v12 = qword_100008188;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v11, &_mh_execute_header, v12, "handlerForIntent", 16LL, 2LL, v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  if (qword_100008118 != -1) {
    swift_once(&qword_100008118, sub_1000034D8);
  }
  uint64_t v13 = sub_100003598(v2, (uint64_t)qword_100008170);
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
  v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Returning handler for intent", v17, 2u);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v18 = type metadata accessor for PlayVideoIntent(0LL);
  if (sub_100003B60(v18))
  {
    if (qword_100008128 != -1) {
      swift_once(&qword_100008128, sub_10000364C);
    }
    uint64_t v19 = type metadata accessor for PlayVideoIntentHandler(0LL);
    v20 = &qword_100008190;
LABEL_19:
    v23 = (void *)*v20;
    a1[3] = v19;
    *a1 = v23;
    return v23;
  }

  uint64_t v21 = type metadata accessor for PlayLiveServiceIntent();
  if (sub_100003B60(v21))
  {
    if (qword_100008130 != -1) {
      swift_once(&qword_100008130, sub_10000367C);
    }
    uint64_t v19 = type metadata accessor for PlayLiveServiceIntentHandler(0LL);
    v20 = &qword_100008198;
    goto LABEL_19;
  }

  uint64_t v22 = type metadata accessor for WatchSportsEventIntent();
  if (sub_100003B60(v22))
  {
    if (qword_100008138 != -1) {
      swift_once(&qword_100008138, sub_1000036AC);
    }
    uint64_t v19 = type metadata accessor for WatchSportsEventIntentHandler(0LL);
    v20 = &qword_1000081A0;
    goto LABEL_19;
  }

  id result = (id)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000001ALL,  0x8000000100003E40LL,  "VideoIntentExtension/IntentHandler.swift",  40LL,  2LL,  34LL,  0);
  __break(1u);
  return result;
}

id sub_100003A78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100003AC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC20VideoIntentExtension13IntentHandler);
}

void *sub_100003B1C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100003B40(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003B60(uint64_t a1)
{
  return swift_dynamicCastClass(v1, a1);
}
uint64_t sub_100003710()
{
  uint64_t result;
  type metadata accessor for SwitchProfileIntentHandler(0LL);
  result = static SwitchProfileIntentHandler.handlerForIntentExtension()();
  qword_100008150 = result;
  return result;
}

id sub_100003740@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  v10 = (char *)&v26 - v9;
  if (qword_100008120 != -1) {
    swift_once(&qword_100008120, sub_100003B5C);
  }
  sub_100003B20(v4, (uint64_t)qword_100008158);
  uint64_t v11 = sub_100003B50((uint64_t)v10);
  v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)sub_100003B44();
    uint64_t v27 = a1;
    v15 = a2;
    v16 = v14;
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Returning handler for intent", v14, 2u);
    uint64_t v17 = (uint64_t)v16;
    a2 = v15;
    a1 = v27;
    sub_100003B38(v17);
  }

  v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v10, v4);
  uint64_t v19 = type metadata accessor for SwitchProfileIntent(0LL);
  if (swift_dynamicCastClass(a1, v19))
  {
    uint64_t v20 = sub_100003B50((uint64_t)v8);
    v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)sub_100003B44();
      *(_WORD *)v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "Intent is SwitchProfileIntent. Returning switchProfileHandler",  v23,  2u);
      sub_100003B38((uint64_t)v23);
    }

    v18(v8, v4);
    if (qword_100008118 != -1) {
      swift_once(&qword_100008118, sub_100003710);
    }
    uint64_t v27 = qword_100008150;
    a2[3] = type metadata accessor for SwitchProfileIntentHandler(0LL);
    v24 = (void *)v27;
    *a2 = v27;
    return v24;
  }

  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000001ALL,  0x8000000100003E20LL,  "IdentityIntentExtension/IntentHandler.swift",  43LL,  2LL,  23LL,  0);
    __break(1u);
  }

  return result;
}

id sub_100003A38()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100003A88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC23IdentityIntentExtension13IntentHandler);
}

void *sub_100003ADC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100003B00(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003B20(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003B38(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_100003B44()
{
  return swift_slowAlloc(2LL, -1LL);
}

uint64_t sub_100003B50(uint64_t a1)
{
  return v1(a1, v3, v2);
}

uint64_t sub_100003B5C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100003BC8(v0, qword_100008158);
  sub_100003B20(v0, (uint64_t)qword_100008158);
  return Logger.init(subsystem:category:)( 0xD000000000000017LL,  0x8000000100003E40LL,  2003790918LL,  0xE400000000000000LL);
}

uint64_t *sub_100003BC8(uint64_t a1, uint64_t *a2)
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
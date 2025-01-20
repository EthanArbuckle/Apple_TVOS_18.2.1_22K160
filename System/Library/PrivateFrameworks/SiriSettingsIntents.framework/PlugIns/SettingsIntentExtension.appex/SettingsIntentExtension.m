uint64_t sub_1000038AC()
{
  uint64_t result;
  sub_100003914();
  result = OS_os_log.init(subsystem:category:)( 0xD000000000000017LL,  0x8000000100003DA0LL,  0x6148746E65746E49LL,  0xED000072656C646ELL);
  qword_100008160 = result;
  return result;
}

unint64_t sub_100003914()
{
  unint64_t result = qword_100008120;
  if (!qword_100008120)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008120);
  }

  return result;
}

void sub_100003950(void *a1)
{
  uint64_t v2 = static os_log_type_t.debug.getter();
  if (qword_100008118 != -1) {
    swift_once(&qword_100008118, sub_1000038AC);
  }
  uint64_t v3 = qword_100008160;
  uint64_t v4 = os_log(_:dso:log:_:_:)( v2,  &_mh_execute_header,  qword_100008160,  "IntentHandler selecting correct handler based on intent",  55LL,  2LL,  &_swiftEmptyArrayStorage);
  uint64_t v5 = static os_log_type_t.error.getter(v4);
  uint64_t v6 = sub_100003B8C(&qword_100008150);
  uint64_t v7 = swift_allocObject(v6, 72LL, 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_100003D80;
  id v8 = a1;
  id v9 = [v8 description];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_100003BCC();
  *(void *)(v7 + 32) = v10;
  *(void *)(v7 + 40) = v12;
  os_log(_:dso:log:_:_:)(v5, &_mh_execute_header, v3, "Received unexpected intent %@", 29LL, 2LL, v7);
  swift_bridgeObjectRelease(v7);
  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000001ALL,  0x8000000100003EA0LL,  "SettingsIntentExtension/IntentHandler.swift",  43LL,  2LL,  26LL,  0);
  __break(1u);
}

id sub_100003AEC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100003B3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC23SettingsIntentExtension13IntentHandler);
}

uint64_t sub_100003B8C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100003BCC()
{
  unint64_t result = qword_100008158;
  if (!qword_100008158)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100008158);
  }

  return result;
}
id sub_100002C84()
{
  if (qword_100008260 != -1) {
    dispatch_once(&qword_100008260, &stru_1000041B8);
  }
  return (id)qword_100008258;
}

void sub_100002CC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.webinspectord", "default");
  v2 = (void *)qword_100008258;
  qword_100008258 = (uint64_t)v1;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = sub_100002C84();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Launched (Device)", v7, 2u);
  }

  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_1000041F8);
  v3 = objc_alloc_init(&OBJC_CLASS___RWIWebinspectordRelayDelegateIOS);
  id v4 = objc_alloc_init(&OBJC_CLASS___RWIRelay);
  [v4 setDelegate:v3];
  [v4 setup];
  objc_autoreleasePoolPop(v0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v5 run];

  return 0LL;
}

void sub_100002E04(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = string;
    id v4 = sub_100002C84();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "webinspectord launched in response to %s",  (uint8_t *)&v6,  0xCu);
    }
  }
}

unint64_t sub_100002EC0(uint64_t a1)
{
  uint64_t v2 = sub_100003414(&qword_100008248);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }

  sub_100003414(&qword_100008250);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  v10 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v28 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100003464(v13, (uint64_t)v5);
    uint64_t v15 = *v5;
    uint64_t v16 = v5[1];
    unint64_t result = sub_10000316C(*v5, v16);
    if ((v18 & 1) != 0) {
      break;
    }
    unint64_t v19 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    v20 = (uint64_t *)(v8[6] + 16 * result);
    uint64_t *v20 = v15;
    v20[1] = v16;
    uint64_t v21 = v8[7];
    uint64_t v22 = type metadata accessor for AuxiliaryMetadataItem(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32LL))( v21 + *(void *)(*(void *)(v22 - 8) + 72LL) * v19,  v10,  v22);
    uint64_t v23 = v8[2];
    BOOL v24 = __OFADD__(v23, 1LL);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_12;
    }
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v26 = v28;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

id RWIRemotePairingDeviceAuxiliaryMetadataProvider.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id RWIRemotePairingDeviceAuxiliaryMetadataProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RWIRemotePairingDeviceAuxiliaryMetadataProvider();
  return objc_msgSendSuper2(&v2, "init");
}

id RWIRemotePairingDeviceAuxiliaryMetadataProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RWIRemotePairingDeviceAuxiliaryMetadataProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_10000316C(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1000031D0(a1, a2, v5);
}

unint64_t sub_1000031D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    v10 = (void *)(v9 + 16 * v6);
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

uint64_t _s13webinspectord47RWIRemotePairingDeviceAuxiliaryMetadataProviderC012registerBoolF06domain3key5valueySo8NSStringC_AISbtFZ_0( uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = static AuxiliaryMetadataProvider.shared.getter();
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v9 = v8;
  uint64_t v10 = sub_100003414(&qword_100008240);
  uint64_t v11 = sub_100003414(&qword_100008248);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = swift_allocObject(v10, v15 + v13, v14 | 7);
  *(_OWORD *)(v16 + 16) = xmmword_100003840;
  v17 = (void *)(v16 + v15);
  char v18 = (void *)((char *)v17 + *(int *)(v11 + 48));
  void *v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v17[1] = v19;
  uint64_t v20 = swift_allocObject(&unk_1000042A8, 17LL, 7LL);
  *(_BYTE *)(v20 + 16) = a3;
  *char v18 = v20;
  uint64_t v21 = enum case for AuxiliaryMetadataItem.BOOLean(_:);
  uint64_t v22 = type metadata accessor for AuxiliaryMetadataItem(0LL);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104LL))(v18, v21, v22);
  unint64_t v23 = sub_100002EC0(v16);
  dispatch thunk of AuxiliaryMetadataProvider.registerMetadata(forDomain:metadata:)(v7, v9, v23);
  swift_release(v6);
  swift_bridgeObjectRelease(v9);
  return swift_bridgeObjectRelease(v23);
}

uint64_t type metadata accessor for RWIRemotePairingDeviceAuxiliaryMetadataProvider()
{
  return objc_opt_self(&OBJC_CLASS___RWIRemotePairingDeviceAuxiliaryMetadataProvider);
}

uint64_t sub_100003414(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100003454()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100003464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003414(&qword_100008248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _[a1 setup];
}
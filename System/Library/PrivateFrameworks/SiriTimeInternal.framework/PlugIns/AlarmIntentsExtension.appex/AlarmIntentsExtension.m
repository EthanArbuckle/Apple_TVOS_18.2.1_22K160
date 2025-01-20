uint64_t sub_100003864()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_100003C38(v0, qword_100008150);
  sub_100003BA4(v0, (uint64_t)qword_100008150);
  return static SiriTimeLog.alarmExtension.getter();
}

unint64_t sub_1000038AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_100008148 != -1) {
    swift_once(&qword_100008148, sub_100003864);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100003BA4(v4, (uint64_t)qword_100008150);
  id v5 = a1;
  v6 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v9 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)v8 = 138412290;
    id v14 = v5;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v8 + 4, v8 + 12);
    void *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Alarm extension received intent: %@", v8, 0xCu);
    uint64_t v11 = sub_100003BF8(&qword_100008140);
    swift_arrayDestroy(v9, 1LL, v11);
    sub_100003C78((uint64_t)v9);
    sub_100003C78((uint64_t)v8);
  }

  else
  {
  }

  uint64_t v12 = static AlarmIntentHandlerUtils.selectIntentHandlers(from:)(v5);
  unint64_t result = sub_100003BBC();
  a2[3] = result;
  *a2 = v12;
  return result;
}

id sub_100003AC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100003B10()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC21AlarmIntentsExtension13IntentHandler);
}

void *sub_100003B60(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100003B84(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003BA4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100003BBC()
{
  unint64_t result = qword_100008138;
  if (!qword_100008138)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSObject);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008138);
  }

  return result;
}

uint64_t sub_100003BF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t *sub_100003C38(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003C78(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}
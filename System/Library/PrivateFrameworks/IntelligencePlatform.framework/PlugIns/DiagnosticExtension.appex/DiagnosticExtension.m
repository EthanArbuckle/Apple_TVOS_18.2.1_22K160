void *sub_1000036F0()
{
  return &_swiftEmptyArrayStorage;
}

id sub_1000037AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IPDiagnosticExtension();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1000037FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IPDiagnosticExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IPDiagnosticExtension()
{
  return objc_opt_self(&OBJC_CLASS___GDIPDiagnosticExtension);
}

unint64_t sub_10000384C()
{
  unint64_t result = qword_100008278;
  if (!qword_100008278)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___DEAttachmentItem);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008278);
  }

  return result;
}

uint64_t sub_100003888()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1000039C0(v0, static Logging.defaultLog);
  sub_100003928(v0, (uint64_t)static Logging.defaultLog);
  id v1 = GDDiagnosticExtensionDefaultLog();
  return Logger.init(_:)(v1);
}

uint64_t Logging.defaultLog.unsafeMutableAddressor()
{
  if (qword_100008248 != -1) {
    swift_once(&qword_100008248, sub_100003888);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_100003928(v0, (uint64_t)static Logging.defaultLog);
}

uint64_t sub_100003928(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logging.defaultLog.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100008248 != -1) {
    swift_once(&qword_100008248, sub_100003888);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_100003928(v2, (uint64_t)static Logging.defaultLog);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

uint64_t *sub_1000039C0(uint64_t a1, uint64_t *a2)
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

id GDDiagnosticExtensionDefaultLog()
{
  if (qword_1000082A0 != -1) {
    dispatch_once(&qword_1000082A0, &stru_1000041E8);
  }
  return (id)qword_100008298;
}

void sub_100003A40(id a1)
{
  os_log_t v1 = os_log_create( (const char *)[@"com.apple.intelligenceplatform.DiagnosticExtension" UTF8String],  "default");
  uint64_t v2 = (void *)qword_100008298;
  qword_100008298 = (uint64_t)v1;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}
@interface Reader
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21automationmode_writer6Reader)init;
- (void)dealloc;
- (void)requestAutomationModeEnabledStateWithReply:(id)a3;
- (void)requestAutomationModeRequiresAuthenticationWithReply:(id)a3;
@end

@implementation Reader

- (void)dealloc
{
  uint64_t v2 = qword_100010A30;
  v3 = self;
  if (v2 != -1) {
    swift_once(&qword_100010A30, sub_1000014FC);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_1000032F4(v4, (uint64_t)qword_100010A38);
  v5 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Tearing down Reader", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for Reader(0LL);
  -[Reader dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
}

- (void)requestAutomationModeEnabledStateWithReply:(id)a3
{
}

- (void)requestAutomationModeRequiresAuthenticationWithReply:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  char v9 = sub_1000028A8(v7);

  return v9 & 1;
}

- (_TtC21automationmode_writer6Reader)init
{
  result = (_TtC21automationmode_writer6Reader *)_swift_stdlib_reportUnimplementedInitializer( "automationmode_writer.Reader",  28LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end
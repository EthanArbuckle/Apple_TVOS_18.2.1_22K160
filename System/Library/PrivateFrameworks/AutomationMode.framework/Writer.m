@interface Writer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21automationmode_writer6Writer)init;
- (void)createNoAuthenticationRequiredCookieWithCompletion:(id)a3;
- (void)dealloc;
- (void)disableAutomationModeWithCompletion:(id)a3;
- (void)enableAutomationModeWithAuthorization:(id)a3 completion:(id)a4;
- (void)enableAutomationModeWithCompletion:(id)a3;
- (void)removeNoAuthenticationRequiredCookieWithCompletion:(id)a3;
@end

@implementation Writer

- (void)dealloc
{
  uint64_t v2 = qword_100010A58;
  v3 = self;
  if (v2 != -1) {
    swift_once(&qword_100010A58, sub_10000350C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_1000032F4(v4, (uint64_t)qword_100010C20);
  v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Tearing down Writer", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for Writer(0LL);
  -[Writer dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
}

- (_TtC21automationmode_writer6Writer)init
{
  result = (_TtC21automationmode_writer6Writer *)_swift_stdlib_reportUnimplementedInitializer( "automationmode_writer.Writer",  28LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000082C4(v7);

  return v9 & 1;
}

- (void)disableAutomationModeWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void *, void))_Block_copy(a3);
  uint64_t v5 = self;
  sub_100003D94(0);
  v4[2](v4, 0LL);
  _Block_release(v4);
}

- (void)enableAutomationModeWithCompletion:(id)a3
{
}

- (void)enableAutomationModeWithAuthorization:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_1000087A0(v8, v10, v11, v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_100009420(v8, v10);
}

- (void)createNoAuthenticationRequiredCookieWithCompletion:(id)a3
{
}

- (void)removeNoAuthenticationRequiredCookieWithCompletion:(id)a3
{
}

@end
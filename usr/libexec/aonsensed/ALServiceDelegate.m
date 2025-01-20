@interface ALServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC5ALXPC17ALServiceDelegate)init;
- (void)onData:(id)a3;
- (void)onInterrupt;
@end

@implementation ALServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100285C68(v7);

  return v9 & 1;
}

- (void)onData:(id)a3
{
  id v5 = a3;
  char v9 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;

  sub_100284F08(v6, v8);
  sub_100017F9C(v6, v8);
}

- (void)onInterrupt
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v7 = self;
  uint64_t v8 = xpclog.getter((uint64_t)v6);
  char v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "service,onInterrupt", v11, 2u);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC5ALXPC17ALServiceDelegate)init
{
  result = (_TtC5ALXPC17ALServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer( "ALXPC.ALServiceDelegate",  23LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
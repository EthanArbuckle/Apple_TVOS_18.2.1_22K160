@interface XPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC12wifip2pdCore9XPCServer)init;
- (void)endpointForType:(unint64_t)a3 processName:(id)a4 completionHandler:(id)a5;
@end

@implementation XPCServer

- (_TtC12wifip2pdCore9XPCServer)init
{
  result = (_TtC12wifip2pdCore9XPCServer *)_swift_stdlib_reportUnimplementedInitializer( "wifip2pdCore.XPCServer",  22LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(void *)&self->listener[OBJC_IVAR____TtC12wifip2pdCore9XPCServer_entitlement]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_lock));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_gracePeriodEndedTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_pendingSessions));
  swift_bridgeObjectRelease(*(void *)&self->listener[OBJC_IVAR____TtC12wifip2pdCore9XPCServer_lastProcessName]);
  v3 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_newSessionGracePeriod;
  uint64_t v4 = type metadata accessor for DispatchTimeInterval(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_100021018( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_newSessionHandler),  *(void *)&self->listener[OBJC_IVAR____TtC12wifip2pdCore9XPCServer_newSessionHandler]);
  v5 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_serverStartedTime;
  uint64_t v6 = type metadata accessor for DispatchTime(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_logger;
  uint64_t v8 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = sub_1002FE504(v6, v7);

  return v9 & 1;
}

- (void)endpointForType:(unint64_t)a3 processName:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  _Block_copy(v8);
  v12 = self;
  sub_1002FF190(a3, v9, v11, (uint64_t)v12, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

@end
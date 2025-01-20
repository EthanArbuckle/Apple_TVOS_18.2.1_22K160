@interface ChatInsertMessageRequestHandler
- (_TtC7imagent31ChatInsertMessageRequestHandler)init;
- (void)insertReceivedMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 serviceName:(id)a6;
@end

@implementation ChatInsertMessageRequestHandler

- (void)insertReceivedMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 serviceName:(id)a6
{
  int v7 = a5;
  if (a4)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
    SEL v11 = a2;
  }

  else
  {
    uint64_t v10 = 0LL;
    SEL v11 = 0LL;
  }

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6, a2);
  unint64_t v14 = v13;
  id v15 = a3;
  v16 = self;
  sub_10002F704(a3, v10, (unint64_t)v11, v7, v12, v14);

  swift_bridgeObjectRelease(v14, v17);
  swift_bridgeObjectRelease(v11, v18);
}

- (_TtC7imagent31ChatInsertMessageRequestHandler)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent31ChatInsertMessageRequestHandler_requiredCapabilities) = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent31ChatInsertMessageRequestHandler_requiredEntitlements) = (Class)&off_100065E68;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChatInsertMessageRequestHandler();
  return -[ChatInsertMessageRequestHandler init](&v3, "init");
}

- (void).cxx_destruct
{
}

@end
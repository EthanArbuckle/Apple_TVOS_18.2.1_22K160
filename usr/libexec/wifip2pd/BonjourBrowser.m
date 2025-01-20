@interface BonjourBrowser
- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser)init;
- (void)subscribeLostDiscoveryResultForPublishID:(unsigned __int8)a3 address:(id)a4;
- (void)subscribeReceivedDiscoveryResult:(id)a3;
- (void)subscribeReceivedMessage:(void *)a3 fromPublishID:(uint64_t)a4 address:(void *)a5;
- (void)subscribeTerminatedWithReason:(int64_t)a3;
@end

@implementation BonjourBrowser

- (void)subscribeTerminatedWithReason:(int64_t)a3
{
  v3 = self;
  sub_100021A7C();
}

- (void)subscribeReceivedDiscoveryResult:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018BD8(v4);
}

- (void)subscribeLostDiscoveryResultForPublishID:(unsigned __int8)a3 address:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_100018FF8(a3, v6);
}

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser)init
{
  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser *)_swift_stdlib_reportUnimplementedInitializer( "CoreP2P.BonjourBrowser",  22LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser_delegate));
  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser_discoveredPeers));
}

- (void)subscribeReceivedMessage:(void *)a3 fromPublishID:(uint64_t)a4 address:(void *)a5
{
  id v8 = a3;
  id v9 = a5;
  id v13 = a1;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  sub_1000208D8(v10, v12);
}

@end
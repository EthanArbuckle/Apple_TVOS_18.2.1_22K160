@interface AnalyticsXPCQueryClient
- (_TtC10analyticsd23AnalyticsXPCQueryClient)init;
- (void)dealloc;
@end

@implementation AnalyticsXPCQueryClient

- (_TtC10analyticsd23AnalyticsXPCQueryClient)init
{
  return (_TtC10analyticsd23AnalyticsXPCQueryClient *)AnalyticsXPCQueryClient.init()();
}

- (void)dealloc
{
  v2 = *(_xpc_connection_s **)((char *)&self->super.isa
                             + OBJC_IVAR____TtC10analyticsd23AnalyticsXPCQueryClient__connection);
  v3 = self;
  xpc_connection_cancel(v2);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AnalyticsXPCQueryClient();
  -[AnalyticsXPCQueryClient dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10analyticsd23AnalyticsXPCQueryClient_keyMapping));
}

@end
@interface AnalyticsXPCQueryClient
- (_TtC13CoreAnalytics23AnalyticsXPCQueryClient)init;
- (void)dealloc;
@end

@implementation AnalyticsXPCQueryClient

- (_TtC13CoreAnalytics23AnalyticsXPCQueryClient)init
{
  return (_TtC13CoreAnalytics23AnalyticsXPCQueryClient *)AnalyticsXPCQueryClient.init()();
}

- (void)dealloc
{
  v2 = *(_xpc_connection_s **)((char *)&self->super.isa
                             + OBJC_IVAR____TtC13CoreAnalytics23AnalyticsXPCQueryClient__connection);
  v3 = self;
  xpc_connection_cancel(v2);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AnalyticsXPCQueryClient();
  -[AnalyticsXPCQueryClient dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end
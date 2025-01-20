@interface GameControllerDaemonAnalytics
- (BOOL)sendEvent:(id)a3 withPayloadBuilder:(id)a4;
- (BOOL)sendEvent:(id)a3 withXPCPayloadBuilder:(id)a4;
- (void)sendEvent:(id)a3 withPayload:(id)a4;
- (void)sendEvent:(id)a3 withXPCPayload:(id)a4;
@end

@implementation GameControllerDaemonAnalytics

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
}

- (void)sendEvent:(id)a3 withXPCPayload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  analytics_send_event([v5 UTF8String], v6);
}

- (BOOL)sendEvent:(id)a3 withPayloadBuilder:(id)a4
{
  return AnalyticsSendEventLazy(a3, a4);
}

- (BOOL)sendEvent:(id)a3 withXPCPayloadBuilder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  LOBYTE(v5) = analytics_send_event_lazy([v5 UTF8String], v6);

  return (char)v5;
}

@end
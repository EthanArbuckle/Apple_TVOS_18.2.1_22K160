@interface CSDScreenSharingActivityManager
- (CSDScreenSharingActivityManager)init;
- (CSDScreenSharingActivityManager)initWithFeatureFlags:(id)a3;
- (CSDScreenSharingActivityManagerDelegate)delegate;
- (NSNumber)systemRootLayerScale;
- (TUScreenShareAttributes)latestRemoteAttributes;
- (TUScreenShareAttributes)localScreenShareAttributes;
- (void)broadcastAttributes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalScreenShareAttributes:(id)a3;
- (void)setSystemRootLayerScale:(id)a3;
- (void)startActivitySessionFor:(id)a3 with:(id)a4;
- (void)startObservingSessions;
- (void)stopActivitySession;
@end

@implementation CSDScreenSharingActivityManager

- (CSDScreenSharingActivityManagerDelegate)delegate
{
  return (CSDScreenSharingActivityManagerDelegate *)(id)sub_100235708();
}

- (void)setDelegate:(id)a3
{
  v5 = self;
  sub_100235764((uint64_t)a3);
}

- (TUScreenShareAttributes)localScreenShareAttributes
{
  return (TUScreenShareAttributes *)(id)sub_1002357FC();
}

- (void)setLocalScreenShareAttributes:(id)a3
{
  v5 = self;
  sub_100235858((uint64_t)a3);
}

- (NSNumber)systemRootLayerScale
{
  return (NSNumber *)v2;
}

- (void)setSystemRootLayerScale:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100235900(a3);
}

- (CSDScreenSharingActivityManager)initWithFeatureFlags:(id)a3
{
  id v3 = a3;
  return (CSDScreenSharingActivityManager *)sub_100235CE4();
}

- (TUScreenShareAttributes)latestRemoteAttributes
{
  id v2 = self;
  id v3 = (void *)sub_10023616C();

  return (TUScreenShareAttributes *)v3;
}

- (void)startObservingSessions
{
  id v2 = self;
  ScreenSharingActivityManager.startObservingSessions()();
}

- (void)startActivitySessionFor:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  ScreenSharingActivityManager.startActivitySession(for:with:)();
}

- (void)stopActivitySession
{
  id v2 = self;
  ScreenSharingActivityManager.stopActivitySession()();
}

- (void)broadcastAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ScreenSharingActivityManager.broadcastAttributes(_:)();
}

- (CSDScreenSharingActivityManager)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDScreenSharingActivityManager_subscriptions));
  sub_10022D318(OBJC_IVAR___CSDScreenSharingActivityManager_messenger);
  sub_10022D318(OBJC_IVAR___CSDScreenSharingActivityManager_observer);
  sub_1001D90EC(OBJC_IVAR___CSDScreenSharingActivityManager_carPlayObserver);
  sub_1001D90EC(OBJC_IVAR___CSDScreenSharingActivityManager_queue);
  sub_1001D90EC(OBJC_IVAR___CSDScreenSharingActivityManager_featureFlags);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDScreenSharingActivityManager_localScreenShareAttributes));
  sub_10022D318(OBJC_IVAR___CSDScreenSharingActivityManager_session);
}

@end
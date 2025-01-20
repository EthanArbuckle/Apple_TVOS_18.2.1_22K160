@interface MTBackgroundTaskManager
- (MTBackgroundTaskManager)init;
- (void)beginBackgroundTask:(id)a3;
- (void)endBackgroundTask;
@end

@implementation MTBackgroundTaskManager

- (void)beginBackgroundTask:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v6 = v5;
  v7 = self;
  sub_100142F80(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)endBackgroundTask
{
  v2 = self;
  sub_1001434A4();
}

- (MTBackgroundTaskManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTBackgroundTaskManager_task) = (Class)UIBackgroundTaskInvalid;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BackgroundTaskManager();
  return -[MTBackgroundTaskManager init](&v3, "init");
}

@end
@interface CSDAudioController
- (CSDAudioController)init;
- (CSDAudioController)initWithVoiceOverObserver:(id)a3;
- (void)expediteDeferredEndInterruptionForCallWithUUID:(id)a3;
@end

@implementation CSDAudioController

- (CSDAudioController)initWithVoiceOverObserver:(id)a3
{
  return (CSDAudioController *)sub_10020D1C0(a3);
}

- (void)expediteDeferredEndInterruptionForCallWithUUID:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10020D424((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (CSDAudioController)init
{
}

- (void).cxx_destruct
{
}

@end
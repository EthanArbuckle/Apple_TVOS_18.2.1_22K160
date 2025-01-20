@interface GKMultiplayerActivityEventFilter
- (GKMultiplayerActivityEventFilter)init;
- (void)filterEventWithMetricsFields:(NSDictionary *)a3 completionHandler:(id)a4;
@end

@implementation GKMultiplayerActivityEventFilter

- (GKMultiplayerActivityEventFilter)init
{
  return (GKMultiplayerActivityEventFilter *)MultiplayerActivityEventFilter.init()();
}

- (void)filterEventWithMetricsFields:(NSDictionary *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject(&unk_1002767B8, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_100188AB4((uint64_t)&unk_1002BA7B0, (uint64_t)v7);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR___GKMultiplayerActivityEventFilter_trackedSessions),  v3);
}

@end
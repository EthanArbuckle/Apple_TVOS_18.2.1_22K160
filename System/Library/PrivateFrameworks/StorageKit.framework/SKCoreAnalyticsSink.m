@interface SKCoreAnalyticsSink
- (_TtC10StorageKit19SKCoreAnalyticsSink)init;
- (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4;
@end

@implementation SKCoreAnalyticsSink

- (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4
{
  v5 = _Block_copy(a4);
  sub_188F9F308();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v7 = self;
  v8 = (void *)sub_188F9F2FC();
  v10[4] = sub_188F9F1C4;
  v10[5] = v6;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 1107296256LL;
  v10[2] = sub_188F9E9E8;
  v10[3] = &block_descriptor_8;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC10StorageKit19SKCoreAnalyticsSink)init
{
  return (_TtC10StorageKit19SKCoreAnalyticsSink *)sub_188F9EEBC( self,  (uint64_t)a2,  type metadata accessor for SKCoreAnalyticsSink);
}

@end
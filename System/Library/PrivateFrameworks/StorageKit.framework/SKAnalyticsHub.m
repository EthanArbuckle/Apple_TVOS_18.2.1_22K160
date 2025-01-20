@interface SKAnalyticsHub
+ (void)addSink:(id)a3;
+ (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4;
- (_TtC10StorageKit14SKAnalyticsHub)init;
@end

@implementation SKAnalyticsHub

+ (void)addSink:(id)a3
{
  uint64_t v3 = qword_18C4FDF30;
  swift_unknownObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = swift_unknownObjectRetain();
  MEMORY[0x1895DB490](v4);
  if (*(void *)((qword_18C4FDF28 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((qword_18C4FDF28 & 0xFFFFFFFFFFFFFF8LL)
                                                                                + 0x18) >> 1)
    sub_188F9F32C();
  sub_188F9F338();
  sub_188F9F320();
  swift_endAccess();
  swift_unknownObjectRelease();
}

+ (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  uint64_t v5 = sub_188F9F308();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  _s10StorageKit14SKAnalyticsHubC9sendEvent4name19eventPayloadBuilderySS_SDySSSo8NSObjectCGSgyctFZ_0( v5,  v7,  (uint64_t)sub_188F9F170,  v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC10StorageKit14SKAnalyticsHub)init
{
  return (_TtC10StorageKit14SKAnalyticsHub *)sub_188F9EEBC(self, (uint64_t)a2, type metadata accessor for SKAnalyticsHub);
}

@end
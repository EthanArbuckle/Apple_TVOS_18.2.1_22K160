@interface RTCCSDCallInfo
- (_TtC13callservicesd14RTCCSDCallInfo)init;
@end

@implementation RTCCSDCallInfo

- (_TtC13callservicesd14RTCCSDCallInfo)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13callservicesd14RTCCSDCallInfo_relayDeviceRouteChanges));
  swift_bridgeObjectRelease(*(void *)&self->callUUID[OBJC_IVAR____TtC13callservicesd14RTCCSDCallInfo_CID]);
  v3 = (char *)self + OBJC_IVAR____TtC13callservicesd14RTCCSDCallInfo_timebase;
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->callUUID[OBJC_IVAR____TtC13callservicesd14RTCCSDCallInfo_audioRoute]);
}

@end
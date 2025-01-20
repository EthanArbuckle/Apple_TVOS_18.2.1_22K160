@interface RTCCSDConversationInfo
- (_TtC13callservicesd22RTCCSDConversationInfo)init;
@end

@implementation RTCCSDConversationInfo

- (_TtC13callservicesd22RTCCSDConversationInfo)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_conversationBaseTime;
  uint64_t v4 = sub_1001F86B8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_10020173C((uint64_t)self + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_conversationProvider);
  sub_1001C6CE4((uint64_t)self + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timebase, &qword_100447EA0);
}

@end
@interface ContinuitySessionManager.RecentCallsProvider
- (_TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider)init;
@end

@implementation ContinuitySessionManager.RecentCallsProvider

- (_TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider)init
{
  result = (_TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.RecentCallsProvider",  28LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_neighborhoodActivityConduit));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_recentsQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_cancellables));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_recentCallItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_contacts));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_featureFlags));
  sub_10001C608( (uint64_t)self + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate,  &qword_100115F78);
  sub_10001C08C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_presentScreenTimeShield),  *(void *)&self->continuitySessionManager[OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_presentScreenTimeShield]);
}

@end
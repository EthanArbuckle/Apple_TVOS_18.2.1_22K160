@interface SDAuthenticationSecurityManager
- (_TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager)init;
- (void)handleKeyBagStateChanged;
- (void)handleOnWristStateChanged;
@end

@implementation SDAuthenticationSecurityManager

- (void)handleKeyBagStateChanged
{
  v2 = self;
  sub_100223FF8((uint64_t)sub_100225078, (uint64_t)&unk_1005D5A70);
}

- (void)handleOnWristStateChanged
{
  v2 = self;
  sub_100223FF8((uint64_t)sub_100225070, (uint64_t)&unk_1005D5A48);
}

- (_TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager)init
{
  result = (_TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAuthenticationSecurityManager",  48LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_queue));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_raiseToWakeTimes));
  sub_100224DB4((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastUnlockedAndOnWristDate);
}

@end
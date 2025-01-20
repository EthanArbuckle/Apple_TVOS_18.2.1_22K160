@interface SDAuthenticationLockSession
@end

@implementation SDAuthenticationLockSession

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_aksAuthSession));
  sub_100189B0C( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_authToken),  *(void *)&self->super.super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_authToken]);
  sub_1001A4BC8( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationLockSession_metrics,  type metadata accessor for SDAuthenticationLockSession.Metrics);
}

@end
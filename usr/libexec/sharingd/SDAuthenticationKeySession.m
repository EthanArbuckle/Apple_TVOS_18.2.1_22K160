@interface SDAuthenticationKeySession
@end

@implementation SDAuthenticationKeySession

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_aksAuthSession));
  sub_100189B0C( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_authToken),  *(void *)&self->super.super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_authToken]);
}

@end
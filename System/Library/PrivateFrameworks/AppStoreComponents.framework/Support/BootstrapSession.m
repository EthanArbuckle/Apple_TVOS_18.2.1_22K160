@interface BootstrapSession
- (_TtC19appstorecomponentsd16BootstrapSession)init;
@end

@implementation BootstrapSession

- (_TtC19appstorecomponentsd16BootstrapSession)init
{
  return (_TtC19appstorecomponentsd16BootstrapSession *)sub_10007FB8C();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_rebootstrapTrigger));

  sub_100080CAC(*(unint64_t *)((char *)&self->super.isa
                                    + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState));
}

@end
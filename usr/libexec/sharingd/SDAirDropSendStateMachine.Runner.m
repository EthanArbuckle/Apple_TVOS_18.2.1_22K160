@interface SDAirDropSendStateMachine.Runner
@end

@implementation SDAirDropSendStateMachine.Runner

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_pseudonymService));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_endpointService));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.super.isa
                                           + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_sendConnections));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_selectedConnection));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.super.isa
                                           + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_urls));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner____lazy_storage___senderContact,  &qword_100649F60);
}

@end
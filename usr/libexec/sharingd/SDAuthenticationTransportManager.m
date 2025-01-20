@interface SDAuthenticationTransportManager
- (_TtC16DaemoniOSLibrary32SDAuthenticationTransportManager)init;
@end

@implementation SDAuthenticationTransportManager

- (_TtC16DaemoniOSLibrary32SDAuthenticationTransportManager)init
{
  result = (_TtC16DaemoniOSLibrary32SDAuthenticationTransportManager *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAuthenticationTransportManager",  49LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_queue));
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_nearbyAgentTransport));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_idsLocalTransport));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_idsInternetTransport));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_rapportTransportBT));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_rapportTransportAWDL));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_coreBluetoothTransport));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_rapportTransportReceiver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_transportLock));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAuthenticationTransportManager_rapportInfraWiFiTransportsByIdentifier));
}

@end
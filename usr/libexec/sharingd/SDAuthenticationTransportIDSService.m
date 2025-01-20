@interface SDAuthenticationTransportIDSService
- (_TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation SDAuthenticationTransportIDSService

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v14 = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v19 = self;
  sub_1003FBA80(v15, v17, v12, v14);

  swift_bridgeObjectRelease(v14);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = v13;
  id v15 = a3;
  id v16 = a4;
  id v18 = a7;
  id v17 = self;
  sub_1003FC06C(v12, v14, a6);

  swift_bridgeObjectRelease(v14);
}

- (_TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService)init
{
  result = (_TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAuthenticationTransportIDSService",  52LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_queue));
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_delegate);
  sub_10018709C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_idsService));
}

@end
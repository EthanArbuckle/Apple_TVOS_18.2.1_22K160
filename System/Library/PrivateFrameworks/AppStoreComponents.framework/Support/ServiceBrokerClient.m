@interface ServiceBrokerClient
- (_TtC19appstorecomponentsd19ServiceBrokerClient)init;
- (void)getAppOfferStateServiceForDelegate:(id)a3 withReplyHandler:(id)a4;
- (void)getLockupFetcherServiceWithReplyHandler:(id)a3;
- (void)getMetricsServiceWithReplyHandler:(id)a3;
- (void)getUtilityServiceWithReplyHandler:(id)a3;
- (void)testConnectionWithReplyHandler:(id)a3;
@end

@implementation ServiceBrokerClient

- (void)testConnectionWithReplyHandler:(id)a3
{
}

- (void)getLockupFetcherServiceWithReplyHandler:(id)a3
{
}

- (void)getMetricsServiceWithReplyHandler:(id)a3
{
}

- (void)getAppOfferStateServiceForDelegate:(id)a3 withReplyHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1001261C0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_1000D9F6C((uint64_t)a3, (uint64_t)sub_10008314C, v7);
  swift_unknownObjectRelease(a3);

  swift_release(v7);
}

- (void)getUtilityServiceWithReplyHandler:(id)a3
{
}

- (_TtC19appstorecomponentsd19ServiceBrokerClient)init
{
  result = (_TtC19appstorecomponentsd19ServiceBrokerClient *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.ServiceBrokerClient",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
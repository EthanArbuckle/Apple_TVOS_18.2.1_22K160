@interface JSCampaignAttributionService
- (_TtC19appstorecomponentsd28JSCampaignAttributionService)init;
- (id)processRedirectURL:(id)a3;
@end

@implementation JSCampaignAttributionService

- (id)processRedirectURL:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  sub_10002A030(0LL, &qword_10013EA40, &OBJC_CLASS___JSContext_ptr);
  v7 = self;
  v8 = (void *)static JSContext.requiredCurrent.getter();
  uint64_t v9 = *(uint64_t *)((char *)&v7->super.isa + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_process);
  v12[2] = v4;
  v12[3] = v6;
  v12[4] = (char *)v7 + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_bag;
  v12[5] = v9;
  v12[6] = (char *)v7 + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_accounts;
  v10 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_10009E098, v12);

  swift_bridgeObjectRelease(v6);
  return v10;
}

- (_TtC19appstorecomponentsd28JSCampaignAttributionService)init
{
  result = (_TtC19appstorecomponentsd28JSCampaignAttributionService *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSCampaignAttributionService",  48LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_process));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_accounts));
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_bag;
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end
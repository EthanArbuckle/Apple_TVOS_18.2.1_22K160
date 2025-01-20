@interface AppOfferStateClient
- (_TtC19appstorecomponentsd19AppOfferStateClient)init;
- (void)dealloc;
- (void)decorateBuyParamsForOffer:(id)a3 withActivity:(id)a4 withReplyHandler:(id)a5;
- (void)didChangeAppCapabilities:(id)a3;
- (void)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5 withReplyHandler:(id)a6;
- (void)reinstallWatchAppWithID:(id)a3 withReplyHandler:(id)a4;
- (void)reinstallWatchSystemAppWithBundleID:(id)a3 withReplyHandler:(id)a4;
- (void)startObservingStateOfOffers:(id)a3;
- (void)stopObservingStateOfOffers:(id)a3;
- (void)viewAppForAppDistributionOffer:(id)a3;
@end

@implementation AppOfferStateClient

- (void)dealloc
{
  v2 = self;
  sub_100039B80();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_objectGraph));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appStateController));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_arcadeSubscription));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_restrictions));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_contingentOffers));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appStoreInstallStateMonitor));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_jsStackManager));
  sub_100029F4C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_localizer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_delegate));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_observations));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appDistribution));
}

- (void)didChangeAppCapabilities:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10003C1B0();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)startObservingStateOfOffers:(id)a3
{
}

- (void)stopObservingStateOfOffers:(id)a3
{
}

- (void)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5 withReplyHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_100120940, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  swift_unknownObjectRetain(a3);
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  sub_10003F9E0(a3, v12, v13, (void (*)(void))sub_100044794, v11);
  swift_unknownObjectRelease(a3);

  swift_release(v11);
}

- (void)reinstallWatchAppWithID:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1001208C8, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100041BEC(v8, (uint64_t)sub_100044794, v7);

  swift_release(v7);
}

- (void)reinstallWatchSystemAppWithBundleID:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_100120850, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  uint64_t v11 = self;
  sub_1000425A8(v7, v9, (uint64_t)sub_100044014, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)viewAppForAppDistributionOffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [v4 id];

  id v7 = [v4 distributorId];
}

- (void)decorateBuyParamsForOffer:(id)a3 withActivity:(id)a4 withReplyHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject(&unk_100120800, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_100043034(v10, v11, (uint64_t)sub_100043F18, v9);

  swift_release(v9);
}

- (_TtC19appstorecomponentsd19AppOfferStateClient)init
{
  result = (_TtC19appstorecomponentsd19AppOfferStateClient *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.AppOfferStateClient",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end
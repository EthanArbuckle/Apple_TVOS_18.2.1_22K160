@interface DialogContext
- (AMSProcessInfo)processInfo;
- (NSString)bundleID;
- (NSURL)bundleURL;
- (SKDialogProtocol)dialogObserver;
- (_TtC9storekitd13DialogContext)init;
- (_TtC9storekitd13DialogContext)initWithBundleID:(id)a3 bundleURL:(id)a4 processInfo:(id)a5 dialogObserver:(id)a6;
- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 completionHandler:(id)a4;
- (void)handleDialogRequest:(AMSDialogRequest *)a3 completionHandler:(id)a4;
- (void)handleEngagementRequest:(AMSEngagementRequest *)a3 bag:(AMSBagProtocol *)a4 completionHandler:(id)a5;
- (void)handleEngagementRequest:(AMSEngagementRequest *)a3 bag:(AMSBagProtocol *)a4 hostSceneID:(NSString *)a5 completionHandler:(id)a6;
- (void)handlePurchase:(AMSPurchaseSIWA *)a3 paymentSheetDelegate:(PaymentSheetDelegate *)a4 completionHandler:(id)a5;
- (void)setDialogObserver:(id)a3;
@end

@implementation DialogContext

- (NSString)bundleID
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (NSURL)bundleURL
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000DB548();
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v8;
}

- (SKDialogProtocol)dialogObserver
{
  return (SKDialogProtocol *)(id)sub_1000DB5A4();
}

- (void)setDialogObserver:(id)a3
{
  v5 = self;
  sub_1000DB600((uint64_t)a3);
}

- (AMSProcessInfo)processInfo
{
  return (AMSProcessInfo *)sub_1000DB638();
}

- (_TtC9storekitd13DialogContext)initWithBundleID:(id)a3 bundleURL:(id)a4 processInfo:(id)a5 dialogObserver:(id)a6
{
  uint64_t v10 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v16 = a5;
  swift_unknownObjectRetain(a6);
  return (_TtC9storekitd13DialogContext *)sub_1000DB648(v13, v15, (uint64_t)v12, v16, (uint64_t)a6);
}

- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 completionHandler:(id)a4
{
}

- (void)handleDialogRequest:(AMSDialogRequest *)a3 completionHandler:(id)a4
{
}

- (void)handleEngagementRequest:(AMSEngagementRequest *)a3 bag:(AMSBagProtocol *)a4 completionHandler:(id)a5
{
}

- (void)handleEngagementRequest:(AMSEngagementRequest *)a3 bag:(AMSBagProtocol *)a4 hostSceneID:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = (void *)swift_allocObject(&unk_1002ED9A8, 56LL, 7LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  swift_unknownObjectRetain(a4);
  uint64_t v13 = a5;
  uint64_t v14 = self;
  sub_100121B88((uint64_t)&unk_10032B3F0, (uint64_t)v11);
}

- (void)handlePurchase:(AMSPurchaseSIWA *)a3 paymentSheetDelegate:(PaymentSheetDelegate *)a4 completionHandler:(id)a5
{
}

- (_TtC9storekitd13DialogContext)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9storekitd13DialogContext_bundleURL;
  uint64_t v4 = sub_100086318();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC9storekitd13DialogContext_dialogObserver));
}

@end
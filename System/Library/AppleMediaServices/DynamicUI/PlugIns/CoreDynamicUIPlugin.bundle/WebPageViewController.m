@interface WebPageViewController
- (_TtC19CoreDynamicUIPlugin21WebPageViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5;
- (_TtC19CoreDynamicUIPlugin21WebPageViewController)initWithCoder:(id)a3;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation WebPageViewController

- (_TtC19CoreDynamicUIPlugin21WebPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_58540();
}

- (_TtC19CoreDynamicUIPlugin21WebPageViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  sub_585E0();
}

- (void).cxx_destruct
{
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_59544();
}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  &type metadata for Any[8],  &protocol witness table for AnyHashable);
  }
  *(void *)(swift_allocObject(&unk_75B40, 24LL, 7LL) + 16) = v10;
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  sub_59A00();

  swift_release();
  swift_bridgeObjectRelease(a4);
}

@end
@interface BuyActionImplementation
- (_TtC19CoreDynamicUIPlugin23BuyActionImplementation)init;
- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5;
- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5;
- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5;
@end

@implementation BuyActionImplementation

- (_TtC19CoreDynamicUIPlugin23BuyActionImplementation)init
{
  return (_TtC19CoreDynamicUIPlugin23BuyActionImplementation *)sub_10338();
}

- (void).cxx_destruct
{
}

- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5
{
}

- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
}

- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
}

- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_11370();
  uint64_t v11 = v10;

  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return v12;
}

- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_115D4();

  return v10;
}

@end
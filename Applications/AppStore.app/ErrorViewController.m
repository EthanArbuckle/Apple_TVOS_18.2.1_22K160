@interface ErrorViewController
- (_TtC8AppStore19ErrorViewController)initWithCoder:(id)a3;
- (_TtC8AppStore19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation ErrorViewController

- (void)loadView
{
  v4 = self;
  if ((-[ErrorViewController isViewLoaded](v4, "isViewLoaded") & 1) != 0)
  {
    v2 = v4;
  }

  else
  {
    v3 = (_TtC8AppStore19ErrorViewController *)objc_msgSend( objc_allocWithZone((Class)type metadata accessor for ErrorShieldView()),  "initWithFrame:",  0.0,  0.0,  0.0,  0.0);
    -[ErrorViewController setView:](v4, "setView:", v3);

    v2 = v3;
  }
}

- (_TtC8AppStore19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
    v8 = (char *)self + OBJC_IVAR____TtC8AppStore19ErrorViewController_previouslySelectedTab;
    *(void *)v8 = 0LL;
    v8[8] = 1;
    id v9 = a4;
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    v11 = (char *)self + OBJC_IVAR____TtC8AppStore19ErrorViewController_previouslySelectedTab;
    *(void *)v11 = 0LL;
    v11[8] = 1;
    id v12 = a4;
    NSString v10 = 0LL;
  }

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for ErrorViewController();
  v13 = -[ErrorViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC8AppStore19ErrorViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC8AppStore19ErrorViewController_previouslySelectedTab;
  *(void *)v4 = 0LL;
  v4[8] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ErrorViewController();
  return -[ErrorViewController initWithCoder:](&v6, "initWithCoder:", a3);
}

@end
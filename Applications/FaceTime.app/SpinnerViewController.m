@interface SpinnerViewController
- (_TtC8FaceTime21SpinnerViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime21SpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation SpinnerViewController

- (void)viewDidLoad
{
  v3 = self;
  sub_100042B9C((uint64_t)v3, v2);
}

- (_TtC8FaceTime21SpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
    id v8 = a4;
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    id v10 = a4;
    NSString v9 = 0LL;
  }

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SpinnerViewController((uint64_t)v10, v11);
  v12 = -[SpinnerViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", v9, a4);

  return v12;
}

- (_TtC8FaceTime21SpinnerViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpinnerViewController((uint64_t)self, (uint64_t)a2);
  return -[SpinnerViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
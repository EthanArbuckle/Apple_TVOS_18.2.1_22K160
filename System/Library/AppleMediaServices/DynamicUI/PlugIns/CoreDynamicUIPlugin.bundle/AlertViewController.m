@interface AlertViewController
- (UINavigationItem)navigationItem;
- (_TtC19CoreDynamicUIPlugin19AlertViewController)init;
- (_TtC19CoreDynamicUIPlugin19AlertViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin19AlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AlertViewController

- (_TtC19CoreDynamicUIPlugin19AlertViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_9D8C();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_9E3C((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_9EE8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_9FA8();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_A00C();
}

- (_TtC19CoreDynamicUIPlugin19AlertViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin19AlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  }
  id v5 = a4;
  sub_A208();
}

- (void).cxx_destruct
{
}

@end
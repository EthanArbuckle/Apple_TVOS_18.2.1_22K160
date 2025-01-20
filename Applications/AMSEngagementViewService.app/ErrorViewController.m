@interface ErrorViewController
- (UINavigationItem)navigationItem;
- (_TtC24AMSEngagementViewService19ErrorViewController)init;
- (_TtC24AMSEngagementViewService19ErrorViewController)initWithCoder:(id)a3;
- (_TtC24AMSEngagementViewService19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ErrorViewController

- (_TtC24AMSEngagementViewService19ErrorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000048D0();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1000049B0((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_100004A38();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100004AF0();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100004B54();
}

- (_TtC24AMSEngagementViewService19ErrorViewController)init
{
}

- (_TtC24AMSEngagementViewService19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  id v5 = a4;
  sub_100005088();
}

- (void).cxx_destruct
{
}

@end
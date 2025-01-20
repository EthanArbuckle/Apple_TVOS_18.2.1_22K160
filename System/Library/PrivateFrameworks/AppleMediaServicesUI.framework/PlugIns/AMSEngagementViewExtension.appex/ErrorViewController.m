@interface ErrorViewController
- (UINavigationItem)navigationItem;
- (_TtC26AMSEngagementViewExtension19ErrorViewController)init;
- (_TtC26AMSEngagementViewExtension19ErrorViewController)initWithCoder:(id)a3;
- (_TtC26AMSEngagementViewExtension19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ErrorViewController

- (_TtC26AMSEngagementViewExtension19ErrorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000054A4();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_100005584((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_10000560C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000056C4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100005728();
}

- (_TtC26AMSEngagementViewExtension19ErrorViewController)init
{
}

- (_TtC26AMSEngagementViewExtension19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  }
  id v5 = a4;
  sub_100005C5C();
}

- (void).cxx_destruct
{
}

@end
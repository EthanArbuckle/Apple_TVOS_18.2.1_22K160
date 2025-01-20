@interface ServiceProductPageViewController
- (UINavigationItem)navigationItem;
- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)init;
- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)primaryAction:(id)a3;
- (void)secondaryAction:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ServiceProductPageViewController

- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_945B8();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_94794((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_94840();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_949CC();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  sub_94B4C();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  sub_94C00();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_94CC0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_94D6C(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_94E6C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_94F48();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_94FB0();
}

- (void)primaryAction:(id)a3
{
}

- (void)secondaryAction:(id)a3
{
}

- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)init
{
}

- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  id v5 = a4;
  sub_957C8();
}

- (void).cxx_destruct
{
  sub_95AC4(OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageRenderPresenter);
}

@end
@interface BundleTwoPanelPageViewController
- (_TtC20StoreDynamicUIPlugin32BundleTwoPanelPageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin32BundleTwoPanelPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation BundleTwoPanelPageViewController

- (_TtC20StoreDynamicUIPlugin32BundleTwoPanelPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3B198();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_3B450();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  sub_3B6E0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  sub_3B780();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_3B82C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_3B8D8(a3);
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_3B9E4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_3BA80();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_3BB00();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_3BC40((uint64_t)a3);
}

- (_TtC20StoreDynamicUIPlugin32BundleTwoPanelPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  id v5 = a4;
  sub_3C40C();
}

- (void).cxx_destruct
{
}

@end
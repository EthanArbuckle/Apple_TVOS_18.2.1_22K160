@interface ServiceWelcomePageViewController
- (_TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ServiceWelcomePageViewController

- (_TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_A2580();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_A2600();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  sub_A269C();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  sub_A27B4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_A2860();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_A2AF8();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  sub_A2BA4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_A2C98();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_A2DF8();
}

- (_TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  id v5 = a4;
  sub_A3028();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_visualEffect));
}

@end
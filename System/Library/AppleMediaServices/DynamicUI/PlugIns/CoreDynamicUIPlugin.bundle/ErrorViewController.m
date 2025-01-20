@interface ErrorViewController
- (UINavigationItem)navigationItem;
- (_TtC19CoreDynamicUIPlugin19ErrorViewController)init;
- (_TtC19CoreDynamicUIPlugin19ErrorViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)airplaneModeInquiryDidObserveChange:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ErrorViewController

- (_TtC19CoreDynamicUIPlugin19ErrorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1F6B8();
}

- (void)dealloc
{
  v2 = self;
  sub_1F7DC();
}

- (void).cxx_destruct
{
  sub_62AC(&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin19ErrorViewController_networkInquiry]);
  sub_60C8( (uint64_t)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin19ErrorViewController_networkObservation],  &qword_7DE60);
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1F96C((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_1FA2C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2047C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_204EC();
}

- (_TtC19CoreDynamicUIPlugin19ErrorViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  }
  id v5 = a4;
  sub_21AC4();
}

- (void)airplaneModeInquiryDidObserveChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21B34();
}

@end
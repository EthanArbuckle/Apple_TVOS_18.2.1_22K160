@interface TopChartsDiffablePageViewController
- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithCoder:(id)a3;
- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation TopChartsDiffablePageViewController

- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_overlayViewController) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_activeViewController) = 0LL;
  id v4 = a3;

  result = (_TtC8AppStore35TopChartsDiffablePageViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/TopChartsDiffablePageViewController.swift",  50LL,  2LL,  34LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001F509C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1001F5A2C();
}

- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore35TopChartsDiffablePageViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.TopChartsDiffablePageViewController",  44LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_overlayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_activeViewController));
}

@end
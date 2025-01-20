@interface TopChartsPageViewController
- (_TtC6Arcade27TopChartsPageViewController)initWithCoder:(id)a3;
- (_TtC6Arcade27TopChartsPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation TopChartsPageViewController

- (_TtC6Arcade27TopChartsPageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6Arcade27TopChartsPageViewController_overlayViewController) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6Arcade27TopChartsPageViewController_activeViewController) = 0LL;
  id v4 = a3;

  result = (_TtC6Arcade27TopChartsPageViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/TopChartsPageViewController.swift",  40LL,  2LL,  31LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  id v2 = v4.receiver;
  id v3 = -[TopChartsPageViewController viewDidLoad](&v4, "viewDidLoad");
  dispatch thunk of BasePresenter.didLoad()(v3);
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  sub_1000EB670();
}

- (_TtC6Arcade27TopChartsPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade27TopChartsPageViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.TopChartsPageViewController",  34LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade27TopChartsPageViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade27TopChartsPageViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade27TopChartsPageViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27TopChartsPageViewController_overlayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27TopChartsPageViewController_activeViewController));
}

@end
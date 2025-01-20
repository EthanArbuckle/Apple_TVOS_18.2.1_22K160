@interface ArcadeSubscribeViewController
- (_TtC6Arcade29ArcadeSubscribeViewController)initWithCoder:(id)a3;
- (_TtC6Arcade29ArcadeSubscribeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)dismissPressed:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ArcadeSubscribeViewController

- (_TtC6Arcade29ArcadeSubscribeViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6Arcade29ArcadeSubscribeViewController_overlayViewController) = 0LL;
  id v4 = a3;

  result = (_TtC6Arcade29ArcadeSubscribeViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/ArcadeSubscribeViewController.swift",  42LL,  2LL,  40LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10007F2AC();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_10007F3C0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10007F5E0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)appEnteredWhileAppeared
{
}

- (void)appExitedWhileAppeared
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10007F9E0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  id v4 = v8.receiver;
  id v5 = a3;
  -[ArcadeSubscribeViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  id v6 = objc_msgSend(v4, "view", v8.receiver, v8.super_class);
  if (v6)
  {
    v7 = v6;
    [v6 setNeedsLayout];
  }

  else
  {
    __break(1u);
  }

- (void)dismissPressed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100080404();
}

- (_TtC6Arcade29ArcadeSubscribeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade29ArcadeSubscribeViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.ArcadeSubscribeViewController",  36LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade29ArcadeSubscribeViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade29ArcadeSubscribeViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade29ArcadeSubscribeViewController_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade29ArcadeSubscribeViewController_impressionsCalculator));
  _s6Arcade17PillOverlayLayoutVwxx_0((Class *)((char *)&self->super.super.super.isa
                                             + OBJC_IVAR____TtC6Arcade29ArcadeSubscribeViewController_lifecycleObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29ArcadeSubscribeViewController_pageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29ArcadeSubscribeViewController_overlayViewController));
}

@end
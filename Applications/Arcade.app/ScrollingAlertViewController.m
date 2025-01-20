@interface ScrollingAlertViewController
- (_TtC6Arcade28ScrollingAlertViewController)initWithCoder:(id)a3;
- (_TtC6Arcade28ScrollingAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ScrollingAlertViewController

- (_TtC6Arcade28ScrollingAlertViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000887E0((uint64_t)v3, v4);
}

  ;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100087B74();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100087F28();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000882D4((uint64_t)a3);
}

- (_TtC6Arcade28ScrollingAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade28ScrollingAlertViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.ScrollingAlertViewController",  35LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade28ScrollingAlertViewController_message));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28ScrollingAlertViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28ScrollingAlertViewController_messageTextView));
}

@end
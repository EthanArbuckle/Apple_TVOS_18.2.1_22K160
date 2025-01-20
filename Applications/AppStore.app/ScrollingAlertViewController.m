@interface ScrollingAlertViewController
- (_TtC8AppStore28ScrollingAlertViewController)initWithCoder:(id)a3;
- (_TtC8AppStore28ScrollingAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ScrollingAlertViewController

- (_TtC8AppStore28ScrollingAlertViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100090B50((uint64_t)v3, v4);
}

  ;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10008FEE4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100090298();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100090644((uint64_t)a3);
}

- (_TtC8AppStore28ScrollingAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore28ScrollingAlertViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.ScrollingAlertViewController",  37LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore28ScrollingAlertViewController_message));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28ScrollingAlertViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28ScrollingAlertViewController_messageTextView));
}

@end
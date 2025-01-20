@interface RateProductViewController
- (_TtC6Arcade25RateProductViewController)initWithCoder:(id)a3;
- (_TtC6Arcade25RateProductViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleDirectionalButtonWithGestureRecognizer:(id)a3;
- (void)handlePanWithGestureRecognizer:(id)a3;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation RateProductViewController

- (_TtC6Arcade25RateProductViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001A532C((uint64_t)v3, v4);
}

  ;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001A3B30();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1001A3FD4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RateProductViewController();
  id v4 = v7.receiver;
  -[RateProductViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  id v5 = objc_msgSend(v4, "view", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    [v5 setOverrideUserInterfaceStyle:2];
  }

  else
  {
    __break(1u);
  }

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_100006028(0LL, (unint64_t *)&qword_1002DD600, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B6B4();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_1001A4488(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)handlePanWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001A49F0(v4);
}

- (void)handleDirectionalButtonWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001A4C38(v4);
}

- (_TtC6Arcade25RateProductViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade25RateProductViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.RateProductViewController",  32LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade25RateProductViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade25RateProductViewController_rateAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25RateProductViewController_titleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade25RateProductViewController_starViews));
}

@end
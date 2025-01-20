@interface TVLibrarySplitViewController
- (_TtC8Podcasts28TVLibrarySplitViewController)initWithCoder:(id)a3;
- (_TtC8Podcasts28TVLibrarySplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8Podcasts28TVLibrarySplitViewController)initWithStyle:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVLibrarySplitViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1001573C8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVLibrarySplitViewController();
  v4 = (char *)v8.receiver;
  -[TVLibrarySplitViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_secondaryNavigationController];
  if (v5)
  {
    id v6 = objc_msgSend(v5, "view", v8.receiver, v8.super_class);
    if (v6)
    {
      v7 = v6;
      [v6 setClipsToBounds:0];

      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

- (_TtC8Podcasts28TVLibrarySplitViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_menu) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_primaryNavigationController) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_secondaryNavigationController) = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVLibrarySplitViewController();
  return -[TVLibrarySplitViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC8Podcasts28TVLibrarySplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  id v8 = a4;
  return (_TtC8Podcasts28TVLibrarySplitViewController *)sub_10015766C(v5, v7, a4);
}

- (_TtC8Podcasts28TVLibrarySplitViewController)initWithStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_menu) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_primaryNavigationController) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_secondaryNavigationController) = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVLibrarySplitViewController();
  return -[TVLibrarySplitViewController initWithStyle:](&v5, "initWithStyle:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_primaryNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts28TVLibrarySplitViewController_secondaryNavigationController));
}

@end
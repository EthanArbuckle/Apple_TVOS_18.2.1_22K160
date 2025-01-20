@interface SegmentedViewController
- (_TtC8AppStore23SegmentedViewController)initWithCoder:(id)a3;
- (_TtC8AppStore23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)takeSelectedIndexFrom:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SegmentedViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000F52C0();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_1000F53D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000F5588((uint64_t)a3);
}

- (void)takeSelectedIndexFrom:(id)a3
{
  id v4 = a3;
  v7 = self;
  id v5 = (objc_class *)[v4 selectedSegmentIndex];
  uint64_t v6 = *(uint64_t *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC8AppStore23SegmentedViewController_selectedIndex);
  *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC8AppStore23SegmentedViewController_selectedIndex) = v5;
  sub_1000F571C(v6, (unint64_t)v5);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1000F5FFC();
}

- (_TtC8AppStore23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8AppStore23SegmentedViewController *)sub_1000F653C(v5, v7, a4);
}

- (_TtC8AppStore23SegmentedViewController)initWithCoder:(id)a3
{
  return (_TtC8AppStore23SegmentedViewController *)sub_1000F665C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23SegmentedViewController_headerView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore23SegmentedViewController_segments));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23SegmentedViewController_selectedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23SegmentedViewController_selectorControl));
}

@end
@interface ShelfPageViewController
- (NSString)title;
- (UINavigationItem)navigationItem;
- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)init;
- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)setTitle:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ShelfPageViewController

- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_50F64();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_51050((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (NSString)title
{
  v2 = self;
  sub_51154((uint64_t)v2);
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = self;
  sub_5129C(v4, v6);
}

- (void)loadView
{
  v2 = self;
  sub_51390();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_51528();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3 = self;
  sub_515C0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v3 = self;
  sub_51664();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v3 = self;
  sub_51710();
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_517D4(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_518F0();
}

- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  }
  id v5 = a4;
  sub_52E0C();
}

- (void).cxx_destruct
{
  sub_44438(OBJC_IVAR____TtC19CoreDynamicUIPlugin23ShelfPageViewController_pageRenderPresenter);
  sub_44438(OBJC_IVAR____TtC19CoreDynamicUIPlugin23ShelfPageViewController_preloadingCompletionPromise);
  swift_release();
}

@end
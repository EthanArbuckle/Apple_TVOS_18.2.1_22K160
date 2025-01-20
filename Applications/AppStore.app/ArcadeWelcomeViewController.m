@interface ArcadeWelcomeViewController
- (_TtC8AppStore27ArcadeWelcomeViewController)initWithCoder:(id)a3;
- (_TtC8AppStore27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ArcadeWelcomeViewController

- (_TtC8AppStore27ArcadeWelcomeViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_overlayViewController) = 0LL;
  id v4 = a3;

  result = (_TtC8AppStore27ArcadeWelcomeViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ArcadeWelcomeViewController.swift",  42LL,  2LL,  56LL,  0);
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1001AEE88();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001AF010();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v6 = type metadata accessor for StoreViewControllerLifecycleEvent(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v10 = self;
  -[ArcadeWelcomeViewController viewWillAppear:](&v15, "viewWillAppear:", v3);
  uint64_t v11 = *(void *)&v10->artworkLoader[OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver];
  uint64_t v12 = *(void *)&v10->lifecycleObserver[OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver];
  sub_1000112B0( (Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver),  v11);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))( v9,  enum case for StoreViewControllerLifecycleEvent.willAppear(_:),  v6);
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)(v9, v11, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = (_TtC8AppStore27ArcadeWelcomeViewController *) -[ArcadeWelcomeViewController navigationController]( v10,  "navigationController");
  if (v13)
  {
    v14 = v13;
    -[ArcadeWelcomeViewController setNavigationBarHidden:animated:](v13, "setNavigationBarHidden:animated:", 1LL, 0LL);

    v10 = v14;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1001AF28C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1001AF468(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v6 = type metadata accessor for StoreViewControllerLifecycleEvent(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13.receiver = self;
  v13.super_class = ObjectType;
  v10 = self;
  -[ArcadeWelcomeViewController viewDidDisappear:](&v13, "viewDidDisappear:", v3);
  uint64_t v11 = *(void *)&v10->artworkLoader[OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver];
  uint64_t v12 = *(void *)&v10->lifecycleObserver[OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver];
  sub_1000112B0( (Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver),  v11);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))( v9,  enum case for StoreViewControllerLifecycleEvent.didDisappear(_:),  v6);
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)(v9, v11, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)appEnteredWhileAppeared
{
}

- (void)appExitedWhileAppeared
{
}

- (_TtC8AppStore27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore27ArcadeWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.ArcadeWelcomeViewController",  36LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_artworkLoader));
  _s8AppStore17PillOverlayLayoutVwxx_0((Class *)((char *)&self->super.super.super.isa
                                               + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_impressionsCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_pageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_overlayViewController));
}

@end
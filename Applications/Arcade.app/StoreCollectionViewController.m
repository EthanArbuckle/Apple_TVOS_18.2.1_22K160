@interface StoreCollectionViewController
- (_TtC6Arcade29StoreCollectionViewController)initWithCoder:(id)a3;
- (_TtC6Arcade29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC6Arcade29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)applicationDidBecomeActive:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation StoreCollectionViewController

- (_TtC6Arcade29StoreCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001FBB70();
}

  ;
}

- (void)loadView
{
  v2 = self;
  sub_1001FA994();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001FACA0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1001FB4BC( a3,  (SEL *)&selRef_viewWillAppear_,  (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1001FAEE8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001FB168(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001FB4BC( a3,  (SEL *)&selRef_viewDidDisappear_,  (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StoreCollectionViewController();
  v2 = v6.receiver;
  -[StoreCollectionViewController viewWillLayoutSubviews](&v6, "viewWillLayoutSubviews");
  id v3 = *(void **)((char *)v2 + OBJC_IVAR____TtC6Arcade29StoreCollectionViewController_overlayViewController);
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = objc_msgSend(v3, "view", v6.receiver, v6.super_class);
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))((swift_isaMask & *v2) + 0x138LL))();
    objc_msgSend(v5, "setFrame:");

    v2 = v5;
LABEL_4:

    return;
  }

  __break(1u);
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_1001FA7C4();
}

- (void)appExitedWhileAppeared
{
  v2 = self;
  sub_1001FA7D0();
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = (_TtC6Arcade29StoreCollectionViewController *)a3;
  v7 = self;
  v5 = (_TtC6Arcade29StoreCollectionViewController *) -[StoreCollectionViewController collectionView]( v7,  "collectionView");
  if (v5)
  {
    objc_super v6 = v5;
    -[StoreCollectionViewController selectItemAtIndexPath:animated:scrollPosition:]( v5,  "selectItemAtIndexPath:animated:scrollPosition:",  0LL,  1LL,  0LL);

    id v4 = v7;
    v7 = v6;
  }
}

- (_TtC6Arcade29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC6Arcade29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.StoreCollectionViewController",  36LL,  "init(collectionViewLayout:)",  27LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.StoreCollectionViewController",  36LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade29StoreCollectionViewController_objectGraph));
  sub_1001FBB30((uint64_t)self + OBJC_IVAR____TtC6Arcade29StoreCollectionViewController_lifecycleObserver);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29StoreCollectionViewController_overlayViewController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade29StoreCollectionViewController_collectionViewDelegate));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade29StoreCollectionViewController_collectionViewDataSource));
}

@end
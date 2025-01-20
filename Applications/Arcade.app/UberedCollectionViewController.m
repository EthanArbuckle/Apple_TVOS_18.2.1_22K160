@interface UberedCollectionViewController
- (int64_t)preferredStatusBarStyle;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UberedCollectionViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for UberedCollectionViewController();
  v2 = (char *)v7.receiver;
  -[StoreCollectionViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_uberHeaderView];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = v3;
  v5 = (char *)objc_msgSend(v2, "view", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    [v5 addSubview:v4];

    v2 = v6;
LABEL_4:

    return;
  }

  __break(1u);
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1001FC2E4(a4, width, height);
  swift_unknownObjectRelease(a4);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1001FC538();
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UberedCollectionViewController();
  v2 = v3.receiver;
  -[UberedCollectionViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  v2[OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_contentInsetsInvalid] = 1;
}

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_statusBarStyle);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_uberScrollObserver);
  if (v5)
  {
    double y = a4.y;
    double x = a4.x;
    id v10 = a3;
    v11 = self;
    swift_retain(v5);
    sub_1001C0410(v10, (uint64_t)a5, x, y);

    swift_release(v5);
  }

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_uberScrollObserver);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    swift_retain(v3);
    sub_1001C051C(v5);

    swift_release(v3);
  }

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_uber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_uberHeaderView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade30UberedCollectionViewController_uberScrollObserver));
}

@end
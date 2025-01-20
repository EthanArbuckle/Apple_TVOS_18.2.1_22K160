@interface PurchasesViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC6Arcade23PurchasesViewController)initWithCoder:(id)a3;
- (_TtC6Arcade23PurchasesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PurchasesViewController

- (_TtC6Arcade23PurchasesViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade23PurchasesViewController_pageTraits) = 0LL;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade23PurchasesViewController_pageTitle);
  void *v4 = 0LL;
  v4[1] = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6Arcade23PurchasesViewController_overlayViewController) = 0LL;
  id v5 = a3;

  result = (_TtC6Arcade23PurchasesViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/PurchasesViewController.swift",  36LL,  2LL,  84LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000B1B4();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10000B5B4();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  id v4 = a3;
  id v5 = v7.receiver;
  -[PurchasesViewController traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  id v6 = objc_msgSend(v5, "snapshotPageTraitEnvironment", v7.receiver, v7.super_class);
  sub_10000D480((uint64_t)v6);

  swift_unknownObjectRelease(v6);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_10000C54C();
  uint64_t v4 = v3;

  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[PurchasesViewController contentScrollViewForEdge:](&v5, "contentScrollViewForEdge:", a3);
}

- (_TtC6Arcade23PurchasesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade23PurchasesViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.PurchasesViewController",  30LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade23PurchasesViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade23PurchasesViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23PurchasesViewController_masterCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23PurchasesViewController_masterCollectionDelegate));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade23PurchasesViewController_pageTraits));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23PurchasesViewController_titleHeaderView));
  swift_bridgeObjectRelease(*(void *)&self->objectGraph[OBJC_IVAR____TtC6Arcade23PurchasesViewController_pageTitle]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade23PurchasesViewController_detailsPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23PurchasesViewController_detailViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23PurchasesViewController_overlayViewController));
}

@end
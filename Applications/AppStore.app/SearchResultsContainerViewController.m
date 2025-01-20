@interface SearchResultsContainerViewController
- (_TtC8AppStore36SearchResultsContainerViewController)initWithCoder:(id)a3;
- (_TtC8AppStore36SearchResultsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SearchResultsContainerViewController

- (_TtC8AppStore36SearchResultsContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000AD37C();
}

  ;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000AA7C8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SearchResultsContainerViewController(0LL);
  v4 = (char *)v6.receiver;
  -[SearchResultsContainerViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  ArtworkLoader.isOccluded.setter(0LL);
  v5 = *(void **)&v4[OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_activeViewController];
  if (v5) {
    objc_msgSend(v5, "viewDidAppear:", v3, v6.receiver, v6.super_class);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SearchResultsContainerViewController(0LL);
  v4 = (char *)v6.receiver;
  -[SearchResultsContainerViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_activeViewController];
  if (v5) {
    objc_msgSend(v5, "viewWillDisappear:", v3, v6.receiver, v6.super_class);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchResultsContainerViewController(0LL);
  id v4 = v5.receiver;
  -[SearchResultsContainerViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  ArtworkLoader.isOccluded.setter(1LL);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1000AAD6C(width);
  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for SearchResultsContainerViewController(0LL);
  -[SearchResultsContainerViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v9,  "viewWillTransitionToSize:withTransitionCoordinator:",  a4,  width,  height);
  swift_unknownObjectRelease(a4);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1000AABAC();
}

- (_TtC8AppStore36SearchResultsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore36SearchResultsContainerViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.SearchResultsContainerViewController",  45LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_searchTrendingAppsViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_cancellables));
  sub_1000142AC((uint64_t)self + OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_searchResultsDelegate);
  sub_10002BDF4( (uint64_t)self + OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_activeSection,  type metadata accessor for SearchSection);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_activeViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36SearchResultsContainerViewController_forcedTraitCollection));
}

@end
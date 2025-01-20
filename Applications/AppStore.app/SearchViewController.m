@interface SearchViewController
- (_TtC8AppStore20SearchViewController)initWithCoder:(id)a3;
- (_TtC8AppStore20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8AppStore20SearchViewController)initWithSearchController:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SearchViewController

- (_TtC8AppStore20SearchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100159908();
}

  ;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100157B8C(v4);
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100158BA8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SearchViewController();
  id v4 = (char *)v7.receiver;
  -[SearchViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  id v5 = objc_msgSend(v4, "searchController", v7.receiver, v7.super_class);
  unsigned int v6 = [v5 isActive];

  if (v6) {
    [*(id *)&v4[OBJC_IVAR____TtC8AppStore20SearchViewController_searchResultsContainerViewController] viewWillDisappear:v3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC8AppStore20SearchViewController)initWithSearchController:(id)a3
{
  id v3 = a3;
  result = (_TtC8AppStore20SearchViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.SearchViewController",  29LL,  "init(searchController:)",  23LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8AppStore20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore20SearchViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.SearchViewController",  29LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SearchViewController_searchResultsContainerViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_actionRunner));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_pendingSearchAction));
  swift_bridgeObjectRelease(*(void *)&self->objectGraph[OBJC_IVAR____TtC8AppStore20SearchViewController_lastMatchedProductId]);
  swift_bridgeObjectRelease(*(void *)&self->objectGraph[OBJC_IVAR____TtC8AppStore20SearchViewController_scheduledSearchTerm]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_scheduledSearchUpdate));
}

@end
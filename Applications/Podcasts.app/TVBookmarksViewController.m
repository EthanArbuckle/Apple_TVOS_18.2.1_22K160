@interface TVBookmarksViewController
+ (Class)episodeCellClass;
- (_TtC8Podcasts25TVBookmarksViewController)init;
- (_TtC8Podcasts25TVBookmarksViewController)initWithCoder:(id)a3;
- (_TtC8Podcasts25TVBookmarksViewController)initWithCompositeFetchedResultsController:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)playEpisodeAtIndexPath:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVBookmarksViewController

- (_TtC8Podcasts25TVBookmarksViewController)init
{
  return (_TtC8Podcasts25TVBookmarksViewController *)sub_1001376E8();
}

- (_TtC8Podcasts25TVBookmarksViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Podcasts25TVBookmarksViewController____lazy_storage___headerViewForSizing) = 0LL;
  id v4 = a3;

  result = (_TtC8Podcasts25TVBookmarksViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010021A280LL,  "Podcasts/TVBookmarksViewController.swift",  40LL,  2LL,  23LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TVBookmarksViewController();
  id v2 = v7.receiver;
  -[MTTVEpisodeListViewController viewDidLoad](&v7, "viewDidLoad");
  id v3 = objc_msgSend(v2, "tableView", v7.receiver, v7.super_class);
  uint64_t v4 = type metadata accessor for TVButtonTableHeaderView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v4);
  NSString v6 = String._bridgeToObjectiveC()();
  [v3 registerClass:ObjCClassFromMetadata forHeaderFooterViewReuseIdentifier:v6];
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9 = sub_100126450(&qword_1002B5180);
  __chkstk_darwin(v9);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v16 = type metadata accessor for IndexPath(0LL, v14, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v13, 0LL, 1LL, v16);
  }

  else
  {
    uint64_t v17 = type metadata accessor for IndexPath(0LL, v10, v11);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v13, 1LL, 1LL, v17);
  }

  id v18 = a3;
  id v19 = a4;
  v20 = self;
  sub_100137A14(a3, (uint64_t)a4, (uint64_t)v13);

  sub_100138B90((uint64_t)v13);
}

- (void)playEpisodeAtIndexPath:(id)a3
{
  uint64_t v5 = type metadata accessor for IndexPath(0LL, a2, a3);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = self;
  sub_100137C70();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

+ (Class)episodeCellClass
{
  uint64_t v2 = sub_100134284(0LL, &qword_1002B5188, off_10023E378);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = sub_100137F6C();
  [v7 intrinsicContentSize];
  double v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_100138994();

  return v7;
}

- (_TtC8Podcasts25TVBookmarksViewController)initWithCompositeFetchedResultsController:(id)a3
{
  id v3 = a3;
  result = (_TtC8Podcasts25TVBookmarksViewController *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.TVBookmarksViewController",  34LL,  "init(compositeFetchedResultsController:)",  40LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts25TVBookmarksViewController____lazy_storage___headerViewForSizing));
}

@end
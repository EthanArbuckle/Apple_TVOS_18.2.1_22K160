@interface ContactListWithSnowglobeViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSArray)preferredFocusEnvironments;
- (_TtC8FaceTime38ContactListWithSnowglobeViewController)init;
- (_TtC8FaceTime38ContactListWithSnowglobeViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime38ContactListWithSnowglobeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)_sectionIndexTitlesForCollectionView:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)didSelectAddParticipants;
- (void)didSelectStartAudioCall:(id)a3;
- (void)didSelectStartVideoCall:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ContactListWithSnowglobeViewController

- (id)_sectionIndexTitlesForCollectionView:(id)a3
{
  v5 = (void *)objc_opt_self(&OBJC_CLASS___UILocalizedIndexedCollation, a2);
  id v6 = a3;
  v7 = self;
  id v8 = [v5 currentCollation];
  id v9 = [v8 sectionTitles];

  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, &type metadata for String);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v9 = sub_100018A04(&qword_100112998);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }

  id v13 = a3;
  v14 = self;
  sub_100013174(a5, (uint64_t)v11);

  swift_bridgeObjectRelease(a4);
  uint64_t v15 = type metadata accessor for IndexPath(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1LL, v15) != 1)
  {
    NSIndexPath v20 = IndexPath._bridgeToObjectiveC()();
    Class isa = v20.super.isa;
    (*(void (**)(char *, uint64_t, NSUInteger, void *))(v16 + 8))(v11, v15, v20._length, v20._reserved);
  }

  return isa;
}

- (_TtC8FaceTime38ContactListWithSnowglobeViewController)init
{
  return (_TtC8FaceTime38ContactListWithSnowglobeViewController *)sub_100013F6C();
}

- (_TtC8FaceTime38ContactListWithSnowglobeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001AE88();
}

  ;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_10001B134();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  id v4 = -[ContactListWithSnowglobeViewController view](v3, "view");
  if (v4)
  {
    id v5 = v4;
    [v4 setAlpha:0.0];
  }

  else
  {
    __break(1u);
  }

- (void)viewDidLoad
{
  id v3 = self;
  sub_1000143FC((uint64_t)v3, v2);
}

- (void)viewDidLayoutSubviews
{
  id v3 = self;
  sub_100014590((uint64_t)v3, v2);
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v2 = self;
  uint64_t v3 = sub_100014C90();

  sub_100018A04(&qword_100112990);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)didSelectStartVideoCall:(id)a3
{
}

- (void)didSelectStartAudioCall:(id)a3
{
}

- (void)didSelectAddParticipants
{
  uint64_t v3 = self;
  sub_1000157EC((uint64_t)v3, v2);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_dataSource;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_dataSource,  v5,  0LL,  0LL);
  return *(void *)(*(void *)v3 + 16LL);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = (char *)self + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_dataSource;
  int64_t result = swift_beginAccess( (char *)self + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_dataSource,  v7,  0LL,  0LL);
  if (a4 < 0)
  {
    __break(1u);
  }

  else if (*(void *)(*(void *)v5 + 16LL) > (unint64_t)a4)
  {
    return *(void *)(*(void *)(*(void *)v5 + 16 * a4 + 40) + 16LL);
  }

  __break(1u);
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  v12 = self;
  id v13 = (void *)sub_1000172A8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v12 = a3;
  id v13 = self;
  sub_10001BB68(v12);
  uint64_t v15 = v14;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (_TtC8FaceTime38ContactListWithSnowglobeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  int64_t result = (_TtC8FaceTime38ContactListWithSnowglobeViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.ContactListWithSnowglobeViewController",  47LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001BFEC((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_callManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_featureFlags));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_imageCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController____lazy_storage___loadingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController____lazy_storage___loadingSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController____lazy_storage___snowglobeView));
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

@end
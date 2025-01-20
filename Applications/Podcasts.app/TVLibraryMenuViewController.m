@interface TVLibraryMenuViewController
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (_TtC8Podcasts27TVLibraryMenuViewController)initWithCoder:(id)a3;
- (_TtC8Podcasts27TVLibraryMenuViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8Podcasts27TVLibraryMenuViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLibraryMenuViewController

- (_TtC8Podcasts27TVLibraryMenuViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  IndexPath.init(row:section:)(0LL, 0LL);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts27TVLibraryMenuViewController_firstAppear) = 1;

  result = (_TtC8Podcasts27TVLibraryMenuViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010021A280LL,  "Podcasts/TVLibraryMenuViewController.swift",  42LL,  2LL,  30LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVLibraryMenuViewController(0LL);
  id v2 = v8.receiver;
  -[TVLibraryMenuViewController viewDidLoad](&v8, "viewDidLoad");
  id v3 = objc_msgSend(v2, "tableView", v8.receiver, v8.super_class);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_100134284(0LL, (unint64_t *)&unk_1002B5DC0, &OBJC_CLASS___UITableViewCell_ptr);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v5);
    NSString v7 = String._bridgeToObjectiveC()();
    [v4 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v7];
  }

  else
  {
    __break(1u);
  }

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v5 = self;
  sub_100154114(a3, (uint64_t)v5, v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = qword_1002B4820;
  id v6 = a3;
  NSString v7 = self;
  if (v5 != -1) {
    swift_once(&qword_1002B4820, sub_100154740);
  }
  int64_t v8 = *((void *)off_1002B5D48 + 2);

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL, a2, a3);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = qword_1002B4828;
  id v12 = a3;
  v13 = self;
  if (v11 != -1) {
    swift_once(&qword_1002B4828, sub_100154A00);
  }
  double v14 = *(double *)&qword_1002B5D50;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL, a2, a3);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  id v12 = self;
  v13 = (void *)sub_100154BB4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL, a2, a3);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  id v12 = self;
  sub_100154D3C((uint64_t)v10, v13, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath(0LL, a2, a3);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 1;
}

- (_TtC8Podcasts27TVLibraryMenuViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC8Podcasts27TVLibraryMenuViewController *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.TVLibraryMenuViewController",  36LL,  "init(style:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8Podcasts27TVLibraryMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Podcasts27TVLibraryMenuViewController *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.TVLibraryMenuViewController",  36LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100136648((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC8Podcasts27TVLibraryMenuViewController_navigationDelegate));
  id v3 = (char *)self + OBJC_IVAR____TtC8Podcasts27TVLibraryMenuViewController_selection;
  uint64_t v6 = type metadata accessor for IndexPath(0LL, v4, v5);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v3, v6);
}

@end
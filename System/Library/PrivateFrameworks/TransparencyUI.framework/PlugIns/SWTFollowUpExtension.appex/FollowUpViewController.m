@interface FollowUpViewController
- (_TtC20SWTFollowUpExtension22FollowUpViewController)init;
- (_TtC20SWTFollowUpExtension22FollowUpViewController)initWithCoder:(id)a3;
- (_TtC20SWTFollowUpExtension22FollowUpViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidLoad;
@end

@implementation FollowUpViewController

- (_TtC20SWTFollowUpExtension22FollowUpViewController)init
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = self;
  Logger.init(subsystem:category:)( 0xD000000000000016LL,  0x80000001000077F0LL,  0x7075776F6C6C6F66LL,  0xE800000000000000LL);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))( (uint64_t)v7 + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log,  v6,  v3);

  v8 = (objc_class *)type metadata accessor for FollowUpViewController(0LL);
  v10.receiver = v7;
  v10.super_class = v8;
  return -[FollowUpViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0LL, 0LL);
}

- (_TtC20SWTFollowUpExtension22FollowUpViewController)initWithCoder:(id)a3
{
  result = (_TtC20SWTFollowUpExtension22FollowUpViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100007980LL,  "SWTFollowUpExtension/FollowUpViewController.swift",  49LL,  2LL,  22LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FollowUpViewController(0LL);
  -[FollowUpViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  v8 = (void (*)(uint64_t))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_100008428, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    v8 = (void (*)(uint64_t))sub_10000711C;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = a3;
  id v11 = a4;
  v12 = self;
  FollowUpViewController.processFollowUpItem(_:selectedAction:completion:)(a3, a4, v8, v9);
  sub_1000070E8((uint64_t)v8, v9);
}

- (_TtC20SWTFollowUpExtension22FollowUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20SWTFollowUpExtension22FollowUpViewController *)_swift_stdlib_reportUnimplementedInitializer( "SWTFollowUpExtension.FollowUpViewController",  43LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v2 = (char *)self + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end
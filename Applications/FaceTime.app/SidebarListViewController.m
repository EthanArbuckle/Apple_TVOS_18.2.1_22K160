@interface SidebarListViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC8FaceTime25SidebarListViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime25SidebarListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didSelectDisconnect;
- (void)didSelectNewCall;
- (void)didSelectRetry;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)viewDidLoad;
@end

@implementation SidebarListViewController

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_10006B89C();
  uint64_t v4 = v3;

  sub_100018A04(&qword_100112990);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (_TtC8FaceTime25SidebarListViewController)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC8FaceTime25SidebarListViewController_state;
  *((void *)v4 + 1) = 0LL;
  *((void *)v4 + 2) = 0LL;
  *(void *)uint64_t v4 = 0LL;
  v4[24] = 4;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8FaceTime25SidebarListViewController_wantsFocusOnNewCallButton) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8FaceTime25SidebarListViewController_continuitySessionManager;
  uint64_t v6 = qword_100112290;
  id v7 = a3;
  if (v6 != -1) {
    swift_once(&qword_100112290, sub_10004B0AC);
  }
  v8 = (void *)qword_10011A2B0;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)qword_10011A2B0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8FaceTime25SidebarListViewController_observerCancellables) = (Class)_swiftEmptyArrayStorage;
  id v9 = v8;

  result = (_TtC8FaceTime25SidebarListViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/SidebarListViewController.swift",  40LL,  2LL,  274LL,  0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___NSNotificationCenter, a2);
  uint64_t v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for SidebarListViewController(v6, v7);
  -[SidebarListViewController dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime25SidebarListViewController_continuitySessionManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8FaceTime25SidebarListViewController_observerCancellables));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime25SidebarListViewController_captureDevice));
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10006BC5C();
}

- (void)didSelectNewCall
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for CreateCallViewController(0LL, (uint64_t)a2));
  uint64_t v4 = self;
  id v7 = [v3 init];
  id v5 = (_TtC8FaceTime25SidebarListViewController *) -[SidebarListViewController navigationController]( v4,  "navigationController");
  if (v5)
  {
    uint64_t v6 = v5;
    -[SidebarListViewController pushViewController:animated:](v5, "pushViewController:animated:", v7, 1LL);

    uint64_t v4 = v6;
  }
}

- (void)didSelectRetry
{
  uint64_t v3 = sub_100018A04(&qword_100114970);
  __chkstk_darwin(v3);
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  type metadata accessor for MainActor(0LL);
  id v7 = self;
  uint64_t v8 = static MainActor.shared.getter(v7);
  id v9 = (void *)swift_allocObject(&unk_1000FA4A8, 40LL, 7LL);
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  uint64_t v10 = sub_10008033C((uint64_t)v5, (uint64_t)&unk_100114CE0, (uint64_t)v9);

  swift_release(v10);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10006E9C8(v6, (uint64_t)v7);
}

- (_TtC8FaceTime25SidebarListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8FaceTime25SidebarListViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SidebarListViewController",  34LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void)didSelectDisconnect
{
  if (qword_100112370 != -1) {
    swift_once(&qword_100112370, sub_100079BAC);
  }
  sub_100079958(0xD000000000000024LL, 0x80000001000DB4E0LL);
  if (qword_1001122C8 != -1) {
    swift_once(&qword_1001122C8, sub_10006A790);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_10001C270(v0, (uint64_t)qword_100114B60);
  oslog = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  v2,  "User disconnected camera via recent call loading failure UI.",  v3,  2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }
}

@end
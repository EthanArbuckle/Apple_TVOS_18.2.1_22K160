@interface RemoteEngagementViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithCoder:(id)a3;
- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RemoteEngagementViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100007BB4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100007E4C( a3,  (SEL *)&selRef_viewWillAppear_,  (uint64_t (*)(uint64_t, uint64_t))&ViewControllerPresenter.viewWillAppear());
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100007CA4(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100007D2C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100007E4C( a3,  (SEL *)&selRef_viewDidDisappear_,  (uint64_t (*)(uint64_t, uint64_t))&ViewControllerPresenter.viewDidDisappear());
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_100007F24();
}

- (void)dealloc
{
  v2 = self;
  sub_1000088A0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task));
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v4 = 0LL;
  }
  v5 = self;
  sub_10000A700();

  swift_bridgeObjectRelease(v4);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3) {
    a3 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  if (v6)
  {
    uint64_t v7 = swift_allocObject(&unk_1000150A8, 24LL, 7LL);
    *(void *)(v7 + 16) = v6;
    v6 = sub_10000B8B4;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  v8 = self;
  sub_10000523C((uint64_t)v6, v7);

  swift_bridgeObjectRelease(a3);
}

+ (id)_exportedInterface
{
  return (id)sub_10000AD18((uint64_t)a1);
}

+ (id)_remoteViewControllerInterface
{
  return sub_10000B000();
}

- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  id v8 = a4;
  return (_TtC24AMSEngagementViewService30RemoteEngagementViewController *)sub_10000B050(v5, v7, a4);
}

- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithCoder:(id)a3
{
  return (_TtC24AMSEngagementViewService30RemoteEngagementViewController *)sub_10000B18C(a3);
}

@end
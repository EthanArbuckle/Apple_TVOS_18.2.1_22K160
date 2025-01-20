@interface TVFaceTimeContainerViewController
- (NSArray)preferredFocusEnvironments;
- (TVFaceTimeContainerViewController)initWithCoder:(id)a3;
- (TVFaceTimeContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVFaceTimeContainerViewController

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  v3 = sub_100075FB8();

  sub_100018A04(&qword_100112990);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100076080();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100077DDC(v6, (uint64_t)v7);
}

- (TVFaceTimeContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (TVFaceTimeContainerViewController *)sub_100078A38(v5, v7, a4);
}

- (TVFaceTimeContainerViewController)initWithCoder:(id)a3
{
  return (TVFaceTimeContainerViewController *)sub_100078BF8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFaceTimeContainerViewController____lazy_storage___monogramView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFaceTimeContainerViewController____lazy_storage___cameraEffectsControlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFaceTimeContainerViewController_captureDeviceManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___TVFaceTimeContainerViewController_observerCancellables));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFaceTimeContainerViewController_sidebarFocusGuide));
}

@end
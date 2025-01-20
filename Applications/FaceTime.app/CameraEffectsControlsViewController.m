@interface CameraEffectsControlsViewController
- (_TtC8FaceTime35CameraEffectsControlsViewController)init;
- (_TtC8FaceTime35CameraEffectsControlsViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime35CameraEffectsControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didSelectCameraBlurButton;
- (void)didSelectCinematicFramingButton;
- (void)didSelectReactionsButton;
- (void)didSelectStudioLightButton;
- (void)viewDidLoad;
@end

@implementation CameraEffectsControlsViewController

- (_TtC8FaceTime35CameraEffectsControlsViewController)init
{
  return (_TtC8FaceTime35CameraEffectsControlsViewController *)sub_10003726C();
}

- (void)dealloc
{
  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_cancellables);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_cancellables,  v11,  1LL,  0LL);
  uint64_t v4 = *v3;
  v5 = self;
  uint64_t v6 = swift_bridgeObjectRetain(v4);
  sub_100036430(v6);
  swift_bridgeObjectRelease(v4);
  uint64_t v7 = *v3;
  uint64_t *v3 = (uint64_t)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v7);
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for CameraEffectsControlsViewController(v8, v9);
  -[CameraEffectsControlsViewController dealloc](&v10, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___cameraBlurLabeledButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___cameraBlurButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___cinematicFramingLabeledButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___cinematicFramingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___studioLightLabeledButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___studioLightButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___reactionsLabeledButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___reactionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController____lazy_storage___stackView));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_cancellables));
}

- (_TtC8FaceTime35CameraEffectsControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100038700();
}

  ;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CameraEffectsControlsViewController((uint64_t)self, (uint64_t)a2);
  id v2 = v3.receiver;
  -[CameraEffectsControlsViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100037624();
  sub_100037E9C();
}

- (void)didSelectCameraBlurButton
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_viewModel
       + 1);
  objc_super v3 = *(void **)&self->$__lazy_storage_$_cameraBlurLabeledButtonView[OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_viewModel];
  if (v2 != 2 && v3 != 0LL)
  {
    BOOL v5 = (v2 & 1) == 0;
    uint64_t v6 = self;
    id v7 = v3;
    [v7 setCurrentBackgroundBlurControlMode:2];
    [v7 setCameraBlurEnabled:v5];
  }

- (void)didSelectCinematicFramingButton
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_viewModel);
  objc_super v3 = *(void **)&self->$__lazy_storage_$_cameraBlurLabeledButtonView[OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_viewModel];
  if (v2 != 2 && v3 != 0LL) {
    [v3 setCinematicFramingEnabled:(v2 & 1) == 0];
  }
}

- (void)didSelectStudioLightButton
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_viewModel
       + 2);
  objc_super v3 = *(void **)&self->$__lazy_storage_$_cameraBlurLabeledButtonView[OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_viewModel];
  if (v2 != 2 && v3 != 0LL) {
    [v3 setStudioLightEnabled:(v2 & 1) == 0];
  }
}

- (void)didSelectReactionsButton
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_viewModel
       + 3);
  objc_super v3 = *(void **)&self->$__lazy_storage_$_cameraBlurLabeledButtonView[OBJC_IVAR____TtC8FaceTime35CameraEffectsControlsViewController_viewModel];
  if (v2 != 2 && v3 != 0LL) {
    [v3 setReactionEffectGestureEnabled:(v2 & 1) == 0];
  }
}

- (_TtC8FaceTime35CameraEffectsControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8FaceTime35CameraEffectsControlsViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.CameraEffectsControlsViewController",  44LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

@end
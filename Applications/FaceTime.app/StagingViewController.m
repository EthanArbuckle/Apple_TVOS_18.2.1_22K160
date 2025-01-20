@interface StagingViewController
- (_TtC8FaceTime21StagingViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime21StagingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)menuButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation StagingViewController

- (_TtC8FaceTime21StagingViewController)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC8FaceTime21StagingViewController_delegate] = 0LL;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___controlsView) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___shadowView) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8FaceTime21StagingViewController_joinContinuityConversationTask) = 0LL;
  id v5 = a3;

  result = (_TtC8FaceTime21StagingViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/StagingViewController.swift",  36LL,  2LL,  52LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3 = self;
  sub_1000B6488((uint64_t)v3, v2);
}

- (void)menuButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000B77E8();
}

- (_TtC8FaceTime21StagingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8FaceTime21StagingViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.StagingViewController",  30LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime21StagingViewController_continuityConversation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___controlsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___shadowView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8FaceTime21StagingViewController_joinContinuityConversationTask));
}

@end
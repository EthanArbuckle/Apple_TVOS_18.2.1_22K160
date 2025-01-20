@interface SplitViewCallViewController
- (_TtC8FaceTime27SplitViewCallViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime27SplitViewCallViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation SplitViewCallViewController

- (_TtC8FaceTime27SplitViewCallViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000B5630();
}

  ;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000B3F0C();
}

- (_TtC8FaceTime27SplitViewCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8FaceTime27SplitViewCallViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SplitViewCallViewController",  36LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_multiwayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerCancellables));
}

@end
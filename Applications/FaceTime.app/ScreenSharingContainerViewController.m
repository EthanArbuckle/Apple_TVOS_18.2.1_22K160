@interface ScreenSharingContainerViewController
- (_TtC8FaceTime36ScreenSharingContainerViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime36ScreenSharingContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ScreenSharingContainerViewController

- (_TtC8FaceTime36ScreenSharingContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100039798();
}

  ;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v3.receiver;
  -[ScreenSharingContainerViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend( v2,  "bs_addChildViewController:",  *(void *)&v2[OBJC_IVAR____TtC8FaceTime36ScreenSharingContainerViewController_screenSharingViewController],  v3.receiver,  v3.super_class);
}

- (void)viewIsAppearing:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (_TtC8FaceTime36ScreenSharingContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8FaceTime36ScreenSharingContainerViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.ScreenSharingContainerViewController",  45LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime36ScreenSharingContainerViewController_screenSharingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime36ScreenSharingContainerViewController_observerQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime36ScreenSharingContainerViewController_observers));
}

@end
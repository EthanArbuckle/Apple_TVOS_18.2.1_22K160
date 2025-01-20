@interface OnboardingImageViewController
- (_TtC22HomeCaptiveViewService29OnboardingImageViewController)initWithCoder:(id)a3;
- (_TtC22HomeCaptiveViewService29OnboardingImageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation OnboardingImageViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OnboardingImageViewController();
  id v2 = v3.receiver;
  -[OnboardingImageViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100004D78();
}

- (_TtC22HomeCaptiveViewService29OnboardingImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v7 = v6;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_image) = 0LL;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_imageView) = 0LL;
    id v8 = a4;
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_image) = 0LL;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_imageView) = 0LL;
    id v10 = a4;
    NSString v9 = 0LL;
  }

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for OnboardingImageViewController();
  v11 = -[OnboardingImageViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC22HomeCaptiveViewService29OnboardingImageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_image) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_imageView) = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OnboardingImageViewController();
  return -[OnboardingImageViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_imageView));
}

@end
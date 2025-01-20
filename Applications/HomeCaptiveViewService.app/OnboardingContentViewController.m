@interface OnboardingContentViewController
- (_TtC22HomeCaptiveViewService31OnboardingContentViewController)initWithCoder:(id)a3;
- (_TtC22HomeCaptiveViewService31OnboardingContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation OnboardingContentViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OnboardingContentViewController();
  id v2 = v3.receiver;
  -[OnboardingContentViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100009EA0();
}

- (_TtC22HomeCaptiveViewService31OnboardingContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v7 = v6;
    v8 = (_OWORD *)((char *)self
                  + OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration);
    _OWORD *v8 = xmmword_100012F60;
    v8[1] = 0u;
    v8[2] = 0u;
    v8[3] = 0u;
    id v9 = a4;
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    v11 = (_OWORD *)((char *)self
                   + OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration);
    _OWORD *v11 = xmmword_100012F60;
    v11[1] = 0u;
    v11[2] = 0u;
    v11[3] = 0u;
    id v12 = a4;
    NSString v10 = 0LL;
  }

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for OnboardingContentViewController();
  v13 = -[OnboardingContentViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC22HomeCaptiveViewService31OnboardingContentViewController)initWithCoder:(id)a3
{
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration);
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration) = xmmword_100012F60;
  uint64_t v6 = (objc_class *)type metadata accessor for OnboardingContentViewController();
  v5[1] = 0u;
  v5[2] = 0u;
  v5[3] = 0u;
  v8.receiver = self;
  v8.super_class = v6;
  return -[OnboardingContentViewController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  id v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration);
  sub_10000CA48( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration),  v2[1],  v2[2],  v2[3],  v2[4],  v2[5],  v2[6],  v2[7]);
}

@end
@interface OnboardingViewController
- (_TtC8AppStore24OnboardingViewController)initWithCoder:(id)a3;
- (_TtC8AppStore24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)menuButtonActionWithRecognizer:(id)a3;
- (void)viewDidLoad;
@end

@implementation OnboardingViewController

- (_TtC8AppStore24OnboardingViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore24OnboardingViewController_primaryButtonCallback);
  void *v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC8AppStore24OnboardingViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/OnboardingViewController.swift",  39LL,  2LL,  62LL,  0);
  __break(1u);
  return result;
}

- (void)loadView
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore24OnboardingViewController_onboardingView);
  v3 = self;
  -[OnboardingViewController setView:](v3, "setView:", v2);
  id v4 = -[OnboardingViewController view](v3, "view");
  if (v4)
  {
    if (*((_BYTE *)&v3->super.super.super.isa + OBJC_IVAR____TtC8AppStore24OnboardingViewController_configuration)) {
      double v5 = 150.0;
    }
    else {
      double v5 = 80.0;
    }
    id v6 = v4;
    objc_msgSend(v4, "setDirectionalLayoutMargins:", 0.0, 150.0, 0.0, v5);
  }

  else
  {
    __break(1u);
  }

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_1000EBDFC();
}

- (void)menuButtonActionWithRecognizer:(id)a3
{
  double v5 = (void *)objc_opt_self(&OBJC_CLASS___UIApplication);
  id v6 = a3;
  v7 = self;
  id v8 = [v5 sharedApplication];
  [v8 suspend];
}

- (_TtC8AppStore24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.OnboardingViewController",  33LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24OnboardingViewController_onboardingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24OnboardingViewController_linkController));
  sub_10000A450( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore24OnboardingViewController_primaryButtonCallback),  *(void *)&self->configuration[OBJC_IVAR____TtC8AppStore24OnboardingViewController_primaryButtonCallback]);
}

@end
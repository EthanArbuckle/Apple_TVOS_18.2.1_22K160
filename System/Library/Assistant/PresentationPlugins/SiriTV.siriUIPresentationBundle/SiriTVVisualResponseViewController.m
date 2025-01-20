@interface SiriTVVisualResponseViewController
- (SAAceView)aceSnippet;
- (VRXVisualResponse)snippet;
- (_TtC6SiriTV34SiriTVVisualResponseViewController)initWithAceSnippet:(id)a3;
- (_TtC6SiriTV34SiriTVVisualResponseViewController)initWithCoder:(id)a3;
- (_TtC6SiriTV34SiriTVVisualResponseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC6SiriTV34SiriTVVisualResponseViewController)initWithPluginSnippet:(id)a3;
- (_TtP6SiriTV42SiriTVVisualResponseViewControllerDelegate_)delegate;
- (void)loadView;
- (void)navigateWithAceCommand:(id)a3;
- (void)navigateWithResponseData:(id)a3;
- (void)performAceCommand:(id)a3;
- (void)performShowResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSnippet:(id)a3;
- (void)updateSharedState:(id)a3;
- (void)viewDidLoad;
@end

@implementation SiriTVVisualResponseViewController

- (_TtP6SiriTV42SiriTVVisualResponseViewControllerDelegate_)delegate
{
  return (_TtP6SiriTV42SiriTVVisualResponseViewControllerDelegate_ *)(id)SiriTVVisualResponseViewController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  v5 = self;
  SiriTVVisualResponseViewController.delegate.setter((uint64_t)a3);
}

- (VRXVisualResponse)snippet
{
  return (VRXVisualResponse *)sub_B17C();
}

- (void)setSnippet:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_B1F0((uint64_t)a3);
}

- (SAAceView)aceSnippet
{
  return (SAAceView *)SiriTVVisualResponseViewController.aceSnippet.getter();
}

- (_TtC6SiriTV34SiriTVVisualResponseViewController)initWithAceSnippet:(id)a3
{
  id v3 = a3;
  sub_B22C();
  return result;
}

- (_TtC6SiriTV34SiriTVVisualResponseViewController)initWithPluginSnippet:(id)a3
{
  id v3 = a3;
  return (_TtC6SiriTV34SiriTVVisualResponseViewController *)sub_B4F0();
}

- (_TtC6SiriTV34SiriTVVisualResponseViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_B930();
}

- (void)loadView
{
  v2 = self;
  SiriTVVisualResponseViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  SiriTVVisualResponseViewController.viewDidLoad()();
}

- (void)updateSharedState:(id)a3
{
}

- (_TtC6SiriTV34SiriTVVisualResponseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  id v5 = a4;
  SiriTVVisualResponseViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV34SiriTVVisualResponseViewController_snippet));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV34SiriTVVisualResponseViewController_aceSnippet));
  id v3 = (char *)self + OBJC_IVAR____TtC6SiriTV34SiriTVVisualResponseViewController_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

- (void)performAceCommand:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_D45C(v5, (uint64_t)v6);
}

- (void)performShowResponse:(id)a3
{
}

- (void)navigateWithResponseData:(id)a3
{
}

- (void)navigateWithAceCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  SiriTVVisualResponseViewController.navigateWithAceCommand(_:)(v4);
}

@end
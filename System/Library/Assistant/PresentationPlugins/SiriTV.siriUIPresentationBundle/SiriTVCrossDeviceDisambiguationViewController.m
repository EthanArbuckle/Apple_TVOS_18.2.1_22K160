@interface SiriTVCrossDeviceDisambiguationViewController
- (BOOL)isInFocusMode;
- (BOOL)isPresented;
- (BOOL)shouldUpdateDisambiguationContentWith:(id)a3;
- (NSDictionary)sharedState;
- (SAUIVisualResponseSnippet)visualResponseSnippet;
- (UIViewController)responseSnippetViewController;
- (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView)disambiguationView;
- (_TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController)initWithCoder:(id)a3;
- (_TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP6SiriTV53SiriTVCrossDeviceDisambiguationViewControllerDelegate_)delegate;
- (void)loadView;
- (void)paginateListWithForwardDirection:(BOOL)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisambiguationView:(id)a3;
- (void)setIsInFocusMode:(BOOL)a3;
- (void)setResponseSnippetViewController:(id)a3;
- (void)setSharedState:(id)a3;
- (void)setVisualResponseSnippet:(id)a3;
- (void)switchToFocusMode;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SiriTVCrossDeviceDisambiguationViewController

- (UIViewController)responseSnippetViewController
{
  return (UIViewController *)v2;
}

- (void)setResponseSnippetViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2B644((uint64_t)a3);
}

- (SAUIVisualResponseSnippet)visualResponseSnippet
{
  return (SAUIVisualResponseSnippet *)v2;
}

- (void)setVisualResponseSnippet:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2B6E0((uint64_t)a3);
}

- (NSDictionary)sharedState
{
  uint64_t v2 = sub_2B74C();
  if (v2)
  {
    uint64_t v3 = v2;
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    v4.super.isa = 0LL;
  }

  return (NSDictionary *)v4.super.isa;
}

- (void)setSharedState:(id)a3
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = self;
  sub_2B808(v4);
}

- (BOOL)isInFocusMode
{
  return sub_2BA10() & 1;
}

- (void)setIsInFocusMode:(BOOL)a3
{
  uint64_t v4 = self;
  sub_2BA60(a3);
}

- (BOOL)isPresented
{
  uint64_t v2 = self;
  unsigned __int8 v3 = sub_2BC74((uint64_t)v2);

  return v3 & 1;
}

- (_TtP6SiriTV53SiriTVCrossDeviceDisambiguationViewControllerDelegate_)delegate
{
  return (_TtP6SiriTV53SiriTVCrossDeviceDisambiguationViewControllerDelegate_ *)(id)sub_2BD0C();
}

- (void)setDelegate:(id)a3
{
  id v5 = self;
  sub_2BD68((uint64_t)a3);
}

- (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView)disambiguationView
{
  uint64_t v2 = self;
  unsigned __int8 v3 = sub_2BDCC((uint64_t)v2);

  return (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView *)v3;
}

- (void)setDisambiguationView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2BEB8((uint64_t)a3);
}

- (void)paginateListWithForwardDirection:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_2BED0(a3, (uint64_t)v7, v6);
  _Block_release(v6);
}

- (void)switchToFocusMode
{
  uint64_t v2 = self;
  sub_2C23C();
}

- (BOOL)shouldUpdateDisambiguationContentWith:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_2C3A4(v4);

  return self & 1;
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_2C4CC();
}

- (void)loadView
{
  uint64_t v2 = self;
  sub_2C7C0();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_2C8C8(a3);
}

- (_TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    id v5 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
  }

  else
  {
    id v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  id v8 = a4;
  return (_TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController *)sub_2CA90(v5, v7, a4);
}

- (_TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController)initWithCoder:(id)a3
{
  return (_TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController *)sub_2CBB8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController_responseSnippetViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController_visualResponseSnippet));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController_sharedState));
  sub_ADC4((uint64_t)self + OBJC_IVAR____TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController_delegate);
  sub_2D0B0(*(id *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC6SiriTV45SiriTVCrossDeviceDisambiguationViewController____lazy_storage___disambiguationView));
}

@end
@interface FacetAlertController
- (_TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)menuButtonActionWithRecognizer:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation FacetAlertController

- (_TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController *)sub_1000D991C(v5, v7, a4);
}

- (_TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self
     + OBJC_IVAR____TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController_facetAlertDelegate;
  *((void *)v5 + 1) = 0LL;
  swift_unknownObjectWeakInit(v5, 0LL);
  id v6 = a3;

  result = (_TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/PageFacetsHeaderView.swift",  35LL,  2LL,  309LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000D9BE8(a3);
}

- (void)menuButtonActionWithRecognizer:(id)a3
{
  v4 = (_TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController *)a3;
  uint64_t v7 = self;
  uint64_t v5 = (_TtC8AppStoreP33_AE4AB5AC2158F15A99DD367B65D1B63820FacetAlertController *) -[FacetAlertController presentingViewController]( v7,  "presentingViewController");
  if (v5)
  {
    id v6 = v5;
    -[FacetAlertController dismissViewControllerAnimated:completion:]( v5,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);

    v4 = v7;
    uint64_t v7 = v6;
  }
}

- (void).cxx_destruct
{
}

@end
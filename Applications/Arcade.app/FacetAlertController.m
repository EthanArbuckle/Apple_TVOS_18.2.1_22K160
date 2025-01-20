@interface FacetAlertController
- (_TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController)initWithCoder:(id)a3;
- (_TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)menuButtonActionWithRecognizer:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation FacetAlertController

- (_TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController *)sub_1001C80C0(v5, v7, a4);
}

- (_TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self
     + OBJC_IVAR____TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController_facetAlertDelegate;
  *((void *)v5 + 1) = 0LL;
  swift_unknownObjectWeakInit(v5, 0LL);
  id v6 = a3;

  result = (_TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/PageFacetsHeaderView.swift",  33LL,  2LL,  309LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001C838C(a3);
}

- (void)menuButtonActionWithRecognizer:(id)a3
{
  v4 = (_TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController *)a3;
  uint64_t v7 = self;
  uint64_t v5 = (_TtC6ArcadeP33_0046C0E5A855D25477218388BCAF187920FacetAlertController *) -[FacetAlertController presentingViewController]( v7,  "presentingViewController");
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
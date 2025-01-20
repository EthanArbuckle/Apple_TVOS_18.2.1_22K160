@interface SiriTVKeyboardViewController
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)isInitialBringupFromLongPress;
- (NSArray)preferredFocusEnvironments;
- (_TtC6SiriTV18SiriTVKeyboardView)keyboardView;
- (_TtC6SiriTV28SiriTVKeyboardViewController)initWithCoder:(id)a3;
- (_TtC6SiriTV28SiriTVKeyboardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP6SiriTV36SiriTVKeyboardViewControllerDelegate_)delegate;
- (void)loadView;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)remoteDoneButtonPressed;
- (void)setDelegate:(id)a3;
- (void)setIsInitialBringupFromLongPress:(BOOL)a3;
- (void)setKeyboardView:(id)a3;
- (void)set_disableAutomaticKeyboardUI:(BOOL)a3;
- (void)set_enableAutomaticKeyboardPressDone:(BOOL)a3;
- (void)siriTVKeyboardViewFocusedWithViewWithView:(id)a3;
- (void)siriTVKeyboardViewStartRequestWithText:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SiriTVKeyboardViewController

- (_TtC6SiriTV18SiriTVKeyboardView)keyboardView
{
  v2 = self;
  sub_6D1A8();
  v4 = v3;

  return (_TtC6SiriTV18SiriTVKeyboardView *)v4;
}

- (void)setKeyboardView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_6D214((uint64_t)a3);
}

- (BOOL)isInitialBringupFromLongPress
{
  return sub_6D2C8() & 1;
}

- (void)setIsInitialBringupFromLongPress:(BOOL)a3
{
}

- (_TtP6SiriTV36SiriTVKeyboardViewControllerDelegate_)delegate
{
  return (_TtP6SiriTV36SiriTVKeyboardViewControllerDelegate_ *)(id)sub_6D324();
}

- (void)setDelegate:(id)a3
{
  id v5 = self;
  sub_6D380((uint64_t)a3);
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return sub_6D3D4() & 1;
}

- (void)set_disableAutomaticKeyboardUI:(BOOL)a3
{
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  return sub_6D434() & 1;
}

- (void)set_enableAutomaticKeyboardPressDone:(BOOL)a3
{
}

- (void)loadView
{
  v2 = self;
  sub_6D604();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_6D6C0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_6D904();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_6D9D0();
  v4 = v3;

  sub_9E24((uint64_t *)&unk_DFA00);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
  return (NSArray *)isa;
}

- (void)remoteDoneButtonPressed
{
  v2 = self;
  sub_6DA64();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (_TtC6SiriTV28SiriTVKeyboardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    id v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    id v7 = 0LL;
  }

  id v8 = a4;
  return (_TtC6SiriTV28SiriTVKeyboardViewController *)sub_6E000(v5, v7, a4);
}

- (_TtC6SiriTV28SiriTVKeyboardViewController)initWithCoder:(id)a3
{
  return result;
}

- (void).cxx_destruct
{
  sub_2D0B0(*(id *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC6SiriTV28SiriTVKeyboardViewController____lazy_storage___keyboardView));
  sub_ADC4((uint64_t)self + OBJC_IVAR____TtC6SiriTV28SiriTVKeyboardViewController_delegate);
  sub_2D0B0(*(id *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC6SiriTV28SiriTVKeyboardViewController____lazy_storage___systemInputViewController));
}

- (void)siriTVKeyboardViewStartRequestWithText:(id)a3
{
  uint64_t v5 = v4;
  SEL v6 = self;
  sub_6E288();

  swift_bridgeObjectRelease(v5, v7, v8, v9, v10, v11, v12, v13);
}

- (void)siriTVKeyboardViewFocusedWithViewWithView:(id)a3
{
  id v5 = a3;
  SEL v6 = self;
  sub_6E34C((uint64_t)a3);
}

@end
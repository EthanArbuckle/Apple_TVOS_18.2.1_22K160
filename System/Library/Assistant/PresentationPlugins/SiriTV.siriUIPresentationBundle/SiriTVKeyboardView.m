@interface SiriTVKeyboardView
- (BOOL)isDismissing;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGSize)suggestedSize;
- (NSArray)preferredFocusEnvironments;
- (UIView)inputControllerView;
- (_TtC6SiriTV18SiriTVKeyboardView)initWithCoder:(id)a3;
- (_TtC6SiriTV18SiriTVKeyboardView)initWithFrame:(CGRect)a3;
- (_TtC6SiriTV25SiriTVTypeToSiriTextField)typeToSiriTextField;
- (_TtP6SiriTV26SiriTVKeyboardViewDelegate_)delegate;
- (void)clearTextField;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)doneButtonPressed:(id)a3;
- (void)hideDoneButtonAndSecondaryLabelWhenDictationStarts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInputControllerView:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setTypeToSiriTextField:(id)a3;
- (void)showSpinnerViewIfNotAlreadyShown:(BOOL)a3;
- (void)textFieldTextDidChange:(id)a3;
- (void)updateAlphaAndSetFocusToDoneButton:(id)a3;
@end

@implementation SiriTVKeyboardView

- (_TtC6SiriTV25SiriTVTypeToSiriTextField)typeToSiriTextField
{
  v2 = self;
  sub_3097C();
  v4 = v3;

  return (_TtC6SiriTV25SiriTVTypeToSiriTextField *)v4;
}

- (void)setTypeToSiriTextField:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_30A20((uint64_t)v4);
}

- (UIView)inputControllerView
{
  return (UIView *)sub_30A54();
}

- (void)setInputControllerView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_30AC8(a3);
}

- (_TtP6SiriTV26SiriTVKeyboardViewDelegate_)delegate
{
  return (_TtP6SiriTV26SiriTVKeyboardViewDelegate_ *)(id)sub_30BA4();
}

- (void)setDelegate:(id)a3
{
  id v5 = self;
  sub_30C00((uint64_t)a3);
}

- (CGSize)suggestedSize
{
  v2 = self;
  double v3 = sub_30C74();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)clearTextField
{
  v2 = self;
  sub_30CF4();
}

- (BOOL)isDismissing
{
  return sub_312E4() & 1;
}

- (void)setIsDismissing:(BOOL)a3
{
}

- (_TtC6SiriTV18SiriTVKeyboardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_31328();
}

- (_TtC6SiriTV18SiriTVKeyboardView)initWithFrame:(CGRect)a3
{
  return (_TtC6SiriTV18SiriTVKeyboardView *)sub_3140C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)showSpinnerViewIfNotAlreadyShown:(BOOL)a3
{
  double v4 = self;
  sub_31670(a3);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  id v3 = sub_32088();

  sub_9E24((uint64_t *)&unk_DFA00);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  double v5 = self;
  char v6 = sub_321B0();

  return v6 & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_32270(v6);
}

- (void)doneButtonPressed:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_323C0();
}

- (void)textFieldTextDidChange:(id)a3
{
}

- (void)updateAlphaAndSetFocusToDoneButton:(id)a3
{
}

- (void)hideDoneButtonAndSecondaryLabelWhenDictationStarts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV18SiriTVKeyboardView____lazy_storage___typeToSiriTextField));
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV18SiriTVKeyboardView_inputControllerView);
  sub_ADC4((uint64_t)self + OBJC_IVAR____TtC6SiriTV18SiriTVKeyboardView_delegate);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV18SiriTVKeyboardView____lazy_storage___doneButton);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV18SiriTVKeyboardView____lazy_storage___spinnerView);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV18SiriTVKeyboardView____lazy_storage___backdropBlurView);
  sub_2D0B0(*(id *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC6SiriTV18SiriTVKeyboardView____lazy_storage___preferredViewToFocus));
}

@end
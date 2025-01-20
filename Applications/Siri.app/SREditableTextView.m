@interface SREditableTextView
+ (double)insertionAnimatedZPosition;
- (BOOL)canResignFirstResponder;
- (BOOL)didCorrect;
- (BOOL)editable;
- (BOOL)isFirstResponder;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)resignFirstResponder;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (SREditableTextView)initWithFrame:(CGRect)a3 presentationStyle:(int64_t)a4;
- (SREditableTextViewDelegate)delegate;
- (double)_indentWidth;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (id)_createVisualEffectBackgroundViewForTextView:(id)a3 topOffset:(double *)a4;
- (int64_t)textAlignment;
- (void)_adjustLineSpacing;
- (void)_handleTap:(id)a3;
- (void)_requestKeyboardFocusAndBecomeFirstResponder;
- (void)beginEditing;
- (void)endEditingAndCorrect:(BOOL)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)setDidCorrect:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)utteranceTextDidReceiveReturnKey:(id)a3;
- (void)utteranceTextDidResignFirstResponder:(id)a3;
@end

@implementation SREditableTextView

- (SREditableTextView)initWithFrame:(CGRect)a3 presentationStyle:(int64_t)a4
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SREditableTextView;
  v5 = -[SREditableTextView initWithFrame:]( &v31,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v7 = v5;
  if (v5)
  {
    v5->_presentationStyle = a4;
    int IsRTL = SiriLanguageIsRTL(v5, v6);
    uint64_t v9 = 2LL;
    if (!IsRTL) {
      uint64_t v9 = 0LL;
    }
    v7->_textAlignment = v9;
    v10 = objc_alloc(&OBJC_CLASS___SRSpeechRecognizedCorrectionTextView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v14 = -[SRSpeechRecognizedCorrectionTextView initWithFrame:]( v10,  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    textView = v7->_textView;
    v7->_textView = v14;

    -[SRSpeechRecognizedCorrectionTextView setDelegate:](v7->_textView, "setDelegate:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleBody,  256LL));
    -[SRSpeechRecognizedCorrectionTextView setFont:](v7->_textView, "setFont:", v16);
    v17 = v7->_textView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[SRSpeechRecognizedCorrectionTextView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[SRSpeechRecognizedCorrectionTextView setTextAlignment:](v7->_textView, "setTextAlignment:", v7->_textAlignment);
    -[SRSpeechRecognizedCorrectionTextView setBounces:](v7->_textView, "setBounces:", 0LL);
    -[SRSpeechRecognizedCorrectionTextView setClipsToBounds:](v7->_textView, "setClipsToBounds:", 0LL);
    -[SRSpeechRecognizedCorrectionTextView setScrollEnabled:](v7->_textView, "setScrollEnabled:", 0LL);
    -[SRSpeechRecognizedCorrectionTextView setReturnKeyType:](v7->_textView, "setReturnKeyType:", 9LL);
    -[SRSpeechRecognizedCorrectionTextView setTextContainerInset:]( v7->_textView,  "setTextContainerInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    if (v7->_presentationStyle == 1)
    {
      v7->_topOffsetForTextView = 8.0;
      v19 = v7->_textView;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
      -[SRSpeechRecognizedCorrectionTextView setTextColor:](v19, "setTextColor:", v20);

      -[SRSpeechRecognizedCorrectionTextView setKeyboardAppearance:](v7->_textView, "setKeyboardAppearance:", 0LL);
      v21 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
      backgroundView = v7->_backgroundView;
      v7->_backgroundView = v21;

      v23 = v7->_backgroundView;
      v24 = (UIView *)objc_claimAutoreleasedReturnValue(+[UIColor systemFillColor](&OBJC_CLASS___UIColor, "systemFillColor"));
      -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);
    }

    else
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue( -[SREditableTextView _createVisualEffectBackgroundViewForTextView:topOffset:]( v7,  "_createVisualEffectBackgroundViewForTextView:topOffset:",  v7->_textView,  &v7->_topOffsetForTextView));
      v24 = v7->_backgroundView;
      v7->_backgroundView = (UIView *)v25;
    }

    -[UIView _setContinuousCornerRadius:](v7->_backgroundView, "_setContinuousCornerRadius:", 10.0);
    -[UIView setUserInteractionEnabled:](v7->_backgroundView, "setUserInteractionEnabled:", 0LL);
    -[SREditableTextView insertSubview:below:](v7, "insertSubview:below:", v7->_backgroundView, v7->_textView);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView font](v7->_textView, "font"));
    [v26 _scaledValueForValue:8.0];
    v7->_heightOffsetForTextView = v27 + v7->_topOffsetForTextView;

    -[SREditableTextView addSubview:](v7, "addSubview:", v7->_textView);
    CGFloat v28 = SiriUIDefaultEdgePadding;
    v7->_edgeInsets.top = 0.0;
    v7->_edgeInsets.leading = v28;
    v7->_edgeInsets.bottom = 0.0;
    v7->_edgeInsets.trailing = v28;
    v29 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v7,  "_handleTap:");
    -[SREditableTextView addGestureRecognizer:](v7, "addGestureRecognizer:", v29);
  }

  return v7;
}

+ (double)insertionAnimatedZPosition
{
  return 500.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
  [v2 descender];
  double v4 = -v3;

  return v4;
}

- (void)setText:(id)a3
{
  double v4 = (const __CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_1000BC638;
  }
  uint64_t v6 = (__CFString *)v5;
  -[SRSpeechRecognizedCorrectionTextView setText:](self->_textView, "setText:");
  -[SREditableTextView _adjustLineSpacing](self, "_adjustLineSpacing");
  -[SREditableTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[SRSpeechRecognizedCorrectionTextView setTextAlignment:](self->_textView, "setTextAlignment:");
  -[SREditableTextView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)text
{
  return (NSString *)-[SRSpeechRecognizedCorrectionTextView text](self->_textView, "text");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = -88.0;
  if (self->_presentationStyle == 1) {
    double v5 = -52.0;
  }
  -[SRSpeechRecognizedCorrectionTextView sizeThatFits:](self->_textView, "sizeThatFits:", width + v5, 1.79769313e308);
  double v7 = v6 + self->_heightOffsetForTextView;
  double v8 = width;
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[SREditableTextView bounds](self, "bounds", a4);
  v7.CGFloat x = x;
  v7.CGFloat y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SREditableTextView;
  -[SREditableTextView layoutSubviews](&v16, "layoutSubviews");
  -[SREditableTextView bounds](self, "bounds");
  CGFloat x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  int64_t presentationStyle = self->_presentationStyle;
  double v8 = CGRectGetWidth(v17);
  double v9 = -88.0;
  if (presentationStyle == 1) {
    double v9 = -52.0;
  }
  double v10 = v8 + v9;
  v18.origin.CGFloat x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  -[SRSpeechRecognizedCorrectionTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10, CGRectGetHeight(v18));
  double v12 = 44.0;
  if (self->_presentationStyle == 1) {
    double v12 = 26.0;
  }
  -[SRSpeechRecognizedCorrectionTextView setFrame:]( self->_textView,  "setFrame:",  v12,  self->_topOffsetForTextView,  v10,  v11);
  double v13 = -60.0;
  if (self->_presentationStyle == 1) {
    double v13 = -28.0;
  }
  double v14 = width + v13;
  double v15 = 30.0;
  if (self->_presentationStyle == 1) {
    double v15 = 14.0;
  }
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v15, y, v14, height);
}

- (BOOL)canResignFirstResponder
{
  return -[SRSpeechRecognizedCorrectionTextView canResignFirstResponder]( self->_textView,  "canResignFirstResponder");
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SREditableTextView;
  -[SREditableTextView resignFirstResponder](&v4, "resignFirstResponder");
  return -[SRSpeechRecognizedCorrectionTextView resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[SRSpeechRecognizedCorrectionTextView isFirstResponder](self->_textView, "isFirstResponder");
}

- (void)_handleTap:(id)a3
{
  if ([a3 state] == (id)3) {
    -[SREditableTextView _requestKeyboardFocusAndBecomeFirstResponder]( self,  "_requestKeyboardFocusAndBecomeFirstResponder");
  }
}

- (void)_requestKeyboardFocusAndBecomeFirstResponder
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000AE5C;
  v4[3] = &unk_1000BA050;
  objc_copyWeak(&v5, &location);
  [v3 editableTextViewRequestKeyboardForTapToEditWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)beginEditing
{
}

- (void)endEditingAndCorrect:(BOOL)a3
{
  BOOL v3 = a3;
  -[SRSpeechRecognizedCorrectionTextView resignFirstResponder](self->_textView, "resignFirstResponder");
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
    char v6 = objc_opt_respondsToSelector(v5, "editableTextViewTextDidFinishCorrecting:");

    if ((v6 & 1) != 0)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
      [v7 editableTextViewTextDidFinishCorrecting:self];
    }
  }

- (void)_adjustLineSpacing
{
  char v6 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView font](self->_textView, "font"));
  [v3 _scaledValueForValue:1.0];
  -[NSMutableParagraphStyle setLineSpacing:](v6, "setLineSpacing:");

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView attributedText](self->_textView, "attributedText"));
  id v5 = [v4 mutableCopy];

  objc_msgSend(v5, "addAttribute:value:range:", NSParagraphStyleAttributeName, v6, 0, objc_msgSend(v5, "length"));
  -[SRSpeechRecognizedCorrectionTextView setAttributedText:](self->_textView, "setAttributedText:", v5);
}

- (void)setDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "editableTextViewTextShouldPreventCorrection:") & 1) != 0
    && ([v4 editableTextViewTextShouldPreventCorrection:self] & 1) != 0)
  {
    BOOL v5 = 0;
  }

  else
  {
    if ((objc_opt_respondsToSelector(v4, "editableTextViewTextWillBeginCorrecting:") & 1) != 0) {
      [v4 editableTextViewTextWillBeginCorrecting:self];
    }
    BOOL v5 = 1;
  }

  return v5;
}

- (void)textViewDidEndEditing:(id)a3
{
  if (self->_didCorrect) {
    self->_didCorrect = 0;
  }
  else {
    -[SREditableTextView endEditingAndCorrect:](self, "endEditingAndCorrect:", 0LL);
  }
}

- (void)textViewDidChange:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 window]);

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v5, "editableTextViewTextDidChange:") & 1) != 0) {
      [v5 editableTextViewTextDidChange:self];
    }
  }

- (double)_indentWidth
{
  double v2 = 28.0;
  if ((SiriUIIsCompactWidth(self, a2) & 1) == 0)
  {
    else {
      return 31.0;
    }
  }

  return v2;
}

- (void)utteranceTextDidResignFirstResponder:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate", a3));
  [v4 editableTextViewTextDidResignFirstResponder:self];

  -[SREditableTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void)utteranceTextDidReceiveReturnKey:(id)a3
{
  self->_didCorrect = 1;
  -[SREditableTextView endEditingAndCorrect:](self, "endEditingAndCorrect:", 1LL);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
  char v5 = objc_opt_respondsToSelector(v4, "editableTextViewTextDidReceiveReturnKey:");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
    [v6 editableTextViewTextDidReceiveReturnKey:self];
  }

- (id)_createVisualEffectBackgroundViewForTextView:(id)a3 topOffset:(double *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 font]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 font]);
  [v7 ascender];
  [v6 _scaledValueForValue:29.0 - v8];
  *(void *)a4 = v9;

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v5 setTextColor:v10];

  double v11 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect siriui_userUtteranceEditModeVibrancyEffect]( &OBJC_CLASS___UIVibrancyEffect,  "siriui_userUtteranceEditModeVibrancyEffect"));
  double v13 = -[UIVisualEffectView initWithEffect:](v11, "initWithEffect:", v12);

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v13, "contentView"));
  [v14 _setContinuousCornerRadius:10.0];

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v13, "contentView"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v15 setBackgroundColor:v16];

  return v13;
}

- (SREditableTextViewDelegate)delegate
{
  return (SREditableTextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BOOL)didCorrect
{
  return self->_didCorrect;
}

- (void)setDidCorrect:(BOOL)a3
{
  self->_didCorrect = a3;
}

- (void).cxx_destruct
{
}

@end
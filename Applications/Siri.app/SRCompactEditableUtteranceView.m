@interface SRCompactEditableUtteranceView
- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3;
- (SRCompactEditableUtteranceView)initWithFrame:(CGRect)a3 userUtterance:(id)a4 delegate:(id)a5;
- (SRCompactEditableUtteranceViewDelegate)_delegate;
- (SREditableTextView)_textView;
- (void)_setDelegate:(id)a3;
- (void)_setTextView:(id)a3;
- (void)_setupConstraints;
- (void)_setupTextView;
- (void)beginEditing;
- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3;
- (void)editableTextViewTextDidFinishCorrecting:(id)a3;
- (void)editableTextViewTextDidResignFirstResponder:(id)a3;
- (void)editableTextViewTextWillBeginCorrecting:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setAuxiliaryView:(id)a3;
@end

@implementation SRCompactEditableUtteranceView

- (SRCompactEditableUtteranceView)initWithFrame:(CGRect)a3 userUtterance:(id)a4 delegate:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SRCompactEditableUtteranceView;
  v14 = -[SRCompactEditableUtteranceView initWithFrame:](&v17, "initWithFrame:", x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userUtterance, a4);
    -[SRCompactEditableUtteranceView _setupTextView](v15, "_setupTextView");
    -[SRCompactEditableUtteranceView _setupConstraints](v15, "_setupConstraints");
    -[SRCompactEditableUtteranceView _setDelegate:](v15, "_setDelegate:", v13);
  }

  return v15;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SRCompactEditableUtteranceView;
  -[SRCompactEditableUtteranceView layoutSubviews](&v12, "layoutSubviews");
  -[SRCompactEditableUtteranceView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  objc_msgSend(v7, "sizeThatFits:", v4, v6);
  double v9 = v8;

  -[NSLayoutConstraint setConstant:](self->_textViewHeightAnchor, "setConstant:", v9);
  textViewTopAnchor = self->_textViewTopAnchor;
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  -[NSLayoutConstraint setConstant:](textViewTopAnchor, "setConstant:", v11 + 24.0);
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SRCompactEditableUtteranceView;
  -[SRCompactEditableUtteranceView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[SRCompactEditableUtteranceView setNeedsLayout](self, "setNeedsLayout");
}

- (void)beginEditing
{
}

- (void)setAuxiliaryView:(id)a3
{
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[SRCompactEditableUtteranceView addSubview:](self, "addSubview:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 leadingAnchor]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView leadingAnchor](self, "leadingAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToAnchor:v6 constant:v7]);
  [v8 setActive:1];

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView trailingAnchor](self, "trailingAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10 constant:v11]);
  [v12 setActive:1];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bottomAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v15 constant:0.0]);
  [v16 setActive:1];

  id v20 = (id)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView bottomAnchor](self, "bottomAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  v19 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v17 constant:v18]);
  [v19 setActive:1];
}

- (void)_setupTextView
{
  objc_super v3 = -[SREditableTextView initWithFrame:presentationStyle:]( objc_alloc(&OBJC_CLASS___SREditableTextView),  "initWithFrame:presentationStyle:",  1LL,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[SRCompactEditableUtteranceView _setTextView:](self, "_setTextView:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  [v5 setDelegate:self];

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[AFUserUtterance bestTextInterpretation](self->_userUtterance, "bestTextInterpretation"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  [v6 setText:v13];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFUserUtterance allPhrases](self->_userUtterance, "allPhrases"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AFUserUtterance correctionIdentifier](self->_userUtterance, "correctionIdentifier"));
  double v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
    [v11 setDictationResult:v7 withCorrectionIdentifier:v9];
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  -[SRCompactEditableUtteranceView addSubview:](self, "addSubview:", v12);
}

- (void)_setupConstraints
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView leadingAnchor](self, "leadingAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToAnchor:v5 constant:v6]);
  [v7 setActive:1];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 trailingAnchor]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView trailingAnchor](self, "trailingAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10 constant:v11]);
  [v12 setActive:1];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 topAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView topAnchor](self, "topAnchor"));
  -[SRCompactEditableUtteranceView safeAreaInsets](self, "safeAreaInsets");
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15));
  textViewTopAnchor = self->_textViewTopAnchor;
  self->_textViewTopAnchor = v16;

  -[NSLayoutConstraint setActive:](self->_textViewTopAnchor, "setActive:", 1LL);
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _textView](self, "_textView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 heightAnchor]);
  id v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToConstant:0.0]);
  textViewHeightAnchor = self->_textViewHeightAnchor;
  self->_textViewHeightAnchor = v20;

  -[NSLayoutConstraint setActive:](self->_textViewHeightAnchor, "setActive:", 1LL);
}

- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[SRCompactEditableUtteranceView editableTextViewRequestKeyboardForTapToEditWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #compact: requesting keyboard for tap to edit",  (uint8_t *)&v7,  0xCu);
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _delegate](self, "_delegate"));
  [v6 editableUtteranceView:self requestsKeyboardWithCompletion:v4];
}

- (void)editableTextViewTextDidFinishCorrecting:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 text]);
  double v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SRCompactEditableUtteranceView editableTextViewTextDidFinishCorrecting:]";
    __int16 v9 = 2112;
    BOOL v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #compact: #tap2edit: correction finished with editedText: %@",  (uint8_t *)&v7,  0x16u);
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _delegate](self, "_delegate"));
  [v6 editableUtteranceView:self didFinishEditingWithText:v4];
}

- (void)editableTextViewTextDidResignFirstResponder:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[SRCompactEditableUtteranceView editableTextViewTextDidResignFirstResponder:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #compact: did resign first responder",  (uint8_t *)&v6,  0xCu);
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _delegate](self, "_delegate"));
  [v5 didResignFirstResponderFromUtteranceView:self];
}

- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3
{
  return 0;
}

- (void)editableTextViewTextWillBeginCorrecting:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceView _delegate](self, "_delegate", a3));
  [v4 willBeginEditingFromUtteranceView:self];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v5 logEventWithType:1424 context:0];
}

- (SREditableTextView)_textView
{
  return self->_textView;
}

- (void)_setTextView:(id)a3
{
}

- (SRCompactEditableUtteranceViewDelegate)_delegate
{
  return (SRCompactEditableUtteranceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
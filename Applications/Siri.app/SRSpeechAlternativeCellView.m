@interface SRSpeechAlternativeCellView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)responseText;
- (SRSpeechAlternativeCellView)initWithTitle:(id)a3;
- (UIEdgeInsets)edgeInsets;
- (void)setResponseText:(id)a3;
- (void)updateConstraints;
@end

@implementation SRSpeechAlternativeCellView

- (SRSpeechAlternativeCellView)initWithTitle:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SRSpeechAlternativeCellView;
  v6 = -[SRSpeechAlternativeCellView init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_titleString, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___UIView);
    containerView = v7->_containerView;
    v7->_containerView = v8;

    -[SRSpeechAlternativeCellView addSubview:](v7, "addSubview:", v7->_containerView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v7->_containerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](&OBJC_CLASS___SiriSharedUIContentLabel, "label"));
    displayTextLabel = v7->_displayTextLabel;
    v7->_displayTextLabel = (UILabel *)v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v7->_displayTextLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v12 = v7->_displayTextLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setAttributedText:](v7->_displayTextLabel, "setAttributedText:", v5);
    -[UILabel setNumberOfLines:](v7->_displayTextLabel, "setNumberOfLines:", 0LL);
    -[UIView addSubview:](v7->_containerView, "addSubview:", v7->_displayTextLabel);
    -[SRSpeechAlternativeCellView setNeedsUpdateConstraints](v7, "setNeedsUpdateConstraints");
  }

  return v7;
}

- (UIEdgeInsets)edgeInsets
{
  int IsRTL = SiriLanguageIsRTL(self, a2);
  double v4 = SiriUIPlatterStyle[24];
  double v3 = SiriUIPlatterStyle[25];
  double v5 = SiriUIPlatterStyle[22];
  if (IsRTL) {
    double v6 = SiriUIPlatterStyle[23];
  }
  else {
    double v6 = SiriUIPlatterStyle[25];
  }
  if (!IsRTL) {
    double v3 = SiriUIPlatterStyle[23];
  }
  result.right = v6;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[SRSpeechAlternativeCellView bounds](self, "bounds", a4);
  v7.CGFloat x = x;
  v7.CGFloat y = y;
  return CGRectContainsPoint(v8, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UILabel sizeThatFits:]( self->_displayTextLabel,  "sizeThatFits:",  a3.width - (SiriUIPlatterStyle[23] + SiriUIPlatterStyle[25]),  1.79769313e308);
  double v5 = v4 + SiriUIPlatterStyle[22] + SiriUIPlatterStyle[24];
  double v6 = SiriUIPlatterStyle[26];
  if (v5 >= v6) {
    double v6 = v5;
  }
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)updateConstraints
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SRSpeechAlternativeCellView;
  -[SRSpeechAlternativeCellView updateConstraints](&v16, "updateConstraints");
  if (!self->_hasSetUpConstraints)
  {
    double v3 = _NSDictionaryOfVariableBindings(@"_containerView", self->_containerView, 0LL);
    double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"H:|[_containerView]|",  0LL,  0LL,  v4));
    -[SRSpeechAlternativeCellView addConstraints:](self, "addConstraints:", v5);

    double v6 = _NSDictionaryOfVariableBindings(@"_containerView", self->_containerView, 0LL);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    CGRect v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"V:|[_containerView]|",  0LL,  0LL,  v7));
    -[SRSpeechAlternativeCellView addConstraints:](self, "addConstraints:", v8);

    displayTextLabel = self->_displayTextLabel;
    if (displayTextLabel)
    {
      containerView = self->_containerView;
      v11 = _NSDictionaryOfVariableBindings(@"_displayTextLabel", displayTextLabel, 0LL);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"H:|[_displayTextLabel]|",  0LL,  0LL,  v12));
      -[UIView addConstraints:](containerView, "addConstraints:", v13);

      v14 = self->_displayTextLabel;
      if (v14)
      {
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  10LL,  0LL,  self->_containerView,  10LL,  1.0,  0.0));
        -[SRSpeechAlternativeCellView addConstraint:](self, "addConstraint:", v15);
      }
    }

    self->_hasSetUpConstraints = 1;
  }

- (NSString)responseText
{
  return self->_responseText;
}

- (void)setResponseText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
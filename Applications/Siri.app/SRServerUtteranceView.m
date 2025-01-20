@interface SRServerUtteranceView
+ (double)insertionAnimatedZPosition;
- (BOOL)chevronHasBeenShown;
- (BOOL)isBlendEffectEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRServerUtteranceView)initWithFrame:(CGRect)a3;
- (UIFont)font;
- (double)_scaledSiriCorrectionViewLeading;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setBlendEffectEnabled:(BOOL)a3;
- (void)setChevronHidden:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SRServerUtteranceView

- (SRServerUtteranceView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SRServerUtteranceView;
  v3 = -[SRServerUtteranceView initWithFrame:]( &v15,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](&OBJC_CLASS___SiriSharedUIContentLabel, "label"));
    label = v3->_label;
    v3->_label = (SiriSharedUIContentLabel *)v4;

    v6 = v3->_label;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](&OBJC_CLASS___UIColor, "siriui_lightTextColor"));
    -[SiriSharedUIContentLabel setTextColor:](v6, "setTextColor:", v7);

    v8 = v3->_label;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](&OBJC_CLASS___UIFont, "siriui_serverUtteranceFont"));
    -[SiriSharedUIContentLabel setFont:](v8, "setFont:", v9);

    id v10 = -[SiriSharedUIContentLabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0LL);
    v11 = v3->_label;
    double v12 = SiriUITextHyphenationFactor(v10);
    *(float *)&double v12 = v12;
    -[SiriSharedUIContentLabel _setHyphenationFactor:](v11, "_setHyphenationFactor:", v12);
    -[SRServerUtteranceView addSubview:](v3, "addSubview:", v3->_label);
    -[SRServerUtteranceView setChevronHidden:](v3, "setChevronHidden:", 1LL);
    CGFloat v13 = SiriUIDefaultEdgePadding;
    v3->_edgeInsets.top = 0.0;
    v3->_edgeInsets.leading = v13;
    v3->_edgeInsets.bottom = 0.0;
    v3->_edgeInsets.trailing = v13;
  }

  return v3;
}

- (void)setChevronHidden:(BOOL)a3
{
  if (!a3) {
    self->_chevronHasBeenShown = 1;
  }
  -[SRServerUtteranceView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)chevronHasBeenShown
{
  return self->_chevronHasBeenShown;
}

+ (double)insertionAnimatedZPosition
{
  return -100.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIContentLabel font](self->_label, "font"));
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIContentLabel font](self->_label, "font"));
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
  v6 = (__CFString *)v5;
  -[SiriSharedUIContentLabel setText:](self->_label, "setText:");
  -[SRServerUtteranceView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAttributedText:(id)a3
{
  if (a3)
  {
    -[SiriSharedUIContentLabel setAttributedText:](self->_label, "setAttributedText:");
    -[SRServerUtteranceView setNeedsLayout](self, "setNeedsLayout");
  }

  else
  {
    -[SRServerUtteranceView setText:](self, "setText:");
  }

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return (UIFont *)-[SiriSharedUIContentLabel font](self->_label, "font");
}

- (BOOL)isBlendEffectEnabled
{
  return self->_blendEffectEnabled;
}

- (void)setBlendEffectEnabled:(BOOL)a3
{
  if (self->_blendEffectEnabled != a3)
  {
    BOOL v3 = a3;
    self->_blendEffectEnabled = a3;
    label = self->_label;
    if (a3) {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor siriui_blendEffectColor](&OBJC_CLASS___UIColor, "siriui_blendEffectColor"));
    }
    else {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](&OBJC_CLASS___UIColor, "siriui_lightTextColor"));
    }
    v7 = (void *)v6;
    -[SiriSharedUIContentLabel setTextColor:](label, "setTextColor:", v6);

    -[SiriSharedUIContentLabel siriui_setBlendEffectEnabled:](self->_label, "siriui_setBlendEffectEnabled:", v3);
    -[SRServerUtteranceView setNeedsLayout](self, "setNeedsLayout");
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[SiriSharedUIContentLabel sizeThatFits:]( self->_label,  "sizeThatFits:",  SiriUIUtteranceWidthForAvailableWidthAndInsets( self,  a3.width,  self->_edgeInsets.top,  self->_edgeInsets.leading,  self->_edgeInsets.bottom,  self->_edgeInsets.trailing),  1.79769313e308);
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SRServerUtteranceView;
  -[SRServerUtteranceView layoutSubviews](&v15, "layoutSubviews");
  -[SRServerUtteranceView bounds](self, "bounds");
  CGFloat x = v16.origin.x;
  double y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v7 = CGRectGetWidth(v16);
  double v9 = SiriUIUtteranceWidthForAvailableWidthAndInsets( v8,  v7,  self->_edgeInsets.top,  self->_edgeInsets.leading,  self->_edgeInsets.bottom,  self->_edgeInsets.trailing);
  if (SiriLanguageIsRTL(v10, v11))
  {
    v17.origin.CGFloat x = x;
    v17.origin.double y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double leading = CGRectGetWidth(v17) - v9 - self->_edgeInsets.leading;
    uint64_t v13 = 2LL;
  }

  else
  {
    uint64_t v13 = 0LL;
    double leading = self->_edgeInsets.leading;
  }

  -[SiriSharedUIContentLabel setTextAlignment:](self->_label, "setTextAlignment:", v13);
  -[SiriSharedUIContentLabel sizeThatFits:](self->_label, "sizeThatFits:", v9, 1.79769313e308);
  -[SiriSharedUIContentLabel setFrame:](self->_label, "setFrame:", leading, y, v9, v14);
}

- (double)_scaledSiriCorrectionViewLeading
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont siriui_serverUtteranceCorrectionPromptFont]( &OBJC_CLASS___UIFont,  "siriui_serverUtteranceCorrectionPromptFont"));
  [v2 _scaledValueForValue:28.0];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
}

@end
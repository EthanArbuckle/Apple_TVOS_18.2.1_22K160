@interface SRTapToEditView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRTapToEditView)initWithFrame:(CGRect)a3;
- (double)_circleToLabelHeightDifference;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (void)_setHighlighted:(BOOL)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SRTapToEditView

- (SRTapToEditView)initWithFrame:(CGRect)a3
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___SRTapToEditView;
  v3 = -[SRTapToEditView initWithFrame:]( &v41,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v5 = v3;
  if (v3)
  {
    *(void *)&double v6 = objc_opt_class(v3, v4).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v7, v6));
    v9 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    tapToEditLabel = v5->_tapToEditLabel;
    v5->_tapToEditLabel = v9;

    v11 = v5->_tapToEditLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont siriui_serverUtteranceCorrectionPromptFont]( &OBJC_CLASS___UIFont,  "siriui_serverUtteranceCorrectionPromptFont"));
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = v5->_tapToEditLabel;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditColor](&OBJC_CLASS___UIColor, "siriui_tapToEditColor"));
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    v15 = v5->_tapToEditLabel;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 siriUILocalizedStringForKey:@"TAP_TO_EDIT" table:0]);
    -[UILabel setText:](v15, "setText:", v16);

    -[UILabel sizeToFit](v5->_tapToEditLabel, "sizeToFit");
    -[SRTapToEditView addSubview:](v5, "addSubview:", v5->_tapToEditLabel);
    *(void *)&double v18 = objc_opt_class(v5, v17).n128_u64[0];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v19, v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](&OBJC_CLASS___UIImage, "imageNamed:inBundle:", @"Circle", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 imageWithRenderingMode:2]);

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[SiriUIContentButton buttonWithImageTemplate:style:]( &OBJC_CLASS___SiriUIContentButton,  "buttonWithImageTemplate:style:",  v22,  0LL));
    circleButton = v5->_circleButton;
    v5->_circleButton = (SiriUIContentButton *)v23;

    -[SiriUIContentButton setUserInteractionEnabled:](v5->_circleButton, "setUserInteractionEnabled:", 0LL);
    -[SiriUIContentButton setAlpha:](v5->_circleButton, "setAlpha:", 0.12);
    -[SiriUIContentButton sizeToFit](v5->_circleButton, "sizeToFit");
    -[SRTapToEditView addSubview:](v5, "addSubview:", v5->_circleButton);
    *(void *)&double v26 = objc_opt_class(v5, v25).n128_u64[0];
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v27, v26));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"Chevron",  v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 imageWithRenderingMode:2]);

    if (SiriLanguageIsRTL(v31, v32))
    {
      uint64_t v33 = objc_claimAutoreleasedReturnValue([v30 imageWithHorizontallyFlippedOrientation]);

      v30 = (void *)v33;
    }

    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[SiriUIContentButton buttonWithImageTemplate:style:]( &OBJC_CLASS___SiriUIContentButton,  "buttonWithImageTemplate:style:",  v30,  0LL));
    chevronButton = v5->_chevronButton;
    v5->_chevronButton = (SiriUIContentButton *)v34;

    -[SiriUIContentButton setUserInteractionEnabled:](v5->_chevronButton, "setUserInteractionEnabled:", 0LL);
    v36 = v5->_chevronButton;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditColor](&OBJC_CLASS___UIColor, "siriui_tapToEditColor"));
    -[SiriUIContentButton setDefaultColorForTemplate:](v36, "setDefaultColorForTemplate:", v37);

    v38 = v5->_chevronButton;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditMaskingColor](&OBJC_CLASS___UIColor, "siriui_tapToEditMaskingColor"));
    -[SiriUIContentButton setHighlightColorForTemplate:](v38, "setHighlightColorForTemplate:", v39);

    -[SiriUIContentButton sizeToFit](v5->_chevronButton, "sizeToFit");
    -[SRTapToEditView addSubview:](v5, "addSubview:", v5->_chevronButton);
    -[SiriUIContentButton siriui_setBlendEffectEnabled:](v5->_chevronButton, "siriui_setBlendEffectEnabled:", 1LL);
    -[UILabel siriui_setBlendEffectEnabled:](v5->_tapToEditLabel, "siriui_setBlendEffectEnabled:", 1LL);
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_tapToEditLabel, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8 + 10.0;
  -[SiriUIContentButton sizeThatFits:](self->_circleButton, "sizeThatFits:", width, height);
  double v12 = v9 + v11;
  if (v7 >= v10) {
    double v10 = v7;
  }
  result.double height = v10;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SRTapToEditView;
  -[SRTapToEditView layoutSubviews](&v32, "layoutSubviews");
  circleButton = self->_circleButton;
  -[SRTapToEditView bounds](self, "bounds");
  -[SiriUIContentButton sizeThatFits:](circleButton, "sizeThatFits:", v4, v5);
  double v7 = v6;
  double v9 = v8;
  tapToEditLabel = self->_tapToEditLabel;
  -[SRTapToEditView bounds](self, "bounds");
  -[UILabel sizeThatFits:](tapToEditLabel, "sizeThatFits:", v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v17 = v9 - v15;
  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v18 scale];
  double v20 = v19;

  double v23 = v17 * -0.5;
  double v24 = floor(v17 * -0.5);
  if (v20 < 2.0) {
    double v23 = v24;
  }
  double v25 = 0.0;
  double v26 = v17 * 0.5;
  double v27 = floor(v17 * 0.5);
  if (v20 < 2.0) {
    double v26 = v27;
  }
  BOOL v28 = v17 <= 0.0;
  if (v17 > 0.0) {
    double v29 = v26;
  }
  else {
    double v29 = 0.0;
  }
  if (v28) {
    double v30 = v23;
  }
  else {
    double v30 = 0.0;
  }
  if (SiriLanguageIsRTL(v21, v22))
  {
    double v31 = 0.0;
    v33.origin.x = 0.0;
    v33.origin.y = v30;
    v33.size.double width = v7;
    v33.size.double height = v9;
    double v25 = CGRectGetWidth(v33) + 10.0;
  }

  else
  {
    v34.origin.x = 0.0;
    v34.origin.y = v29;
    v34.size.double width = v14;
    v34.size.double height = v16;
    double v31 = CGRectGetWidth(v34) + 10.0;
  }

  -[UILabel setFrame:](self->_tapToEditLabel, "setFrame:", v25, v29, v14, v16);
  -[SiriUIContentButton setFrame:](self->_circleButton, "setFrame:", v31, v30, v7, v9);
  -[SiriUIContentButton setFrame:](self->_chevronButton, "setFrame:", v31, v30, v7, v9);
}

- (double)firstLineBaselineOffsetFromTop
{
  double v4 = v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tapToEditLabel, "font"));
  [v5 ascender];
  double v7 = v6;

  double v8 = v4 * 0.5;
  if (v4 <= 0.0) {
    double v8 = -0.0;
  }
  return v8 + v7;
}

- (double)baselineOffsetFromBottom
{
  double v4 = v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tapToEditLabel, "font"));
  [v5 descender];
  double v7 = v6;
  double v8 = -v6;

  double result = v4 * 0.5 - v7;
  if (v4 <= 0.0) {
    return v8;
  }
  return result;
}

- (void)_setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  tapToEditLabel = self->_tapToEditLabel;
  if (a3) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditMaskingColor](&OBJC_CLASS___UIColor, "siriui_tapToEditMaskingColor"));
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditColor](&OBJC_CLASS___UIColor, "siriui_tapToEditColor"));
  }
  double v7 = (void *)v6;
  -[UILabel setTextColor:](tapToEditLabel, "setTextColor:", v6);

  -[SiriUIContentButton setHighlighted:](self->_circleButton, "setHighlighted:", v3);
  -[SiriUIContentButton setHighlighted:](self->_chevronButton, "setHighlighted:", v3);
}

- (double)_circleToLabelHeightDifference
{
  circleButton = self->_circleButton;
  -[SRTapToEditView bounds](self, "bounds");
  -[SiriUIContentButton sizeThatFits:](circleButton, "sizeThatFits:", v4, v5);
  double v7 = v6;
  tapToEditLabel = self->_tapToEditLabel;
  -[SRTapToEditView bounds](self, "bounds");
  -[UILabel sizeThatFits:](tapToEditLabel, "sizeThatFits:", v9, v10);
  return v7 - v11;
}

- (void).cxx_destruct
{
}

@end
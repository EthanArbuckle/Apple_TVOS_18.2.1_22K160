@interface SATVTextEntryView
- (BOOL)touchInputEnabled;
- (NSArray)keyboardConstraints;
- (SATVTextEntryView)initWithFrame:(CGRect)a3;
- (UIButton)continueButton;
- (UIFocusGuide)gridFocusGuide;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UITextField)textField;
- (UIView)systemInputView;
- (void)_gridAlignFrame:(CGRect *)a3;
- (void)_setSystemInputView:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setGridFocusGuide:(id)a3;
- (void)setKeyboardConstraints:(id)a3;
- (void)setSystemInputView:(id)a3 touchInputEnabled:(BOOL)a4;
- (void)setTouchInputEnabled:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation SATVTextEntryView

- (SATVTextEntryView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SATVTextEntryView;
  v3 = -[SATVTextEntryView initWithFrame:]( &v25,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc(&OBJC_CLASS___TVSKLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = -[TVSKLabel initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewTitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewTitleFont"));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v12);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_stepViewTitleDynamicColor](&OBJC_CLASS___UIColor, "tvsk_stepViewTitleDynamicColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v13);

    -[SATVTextEntryView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v14 = -[TVSKLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKLabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v16);

    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityCDynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityCDynamicColor"));
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v17);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0LL);
    -[SATVTextEntryView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    v18 = -[SATVNonFocusableTextField initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVNonFocusableTextField),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    textField = v4->_textField;
    v4->_textField = &v18->super;

    -[UITextField _setBlurEnabled:](v4->_textField, "_setBlurEnabled:", 0LL);
    -[UITextField setAutocorrectionType:](v4->_textField, "setAutocorrectionType:", 1LL);
    -[UITextField setKeyboardType:](v4->_textField, "setKeyboardType:", 0LL);
    -[SATVTextEntryView addSubview:](v4, "addSubview:", v4->_textField);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    continueButton = v4->_continueButton;
    v4->_continueButton = (UIButton *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleTitle3));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_continueButton, "titleLabel"));
    [v23 setFont:v22];

    -[SATVTextEntryView addSubview:](v4, "addSubview:", v4->_continueButton);
  }

  return v4;
}

- (void)setSystemInputView:(id)a3 touchInputEnabled:(BOOL)a4
{
  v6 = (UIView *)a3;
  if (self->_systemInputView != v6)
  {
    self->_touchInputEnabled = a4;
    v10 = v6;
    -[SATVTextEntryView _setSystemInputView:](self, "_setSystemInputView:", v6);
    if (self->_touchInputEnabled)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView gridFocusGuide](self, "gridFocusGuide"));
      -[SATVTextEntryView removeLayoutGuide:](self, "removeLayoutGuide:", v7);

      -[SATVTextEntryView setGridFocusGuide:](self, "setGridFocusGuide:", 0LL);
    }

    else
    {
      v8 = objc_alloc_init(&OBJC_CLASS___UIFocusContainerGuide);
      -[SATVTextEntryView setGridFocusGuide:](self, "setGridFocusGuide:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView gridFocusGuide](self, "gridFocusGuide"));
      -[SATVTextEntryView addLayoutGuide:](self, "addLayoutGuide:", v9);
    }

    v6 = v10;
  }
}

- (void)updateConstraints
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView keyboardConstraints](self, "keyboardConstraints"));

  if (!v3)
  {
    unsigned int v4 = -[SATVTextEntryView touchInputEnabled](self, "touchInputEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView systemInputView](self, "systemInputView"));
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  3LL,  0LL,  self,  3LL,  1.0,  485.0));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView systemInputView](self, "systemInputView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  1LL,  0LL,  self,  1LL,  1.0,  0.0));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView systemInputView](self, "systemInputView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  2LL,  0LL,  self,  2LL,  1.0,  0.0));

      v17 = v6;
      v11 = &v17;
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  3LL,  0LL,  self,  3LL,  1.0,  0.0));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView systemInputView](self, "systemInputView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v12,  4LL,  0LL,  self,  4LL,  1.0,  0.0));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView systemInputView](self, "systemInputView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  1LL,  0LL,  self,  1LL,  1.0,  140.0));

      v16 = v6;
      v11 = &v16;
    }

    v11[1] = v8;
    v11[2] = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
    -[SATVTextEntryView setKeyboardConstraints:](self, "setKeyboardConstraints:", v14);

    -[SATVTextEntryView addConstraints:](self, "addConstraints:", self->_keyboardConstraints);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SATVTextEntryView;
  -[SATVTextEntryView updateConstraints](&v15, "updateConstraints");
}

- (void)layoutSubviews
{
  v88.receiver = self;
  v88.super_class = (Class)&OBJC_CLASS___SATVTextEntryView;
  -[SATVTextEntryView layoutSubviews](&v88, "layoutSubviews");
  -[SATVTextEntryView bounds](self, "bounds");
  double v66 = v3;
  double rect = v4;
  double v6 = v5;
  double v8 = v7;
  double v84 = 0.0;
  *(double *)&uint64_t v85 = 0.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "sizeThatFits:", 1144.0, 3.40282347e38);
  double v11 = v10;
  double v13 = v12;
  double v86 = v10;
  double v87 = v12;

  CGFloat v80 = 0.0;
  *(double *)&uint64_t v81 = 0.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v14, "sizeThatFits:", 1144.0, 3.40282347e38);
  double v16 = v15;
  double v18 = v17;
  double v82 = v15;
  double v83 = v17;

  double v76 = 0.0;
  double v77 = 0.0;
  *(double *)&uint64_t v78 = 600.0;
  *(double *)&uint64_t v79 = 70.0;
  __int128 v73 = xmmword_1000C46D0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self, "continueButton"));
  double v20 = v6;
  double v67 = v8;
  objc_msgSend(v19, "sizeThatFits:", v6, v8);
  double v22 = v21;
  double v24 = v23;
  double v74 = v21;
  double v75 = v23;

  if (-[SATVTextEntryView touchInputEnabled](self, "touchInputEnabled"))
  {
    double v61 = v24;
    double v62 = v22;
    double v63 = UIRectCenteredXInRect(0.0, 0.0, v11, v13, v66, rect, v20, v67);
    double v64 = v25;
    double v65 = v26;
    double v84 = v63;
    double v86 = v25;
    double v87 = v26;
    *(double *)&uint64_t v85 = 128.0;
    CGFloat v27 = UIRectCenteredXInRect(0.0, 0.0, v16, v18, v66, rect, v20, v67);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v80 = v27;
    double v82 = v28;
    double v83 = v30;
    *(double *)&uint64_t v81 = 241.0;
    double v76 = UIRectCenteredXInRect(0.0, 0.0, 600.0, 70.0, v66, rect, v20, v67);
    uint64_t v78 = v32;
    uint64_t v79 = v33;
    v89.origin.double y = 241.0;
    v89.origin.x = v27;
    v89.size.double width = v29;
    v89.size.double height = v31;
    double v77 = CGRectGetMaxY(v89) + 100.0;
    CGFloat v34 = v20;
    double v35 = UIRectCenteredXInRect(0.0, 713.0, v22, v24, v66, rect, v20, v67);
    double v37 = v36;
    *(double *)&__int128 v73 = v35;
    double v74 = v38;
    double v75 = v36;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView systemInputView](self, "systemInputView"));
    [v39 frame];
    double MaxY = CGRectGetMaxY(v90);

    v91.origin.x = v66;
    v91.origin.double y = rect;
    double v41 = v63;
    v91.size.double width = v34;
    v91.size.double height = v67;
    double v42 = MaxY + round((CGRectGetMaxY(v91) - MaxY - v37) * 0.5);
    double v43 = v64;
    *((double *)&v73 + 1) = v42;
    double v44 = 128.0;
  }

  else
  {
    -[SATVTextEntryView _gridAlignFrame:](self, "_gridAlignFrame:", &v84);
    *(double *)&uint64_t v85 = 128.0;
    -[SATVTextEntryView _gridAlignFrame:](self, "_gridAlignFrame:", &v80);
    *(double *)&uint64_t v81 = 241.0;
    -[SATVTextEntryView _gridAlignFrame:](self, "_gridAlignFrame:", &v76);
    double v77 = 418.0;
    -[SATVTextEntryView _gridAlignFrame:](self, "_gridAlignFrame:", &v73);
    *((void *)&v73 + 1) = 0x4083000000000000LL;
    double v69 = 0.0;
    double v70 = 0.0;
    double v71 = 1144.0;
    v92.origin.x = v66;
    v92.size.double height = v67;
    v92.origin.double y = rect;
    v92.size.double width = v20;
    double Height = CGRectGetHeight(v92);
    -[SATVTextEntryView _gridAlignFrame:](self, "_gridAlignFrame:", &v69);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView gridFocusGuide](self, "gridFocusGuide"));
    objc_msgSend(v45, "_setManualLayoutFrame:", v69, v70, v71, Height);

    double v41 = v84;
    double v44 = *(double *)&v85;
    double v43 = v86;
    double v65 = v87;
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView titleLabel](self, "titleLabel", *(void *)&v61, *(void *)&v62));
  objc_msgSend(v46, "setFrame:", v41, v44, v43, v65);

  double v47 = v80;
  double v48 = *(double *)&v81;
  double v49 = v82;
  double v50 = v83;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v51, "setFrame:", v47, v48, v49, v50);

  double v52 = v76;
  double v53 = v77;
  double v54 = *(double *)&v78;
  double v55 = *(double *)&v79;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView textField](self, "textField"));
  objc_msgSend(v56, "setFrame:", v52, v53, v54, v55);

  __int128 v57 = v73;
  double v58 = v74;
  double v59 = v75;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self, "continueButton"));
  objc_msgSend(v60, "setFrame:", v57, v58, v59);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  if (!-[SATVTextEntryView touchInputEnabled](self, "touchInputEnabled", a3, a4))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    id v9 = (id)objc_claimAutoreleasedReturnValue([v5 focusedView]);

    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self, "continueButton"));
    BOOL v7 = v9 != v6;

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView gridFocusGuide](self, "gridFocusGuide"));
    [v8 setEnabled:v7];
  }

- (void)_gridAlignFrame:(CGRect *)a3
{
  a3->origin.x = CGRectGetWidth(*a3) * -0.5 + 1258.0;
}

- (void)_setSystemInputView:(id)a3
{
  double v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_systemInputView, "removeFromSuperview");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView keyboardConstraints](self, "keyboardConstraints"));
  -[SATVTextEntryView removeConstraints:](self, "removeConstraints:", v5);

  -[SATVTextEntryView setKeyboardConstraints:](self, "setKeyboardConstraints:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_systemInputView, "layer"));
  [v6 setBorderWidth:1.0];

  systemInputView = self->_systemInputView;
  self->_systemInputView = v4;
  double v8 = v4;

  -[SATVTextEntryView addSubview:](self, "addSubview:", self->_systemInputView);
  -[SATVTextEntryView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UITextField)textField
{
  return self->_textField;
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (UIView)systemInputView
{
  return self->_systemInputView;
}

- (NSArray)keyboardConstraints
{
  return self->_keyboardConstraints;
}

- (void)setKeyboardConstraints:(id)a3
{
}

- (BOOL)touchInputEnabled
{
  return self->_touchInputEnabled;
}

- (void)setTouchInputEnabled:(BOOL)a3
{
  self->_touchInputEnabled = a3;
}

- (UIFocusGuide)gridFocusGuide
{
  return self->_gridFocusGuide;
}

- (void)setGridFocusGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
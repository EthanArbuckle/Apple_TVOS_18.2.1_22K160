@interface SATVTimeZoneView
- (BOOL)touchInputEnabled;
- (NSArray)headerConstraints;
- (NSArray)keyboardConstraints;
- (NSArray)searchViewConstraints;
- (NSArray)textFieldConstraints;
- (SATVHeaderView)headerView;
- (SATVTimeZoneView)initWithFrame:(CGRect)a3;
- (UITextField)textField;
- (UIView)searchView;
- (UIView)systemInputView;
- (void)_gridAlignFrame:(CGRect *)a3;
- (void)layoutSubviews;
- (void)setHeaderConstraints:(id)a3;
- (void)setKeyboardConstraints:(id)a3;
- (void)setSearchView:(id)a3;
- (void)setSearchViewConstraints:(id)a3;
- (void)setSystemInputView:(id)a3 touchInputEnabled:(BOOL)a4;
- (void)setTextFieldConstraints:(id)a3;
- (void)setTouchInputEnabled:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation SATVTimeZoneView

- (SATVTimeZoneView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SATVTimeZoneView;
  v3 = -[SATVTimeZoneView initWithFrame:]( &v16,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___SATVHeaderView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = -[SATVHeaderView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    headerView = v3->_headerView;
    v3->_headerView = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView subtitleLabel](v3->_headerView, "subtitleLabel"));
    [v11 setFont:v10];

    -[SATVTimeZoneView addSubview:](v3, "addSubview:", v3->_headerView);
    v12 = -[_SATVTimeZoneTextField initWithFrame:]( objc_alloc(&OBJC_CLASS____SATVTimeZoneTextField),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    textField = v3->_textField;
    v3->_textField = &v12->super;

    -[UITextField _setBlurEnabled:](v3->_textField, "_setBlurEnabled:", 0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    -[UITextField setFont:](v3->_textField, "setFont:", v14);

    -[UITextField setAutocorrectionType:](v3->_textField, "setAutocorrectionType:", 1LL);
    -[UITextField setKeyboardType:](v3->_textField, "setKeyboardType:", 10LL);
    -[SATVTimeZoneView addSubview:](v3, "addSubview:", v3->_textField);
  }

  return v3;
}

- (void)updateConstraints
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView keyboardConstraints](self, "keyboardConstraints"));

  if (!v3)
  {
    unsigned int v4 = -[SATVTimeZoneView touchInputEnabled](self, "touchInputEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView systemInputView](self, "systemInputView"));
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  3LL,  0LL,  self,  3LL,  1.0,  330.0));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView systemInputView](self, "systemInputView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  1LL,  0LL,  self,  1LL,  1.0,  0.0));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView systemInputView](self, "systemInputView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  2LL,  0LL,  self,  2LL,  1.0,  0.0));

      v15[0] = v6;
      v15[1] = v8;
      v15[2] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
      -[SATVTimeZoneView setKeyboardConstraints:](self, "setKeyboardConstraints:", v11);
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  10LL,  0LL,  self,  10LL,  1.0,  0.0));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView systemInputView](self, "systemInputView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v12,  1LL,  0LL,  self,  1LL,  1.0,  140.0));

      v14[0] = v6;
      v14[1] = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
      -[SATVTimeZoneView setKeyboardConstraints:](self, "setKeyboardConstraints:", v10);
    }

    -[SATVTimeZoneView addConstraints:](self, "addConstraints:", self->_keyboardConstraints);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATVTimeZoneView;
  -[SATVTimeZoneView updateConstraints](&v13, "updateConstraints");
}

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___SATVTimeZoneView;
  -[SATVTimeZoneView layoutSubviews](&v52, "layoutSubviews");
  -[SATVTimeZoneView bounds](self, "bounds");
  double rect = v3;
  double v5 = v4;
  double rect_16 = v6;
  double v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView systemInputView](self, "systemInputView"));
  [v9 frame];
  double rect_8 = v10;
  double v12 = v11;
  double v43 = v13;
  double rect_24 = v14;

  v51.origin.CGFloat x = 0.0;
  v51.origin.CGFloat y = 0.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView headerView](self, "headerView"));
  objc_msgSend(v15, "sizeThatFits:", 1200.0, 3.40282347e38);
  double v17 = v16;
  double v19 = v18;
  v51.size.CGFloat width = v16;
  v51.size.double height = v18;

  v50.origin.CGFloat x = 0.0;
  v50.origin.CGFloat y = 0.0;
  v50.size.CGFloat width = 600.0;
  v50.size.double height = 70.0;
  __int128 v48 = xmmword_1000C45A8;
  __int128 v49 = unk_1000C45B8;
  if (-[SATVTimeZoneView touchInputEnabled](self, "touchInputEnabled"))
  {
    double v42 = v5;
    CGFloat v20 = UIRectCenteredXInRect(0.0, 0.0, v17, v19, rect, v5, rect_16, v8);
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    v51.origin.CGFloat x = v20;
    v51.size.CGFloat width = v21;
    v51.size.double height = v23;
    v51.origin.CGFloat y = 80.0;
    CGFloat v25 = UIRectCenteredXInRect(0.0, 0.0, 600.0, 70.0, rect, v5, rect_16, v8);
    CGFloat v27 = v26;
    double v41 = v8;
    CGFloat v29 = v28;
    v50.origin.CGFloat x = v25;
    v50.size.CGFloat width = v26;
    v50.size.double height = v28;
    v53.origin.CGFloat y = 80.0;
    v53.origin.CGFloat x = v20;
    v53.size.CGFloat width = v22;
    v53.size.double height = v24;
    v54.origin.CGFloat y = CGRectGetMaxY(v53) + 77.0;
    v50.origin.CGFloat y = v54.origin.y;
    v54.origin.CGFloat x = v25;
    v54.size.CGFloat width = v27;
    v54.size.double height = v29;
    CGFloat v30 = CGRectGetMaxY(v54) + 26.0;
    *(void *)&__int128 v48 = UIRectCenteredXInRect(0.0, 0.0, 700.0, 0.0, rect, v42, rect_16, v41);
    *(void *)&__int128 v49 = v31;
    v55.origin.CGFloat x = rect_8;
    v55.origin.CGFloat y = v30;
    v55.size.CGFloat width = v43;
    v55.size.double height = rect_24;
    *((double *)&v48 + 1) = CGRectGetMaxY(v55) + 50.0;
    v56.origin.CGFloat x = rect;
    v56.origin.CGFloat y = v42;
    v56.size.CGFloat width = rect_16;
    v56.size.double height = v41;
    double v12 = v30;
    double Height = CGRectGetHeight(v56);
    CGFloat x = rect_8;
    CGFloat y = v30;
    CGFloat width = v43;
    CGFloat v36 = rect_24;
  }

  else
  {
    -[SATVTimeZoneView _gridAlignFrame:](self, "_gridAlignFrame:", &v51);
    v51.origin.CGFloat y = 128.0;
    -[SATVTimeZoneView _gridAlignFrame:](self, "_gridAlignFrame:", &v50);
    v50.origin.CGFloat y = CGRectGetMaxY(v51) + 77.0;
    -[SATVTimeZoneView _gridAlignFrame:](self, "_gridAlignFrame:", &v48);
    *((double *)&v48 + 1) = CGRectGetMaxY(v50) + 50.0;
    v57.origin.CGFloat x = rect;
    v57.origin.CGFloat y = v5;
    v57.size.CGFloat width = rect_16;
    v57.size.double height = v8;
    double Height = CGRectGetHeight(v57);
    CGFloat x = v50.origin.x;
    CGFloat y = v50.origin.y;
    CGFloat width = v50.size.width;
    CGFloat v36 = v50.size.height;
  }

  *((double *)&v49 + 1) = Height - (CGRectGetMaxY(*(CGRect *)&x) + 50.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView textField](self, "textField"));
  objc_msgSend(v37, "setFrame:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView searchView](self, "searchView"));
  objc_msgSend(v38, "setFrame:", v48, v49);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView systemInputView](self, "systemInputView"));
  objc_msgSend(v39, "setFrame:", rect_8, v12, v43, rect_24);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView headerView](self, "headerView"));
  objc_msgSend(v40, "setFrame:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
}

- (void)setSystemInputView:(id)a3 touchInputEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIView *)a3;
  systemInputView = self->_systemInputView;
  double v10 = v7;
  if (systemInputView != v7)
  {
    -[UIView removeFromSuperview](systemInputView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_systemInputView, a3);
    -[SATVTimeZoneView addSubview:](self, "addSubview:", self->_systemInputView);
LABEL_4:
    self->_touchInputEnabled = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneView keyboardConstraints](self, "keyboardConstraints"));
    -[SATVTimeZoneView removeConstraints:](self, "removeConstraints:", v9);

    -[SATVTimeZoneView setKeyboardConstraints:](self, "setKeyboardConstraints:", 0LL);
    -[SATVTimeZoneView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    goto LABEL_5;
  }

  if (self->_touchInputEnabled != v4) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)setSearchView:(id)a3
{
  double v5 = (UIView *)a3;
  searchView = self->_searchView;
  if (searchView != v5)
  {
    double v7 = v5;
    -[UIView removeFromSuperview](searchView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_searchView, a3);
    -[SATVTimeZoneView addSubview:](self, "addSubview:", self->_searchView);
    -[SATVTimeZoneView setNeedsLayout](self, "setNeedsLayout");
    double v5 = v7;
  }
}

- (void)_gridAlignFrame:(CGRect *)a3
{
  a3->origin.CGFloat x = floor(CGRectGetWidth(*a3) * -0.5 + 1258.0);
}

- (UIView)searchView
{
  return self->_searchView;
}

- (SATVHeaderView)headerView
{
  return self->_headerView;
}

- (UITextField)textField
{
  return self->_textField;
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

- (NSArray)headerConstraints
{
  return self->_headerConstraints;
}

- (void)setHeaderConstraints:(id)a3
{
}

- (NSArray)searchViewConstraints
{
  return self->_searchViewConstraints;
}

- (void)setSearchViewConstraints:(id)a3
{
}

- (NSArray)textFieldConstraints
{
  return self->_textFieldConstraints;
}

- (void)setTextFieldConstraints:(id)a3
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

- (void).cxx_destruct
{
}

@end
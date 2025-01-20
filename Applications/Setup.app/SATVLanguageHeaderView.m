@interface SATVLanguageHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SATVHeaderView)hiddenHeaderView;
- (SATVHeaderView)visibleHeaderView;
- (SATVLanguageHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHiddenHeaderView:(id)a3;
- (void)setTitle:(id)a3 subtitle:(id)a4 languageCode:(id)a5 animated:(BOOL)a6;
- (void)setVisibleHeaderView:(id)a3;
@end

@implementation SATVLanguageHeaderView

- (SATVLanguageHeaderView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SATVLanguageHeaderView;
  v3 = -[SATVLanguageHeaderView initWithFrame:]( &v15,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___SATVHeaderView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = -[SATVHeaderView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    visibleHeaderView = v3->_visibleHeaderView;
    v3->_visibleHeaderView = v8;

    -[SATVLanguageHeaderView addSubview:](v3, "addSubview:", v3->_visibleHeaderView);
    v10 = -[SATVHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    hiddenHeaderView = v3->_hiddenHeaderView;
    v3->_hiddenHeaderView = v10;

    -[SATVLanguageHeaderView addSubview:](v3, "addSubview:", v3->_hiddenHeaderView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView layer](v3->_hiddenHeaderView, "layer"));
    LODWORD(v13) = 0;
    [v12 setOpacity:v13];
  }

  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATVLanguageHeaderView;
  -[SATVLanguageHeaderView layoutSubviews](&v13, "layoutSubviews");
  -[SATVLanguageHeaderView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView hiddenHeaderView](self, "hiddenHeaderView"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setTitle:(id)a3 subtitle:(id)a4 languageCode:(id)a5 animated:(BOOL)a6
{
  id v64 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 titleLabel]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 text]);
  if ([v14 length])
  {
    id v15 = [v64 length];

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 titleLabel]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 text]);
      unsigned int v19 = [v18 isEqualToString:v64] ^ 1;

      goto LABEL_6;
    }
  }

  else
  {
  }

  id v20 = [v64 length];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 titleLabel]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 text]);
  id v24 = [v23 length];

  unsigned int v19 = v20 != v24;
LABEL_6:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 subtitleLabel]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 text]);
  if ([v27 length])
  {
    id v28 = [v10 length];

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 subtitleLabel]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 text]);
      unsigned int v32 = [v31 isEqualToString:v64] ^ 1;

      goto LABEL_11;
    }
  }

  else
  {
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 subtitleLabel]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 text]);
  id v36 = [v35 length];
  id v37 = [v10 length];

  unsigned int v32 = v36 != v37;
LABEL_11:
  if ((v19 | v32) == 1)
  {
    if (a6)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView hiddenHeaderView](self, "hiddenHeaderView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 titleLabel]);
      [v39 setText:v64];

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView hiddenHeaderView](self, "hiddenHeaderView"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 subtitleLabel]);
      [v41 setText:v10];

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView hiddenHeaderView](self, "hiddenHeaderView"));
      [v42 setNeedsLayout];

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView hiddenHeaderView](self, "hiddenHeaderView"));
      [v43 layoutIfNeeded];

      v44 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"opacity"));
      [v44 setKeyTimes:&off_1000D10A0];
      [v44 setValues:&off_1000D10B8];
      [v44 setDuration:0.3];
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 layer]);
      [v46 addAnimation:v44 forKey:@"fadeOut"];

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
      v48 = (void *)objc_claimAutoreleasedReturnValue([v47 layer]);
      LODWORD(v49) = 0;
      [v48 setOpacity:v49];

      v50 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"opacity"));
      [v50 setKeyTimes:&off_1000D10D0];
      [v50 setValues:&off_1000D10E8];
      [v50 setDuration:0.3];
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView hiddenHeaderView](self, "hiddenHeaderView"));
      v52 = (void *)objc_claimAutoreleasedReturnValue([v51 layer]);
      [v52 addAnimation:v50 forKey:@"fadeIn"];

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView hiddenHeaderView](self, "hiddenHeaderView"));
      v54 = (void *)objc_claimAutoreleasedReturnValue([v53 layer]);
      LODWORD(v55) = 1.0;
      [v54 setOpacity:v55];

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView hiddenHeaderView](self, "hiddenHeaderView"));
      -[SATVLanguageHeaderView setVisibleHeaderView:](self, "setVisibleHeaderView:", v57);

      -[SATVLanguageHeaderView setHiddenHeaderView:](self, "setHiddenHeaderView:", v56);
    }

    else
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
      v59 = (void *)objc_claimAutoreleasedReturnValue([v58 titleLabel]);
      [v59 setText:v64];

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
      v50 = (void *)objc_claimAutoreleasedReturnValue([v44 subtitleLabel]);
      [v50 setText:v10];
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 titleLabel]);
    [v61 setAccessibilityLanguage:v11];

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageHeaderView visibleHeaderView](self, "visibleHeaderView"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 subtitleLabel]);
    [v63 setAccessibilityLanguage:v11];
  }
}

- (SATVHeaderView)visibleHeaderView
{
  return self->_visibleHeaderView;
}

- (void)setVisibleHeaderView:(id)a3
{
}

- (SATVHeaderView)hiddenHeaderView
{
  return self->_hiddenHeaderView;
}

- (void)setHiddenHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
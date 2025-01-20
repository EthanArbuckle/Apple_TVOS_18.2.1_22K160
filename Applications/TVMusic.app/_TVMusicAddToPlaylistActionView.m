@interface _TVMusicAddToPlaylistActionView
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (UIImageView)trailingImageView;
- (UILabel)textLabel;
- (_TVMusicAddToPlaylistActionView)initWithText:(id)a3 isFolder:(BOOL)a4 handler:(id)a5;
- (_UIFloatingContentView)floatingView;
- (id)accessibilityLabel;
- (id)actionHandler;
- (unint64_t)accessibilityTraits;
- (void)_handleSelectPress:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
@end

@implementation _TVMusicAddToPlaylistActionView

- (_TVMusicAddToPlaylistActionView)initWithText:(id)a3 isFolder:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS____TVMusicAddToPlaylistActionView;
  v10 = -[_TVMusicAddToPlaylistActionView init](&v41, "init");
  if (v10)
  {
    id v11 = [v9 copy];
    id actionHandler = v10->_actionHandler;
    v10->_id actionHandler = v11;

    v13 = objc_alloc(&OBJC_CLASS____UIFloatingContentView);
    -[_TVMusicAddToPlaylistActionView bounds](v10, "bounds");
    v14 = -[_UIFloatingContentView initWithFrame:](v13, "initWithFrame:");
    floatingView = v10->_floatingView;
    v10->_floatingView = v14;

    -[_UIFloatingContentView setCornerRadius:](v10->_floatingView, "setCornerRadius:", 14.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v10->_floatingView, "setContinuousCornerEnabled:", 1LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  2LL));
    -[_UIFloatingContentView setFocusAnimationConfiguration:]( v10->_floatingView,  "setFocusAnimationConfiguration:",  v16);

    -[_UIFloatingContentView setContentMotionRotation:translation:]( v10->_floatingView,  "setContentMotionRotation:translation:",  0.0,  0.0523598776,  0.0,  4.0);
    -[_TVMusicAddToPlaylistActionView addSubview:](v10, "addSubview:", v10->_floatingView);
    v17 = objc_alloc(&OBJC_CLASS___UIView);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView visualEffectContainerView](v10->_floatingView, "visualEffectContainerView"));
    [v18 bounds];
    v19 = -[UIView initWithFrame:](v17, "initWithFrame:");

    -[UIView setAutoresizingMask:](v19, "setAutoresizingMask:", 18LL);
    -[_UIFloatingContentView cornerRadius](v10->_floatingView, "cornerRadius");
    -[UIView _setContinuousCornerRadius:](v19, "_setContinuousCornerRadius:");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1));
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView visualEffectContainerView](v10->_floatingView, "visualEffectContainerView"));
    [v21 addSubview:v19];

    v22 = objc_alloc(&OBJC_CLASS___UILabel);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v10->_floatingView, "contentView"));
    [v23 bounds];
    v24 = -[UILabel initWithFrame:](v22, "initWithFrame:");
    textLabel = v10->_textLabel;
    v10->_textLabel = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    -[UILabel setFont:](v10->_textLabel, "setFont:", v26);

    -[UILabel setText:](v10->_textLabel, "setText:", v8);
    -[UILabel setTextAlignment:](v10->_textLabel, "setTextAlignment:", 1LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v10->_textLabel, "setTextColor:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v10->_floatingView, "contentView"));
    [v28 addSubview:v10->_textLabel];

    if (v6)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView traitCollection](v10, "traitCollection"));
      id v30 = [v29 layoutDirection];

      uint64_t TableNext = UIImageGetTableNext();
      v32 = (void *)objc_claimAutoreleasedReturnValue(TableNext);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 imageWithRenderingMode:2]);

      v34 = objc_alloc_init(&OBJC_CLASS___UIImageView);
      trailingImageView = v10->_trailingImageView;
      v10->_trailingImageView = v34;

      if (v30 == (id)1)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue([v33 imageWithHorizontallyFlippedOrientation]);
        -[UIImageView setImage:](v10->_trailingImageView, "setImage:", v36);
      }

      else
      {
        -[UIImageView setImage:](v10->_trailingImageView, "setImage:", v33);
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](&OBJC_CLASS___UIColor, "grayColor"));
      -[UIImageView setTintColor:](v10->_trailingImageView, "setTintColor:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v10->_floatingView, "contentView"));
      [v38 addSubview:v10->_trailingImageView];
    }

    v39 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  v10,  "_handleSelectPress:");
    -[UILongPressGestureRecognizer setAllowedPressTypes:](v39, "setAllowedPressTypes:", &off_100282210);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v39, "setMinimumPressDuration:", 0.0);
    -[_TVMusicAddToPlaylistActionView addGestureRecognizer:](v10, "addGestureRecognizer:", v39);
  }

  return v10;
}

- (void)layoutSubviews
{
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS____TVMusicAddToPlaylistActionView;
  -[_TVMusicAddToPlaylistActionView layoutSubviews](&v72, "layoutSubviews");
  double y = CGPointZero.y;
  -[_TVMusicAddToPlaylistActionView bounds](self, "bounds");
  double Width = CGRectGetWidth(v73);
  id v5 = -[_TVMusicAddToPlaylistActionView bounds](self, "bounds");
  double v10 = UIRectCenteredIntegralRect(v5, CGPointZero.x, y, Width, 66.0, v6, v7, v8, v9);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView floatingView](self, "floatingView"));
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView floatingView](self, "floatingView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 contentView]);
  [v19 bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView trailingImageView](self, "trailingImageView"));
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView traitCollection](self, "traitCollection"));
    id v30 = [v29 layoutDirection];

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView trailingImageView](self, "trailingImageView"));
    [v31 intrinsicContentSize];
    double v33 = v32;
    double v35 = v34;

    double v37 = 15.0;
    if (v30 != (id)1)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView floatingView](self, "floatingView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 contentView]);
      [v39 bounds];
      double v37 = CGRectGetWidth(v74) + -30.0;
    }

    double v40 = UIRectCenteredYInRect(v36, v37, y, v33, v35, v21, v23, v25, v27);
    double v42 = v41;
    double v44 = v43;
    double v71 = y;
    double v45 = v27;
    double v46 = v25;
    double v47 = v23;
    double v48 = v21;
    double v50 = v49;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView trailingImageView](self, "trailingImageView"));
    double v52 = v50;
    double v21 = v48;
    double v23 = v47;
    double v25 = v46;
    double v27 = v45;
    double y = v71;
    objc_msgSend(v51, "setFrame:", v40, v42, v44, v52);
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView textLabel](self, "textLabel"));
  [v53 intrinsicContentSize];
  double v55 = v54;

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView floatingView](self, "floatingView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 contentView]);
  [v57 bounds];
  double v58 = CGRectGetWidth(v75);

  double v59 = v58 + -60.0;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView trailingImageView](self, "trailingImageView"));

  if (v60)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView trailingImageView](self, "trailingImageView"));
    [v62 frame];
    double v59 = v59 + (CGRectGetWidth(v76) + 15.0) * -2.0;
  }

  double v63 = UIRectCenteredIntegralRect(v61, CGPointZero.x, y, v59, v55, v21, v23, v25, v27);
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView textLabel](self, "textLabel"));
  objc_msgSend(v70, "setFrame:", v63, v65, v67, v69);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____TVMusicAddToPlaylistActionView;
  return UIAccessibilityTraitButton | -[_TVMusicAddToPlaylistActionView accessibilityTraits](&v3, "accessibilityTraits");
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView textLabel](self, "textLabel"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____TVMusicAddToPlaylistActionView;
  -[_TVMusicAddToPlaylistActionView systemLayoutSizeFittingSize:]( &v5,  "systemLayoutSizeFittingSize:",  a3.width,  a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView textLabel](self, "textLabel"));
  [v3 intrinsicContentSize];
  double v5 = v4;

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView trailingImageView](self, "trailingImageView"));
  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView trailingImageView](self, "trailingImageView"));
    [v7 intrinsicContentSize];
    double v9 = v8 + 15.0;
  }

  else
  {
    double v9 = 0.0;
  }

  double v10 = 80.0;
  double v11 = v5 + 60.0 + v9 * 2.0;
  result.height = v10;
  result.width = v11;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____TVMusicAddToPlaylistActionView;
  id v6 = a4;
  id v7 = a3;
  -[_TVMusicAddToPlaylistActionView didUpdateFocusInContext:withAnimationCoordinator:]( &v16,  "didUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nextFocusedView]);

  LODWORD(v7) = [v8 isDescendantOfView:self];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100085008;
  v14[3] = &unk_100268F28;
  v14[4] = self;
  char v15 = (char)v7;
  [v6 addCoordinatedAnimations:v14 completion:&stru_10026BE70];
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView floatingView](self, "floatingView"));
  unint64_t v10 = (unint64_t)[v9 controlState];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView floatingView](self, "floatingView"));
  double v12 = v11;
  uint64_t v13 = 8LL;
  if (!(_DWORD)v7) {
    uint64_t v13 = 0LL;
  }
  [v11 setControlState:v10 & 0xFFFFFFFFFFFFFFF7 | v13 withAnimationCoordinator:v6];
}

- (void)_handleSelectPress:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView floatingView](self, "floatingView"));
  unint64_t v6 = (unint64_t)[v5 controlState];

  id v7 = (char *)[v4 state];
  if ((unint64_t)(v7 - 4) < 2)
  {
LABEL_8:
    v6 &= ~1uLL;
    goto LABEL_9;
  }

  if (v7 == (char *)3)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView actionHandler](self, "actionHandler"));

    if (v8)
    {
      double v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[_TVMusicAddToPlaylistActionView actionHandler](self, "actionHandler"));
      v9[2]();
    }

    goto LABEL_8;
  }

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UIImageView)trailingImageView
{
  return self->_trailingImageView;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
}

@end
@interface SCATModernMenuPageControl
- (BOOL)scatIndicatesOwnFocus;
- (SCATModernMenuPageControl)initWithFrame:(CGRect)a3;
- (double)_highlightViewWidth;
- (int64_t)semanticContentAttribute;
- (void)didUpdateScatMenuItemStyle;
- (void)layoutSubviews;
@end

@implementation SCATModernMenuPageControl

- (SCATModernMenuPageControl)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SCATModernMenuPageControl;
  v3 = -[SCATModernMenuPageControl initWithFrame:]( &v20,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SCATModernMenuPageControl setAllowsContinuousInteraction:](v3, "setAllowsContinuousInteraction:", 0LL);
    v5 = -[SCATModernPageControlHighlightView initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATModernPageControlHighlightView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    highlightView = v4->_highlightView;
    v4->_highlightView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[SCATModernPageControlHighlightView setBackgroundColor:](v4->_highlightView, "setBackgroundColor:", v7);

    -[SCATModernPageControlHighlightView setClipsToBounds:](v4->_highlightView, "setClipsToBounds:", 0LL);
    -[SCATModernMenuPageControl setClipsToBounds:](v4, "setClipsToBounds:", 0LL);
    -[SCATModernMenuPageControl addSubview:](v4, "addSubview:", v4->_highlightView);
    -[SCATModernPageControlHighlightView setAlpha:](v4->_highlightView, "setAlpha:", 0.0);
    -[SCATModernPageControlHighlightView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_highlightView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernPageControlHighlightView centerXAnchor](v4->_highlightView, "centerXAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuPageControl centerXAnchor](v4, "centerXAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
    [v10 setActive:1];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernPageControlHighlightView centerYAnchor](v4->_highlightView, "centerYAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuPageControl centerYAnchor](v4, "centerYAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
    [v13 setActive:1];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernPageControlHighlightView heightAnchor](v4->_highlightView, "heightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToConstant:15.0]);
    [v15 setActive:1];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernPageControlHighlightView widthAnchor](v4->_highlightView, "widthAnchor"));
    -[SCATModernMenuPageControl _highlightViewWidth](v4, "_highlightViewWidth");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:"));
    -[SCATModernPageControlHighlightView setWidthConstraint:](v4->_highlightView, "setWidthConstraint:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernPageControlHighlightView widthConstraint](v4->_highlightView, "widthConstraint"));
    [v18 setActive:1];

    -[SCATModernMenuPageControl didUpdateScatMenuItemStyle](v4, "didUpdateScatMenuItemStyle");
  }

  return v4;
}

- (double)_highlightViewWidth
{
  return v2 + 8.0;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernMenuPageControl;
  -[SCATModernMenuPageControl layoutSubviews](&v6, "layoutSubviews");
  -[SCATModernMenuPageControl _highlightViewWidth](self, "_highlightViewWidth");
  double v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernPageControlHighlightView widthConstraint](self->_highlightView, "widthConstraint"));
  [v5 setConstant:v4];

  -[SCATModernPageControlHighlightView layoutIfNeeded](self->_highlightView, "layoutIfNeeded");
}

- (void)didUpdateScatMenuItemStyle
{
  switch((unint64_t)-[SCATModernMenuPageControl scatMenuItemStyle](self, "scatMenuItemStyle"))
  {
    case 0uLL:
    case 4uLL:
      highlightView = self->_highlightView;
      double v4 = 0.0;
      goto LABEL_5;
    case 1uLL:
    case 3uLL:
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v7 menuKnockoutColor]);
      -[SCATModernMenuPageControl setPageIndicatorTintColor:](self, "setPageIndicatorTintColor:", v5);

      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v7 menuKnockoutColor]);
      -[SCATModernMenuPageControl setCurrentPageIndicatorTintColor:](self, "setCurrentPageIndicatorTintColor:", v6);

      -[SCATModernMenuPageControl _setDrawsAsBackdropOverlayWithBlendMode:]( self,  "_setDrawsAsBackdropOverlayWithBlendMode:",  [v7 menuKnockoutBorderOverlayBlendMode]);
      [v7 menuKnockoutBorderOpacity];
      -[SCATModernMenuPageControl setAlpha:](self, "setAlpha:");
      -[SCATModernPageControlHighlightView setAlpha:](self->_highlightView, "setAlpha:", 0.0);

      break;
    case 2uLL:
      highlightView = self->_highlightView;
      double v4 = 1.0;
LABEL_5:
      -[SCATModernPageControlHighlightView setAlpha:](highlightView, "setAlpha:", v4);
      -[SCATModernMenuPageControl setPageIndicatorTintColor:](self, "setPageIndicatorTintColor:", 0LL);
      -[SCATModernMenuPageControl setCurrentPageIndicatorTintColor:](self, "setCurrentPageIndicatorTintColor:", 0LL);
      -[SCATModernMenuPageControl _setDrawsAsBackdropOverlayWithBlendMode:]( self,  "_setDrawsAsBackdropOverlayWithBlendMode:",  0LL);
      break;
    default:
      return;
  }

- (int64_t)semanticContentAttribute
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  else {
    int64_t v3 = 3LL;
  }

  return v3;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
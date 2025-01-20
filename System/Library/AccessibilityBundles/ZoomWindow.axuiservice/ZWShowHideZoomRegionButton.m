@interface ZWShowHideZoomRegionButton
- (UIView)buttonView;
- (UIView)zoomRegionRect;
- (ZWShowHideZoomRegionButton)init;
- (void)makeHorizontal;
- (void)makeVertical;
- (void)setButtonView:(id)a3;
- (void)setZoomRegionRect:(id)a3;
@end

@implementation ZWShowHideZoomRegionButton

- (ZWShowHideZoomRegionButton)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ZWShowHideZoomRegionButton;
  v2 = -[ZWShowHideZoomRegionButton init](&v16, "init");
  v3 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 0.0, 0.0, 48.0, 15.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3, "layer"));
  [v4 setCornerRadius:7.5];

  id v5 = ZWLensInnerColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v6);

  double v7 = ZWLensOuterBorderWidth();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3, "layer"));
  [v8 setBorderWidth:v7];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3, "layer"));
  [v10 setCompositingFilter:v9];

  -[ZWShowHideZoomRegionButton setButtonView:](v2, "setButtonView:", v3);
  -[ZWShowHideZoomRegionButton addSubview:](v2, "addSubview:", v3);
  id v11 = ZWLocString(@"ZW_ZOOM_REGION_BUTTON_LABEL");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[ZWShowHideZoomRegionButton setAccessibilityLabel:](v2, "setAccessibilityLabel:", v12);

  id v13 = ZWLocString(@"ZW_ZOOM_REGION_BUTTON_HINT");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[ZWShowHideZoomRegionButton setAccessibilityHint:](v2, "setAccessibilityHint:", v14);

  return v2;
}

- (void)makeVertical
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWShowHideZoomRegionButton buttonView](self, "buttonView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWShowHideZoomRegionButton buttonView](self, "buttonView"));
  objc_msgSend(v8, "setBounds:", v5, v7, 15.0, 48.0);
}

- (void)makeHorizontal
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWShowHideZoomRegionButton buttonView](self, "buttonView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWShowHideZoomRegionButton buttonView](self, "buttonView"));
  objc_msgSend(v8, "setBounds:", v5, v7, 48.0, 15.0);
}

- (UIView)zoomRegionRect
{
  return self->_zoomRegionRect;
}

- (void)setZoomRegionRect:(id)a3
{
}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
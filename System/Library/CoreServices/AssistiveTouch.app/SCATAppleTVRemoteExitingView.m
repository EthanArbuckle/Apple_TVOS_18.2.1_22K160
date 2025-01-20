@interface SCATAppleTVRemoteExitingView
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)updateFocusState:(int64_t)a3;
- (CALayer)borderLayer;
- (SCATAppleTVRemoteExitingView)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (id)activateActionHandler;
- (void)layoutSubviews;
- (void)setActivateActionHandler:(id)a3;
- (void)setBorderLayer:(id)a3;
@end

@implementation SCATAppleTVRemoteExitingView

- (SCATAppleTVRemoteExitingView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteExitingView;
  v3 = -[SCATCustomFocusingView initWithFrame:]( &v12,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v4 = v3;
  if (v3)
  {
    -[SCATAppleTVRemoteExitingView setTranslatesAutoresizingMaskIntoConstraints:]( v3,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    *(void *)&double v7 = objc_opt_class(v4, v6).n128_u64[0];
    objc_msgSend(v8, "roundedRectCornerRadius", v7);
    [v5 setCornerRadius:v9 + 5.0];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView layer](v4, "layer"));
    [v10 addSublayer:v5];

    -[SCATAppleTVRemoteExitingView setBorderLayer:](v4, "setBorderLayer:", v5);
  }

  return v4;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteExitingView;
  -[SCATAppleTVRemoteExitingView layoutSubviews](&v8, "layoutSubviews");
  -[SCATAppleTVRemoteExitingView bounds](self, "bounds");
  CGRect v10 = CGRectInset(v9, -5.0, -5.0);
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView borderLayer](self, "borderLayer"));
  objc_msgSend(v7, "setFrame:", x, y, width, height);
}

- (BOOL)updateFocusState:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteExitingView;
  BOOL v5 = -[SCATCustomFocusingView updateFocusState:](&v18, "updateFocusState:");
  if (v5)
  {
    if (!a3 || a3 == 2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView borderLayer](self, "borderLayer"));
      [v13 setBorderWidth:0.0];

      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
LABEL_9:
      id v14 = v12;
      id v15 = [v14 CGColor];
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView borderLayer](self, "borderLayer"));
      [v16 setBorderColor:v15];

      return v5;
    }

    if (a3 == 1)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView borderLayer](self, "borderLayer"));
      [v6 setBorderWidth:5.0];

      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned int v8 = [v7 assistiveTouchGroupElementsEnabled];

      *(void *)&double v11 = objc_opt_class(self, v9).n128_u64[0];
      if (v8) {
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "focusedGroupStateColor", v11));
      }
      else {
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "focusedStateColor", v11));
      }
      goto LABEL_9;
    }
  }

  return v5;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (BOOL)scatPerformAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView activateActionHandler](self, "activateActionHandler"));

  if (v5)
  {
    uint64_t v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView activateActionHandler](self, "activateActionHandler"));
    v6[2]();

    return 1;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteExitingView;
    return -[SCATAppleTVRemoteExitingView scatPerformAction:](&v8, "scatPerformAction:", v3);
  }

- (id)accessibilityLabel
{
  return sub_10002B014(@"Remote-Exit");
}

- (id)activateActionHandler
{
  return self->_activateActionHandler;
}

- (void)setActivateActionHandler:(id)a3
{
}

- (CALayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
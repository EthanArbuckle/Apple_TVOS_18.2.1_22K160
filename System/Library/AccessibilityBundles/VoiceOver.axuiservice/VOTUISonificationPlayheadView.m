@interface VOTUISonificationPlayheadView
- (BOOL)largeCursorEnabled;
- (VOTUISonificationPlayheadView)initWithFrame:(CGRect)a3;
- (double)lineWidth;
- (void)layoutSubviews;
- (void)updateStyling;
@end

@implementation VOTUISonificationPlayheadView

- (VOTUISonificationPlayheadView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VOTUISonificationPlayheadView;
  v3 = -[VOTUISonificationPlayheadView initWithFrame:]( &v14,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VOTUISonificationPlayheadView setClipsToBounds:](v3, "setClipsToBounds:", 1LL);
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x3032000000LL;
    v12[3] = sub_73B4;
    v12[4] = sub_73C4;
    v5 = v4;
    v13 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_73CC;
    v11[3] = &unk_24758;
    v11[4] = v12;
    [v6 registerUpdateBlock:v11 forRetrieveSelector:"voiceOverLargeCursorEnabled" withListener:v5];

    -[VOTUISonificationPlayheadView updateStyling](v5, "updateStyling");
    -[VOTUISonificationPlayheadView setAlpha:](v5, "setAlpha:", 0.8);
    v15[0] = objc_opt_class(&OBJC_CLASS___UITraitPreferredContentSizeCategory);
    v15[1] = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_73DC;
    v10[3] = &unk_24780;
    v10[4] = v12;
    id v8 =  -[VOTUISonificationPlayheadView registerForTraitChanges:withHandler:]( v5,  "registerForTraitChanges:withHandler:",  v7,  v10);

    _Block_object_dispose(v12, 8);
  }

  return v4;
}

- (double)lineWidth
{
  unsigned int v2 = -[VOTUISonificationPlayheadView largeCursorEnabled](self, "largeCursorEnabled");
  double result = 4.0;
  if (v2) {
    return 8.0;
  }
  return result;
}

- (BOOL)largeCursorEnabled
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 voiceOverLargeCursorEnabled];

  return 1;
}

- (void)updateStyling
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationPlayheadView traitCollection](self, "traitCollection"));
  v4 = (char *)[v3 userInterfaceStyle];

  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  }

  v7 = (void *)v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationPlayheadView layer](self, "layer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sublayers]);
  id v10 = [v9 count];

  if ((unint64_t)v10 <= 1)
  {
    do
    {
      v11 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationPlayheadView layer](self, "layer"));
      [v12 addSublayer:v11];

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationPlayheadView layer](self, "layer"));
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sublayers]);
      id v15 = [v14 count];
    }

    while ((unint64_t)v15 < 2);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationPlayheadView layer](self, "layer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sublayers]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:1]);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationPlayheadView layer](self, "layer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sublayers]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:0]);

  -[VOTUISonificationPlayheadView lineWidth](self, "lineWidth");
  [v18 setCornerRadius:v22 * 0.5];
  id v25 = v5;
  objc_msgSend(v18, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));
  -[VOTUISonificationPlayheadView lineWidth](self, "lineWidth");
  [v21 setCornerRadius:v23 * 0.5];
  id v24 = v7;
  objc_msgSend(v21, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTUISonificationPlayheadView;
  -[VOTUISonificationPlayheadView layoutSubviews](&v11, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationPlayheadView layer](self, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sublayers]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationPlayheadView layer](self, "layer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sublayers]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);

  -[VOTUISonificationPlayheadView lineWidth](self, "lineWidth");
  CGFloat v10 = v9 * 0.25;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setValue:forKey:]( &OBJC_CLASS___CATransaction,  "setValue:forKey:",  kCFBooleanTrue,  kCATransactionDisableActions);
  -[VOTUISonificationPlayheadView bounds](self, "bounds");
  CGRect v13 = CGRectInset(v12, v10, v10);
  objc_msgSend(v5, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  -[VOTUISonificationPlayheadView bounds](self, "bounds");
  objc_msgSend(v8, "setFrame:");
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

@end
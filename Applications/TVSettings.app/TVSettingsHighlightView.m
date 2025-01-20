@interface TVSettingsHighlightView
- (TVSettingsHighlightView)initWithFrame:(CGRect)a3;
- (double)highlightProgress;
- (void)_setHighlightProgress:(double)a3;
- (void)setHighlightProgress:(double)a3;
@end

@implementation TVSettingsHighlightView

- (TVSettingsHighlightView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsHighlightView;
  v3 = -[TVSettingsHighlightView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    if (qword_1001E1B80 != -1) {
      dispatch_once(&qword_1001E1B80, &stru_100193E18);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 traitCollection]);
    id v6 = [v5 userInterfaceStyle];

    BOOL v7 = v6 == (id)2 || v6 == (id)1000;
    v8 = &qword_1001E1B78;
    if (!v7) {
      v8 = &qword_1001E1B70;
    }
    -[TVSettingsHighlightView setBackgroundColor:](v3, "setBackgroundColor:", *v8);
    -[TVSettingsHighlightView highlightProgress](v3, "highlightProgress");
    -[TVSettingsHighlightView _setHighlightProgress:](v3, "_setHighlightProgress:");
  }

  return v3;
}

- (void)setHighlightProgress:(double)a3
{
  if (v5 != a3) {
    -[TVSettingsHighlightView _setHighlightProgress:](self, "_setHighlightProgress:", a3);
  }
}

- (void)_setHighlightProgress:(double)a3
{
  double v6 = v5;
  -[TVSettingsHighlightView highlightProgress](self, "highlightProgress");
  double v8 = v7;
  -[TVSettingsHighlightView primaryHighlightAlphaForHighlightProgress:]( self,  "primaryHighlightAlphaForHighlightProgress:",  a3);
  if (!self->_isAnimating)
  {
    double v10 = vabdd_f64(v6, v8);
    if (v6 > 0.5 != v8 > 0.5 && v10 < 1.0)
    {
      v12[4] = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000C3044;
      v13[3] = &unk_10018EE18;
      v13[4] = self;
      v13[5] = v9;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000C3068;
      v12[3] = &unk_10018EC08;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v13,  v12,  0.1,  0.0);
    }

    else
    {
      -[TVSettingsHighlightView setAlpha:](self, "setAlpha:");
    }
  }

- (double)highlightProgress
{
  return self->_highlightProgress;
}

@end
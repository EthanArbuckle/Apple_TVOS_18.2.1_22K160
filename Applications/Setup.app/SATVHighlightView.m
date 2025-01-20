@interface SATVHighlightView
- (SATVHighlightView)initWithFrame:(CGRect)a3;
- (void)_setHighlightProgress:(double)a3;
- (void)setHighlightProgress:(double)a3;
@end

@implementation SATVHighlightView

- (SATVHighlightView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVHighlightView;
  v3 = -[SATVHighlightView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.501960784,  0.482352941,  0.501960784,  0.1));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvsk_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v5));
    -[SATVHighlightView setBackgroundColor:](v3, "setBackgroundColor:", v6);
    -[SATVHighlightView highlightProgress](v3, "highlightProgress");
    -[SATVHighlightView _setHighlightProgress:](v3, "_setHighlightProgress:");
  }

  return v3;
}

- (void)setHighlightProgress:(double)a3
{
  if (v5 != a3) {
    -[SATVHighlightView _setHighlightProgress:](self, "_setHighlightProgress:", a3);
  }
}

- (void)_setHighlightProgress:(double)a3
{
  double v6 = v5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SATVHighlightView;
  -[SATVHighlightView setHighlightProgress:](&v14, "setHighlightProgress:", a3);
  -[SATVHighlightView highlightProgress](self, "highlightProgress");
  double v8 = v7;
  -[SATVHighlightView primaryHighlightAlphaForHighlightProgress:]( self,  "primaryHighlightAlphaForHighlightProgress:",  a3);
  if (!self->_isAnimating)
  {
    double v10 = vabdd_f64(v6, v8);
    if (v6 > 0.5 != v8 > 0.5 && v10 < 1.0)
    {
      v12[4] = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10006A6F4;
      v13[3] = &unk_1000C94F8;
      v13[4] = self;
      v13[5] = v9;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10006A718;
      v12[3] = &unk_1000C9490;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v13,  v12,  0.1,  0.0);
    }

    else
    {
      -[SATVHighlightView setAlpha:](self, "setAlpha:");
    }
  }

@end
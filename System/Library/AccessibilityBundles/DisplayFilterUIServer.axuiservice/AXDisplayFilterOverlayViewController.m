@interface AXDisplayFilterOverlayViewController
- (AXDisplayFilterOverlayView)_filterView;
- (BOOL)_canShowWhileLocked;
- (NSArray)filters;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyInitialLayoutConstraints;
- (void)fadeToBlackAndComeBack:(double)a3 completion:(id)a4;
- (void)loadView;
- (void)setFilters:(id)a3;
- (void)set_filterView:(id)a3;
@end

@implementation AXDisplayFilterOverlayViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2LL;
}

- (void)fadeToBlackAndComeBack:(double)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_554C;
  v8[3] = &unk_8220;
  v8[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5580;
  v5[3] = &unk_8298;
  double v7 = a3;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v8,  v5,  v7 * 0.25);
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[UIView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[AXDisplayFilterOverlayViewController setView:](self, "setView:", v9);
  double v7 = -[AXDisplayFilterOverlayView initWithFrame:]( objc_alloc(&OBJC_CLASS___AXDisplayFilterOverlayView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[AXDisplayFilterOverlayView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  1LL);
  -[AXDisplayFilterOverlayView setAutoresizingMask:](v7, "setAutoresizingMask:", 18LL);
  -[AXDisplayFilterOverlayView setAlpha:](v7, "setAlpha:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.5,  0.5,  0.5,  1.0));
  -[AXDisplayFilterOverlayView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[AXDisplayFilterOverlayViewController set_filterView:](self, "set_filterView:", v7);
  -[UIView addSubview:](v9, "addSubview:", v7);
  -[AXDisplayFilterOverlayViewController _applyInitialLayoutConstraints](self, "_applyInitialLayoutConstraints");
}

- (void)_applyInitialLayoutConstraints
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayViewController _filterView](self, "_filterView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  1LL,  0LL,  v8,  1LL,  1.0,  0.0));
  [v8 addConstraint:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  2LL,  0LL,  v8,  2LL,  1.0,  0.0));
  [v8 addConstraint:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  3LL,  0LL,  v8,  3LL,  1.0,  0.0));
  [v8 addConstraint:v6];

  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  4LL,  0LL,  v8,  4LL,  1.0,  0.0));
  [v8 addConstraint:v7];
}

- (NSArray)filters
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayViewController _filterView](self, "_filterView"));

  if (!v3) {
    id v4 = -[AXDisplayFilterOverlayViewController view](self, "view");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayViewController _filterView](self, "_filterView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 filters]);

  return (NSArray *)v6;
}

- (void)setFilters:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayViewController _filterView](self, "_filterView"));

  if (!v5) {
    id v6 = -[AXDisplayFilterOverlayViewController view](self, "view");
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayViewController _filterView](self, "_filterView"));
  [v7 setFilters:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXDisplayFilterOverlayView)_filterView
{
  return self->__filterView;
}

- (void)set_filterView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
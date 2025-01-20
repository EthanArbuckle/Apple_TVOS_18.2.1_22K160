@interface _PBHotBlackSpinnerViewController
- (void)viewDidLoad;
@end

@implementation _PBHotBlackSpinnerViewController

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____PBHotBlackSpinnerViewController;
  -[_PBHotBlackViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  100LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_PBHotBlackSpinnerViewController view](self, "view"));
  [v4 addSubview:v3];

  +[UIActivityIndicatorView defaultSizeForStyle:](&OBJC_CLASS___UIActivityIndicatorView, "defaultSizeForStyle:", 100LL);
  double v6 = v5;
  double v8 = v7;
  double y = CGPointZero.y;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_PBHotBlackSpinnerViewController view](self, "view"));
  id v11 = [v10 bounds];
  double v16 = UIRectCenteredIntegralRect(v11, CGPointZero.x, y, v6, v8, v12, v13, v14, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  -[UIActivityIndicatorView setFrame:](v3, "setFrame:", v16, v18, v20, v22);
  -[UIActivityIndicatorView startAnimating](v3, "startAnimating");
}

@end
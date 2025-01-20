@interface TVSSCAPackageContentView
- (CGSize)intrinsicContentSize;
- (TVSSVisualContent)content;
- (void)_startAnimating;
- (void)_stopAnimating;
- (void)didMoveToWindow;
- (void)setContent:(id)a3;
@end

@implementation TVSSCAPackageContentView

- (void)didMoveToWindow
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSCAPackageContentView;
  -[TVSSCAPackageContentView didMoveToWindow](&v3, "didMoveToWindow");
  id v2 = -[TVSSCAPackageContentView window](v5, "window");

  if (v2) {
    -[TVSSCAPackageContentView _startAnimating](v5, "_startAnimating");
  }
  else {
    -[TVSSCAPackageContentView _stopAnimating](v5, "_stopAnimating");
  }
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContent:(id)a3
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v33->_content != location[0])
  {
    id v25 = location[0];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSCAPackageContent);
    if ((objc_opt_isKindOfClass(v25, v3) & 1) != 0)
    {
      objc_storeStrong((id *)&v33->_content, location[0]);
      -[_UICAPackageView removeFromSuperview](v33->_packageView, "removeFromSuperview");
      id v24 = -[TVSSCAPackageContentView traitCollection](v33, "traitCollection");
      char v29 = 0;
      char v27 = 0;
      if ([v24 userInterfaceStyle] == (id)2)
      {
        id v30 = [location[0] darkPackageName];
        char v29 = 1;
        id v4 = v30;
      }

      else
      {
        id v28 = [location[0] lightPackageName];
        char v27 = 1;
        id v4 = v28;
      }

      id v31 = v4;
      if ((v27 & 1) != 0) {

      }
      if ((v29 & 1) != 0) {
      v12 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      }
      v26 = -[NSBundle URLForResource:withExtension:](v12, "URLForResource:withExtension:", v31, @"caar");

      v5 = objc_alloc(&OBJC_CLASS____UICAPackageView);
      v6 = -[_UICAPackageView initWithContentsOfURL:publishedObjectViewClassMap:]( v5,  "initWithContentsOfURL:publishedObjectViewClassMap:",  v26);
      packageView = v33->_packageView;
      v33->_packageView = v6;

      -[_UICAPackageView setContentMode:](v33->_packageView, "setContentMode:");
      -[_UICAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v33->_packageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      -[TVSSCAPackageContentView addSubview:](v33, "addSubview:", v33->_packageView);
      id v23 = -[_UICAPackageView centerXAnchor](v33->_packageView, "centerXAnchor");
      id v22 = -[TVSSCAPackageContentView centerXAnchor](v33, "centerXAnchor");
      [location[0] contentOffset];
      id v21 = [v23 constraintEqualToAnchor:v22 constant:v8];
      v34[0] = v21;
      id v20 = -[_UICAPackageView centerYAnchor](v33->_packageView, "centerYAnchor");
      id v19 = -[TVSSCAPackageContentView centerYAnchor](v33, "centerYAnchor");
      [location[0] contentOffset];
      id v18 = [v20 constraintEqualToAnchor:v19 constant:v9];
      v34[1] = v18;
      id v17 = -[_UICAPackageView widthAnchor](v33->_packageView, "widthAnchor");
      [location[0] size];
      id v16 = [v17 constraintEqualToConstant:v10];
      v34[2] = v16;
      id v15 = -[_UICAPackageView heightAnchor](v33->_packageView, "heightAnchor");
      [location[0] size];
      id v14 = [v15 constraintEqualToConstant:v11];
      v34[3] = v14;
      v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 4LL);
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

      objc_storeStrong((id *)&v26, 0LL);
      objc_storeStrong(&v31, 0LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)_startAnimating
{
  id v16 = self;
  location[1] = (id)a2;
  double v7 = CACurrentMediaTime();
  id v8 = -[_UICAPackageView layer](v16->_packageView, "layer");
  [v8 setBeginTime:v7];

  -[NSTimer invalidate](v16->_repeatTimer, "invalidate");
  -[TVSSCAPackageContent repeatInterval](v16->_content, "repeatInterval");
  if (v2 > 0.0)
  {
    objc_initWeak(location, v16);
    -[TVSSCAPackageContent repeatInterval](v16->_content, "repeatInterval");
    double v6 = v3;
    double v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_1000F7244;
    v13 = &unk_1001B5AB0;
    objc_copyWeak(&v14, location);
    id v4 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v9,  v6);
    repeatTimer = v16->_repeatTimer;
    v16->_repeatTimer = v4;

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }

- (void)_stopAnimating
{
}

- (TVSSVisualContent)content
{
  return (TVSSVisualContent *)self->_content;
}

- (void).cxx_destruct
{
}

@end
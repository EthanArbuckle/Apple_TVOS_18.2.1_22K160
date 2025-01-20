@interface _TVSSFocusSinkView
- (BOOL)canBecomeFocused;
- (_TVSSFocusSinkView)initWithFrame:(CGRect)a3;
- (void)_updateBorderColor;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation _TVSSFocusSinkView

- (_TVSSFocusSinkView)initWithFrame:(CGRect)a3
{
  CGRect v14 = a3;
  SEL v12 = a2;
  v13 = 0LL;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____TVSSFocusSinkView;
  v13 = -[_TVSSFocusSinkView initWithFrame:]( &v11,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    double v10 = 1.0;
    if ((TVSSDebugGuideLinesEnabled() & 1) != 0) {
      double v10 = 10.0;
    }
    id v9 = -[_TVSSFocusSinkView widthAnchor](v13, "widthAnchor");
    id v8 = [v9 constraintEqualToConstant:v10];
    v15[0] = v8;
    id v7 = -[_TVSSFocusSinkView heightAnchor](v13, "heightAnchor");
    id v6 = [v7 constraintEqualToConstant:v10];
    v15[1] = v6;
    v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[_TVSSFocusSinkView _updateBorderColor](v13, "_updateBorderColor");
  }

  v4 = v13;
  objc_storeStrong((id *)&v13, 0LL);
  return v4;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_CLASS____TVSSFocusSinkView;
  -[_TVSSFocusSinkView didUpdateFocusInContext:withAnimationCoordinator:]( &v5,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v6);
  -[_TVSSFocusSinkView _updateBorderColor](v8, "_updateBorderColor");
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateBorderColor
{
  id v7 = self;
  v6[1] = a2;
  if ((TVSSDebugGuideLinesEnabled() & 1) != 0)
  {
    char v4 = 0;
    if ((-[_TVSSFocusSinkView isFocused](v7, "isFocused") & 1) != 0)
    {
      objc_super v5 = +[UIColor magentaColor](&OBJC_CLASS___UIColor, "magentaColor");
      char v4 = 1;
      v2 = v5;
    }

    else
    {
      v2 = (UIColor *)0LL;
    }

    v6[0] = v2;
    if ((v4 & 1) != 0) {

    }
    -[_TVSSFocusSinkView setBackgroundColor:](v7, "setBackgroundColor:", v6[0], v6);
    objc_storeStrong(location, 0LL);
  }

@end
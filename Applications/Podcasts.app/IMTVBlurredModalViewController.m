@interface IMTVBlurredModalViewController
- (IMTVBlurredModalViewController)init;
- (IMTVBlurredModalViewController)initWithBlurEffectStyle:(int64_t)a3;
- (IMTVBlurredModalViewController)initWithCoder:(id)a3;
- (IMTVBlurredModalViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIVisualEffectView)blurredBackground;
- (int64_t)blurEffectStyle;
- (void)loadView;
- (void)setBlurEffectStyle:(int64_t)a3;
- (void)setBlurredBackground:(id)a3;
@end

@implementation IMTVBlurredModalViewController

- (IMTVBlurredModalViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IMTVBlurredModalViewController;
  v2 = -[IMTVBlurredModalViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0LL, 0LL);
  v3 = v2;
  if (v2)
  {
    -[IMTVBlurredModalViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 5LL);
    v3->_blurEffectStyle = 4005LL;
  }

  return v3;
}

- (IMTVBlurredModalViewController)initWithBlurEffectStyle:(int64_t)a3
{
  result = -[IMTVBlurredModalViewController init](self, "init");
  if (result) {
    result->_blurEffectStyle = a3;
  }
  return result;
}

- (IMTVBlurredModalViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  objc_exception_throw(0LL);
  return -[IMTVBlurredModalViewController initWithNibName:bundle:](v4, v5, v6, v7);
}

- (IMTVBlurredModalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw(0LL);
  -[IMTVBlurredModalViewController loadView](v7, v8);
  return result;
}

- (void)loadView
{
  id v3 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[IMTVBlurredModalViewController setView:](self, "setView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVBlurredModalViewController view](self, "view"));
  [v5 setBackgroundColor:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVBlurredModalViewController view](self, "view"));
  [v6 setOpaque:0];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IMTVBlurredModalViewController view](self, "view"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVBlurredModalViewController blurredBackground](self, "blurredBackground"));
  [v8 addSubview:v7];
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  if (self->_blurEffectStyle != a3)
  {
    self->_blurEffectStyle = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVBlurredModalViewController blurredBackground](self, "blurredBackground"));
    [v4 setEffect:v5];
  }

- (UIVisualEffectView)blurredBackground
{
  blurredBackground = self->_blurredBackground;
  if (!blurredBackground)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIBlurEffect effectWithStyle:]( &OBJC_CLASS___UIBlurEffect,  "effectWithStyle:",  -[IMTVBlurredModalViewController blurEffectStyle](self, "blurEffectStyle")));
    id v5 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v4);
    id v6 = self->_blurredBackground;
    self->_blurredBackground = v5;

    -[UIVisualEffectView setAutoresizingMask:](self->_blurredBackground, "setAutoresizingMask:", 18LL);
    blurredBackground = self->_blurredBackground;
  }

  return blurredBackground;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setBlurredBackground:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
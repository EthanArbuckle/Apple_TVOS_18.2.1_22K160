@interface TVHImageDeckViewController
- (NSArray)imageProxies;
- (NSDirectionalEdgeInsets)crossFadeImageViewMargin;
- (TVHImageDeckView)imageDeckView;
- (TVHImageDeckViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)setCrossFadeImageViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setImageDeckView:(id)a3;
- (void)setImageProxies:(id)a3;
@end

@implementation TVHImageDeckViewController

- (TVHImageDeckViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHImageDeckViewController;
  v4 = -[TVHImageDeckViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  if (v4)
  {
    v5 = -[TVHImageDeckView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHImageDeckView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    imageDeckView = v4->_imageDeckView;
    v4->_imageDeckView = v5;
  }

  return v4;
}

- (void)setImageProxies:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHImageDeckViewController imageDeckView](self, "imageDeckView"));
  [v5 setImageProxies:v4];
}

- (NSArray)imageProxies
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageDeckViewController imageDeckView](self, "imageDeckView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxies]);

  return (NSArray *)v3;
}

- (void)setCrossFadeImageViewMargin:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHImageDeckViewController imageDeckView](self, "imageDeckView"));
  objc_msgSend(v7, "setCrossFadeImageViewMargin:", top, leading, bottom, trailing);
}

- (NSDirectionalEdgeInsets)crossFadeImageViewMargin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageDeckViewController imageDeckView](self, "imageDeckView"));
  [v2 crossFadeImageViewMargin];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double trailing = v14;
  result.double bottom = v13;
  result.double leading = v12;
  result.double top = v11;
  return result;
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHImageDeckViewController imageDeckView](self, "imageDeckView"));
  -[TVHImageDeckViewController setView:](self, "setView:", v3);
}

- (TVHImageDeckView)imageDeckView
{
  return self->_imageDeckView;
}

- (void)setImageDeckView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
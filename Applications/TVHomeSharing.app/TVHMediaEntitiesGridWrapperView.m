@interface TVHMediaEntitiesGridWrapperView
+ (id)new;
- (BOOL)showsActivityIndicator;
- (TVHCollectionView)collectionView;
- (TVHLoadingView)loadingView;
- (TVHMediaEntitiesGridWrapperView)init;
- (TVHMediaEntitiesGridWrapperView)initWithCoder:(id)a3;
- (TVHMediaEntitiesGridWrapperView)initWithFrame:(CGRect)a3;
- (TVHMediaEntitiesGridWrapperView)initWithFrame:(CGRect)a3 collectionView:(id)a4;
- (id)preferredFocusEnvironments;
- (void)_addLoadingView;
- (void)_hideCollectionView;
- (void)_removeLoadingView;
- (void)_showCollectionView;
- (void)layoutSubviews;
- (void)setLoadingView:(id)a3;
- (void)setShowsActivityIndicator:(BOOL)a3;
@end

@implementation TVHMediaEntitiesGridWrapperView

+ (id)new
{
  return 0LL;
}

- (TVHMediaEntitiesGridWrapperView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesGridWrapperView)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntitiesGridWrapperView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntitiesGridWrapperView)initWithFrame:(CGRect)a3 collectionView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesGridWrapperView;
  v11 = -[TVHMediaEntitiesGridWrapperView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionView, a4);
    -[TVHMediaEntitiesGridWrapperView addSubview:](v12, "addSubview:", v12->_collectionView);
  }

  return v12;
}

- (void)setShowsActivityIndicator:(BOOL)a3
{
  if (self->_showsActivityIndicator != a3)
  {
    self->_showsActivityIndicator = a3;
    if (a3)
    {
      -[TVHMediaEntitiesGridWrapperView _removeLoadingView](self, "_removeLoadingView");
      -[TVHMediaEntitiesGridWrapperView _showCollectionView](self, "_showCollectionView");
    }

    else
    {
      -[TVHMediaEntitiesGridWrapperView _hideCollectionView](self, "_hideCollectionView");
      -[TVHMediaEntitiesGridWrapperView _addLoadingView](self, "_addLoadingView");
    }
  }

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesGridWrapperView;
  -[TVHMediaEntitiesGridWrapperView layoutSubviews](&v9, "layoutSubviews");
  -[TVHMediaEntitiesGridWrapperView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridWrapperView collectionView](self, "collectionView"));
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridWrapperView loadingView](self, "loadingView"));
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v6);
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridWrapperView collectionView](self, "collectionView"));
  double v5 = v2;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)_showCollectionView
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridWrapperView collectionView](self, "collectionView"));
  [v2 setHidden:0];
}

- (void)_hideCollectionView
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridWrapperView collectionView](self, "collectionView"));
  [v2 setHidden:1];
}

- (void)_addLoadingView
{
  double v3 = objc_alloc_init(&OBJC_CLASS___TVHLoadingView);
  -[TVHMediaEntitiesGridWrapperView setLoadingView:](self, "setLoadingView:", v3);
  -[TVHMediaEntitiesGridWrapperView addSubview:](self, "addSubview:", v3);
  -[TVHMediaEntitiesGridWrapperView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_removeLoadingView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridWrapperView loadingView](self, "loadingView"));
  -[TVHMediaEntitiesGridWrapperView setLoadingView:](self, "setLoadingView:", 0LL);
  [v3 removeFromSuperview];
  -[TVHMediaEntitiesGridWrapperView setNeedsLayout](self, "setNeedsLayout");
}

- (TVHCollectionView)collectionView
{
  return self->_collectionView;
}

- (BOOL)showsActivityIndicator
{
  return self->_showsActivityIndicator;
}

- (TVHLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
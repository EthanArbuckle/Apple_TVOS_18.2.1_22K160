@interface MTCollectionReusableView
- (BOOL)floating;
- (MTCollectionReusableView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (UIView)contentView;
- (void)configureSubviews;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setFloating:(BOOL)a3;
@end

@implementation MTCollectionReusableView

- (MTCollectionReusableView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTCollectionReusableView;
  v3 = -[MTCollectionReusableView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[MTCollectionReusableView configureSubviews](v3, "configureSubviews");
  }
  return v4;
}

- (void)setBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v8 = *p_backgroundView;
    -[MTCollectionReusableView bounds](self, "bounds");
    -[UIView setFrame:](v8, "setFrame:");
    -[MTCollectionReusableView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backgroundView, 0LL);
    v5 = v9;
  }
}

- (void)setFloating:(BOOL)a3
{
  if (self->_floating != a3)
  {
    self->_floating = a3;
    -[MTCollectionReusableView setOpaque:](self, "setOpaque:", !a3);
  }

- (void)configureSubviews
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  -[MTCollectionReusableView bounds](self, "bounds");
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v4;

  -[UIView setPreservesSuperviewLayoutMargins:](self->_contentView, "setPreservesSuperviewLayoutMargins:", 1LL);
  -[MTCollectionReusableView addSubview:](self, "addSubview:", self->_contentView);
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTCollectionReusableView;
  -[MTCollectionReusableView layoutSubviews](&v13, "layoutSubviews");
  -[MTCollectionReusableView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionReusableView backgroundView](self, "backgroundView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionReusableView contentView](self, "contentView"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)floating
{
  return self->_floating;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
}

@end
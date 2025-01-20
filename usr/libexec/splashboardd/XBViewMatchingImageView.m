@interface XBViewMatchingImageView
- (BOOL)bottom;
- (UIImageView)imageView;
- (UIView)matchingView;
- (XBViewMatchingImageView)initWithMatchingView:(id)a3 image:(id)a4 bottom:(BOOL)a5;
- (void)layoutSubviews;
- (void)setBottom:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setMatchingView:(id)a3;
@end

@implementation XBViewMatchingImageView

- (XBViewMatchingImageView)initWithMatchingView:(id)a3 image:(id)a4 bottom:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___XBViewMatchingImageView;
  v10 = -[XBViewMatchingImageView init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    -[XBViewMatchingImageView setMatchingView:](v10, "setMatchingView:", v8);
    if (v9)
    {
      v12 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v9);
      -[XBViewMatchingImageView setImageView:](v11, "setImageView:", v12);
    }

    -[XBViewMatchingImageView setBottom:](v11, "setBottom:", v5);
    if (v5) {
      uint64_t v13 = 10LL;
    }
    else {
      uint64_t v13 = 34LL;
    }
    [v8 setAutoresizingMask:v13];
    [v8 setHidden:v9 != 0];
    -[XBViewMatchingImageView addSubview:](v11, "addSubview:", v8);
    -[XBViewMatchingImageView addSubview:](v11, "addSubview:", v11->_imageView);
  }

  return v11;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___XBViewMatchingImageView;
  -[XBViewMatchingImageView layoutSubviews](&v25, "layoutSubviews");
  -[UIView sizeToFit](self->_matchingView, "sizeToFit");
  -[UIView frame](self->_matchingView, "frame");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL bottom = self->_bottom;
  id v12 = -[XBViewMatchingImageView safeAreaInsets](self, "safeAreaInsets");
  if (bottom)
  {
    double v15 = UIRectInset(v12, v4, v6, v8, v10, -v14, 0.0, 0.0, 0.0);
    double v17 = v16;
    double v19 = v18;
    -[XBViewMatchingImageView frame](self, "frame");
    double v21 = v20 - v19;
  }

  else
  {
    double v15 = UIRectInset(v12, v4, v6, v8, v10, 0.0, 0.0, -v13, 0.0);
    double v21 = v22;
    double v17 = v23;
    double v19 = v24;
  }

  -[UIView setFrame:](self->_matchingView, "setFrame:", v15, v21, v17, v19);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v15, v21, v17, v19);
}

- (UIView)matchingView
{
  return self->_matchingView;
}

- (void)setMatchingView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)bottom
{
  return self->_bottom;
}

- (void)setBottom:(BOOL)a3
{
  self->_BOOL bottom = a3;
}

- (void).cxx_destruct
{
}

@end
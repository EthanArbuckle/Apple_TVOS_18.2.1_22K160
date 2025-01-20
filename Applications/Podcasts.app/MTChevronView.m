@interface MTChevronView
+ (id)chevronImage;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTChevronView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (void)layoutSubviews;
- (void)setImageView:(id)a3;
@end

@implementation MTChevronView

+ (id)chevronImage
{
  if (qword_1002B6B20 != -1) {
    dispatch_once(&qword_1002B6B20, &stru_1002441B0);
  }
  return (id)qword_1002B6B18;
}

- (MTChevronView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTChevronView;
  v3 = -[MTChevronView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    id v5 = [(id)objc_opt_class(v3) chevronImage];
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v6);
    -[MTChevronView setImageView:](v4, "setImageView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](v4, "imageView"));
    [v8 sizeToFit];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](v4, "imageView"));
    -[MTChevronView addSubview:](v4, "addSubview:", v9);
  }

  return v4;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MTChevronView;
  -[MTChevronView layoutSubviews](&v24, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](self, "imageView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[MTChevronView bounds](self, "bounds");
  double v16 = CGRectCenterRectInRect(v5, v7, v9, v11, v12, v13, v14, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](self, "imageView"));
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](self, "imageView"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
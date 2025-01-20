@interface TVSettingsPhotoCollectionViewCell
- (BOOL)canBecomeFocused;
- (TVImageProxy)imageProxy;
- (TVSettingsPhotoCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (void)prepareForReuse;
- (void)setImageProxy:(id)a3;
@end

@implementation TVSettingsPhotoCollectionViewCell

- (TVSettingsPhotoCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionViewCell;
  v3 = -[TVSettingsPhotoCollectionViewCell initWithFrame:]( &v12,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionViewCell contentView](v3, "contentView"));
    [v5 bounds];
    v6 = -[UIImageView initWithFrame:](v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = v6;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 4LL);
    -[UIImageView setAdjustsImageWhenAncestorFocused:](v3->_imageView, "setAdjustsImageWhenAncestorFocused:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionViewCell contentView](v3, "contentView"));
    [v8 addSubview:v3->_imageView];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionViewCell contentView](v3, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](&OBJC_CLASS___UIColor, "lightGrayColor"));
    [v9 setBackgroundColor:v10];
  }

  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionViewCell;
  -[TVSettingsPhotoCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  -[UIImageView setImage:](self->_imageView, "setImage:", 0LL);
  -[TVImageProxy cancel](self->_imageProxy, "cancel");
  imageProxy = self->_imageProxy;
  self->_imageProxy = 0LL;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setImageProxy:(id)a3
{
  id v5 = a3;
  p_imageProxy = (id *)&self->_imageProxy;
  if ((-[TVImageProxy isEqual:](self->_imageProxy, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageProxy, a3);
    objc_initWeak(&location, self);
    id v7 = *p_imageProxy;
    v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    v10 = sub_1000E6B70;
    v11 = &unk_100194F40;
    objc_copyWeak(&v12, &location);
    [v7 setCompletionHandler:&v8];
    objc_msgSend(*p_imageProxy, "load", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
}

@end
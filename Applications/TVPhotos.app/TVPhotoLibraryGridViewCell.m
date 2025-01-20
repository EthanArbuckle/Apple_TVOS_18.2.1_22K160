@interface TVPhotoLibraryGridViewCell
- (NSString)assetLocalIdentifier;
- (TVPhotoLibraryGridViewCell)initWithFrame:(CGRect)a3;
- (UIImage)badgeImage;
- (unint64_t)assetType;
- (void)_updatePlaceholderImage;
- (void)layoutSubviews;
- (void)setAssetLocalIdentifier:(id)a3;
- (void)setAssetType:(unint64_t)a3;
- (void)setBadgeImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPhotoLibraryGridViewCell

- (TVPhotoLibraryGridViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPhotoLibraryGridViewCell;
  v3 = -[TVPPhotoCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVPhotoLibraryGridViewCell _updatePlaceholderImage](v3, "_updatePlaceholderImage");
    v4->_assetType = 1LL;
  }

  return v4;
}

- (void)_updatePlaceholderImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoLibraryGridViewCell traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2)
  {
    v5 = &qword_100102E78;
    objc_super v6 = (void *)qword_100102E78;
    if (!qword_100102E78)
    {
      v7 = @"iCloud-Dark";
LABEL_6:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v7));
      v9 = (void *)*v5;
      uint64_t *v5 = v8;

      objc_super v6 = (void *)*v5;
    }
  }

  else
  {
    v5 = &qword_100102E70;
    objc_super v6 = (void *)qword_100102E70;
    if (!qword_100102E70)
    {
      v7 = @"iCloud-Light";
      goto LABEL_6;
    }
  }

  id v10 = v6;
  -[TVPPhotoCell setPlaceholderImage:](self, "setPlaceholderImage:", v10);
}

- (void)setAssetType:(unint64_t)a3
{
  if (self->_assetType != a3)
  {
    self->_assetType = a3;
    switch(a3)
    {
      case 2uLL:
        id v4 = @"Pano";
        goto LABEL_8;
      case 6uLL:
        id v4 = @"Video";
        goto LABEL_8;
      case 7uLL:
        id v4 = @"TimeLapse";
        goto LABEL_8;
      case 8uLL:
        id v4 = @"SloMo";
LABEL_8:
        objc_super v6 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v4));
        badgeImage = self->_badgeImage;
        self->_badgeImage = v6;
        break;
      default:
        badgeImage = self->_badgeImage;
        self->_badgeImage = 0LL;
        break;
    }

    -[TVPhotoLibraryGridViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVPhotoLibraryGridViewCell;
  -[TVPhotoLibraryGridViewCell layoutSubviews](&v24, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoLibraryGridViewCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  if (self->_assetType == 1 || !self->_badgeImage)
  {
    -[TVPPhotoCell setOverlay:](self, "setOverlay:", 0LL);
  }

  else
  {
    v13 = objc_alloc(&OBJC_CLASS___UIView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
    [v14 bounds];
    v15 = -[UIView initWithFrame:](v13, "initWithFrame:");

    v16 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", self->_badgeImage);
    -[UIView addSubview:](v15, "addSubview:", v16);
    -[UIImageView frame](v16, "frame");
    double v18 = v17;
    double v20 = v19;
    -[UIView bounds](v15, "bounds");
    double v22 = v21 - v18 + -10.0;
    -[UIView bounds](v15, "bounds");
    -[UIImageView setFrame:](v16, "setFrame:", v22, v23 - v20 + -10.0, v18, v20);
    -[TVPPhotoCell setOverlay:](self, "setOverlay:", v15);
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoLibraryGridViewCell traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[TVPhotoLibraryGridViewCell _updatePlaceholderImage](self, "_updatePlaceholderImage");
  }
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (void)setAssetLocalIdentifier:(id)a3
{
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (void)setBadgeImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
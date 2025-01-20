@interface TVPSharedPSAlbumDescriptionView
- (BOOL)displaysNewAlbumBadge;
- (BOOL)needsNewOverlayView;
- (NSString)cellIdentifier;
- (TVPSharedPSAlbumDescriptionView)initWithFrame:(CGRect)a3;
- (UIImage)overlayImage;
- (void)_updatePlaceholderImage;
- (void)layoutSubviews;
- (void)setCellIdentifier:(id)a3;
- (void)setDisplaysNewAlbumBadge:(BOOL)a3;
- (void)setNeedsNewOverlayView:(BOOL)a3;
- (void)setOverlayImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPSharedPSAlbumDescriptionView

- (TVPSharedPSAlbumDescriptionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPSharedPSAlbumDescriptionView;
  v3 = -[TVPPhotoCollectionGridViewCell initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[TVPSharedPSAlbumDescriptionView _updatePlaceholderImage](v3, "_updatePlaceholderImage");
  }
  return v4;
}

- (void)setDisplaysNewAlbumBadge:(BOOL)a3
{
  self->_displaysNewAlbumBadge = a3;
  uint64_t v4 = qword_100103308;
  if (!qword_100103308)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"NewBadge"));
    objc_super v6 = (void *)qword_100103308;
    qword_100103308 = v5;

    *(_DWORD *)&a3 = self->_displaysNewAlbumBadge;
    uint64_t v4 = qword_100103308;
  }

  if (a3) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0LL;
  }
  -[TVPPhotoCollectionGridViewCell setBadgeImage:](self, "setBadgeImage:", v7);
}

- (void)setOverlayImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  if (self->_overlayImage != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_overlayImage, a3);
    uint64_t v5 = v6;
    self->_needsNewOverlayView = 1;
  }
}

- (void)_updatePlaceholderImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAlbumDescriptionView traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2)
  {
    uint64_t v5 = &qword_100103300;
    objc_super v6 = (void *)qword_100103300;
    if (!qword_100103300)
    {
      uint64_t v7 = @"iCloud-Dark";
LABEL_6:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v7));
      v9 = (void *)*v5;
      *uint64_t v5 = v8;

      objc_super v6 = (void *)*v5;
    }
  }

  else
  {
    uint64_t v5 = &qword_1001032F8;
    objc_super v6 = (void *)qword_1001032F8;
    if (!qword_1001032F8)
    {
      uint64_t v7 = @"iCloud-Light";
      goto LABEL_6;
    }
  }

  id v10 = v6;
  -[TVPPhotoCell setPlaceholderImage:](self, "setPlaceholderImage:", v10);
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVPSharedPSAlbumDescriptionView;
  -[TVPSharedPSAlbumDescriptionView layoutSubviews](&v28, "layoutSubviews");
  if (self->_overlayImage)
  {
    if (self->_needsNewOverlayView)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
      [v3 bounds];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;

      v12 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v5, v7, v9, v11);
      -[UIView setClipsToBounds:](v12, "setClipsToBounds:", 0LL);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"gradientImage"));
      v14 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v13);
      -[UIView bounds](v12, "bounds");
      double v16 = v15;
      [v13 size];
      double v18 = v16 - v17;
      -[UIView bounds](v12, "bounds");
      double v20 = v19;
      [v13 size];
      -[UIImageView setFrame:](v14, "setFrame:", 0.0, v18, v20, v21);
      -[UIView addSubview:](v12, "addSubview:", v14);
      v22 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", self->_overlayImage);
      -[UIView addSubview:](v12, "addSubview:", v22);
      -[UIImageView frame](v22, "frame");
      double v24 = v23;
      double v26 = v25;
      -[UIView bounds](v12, "bounds");
      -[UIImageView setFrame:](v22, "setFrame:", 15.0, v27 - v26 + -15.0, v24, v26);
      -[TVPPhotoCell setOverlay:](self, "setOverlay:", v12);
      self->_needsNewOverlayView = 0;
    }
  }

  else
  {
    -[TVPPhotoCell setOverlay:](self, "setOverlay:", 0LL);
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAlbumDescriptionView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[TVPSharedPSAlbumDescriptionView _updatePlaceholderImage](self, "_updatePlaceholderImage");
  }
}

- (NSString)cellIdentifier
{
  return self->_cellIdentifier;
}

- (void)setCellIdentifier:(id)a3
{
}

- (BOOL)displaysNewAlbumBadge
{
  return self->_displaysNewAlbumBadge;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (BOOL)needsNewOverlayView
{
  return self->_needsNewOverlayView;
}

- (void)setNeedsNewOverlayView:(BOOL)a3
{
  self->_needsNewOverlayView = a3;
}

- (void).cxx_destruct
{
}

@end
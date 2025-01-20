@interface SCATAppleTVRemoteVolumeButtonView
- (BOOL)scatBeginScanningFromSelfAfterActivation;
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)updateFocusState:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (SCATAppleTVRemoteVolumeButtonView)initWithButton:(int64_t)a3 delegate:(id)a4;
- (SCATAppleTVRemoteVolumeButtonViewDelegate)delegate;
- (UIImage)glyphImage;
- (UIImageView)imageView;
- (id)description;
- (int64_t)button;
- (void)setButton:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setGlyphImage:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation SCATAppleTVRemoteVolumeButtonView

- (SCATAppleTVRemoteVolumeButtonView)initWithButton:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteVolumeButtonView;
  v7 = -[SCATCustomFocusingView initWithFrame:]( &v29,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    -[SCATAppleTVRemoteVolumeButtonView setDelegate:](v7, "setDelegate:", v6);
    -[SCATAppleTVRemoteVolumeButtonView setButton:](v8, "setButton:", a3);
    -[SCATAppleTVRemoteVolumeButtonView setTranslatesAutoresizingMaskIntoConstraints:]( v8,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    if (a3) {
      v9 = @"volume-down";
    }
    else {
      v9 = @"volume-up";
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 imageWithRenderingMode:2]);
    -[SCATAppleTVRemoteVolumeButtonView setGlyphImage:](v8, "setGlyphImage:", v11);

    v12 = objc_alloc(&OBJC_CLASS___UIImageView);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView glyphImage](v8, "glyphImage"));
    v14 = -[UIImageView initWithImage:](v12, "initWithImage:", v13);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v14,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATAppleTVRemoteVolumeButtonView addSubview:](v8, "addSubview:", v14);
    -[SCATAppleTVRemoteVolumeButtonView setImageView:](v8, "setImageView:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](v8, "imageView"));
    [v15 setContentMode:4];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v14, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView topAnchor](v8, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17]);
    [v18 setActive:1];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](v14, "rightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView rightAnchor](v8, "rightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20]);
    [v21 setActive:1];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v14, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView bottomAnchor](v8, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v23]);
    [v24 setActive:1];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](v14, "leftAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView leftAnchor](v8, "leftAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v26]);
    [v27 setActive:1];
  }

  return v8;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteVolumeButtonView;
  id v3 = -[SCATAppleTVRemoteVolumeButtonView description](&v9, "description");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  if (self->_button == 1) {
    id v6 = @"Decrease Volume";
  }
  else {
    id v6 = @"Increase Volume";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - Button: %@",  v4,  v6));

  return v7;
}

- (CGSize)intrinsicContentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)updateFocusState:(int64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteVolumeButtonView;
  BOOL v5 = -[SCATCustomFocusingView updateFocusState:](&v24, "updateFocusState:");
  if (v5)
  {
    if (a3)
    {
      if (a3 == 2)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
        [v18 _setDrawsAsBackdropOverlayWithBlendMode:0];

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
        [v19 setAlpha:1.0];

        id v21 = objc_msgSend((id)objc_opt_class(self, v20), "focusedGroupStateContentsColor");
        uint64_t v10 = objc_claimAutoreleasedReturnValue(v21);
      }

      else
      {
        if (a3 != 1)
        {
LABEL_10:
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView delegate](self, "delegate"));
          [v22 volumeButton:self didChangeFocusState:a3];

          return v5;
        }

        double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
        [v6 _setDrawsAsBackdropOverlayWithBlendMode:0];

        double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
        [v7 setAlpha:1.0];

        id v9 = objc_msgSend((id)objc_opt_class(self, v8), "focusedStateContentsColor");
        uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
      }

      v15 = (void *)v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
      [v16 setTintColor:v15];
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
      objc_msgSend( v11,  "_setDrawsAsBackdropOverlayWithBlendMode:",  objc_msgSend(v12, "menuKnockoutBorderOverlayBlendMode"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
      [v14 menuKnockoutBorderOpacity];
      objc_msgSend(v13, "setAlpha:");

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 menuKnockoutColor]);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView imageView](self, "imageView"));
      [v17 setTintColor:v16];
    }

    goto LABEL_10;
  }

  return v5;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (BOOL)scatBeginScanningFromSelfAfterActivation
{
  return 1;
}

- (BOOL)scatPerformAction:(int)a3
{
  int64_t v3 = -[SCATAppleTVRemoteVolumeButtonView button](self, "button", *(void *)&a3);
  if (v3 == 1)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v4 decreaseVolume];
    goto LABEL_5;
  }

  if (!v3)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v4 increaseVolume];
LABEL_5:
  }

  return 1;
}

- (int64_t)button
{
  return self->_button;
}

- (void)setButton:(int64_t)a3
{
  self->_button = a3;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (void)setGlyphImage:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (SCATAppleTVRemoteVolumeButtonViewDelegate)delegate
{
  return (SCATAppleTVRemoteVolumeButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
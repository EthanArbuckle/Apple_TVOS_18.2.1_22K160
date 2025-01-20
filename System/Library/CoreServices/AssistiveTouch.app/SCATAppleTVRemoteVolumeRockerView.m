@interface SCATAppleTVRemoteVolumeRockerView
- (CGSize)intrinsicContentSize;
- (SCATAppleTVRemoteVolumeButtonView)decreaseVolumeViewInternal;
- (SCATAppleTVRemoteVolumeButtonView)increaseVolumeViewInternal;
- (SCATAppleTVRemoteVolumeRockerView)initWithFrame:(CGRect)a3;
- (UIImage)containingGroupFocusedBackgroundImage;
- (UIImage)decreaseVolumeFocusedBackgroundImage;
- (UIImage)increaseVolumeFocusedBackgroundImage;
- (UIImage)unfocusedBackgroundImage;
- (UIImageView)backgroundImageView;
- (void)setBackgroundImageView:(id)a3;
- (void)setContainingGroupFocusedBackgroundImage:(id)a3;
- (void)setDecreaseVolumeFocusedBackgroundImage:(id)a3;
- (void)setDecreaseVolumeViewInternal:(id)a3;
- (void)setIncreaseVolumeFocusedBackgroundImage:(id)a3;
- (void)setIncreaseVolumeViewInternal:(id)a3;
- (void)setUnfocusedBackgroundImage:(id)a3;
- (void)volumeButton:(id)a3 didChangeFocusState:(int64_t)a4;
@end

@implementation SCATAppleTVRemoteVolumeRockerView

- (SCATAppleTVRemoteVolumeRockerView)initWithFrame:(CGRect)a3
{
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteVolumeRockerView;
  v3 = -[SCATCustomFocusingView initWithFrame:]( &v48,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SCATAppleTVRemoteVolumeRockerView setTranslatesAutoresizingMaskIntoConstraints:]( v3,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"button-volume"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 imageWithRenderingMode:2]);
    -[SCATAppleTVRemoteVolumeRockerView setUnfocusedBackgroundImage:](v4, "setUnfocusedBackgroundImage:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"button-volume"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 imageWithRenderingMode:2]);
    -[SCATAppleTVRemoteVolumeRockerView setContainingGroupFocusedBackgroundImage:]( v4,  "setContainingGroupFocusedBackgroundImage:",  v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"button-volume-up-press"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 imageWithRenderingMode:2]);
    -[SCATAppleTVRemoteVolumeRockerView setIncreaseVolumeFocusedBackgroundImage:]( v4,  "setIncreaseVolumeFocusedBackgroundImage:",  v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"button-volume-down-press"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 imageWithRenderingMode:2]);
    -[SCATAppleTVRemoteVolumeRockerView setDecreaseVolumeFocusedBackgroundImage:]( v4,  "setDecreaseVolumeFocusedBackgroundImage:",  v12);

    v13 = objc_alloc(&OBJC_CLASS___UIImageView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView unfocusedBackgroundImage](v4, "unfocusedBackgroundImage"));
    v15 = -[UIImageView initWithImage:](v13, "initWithImage:", v14);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v15,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATAppleTVRemoteVolumeRockerView addSubview:](v4, "addSubview:", v15);
    -[SCATAppleTVRemoteVolumeRockerView setBackgroundImageView:](v4, "setBackgroundImageView:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](v4, "backgroundImageView"));
    [v16 setContentMode:4];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v15, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView topAnchor](v4, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18]);
    [v19 setActive:1];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](v15, "rightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView rightAnchor](v4, "rightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
    [v22 setActive:1];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v15, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView bottomAnchor](v4, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v24]);
    [v25 setActive:1];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](v15, "leftAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView leftAnchor](v4, "leftAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v27]);
    [v28 setActive:1];

    v29 = -[SCATAppleTVRemoteVolumeButtonView initWithButton:delegate:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteVolumeButtonView),  "initWithButton:delegate:",  0LL,  v4);
    id v30 = sub_10002B014(@"Remote-VolumeUp");
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    -[SCATAppleTVRemoteVolumeButtonView setAccessibilityLabel:](v29, "setAccessibilityLabel:", v31);

    -[SCATAppleTVRemoteVolumeRockerView setIncreaseVolumeViewInternal:](v4, "setIncreaseVolumeViewInternal:", v29);
    -[SCATAppleTVRemoteVolumeRockerView addSubview:](v4, "addSubview:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView topAnchor](v29, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView topAnchor](v4, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v33 constant:22.0]);
    [v34 setActive:1];

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView centerXAnchor](v29, "centerXAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView centerXAnchor](v4, "centerXAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v36]);
    [v37 setActive:1];

    v38 = -[SCATAppleTVRemoteVolumeButtonView initWithButton:delegate:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteVolumeButtonView),  "initWithButton:delegate:",  1LL,  v4);
    id v39 = sub_10002B014(@"Remote-VolumeDown");
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    -[SCATAppleTVRemoteVolumeButtonView setAccessibilityLabel:](v38, "setAccessibilityLabel:", v40);

    -[SCATAppleTVRemoteVolumeRockerView setDecreaseVolumeViewInternal:](v4, "setDecreaseVolumeViewInternal:", v38);
    -[SCATAppleTVRemoteVolumeRockerView addSubview:](v4, "addSubview:", v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView bottomAnchor](v38, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView bottomAnchor](v4, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v42 constant:-36.0]);
    [v43 setActive:1];

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeButtonView centerXAnchor](v38, "centerXAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView centerXAnchor](v4, "centerXAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v45]);
    [v46 setActive:1];
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)volumeButton:(id)a3 didChangeFocusState:(int64_t)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATAppleTVRemoteVolumeRockerView increaseVolumeViewInternal]( self,  "increaseVolumeViewInternal",  a3,  a4));
  id v6 = [v5 focusState];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView decreaseVolumeViewInternal](self, "decreaseVolumeViewInternal"));
  id v8 = [v7 focusState];

  if (v6 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
    [v9 _setDrawsAsBackdropOverlayWithBlendMode:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
    [v10 setAlpha:1.0];

    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[SCATAppleTVRemoteVolumeRockerView increaseVolumeFocusedBackgroundImage]( self,  "increaseVolumeFocusedBackgroundImage"));
  }

  else if (v8 == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
    [v12 _setDrawsAsBackdropOverlayWithBlendMode:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
    [v13 setAlpha:1.0];

    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[SCATAppleTVRemoteVolumeRockerView decreaseVolumeFocusedBackgroundImage]( self,  "decreaseVolumeFocusedBackgroundImage"));
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
    v15 = v14;
    if (v6 == (id)2)
    {
      [v14 _setDrawsAsBackdropOverlayWithBlendMode:0];

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
      [v16 setAlpha:1.0];

      uint64_t v11 = objc_claimAutoreleasedReturnValue( -[SCATAppleTVRemoteVolumeRockerView containingGroupFocusedBackgroundImage]( self,  "containingGroupFocusedBackgroundImage"));
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
      objc_msgSend( v15,  "_setDrawsAsBackdropOverlayWithBlendMode:",  objc_msgSend(v17, "menuKnockoutBorderOverlayBlendMode"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
      [v19 menuKnockoutBorderOpacity];
      objc_msgSend(v18, "setAlpha:");

      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView unfocusedBackgroundImage](self, "unfocusedBackgroundImage"));
    }
  }

  id v21 = (id)v11;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView backgroundImageView](self, "backgroundImageView"));
  [v20 setImage:v21];
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIImage)unfocusedBackgroundImage
{
  return self->_unfocusedBackgroundImage;
}

- (void)setUnfocusedBackgroundImage:(id)a3
{
}

- (UIImage)containingGroupFocusedBackgroundImage
{
  return self->_containingGroupFocusedBackgroundImage;
}

- (void)setContainingGroupFocusedBackgroundImage:(id)a3
{
}

- (UIImage)increaseVolumeFocusedBackgroundImage
{
  return self->_increaseVolumeFocusedBackgroundImage;
}

- (void)setIncreaseVolumeFocusedBackgroundImage:(id)a3
{
}

- (UIImage)decreaseVolumeFocusedBackgroundImage
{
  return self->_decreaseVolumeFocusedBackgroundImage;
}

- (void)setDecreaseVolumeFocusedBackgroundImage:(id)a3
{
}

- (SCATAppleTVRemoteVolumeButtonView)increaseVolumeViewInternal
{
  return self->_increaseVolumeViewInternal;
}

- (void)setIncreaseVolumeViewInternal:(id)a3
{
}

- (SCATAppleTVRemoteVolumeButtonView)decreaseVolumeViewInternal
{
  return self->_decreaseVolumeViewInternal;
}

- (void)setDecreaseVolumeViewInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
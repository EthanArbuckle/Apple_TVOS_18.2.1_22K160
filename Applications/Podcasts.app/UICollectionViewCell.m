@interface UICollectionViewCell
- (void)im_updateLabelShadow:(id)a3 alwaysDisplaysLabel:(BOOL)a4;
- (void)im_updateLayersForLabel:(id)a3 imageView:(id)a4;
@end

@implementation UICollectionViewCell

- (void)im_updateLabelShadow:(id)a3 alwaysDisplaysLabel:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v7 = [v6 _graphicsQuality];

  if (v7 != (id)10)
  {
    if (v4 && !-[UICollectionViewCell isFocused](self, "isFocused"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v16 shadowColor]);

      if (v15)
      {
        [v16 setShadowColor:0];
        double width = CGSizeZero.width;
        double height = CGSizeZero.height;
        double v14 = 0.0;
        v11 = v16;
LABEL_10:
        objc_msgSend(v11, "setShadowOffset:", width, height);
        [v16 setShadowBlur:v14];
      }
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v16 shadowColor]);

      if (!v8)
      {
        if (!qword_1002B6B98)
        {
          uint64_t v9 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.400000006));
          v10 = (void *)qword_1002B6B98;
          qword_1002B6B98 = v9;
        }

        objc_msgSend(v16, "setShadowColor:");
        v11 = v16;
        double height = 2.0;
        double width = 0.0;
        double v14 = 6.0;
        goto LABEL_10;
      }
    }
  }
}

- (void)im_updateLayersForLabel:(id)a3 imageView:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v8 = [v7 _graphicsQuality];

  if (v8 == (id)10)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewCell contentView](self, "contentView"));
    [v9 addSubview:v6];
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v14 _layeredImageContainer]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layer]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _layerBelowTitles]);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 superlayer]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 layer]);

    [v12 insertSublayer:v13 above:v11];
    id v6 = v11;
  }
}

@end
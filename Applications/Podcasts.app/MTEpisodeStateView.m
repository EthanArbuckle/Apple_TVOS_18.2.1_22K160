@interface MTEpisodeStateView
+ (double)imagePadding;
+ (id)explicitIcon;
+ (id)imageForIconKey:(id)a3 theme:(id)a4;
+ (id)orderedIconKeys;
+ (id)videoIcon;
- (BOOL)_airplaneMode;
- (BOOL)_document;
- (BOOL)_error;
- (BOOL)_isRTL;
- (BOOL)_streaming;
- (BOOL)isCenteredLayout;
- (BOOL)isExplicit;
- (BOOL)isNotEmpty;
- (BOOL)isVerticalLayout;
- (BOOL)isVideo;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTColorTheme)colorTheme;
- (MTEpisodeStateView)init;
- (id)_imageViewForKey:(id)a3;
- (id)_imageViews;
- (id)imagesForCurrentIconsExcludingPlayState;
- (unint64_t)assetStatus;
- (unint64_t)playStatus;
- (void)_setAirplaneMode:(BOOL)a3;
- (void)_setDocument:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3 forFlag:(unint64_t)a4;
- (void)_setError:(BOOL)a3;
- (void)_setNeedsIconUpdate;
- (void)_setStreaming:(BOOL)a3;
- (void)_updateIconsIfNeeded;
- (void)_updateImageViews;
- (void)applyThemeToImageViewWithKey:(id)a3;
- (void)layoutSubviews;
- (void)setAssetStatus:(unint64_t)a3;
- (void)setCenteredLayout:(BOOL)a3;
- (void)setColorTheme:(id)a3;
- (void)setExplicit:(BOOL)a3;
- (void)setPlayStatus:(unint64_t)a3;
- (void)setVerticalLayout:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)sizeToFit;
- (void)updateSizeIfNeeded;
@end

@implementation MTEpisodeStateView

+ (id)explicitIcon
{
  return [a1 imageForIconKey:&off_100254830 theme:0];
}

+ (id)videoIcon
{
  return [a1 imageForIconKey:&off_100254848 theme:0];
}

+ (id)orderedIconKeys
{
  if (qword_1002B69E8 != -1) {
    dispatch_once(&qword_1002B69E8, &stru_100242688);
  }
  return (id)qword_1002B69E0;
}

+ (id)imageForIconKey:(id)a3 theme:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1002B69F8 != -1) {
    dispatch_once(&qword_1002B69F8, &stru_1002426A8);
  }
  id v7 = [v5 unsignedIntegerValue];
  if (v7 == (id)2048)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[UIImage backCatalogPartiallyPlayedIconForTheme:]( &OBJC_CLASS___UIImage,  "backCatalogPartiallyPlayedIconForTheme:",  v6));
  }

  else if (v7 == (id)1024)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIImage backCatalogIconForTheme:](&OBJC_CLASS___UIImage, "backCatalogIconForTheme:", v6));
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([(id)qword_1002B69F0 objectForKeyedSubscript:v5]);
  }

  v9 = (void *)v8;

  return v9;
}

+ (double)imagePadding
{
  return 8.0;
}

- (MTEpisodeStateView)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTEpisodeStateView;
  v2 = -[MTEpisodeStateView init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    imageViews = v2->_imageViews;
    v2->_imageViews = (NSArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    imageViewCache = v2->_imageViewCache;
    v2->_imageViewCache = (NSMutableDictionary *)v5;
  }

  return v2;
}

- (void)updateSizeIfNeeded
{
  if (self->_needsSizeUpdate) {
    -[MTEpisodeStateView sizeToFit](self, "sizeToFit");
  }
}

- (BOOL)isNotEmpty
{
  return self->_icons != 0;
}

- (void)setVerticalLayout:(BOOL)a3
{
  if (self->_verticalLayout != a3)
  {
    self->_verticalLayout = a3;
    -[MTEpisodeStateView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setCenteredLayout:(BOOL)a3
{
  if (self->_centeredLayout != a3)
  {
    self->_centeredLayout = a3;
    -[MTEpisodeStateView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setAssetStatus:(unint64_t)a3
{
  BOOL v4 = (a3 & 0x1F) == 1;
  BOOL v5 = (a3 & 0x1F) == 3;
  BOOL v6 = (a3 & 0x1F) == 4;
  BOOL v7 = a3 > 4;
  BOOL v8 = a3 <= 4 && (a3 & 0x1F) == 2;
  BOOL v9 = !v7 && v4;
  BOOL v10 = !v7 && v5;
  BOOL v11 = !v7 && v6;
  -[MTEpisodeStateView _setStreaming:](self, "_setStreaming:", v8);
  -[MTEpisodeStateView _setDocument:](self, "_setDocument:", v9);
  -[MTEpisodeStateView _setError:](self, "_setError:", v10);
  -[MTEpisodeStateView _setAirplaneMode:](self, "_setAirplaneMode:", v11);
}

- (void)setPlayStatus:(unint64_t)a3
{
  unint64_t v3 = self->_icons & 0xFFFFFFFFFFFFE07FLL;
  self->_icons = v3;
  if (a3 <= 5) {
    self->_icons = v3 | qword_1001C3790[a3];
  }
  -[MTEpisodeStateView _setNeedsIconUpdate](self, "_setNeedsIconUpdate");
}

- (BOOL)isExplicit
{
  return (LOBYTE(self->_icons) >> 1) & 1;
}

- (BOOL)isVideo
{
  return self->_icons & 1;
}

- (void)setExplicit:(BOOL)a3
{
}

- (void)setVideo:(BOOL)a3
{
}

- (id)imagesForCurrentIconsExcludingPlayState
{
  unint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView orderedIconKeys](&OBJC_CLASS___MTEpisodeStateView, "orderedIconKeys", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((unint64_t)[v9 unsignedIntegerValue] <= 0x7F)
        {
          unint64_t icons = self->_icons;
          if (((unint64_t)[v9 unsignedIntegerValue] & icons) != 0)
          {
            BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView _imageViewForKey:](self, "_imageViewForKey:", v9));
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 image]);

            if (v12) {
              -[NSMutableArray addObject:](v3, "addObject:", v12);
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }

  id v13 = -[NSMutableArray copy](v3, "copy");
  return v13;
}

- (void)_setStreaming:(BOOL)a3
{
}

- (void)_setDocument:(BOOL)a3
{
}

- (void)_setError:(BOOL)a3
{
}

- (void)_setAirplaneMode:(BOOL)a3
{
}

- (BOOL)_streaming
{
  return (LOBYTE(self->_icons) >> 3) & 1;
}

- (BOOL)_document
{
  return (LOBYTE(self->_icons) >> 4) & 1;
}

- (BOOL)_error
{
  return (LOBYTE(self->_icons) >> 5) & 1;
}

- (BOOL)_airplaneMode
{
  return (LOBYTE(self->_icons) >> 6) & 1;
}

- (void)_setEnabled:(BOOL)a3 forFlag:(unint64_t)a4
{
  unint64_t icons = self->_icons;
  if (((((icons & a4) == 0) ^ a3) & 1) == 0)
  {
    unint64_t v5 = icons & ~a4;
    unint64_t v6 = icons | a4;
    if (!a3) {
      unint64_t v6 = v5;
    }
    self->_unint64_t icons = v6;
    -[MTEpisodeStateView _setNeedsIconUpdate](self, "_setNeedsIconUpdate");
  }

- (void)_setNeedsIconUpdate
{
  self->_needsIconUpdate = 1;
  self->_needsSizeUpdate = 1;
}

- (void)_updateIconsIfNeeded
{
  if (self->_needsIconUpdate) {
    -[MTEpisodeStateView _updateImageViews](self, "_updateImageViews");
  }
}

- (void)_updateImageViews
{
  unint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView _imageViews](self, "_imageViews"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", self->_imageViews));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v4));
  [v6 minusSet:v5];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      BOOL v11 = 0LL;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)v11) removeFromSuperview];
        BOOL v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v9);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v5));
  [v12 minusSet:v4];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      __int128 v17 = 0LL;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[MTEpisodeStateView addSubview:]( self,  "addSubview:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v17),  (void)v19);
        __int128 v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v15);
  }

  imageViews = self->_imageViews;
  self->_imageViews = v3;
}

- (id)_imageViews
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView orderedIconKeys](&OBJC_CLASS___MTEpisodeStateView, "orderedIconKeys", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        unint64_t icons = self->_icons;
        if (((unint64_t)[v9 unsignedIntegerValue] & icons) != 0)
        {
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView _imageViewForKey:](self, "_imageViewForKey:", v9));
          if (v11) {
            [v3 addObject:v11];
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v3));
  return v12;
}

- (id)_imageViewForKey:(id)a3
{
  id v4 = a3;
  id v5 = (UIImageView *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_imageViewCache,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView colorTheme](self, "colorTheme"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisodeStateView imageForIconKey:theme:]( &OBJC_CLASS___MTEpisodeStateView,  "imageForIconKey:theme:",  v4,  v6));

    if (v7)
    {
      id v5 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v7);
      -[UIImageView sizeToFit](v5, "sizeToFit");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageViewCache, "setObject:forKeyedSubscript:", v5, v4);
    }

    else
    {
      id v5 = 0LL;
    }
  }

  -[MTEpisodeStateView applyThemeToImageViewWithKey:](self, "applyThemeToImageViewWithKey:", v4);

  return v5;
}

- (BOOL)_isRTL
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[MTEpisodeStateView semanticContentAttribute](self, "semanticContentAttribute")) == (id)1;
}

- (void)applyThemeToImageViewWithKey:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_imageViewCache, "objectForKeyedSubscript:"));
  if (v4 && [v7 unsignedIntegerValue] == (id)4096)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView colorTheme](self, "colorTheme"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColorForTheme:](&OBJC_CLASS___UIColor, "tintColorForTheme:", v5));
    [v4 setTintColor:v6];
  }
}

- (void)setColorTheme:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_colorTheme, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](&OBJC_CLASS___UIColor, "secondaryTextColorForTheme:", v5));
  -[MTEpisodeStateView setTintColor:](self, "setTintColor:", v6);

  imageViewCache = self->_imageViewCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100072D58;
  v9[3] = &unk_1002426D0;
  id v10 = v5;
  id v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](imageViewCache, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[MTEpisodeStateView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v4 = v3;
  -[MTEpisodeStateView bounds](self, "bounds");
  double v6 = v5;
  -[MTEpisodeStateView _updateIconsIfNeeded](self, "_updateIconsIfNeeded");
  if (-[MTEpisodeStateView _isRTL](self, "_isRTL") && !-[MTEpisodeStateView isVerticalLayout](self, "isVerticalLayout")) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_imageViews, "reverseObjectEnumerator"));
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_imageViews, "objectEnumerator"));
  }
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v8);
        }
        __int128 v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        objc_msgSend(v15, "frame", (void)v27);
        double v17 = v16;
        double v19 = v18;
        unsigned int v20 = -[MTEpisodeStateView isVerticalLayout](self, "isVerticalLayout");
        unsigned int v21 = -[MTEpisodeStateView isCenteredLayout](self, "isCenteredLayout");
        if (v20)
        {
          if (v21)
          {
            double x = IMRoundToPixel((v6 - v17) * 0.5);
          }

          else if (-[MTEpisodeStateView _isRTL](self, "_isRTL"))
          {
            double x = v6 - v17;
          }

          else
          {
            double x = 0.0;
          }
        }

        else
        {
          double y = v4 - v19;
          if (v21) {
            double y = IMRoundToPixel(y * 0.5);
          }
        }

        objc_msgSend(v15, "setFrame:", x, y, v17, v19);
        unsigned int v22 = -[MTEpisodeStateView isVerticalLayout](self, "isVerticalLayout");
        +[MTEpisodeStateView imagePadding](&OBJC_CLASS___MTEpisodeStateView, "imagePadding");
        double v24 = v19 + v23;
        double v25 = v17 + v23;
        if (v22) {
          double v25 = -0.0;
        }
        double x = x + v25;
        if (v22) {
          double v26 = v24;
        }
        else {
          double v26 = -0.0;
        }
        double y = y + v26;
      }

      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v10);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  double v4 = self->_imageViews;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        objc_msgSend(v11, "frame", (void)v22);
        double v13 = v12;
        double v15 = v14;
        unsigned int v16 = -[MTEpisodeStateView isVerticalLayout](self, "isVerticalLayout");
        double v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_imageViews, "lastObject"));

        if (v16)
        {
          if (v9 < v13) {
            double v9 = v13;
          }
          double v8 = v8 + v15;
          if (v11 != v17)
          {
            +[MTEpisodeStateView imagePadding](&OBJC_CLASS___MTEpisodeStateView, "imagePadding");
            double v8 = v8 + v18;
          }
        }

        else
        {
          if (v8 < v15) {
            double v8 = v15;
          }
          double v9 = v9 + v13;
          if (v11 != v17)
          {
            +[MTEpisodeStateView imagePadding](&OBJC_CLASS___MTEpisodeStateView, "imagePadding");
            double v9 = v9 + v19;
          }
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v6);
  }

  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
  }

  double v20 = v9;
  double v21 = v8;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)sizeToFit
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTEpisodeStateView;
  -[MTEpisodeStateView sizeToFit](&v3, "sizeToFit");
  self->_needsSizeUpdate = 0;
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (unint64_t)playStatus
{
  return self->_playStatus;
}

- (unint64_t)assetStatus
{
  return self->_assetStatus;
}

- (BOOL)isVerticalLayout
{
  return self->_verticalLayout;
}

- (BOOL)isCenteredLayout
{
  return self->_centeredLayout;
}

- (void).cxx_destruct
{
}

@end
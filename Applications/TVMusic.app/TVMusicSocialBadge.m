@interface TVMusicSocialBadge
+ (id)socialBadgeFromElement:(id)a3 existingView:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)imageViews;
- (TVMusicSocialBadge)initWithFrame:(CGRect)a3;
- (double)minimumInteritemSpacing;
- (void)_checkReadyToDisplay;
- (void)_didLoadImageForImageView:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setImageViews:(id)a3;
- (void)setMinimumInteritemSpacing:(double)a3;
@end

@implementation TVMusicSocialBadge

+ (id)socialBadgeFromElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVMusicSocialBadge, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    id v10 = v7;
  }
  else {
    id v10 = objc_msgSend( objc_alloc((Class)a1),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  }
  v63 = v10;
  v64 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 imageViews]);
  id v12 = [v11 mutableCopy];

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  v65 = v6;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 childViewElements]);
  id v79 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
  if (v79)
  {
    uint64_t v13 = *(void *)v81;
    uint64_t v14 = TVElementKeyMonogram;
    uint64_t v69 = TVAttributeKeyLastName;
    uint64_t v68 = TVAttributeKeyFirstName;
    uint64_t v67 = TVAttributeKeyImg_Width;
    uint64_t v66 = TVAttributeKeyImg_Height;
    uint64_t v71 = *(void *)v81;
    v72 = v12;
    uint64_t v70 = TVElementKeyMonogram;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v81 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)v15);
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 lastObject]);
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___TVImageElement, v18);
        if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0 && ![v16 imageType])
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVInterfaceFactory,  "sharedInterfaceFactory"));
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v24 viewForElement:v16 existingView:v17]);

          uint64_t v26 = objc_opt_class(&OBJC_CLASS____TVImageView, v25);
          if ((objc_opt_isKindOfClass(v20, v26) & 1) != 0)
          {
            [v74 addObject:v20];
            [v12 removeLastObject];
          }
        }

        else
        {
          uint64_t v20 = 0LL;
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue([v16 elementName]);
        unsigned int v22 = [v21 isEqualToString:v14];

        if (v22)
        {
          if (!(v20 | v17))
          {
            uint64_t v20 = (uint64_t)objc_alloc_init(&OBJC_CLASS____TVImageView);
            goto LABEL_18;
          }

          if (v20)
          {
            if (!v17)
            {
LABEL_18:
              id v23 = objc_alloc_init(&OBJC_CLASS____TVImageView);
              goto LABEL_23;
            }
          }

          else
          {
            uint64_t v20 = (uint64_t)(id)v17;
            if (!v17) {
              goto LABEL_18;
            }
          }

          id v23 = (id)v17;
LABEL_23:
          v76 = v23;

          v27 = (void *)objc_claimAutoreleasedReturnValue([v16 attributes]);
          uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v69]);
          uint64_t v29 = objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v68]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v67]);
          [v30 doubleValue];
          double v32 = v31;

          v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v66]);
          [v33 doubleValue];
          double v35 = v34;

          if (v32 >= v35) {
            double v36 = v35;
          }
          else {
            double v36 = v32;
          }
          if (v36 == 0.0) {
            double v37 = 50.0;
          }
          else {
            double v37 = v36;
          }
          uint64_t v78 = v17;
          v75 = v27;
          if (v37 <= 32.0)
          {
            v38 = (void *)v29;
            v39 = (void *)v28;
            double v40 = 7.0;
          }

          else
          {
            if (v37 > 45.0)
            {
              if (v37 <= 118.0)
              {
                v38 = (void *)v29;
                v39 = (void *)v28;
                uint64_t v42 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 24.0));
              }

              else
              {
                v38 = (void *)v29;
                v39 = (void *)v28;
                if (v37 <= 180.0) {
                  double v40 = 52.0;
                }
                else {
                  double v40 = 109.0;
                }
                double v41 = UIFontWeightThin;
LABEL_37:
                uint64_t v42 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](&OBJC_CLASS___UIFont, "systemFontOfSize:weight:", v40, v41));
              }

              v77 = (void *)v42;
              v43 = (void *)objc_claimAutoreleasedReturnValue([v16 style]);
              v44 = (void *)objc_claimAutoreleasedReturnValue([v43 backgroundColor]);
              v45 = (void *)objc_claimAutoreleasedReturnValue([v44 color]);

              if (!v45)
              {
                v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
                v47 = (void *)objc_claimAutoreleasedReturnValue([v46 traitCollection]);
                id v48 = [v47 userInterfaceStyle];

                if (v48 == (id)2) {
                  uint64_t v49 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.35, 1.0));
                }
                else {
                  uint64_t v49 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.58,  0.6,  0.65,  1.0));
                }
                v45 = (void *)v49;
              }

              v50 = (void *)objc_claimAutoreleasedReturnValue([v16 style]);
              v51 = (void *)objc_claimAutoreleasedReturnValue([v50 color]);
              v52 = (void *)objc_claimAutoreleasedReturnValue([v51 color]);
              v53 = v52;
              if (v52) {
                id v54 = v52;
              }
              else {
                id v54 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
              }
              v55 = v54;

              id v56 = [[TVMonogramImageConfiguration alloc] initWithStyle:0];
              [v56 setBgColor:v45];
              [v56 setTextColor:v55];
              [v56 setDiameter:v37];
              [v56 setFocusedSizeIncrease:0.0];
              [v56 setFirstName:v38];
              [v56 setLastName:v39];
              [v56 setFont:v77];
              uint64_t v57 = TVMonogramImageWithConfiguration(v56);
              v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
              uint64_t v20 = (uint64_t)v76;
              [v76 setImage:v58];
              [v74 addObject:v76];
              id v12 = v72;
              [v72 removeLastObject];

              uint64_t v14 = v70;
              uint64_t v13 = v71;
              uint64_t v17 = v78;
              goto LABEL_47;
            }

            v38 = (void *)v29;
            v39 = (void *)v28;
            double v40 = 17.0;
          }

          double v41 = UIFontWeightRegular;
          goto LABEL_37;
        }

- (TVMusicSocialBadge)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicSocialBadge;
  v3 = -[TVMusicSocialBadge initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[TVMusicSocialBadge setOpaque:](v3, "setOpaque:", 0LL);
  }
  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicSocialBadge;
  -[TVMusicSocialBadge dealloc](&v4, "dealloc");
}

- (void)setImageViews:(id)a3
{
  id v17 = a3;
  -[NSArray makeObjectsPerformSelector:](self->_imageViews, "makeObjectsPerformSelector:", "removeFromSuperview");
  objc_storeStrong((id *)&self->_imageViews, a3);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSArray count](self->_imageViews, "count")));
  unloadedImageViews = self->_unloadedImageViews;
  self->_unloadedImageViews = v5;

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = self->_imageViews;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = TVMLImageViewImageDidLoadNotification;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        [v12 setHidden:1];
        -[TVMusicSocialBadge insertSubview:atIndex:](self, "insertSubview:atIndex:", v12, 0LL);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 image]);
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue([v12 image]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v12 placeholderImage]);

          if (v15 != v16) {
            continue;
          }
        }

        [v19 addObserver:self selector:"_didLoadImageForImageView:" name:v10 object:v12];
        -[NSMutableArray addObject:](self->_unloadedImageViews, "addObject:", v12);
      }

      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v8);
  }

  -[TVMusicSocialBadge _checkReadyToDisplay](self, "_checkReadyToDisplay");
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  self->_minimumInteritemSpacing = a3;
  -[TVMusicSocialBadge setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSocialBadge imageViews](self, "imageViews", a3.width, a3.height));
  id v5 = [v4 count];

  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (v5)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSocialBadge imageViews](self, "imageViews", 0LL));
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      double v12 = CGSizeZero.width;
      double v13 = height;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)i), "sizeThatFits:", CGSizeZero.width, height);
          double v12 = v12 + v15;
          double v13 = fmax(v13, v16);
        }

        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v10);
    }

    else
    {
      double v12 = CGSizeZero.width;
      double v13 = height;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSocialBadge imageViews](self, "imageViews"));
    double v18 = (double)((unint64_t)[v17 count] - 1);
    -[TVMusicSocialBadge minimumInteritemSpacing](self, "minimumInteritemSpacing");
    double width = fmax(v12 + v18 * v19, 0.0);

    double height = v13;
  }

  double v20 = width;
  double v21 = height;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___TVMusicSocialBadge;
  -[TVMusicSocialBadge layoutSubviews](&v37, "layoutSubviews");
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSocialBadge imageViews](self, "imageViews", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  double v5 = 0.0;
  double v6 = 0.0;
  if (v4)
  {
    id v7 = v4;
    uint64_t v8 = *(void *)v34;
    double height = CGSizeZero.height;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)i), "sizeThatFits:", CGSizeZero.width, height);
        double v6 = v6 + v11;
      }

      id v7 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v7);
  }

  -[TVMusicSocialBadge bounds](self, "bounds");
  double v13 = v12;
  double v15 = v14;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSocialBadge imageViews](self, "imageViews"));
  if ((unint64_t)[v16 count] >= 2)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSocialBadge imageViews](self, "imageViews"));
    double v18 = (v13 - v6) / ((double)(unint64_t)[v17 count] + -1.0);
    -[TVMusicSocialBadge minimumInteritemSpacing](self, "minimumInteritemSpacing");
    double v5 = fmax(v18, v19);
  }

  id v20 = -[TVMusicSocialBadge effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  double v21 = (char *)-[NSArray count](self->_imageViews, "count") - 1;
  if ((uint64_t)v21 >= 0)
  {
    double v22 = v15 * 0.5;
    double v23 = 1.0;
    if (v20 == (id)1)
    {
      double v23 = -1.0;
      double v24 = 0.0;
    }

    else
    {
      double v24 = v13;
    }

    double v25 = CGSizeZero.height;
    double v26 = -v23;
    do
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSocialBadge imageViews](self, "imageViews"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectAtIndexedSubscript:v21]);

      objc_msgSend(v28, "sizeThatFits:", CGSizeZero.width, v25);
      double v31 = v30;
      double v32 = 0.0;
      if (v20 != (id)1) {
        double v32 = v31;
      }
      objc_msgSend(v28, "setFrame:", v24 - v32, floor(v22 + v29 * -0.5), v31, v29);
      double v24 = v24 + v26 * (v5 + v31);

      --v21;
    }

    while (v21 != (char *)-1LL);
  }

- (void)_didLoadImageForImageView:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:TVMLImageViewImageDidLoadNotification object:v5];

  -[NSMutableArray removeObject:](self->_unloadedImageViews, "removeObject:", v5);
  -[TVMusicSocialBadge _checkReadyToDisplay](self, "_checkReadyToDisplay");
}

- (void)_checkReadyToDisplay
{
  if (!-[NSMutableArray count](self->_unloadedImageViews, "count"))
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSocialBadge imageViews](self, "imageViews", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setHidden:0];
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }
  }

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (void).cxx_destruct
{
}

@end
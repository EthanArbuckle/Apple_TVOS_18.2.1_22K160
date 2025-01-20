@interface TVPUIUtilities
+ (BOOL)isValidIndexPath:(id)a3 collectionView:(id)a4;
+ (id)_vibrantEffectView;
+ (id)embedPhotosLoadingViewInView:(id)a3 topMargin:(double)a4 message:(id)a5;
+ (id)photoLibraryEmptyViewInView:(id)a3;
+ (id)photoLibraryEmptyViewWithBounds:(CGRect)a3 title:(id)a4 message:(id)a5;
+ (id)photoLibraryEmptyViewWithBounds:(CGRect)a3 title:(id)a4 messageFormat:(id)a5;
+ (unint64_t)assetTypeForAsset:(id)a3;
+ (void)activityBannerImageFromAssets:(id)a3 imageManager:(id)a4 completion:(id)a5;
+ (void)animateAlbumHeader:(id)a3 focusedCellFrame:(CGRect)a4 adjustedHeaderFrame:(CGRect)a5;
+ (void)animateToBottom:(id)a3;
+ (void)refreshSlideshowPreviewWithPhotoAssets:(id)a3 navigationController:(id)a4;
@end

@implementation TVPUIUtilities

+ (unint64_t)assetTypeForAsset:(id)a3
{
  id v3 = a3;
  switch((unint64_t)[v3 playbackStyle])
  {
    case 1uLL:
      BOOL v4 = [v3 mediaSubtypes] == (id)1;
      uint64_t v5 = 1LL;
      goto LABEL_10;
    case 2uLL:
      unint64_t v6 = 5LL;
      break;
    case 3uLL:
      unint64_t v6 = 3LL;
      break;
    case 4uLL:
      if ([v3 mediaSubtypes] == (id)0x20000)
      {
        unint64_t v6 = 8LL;
      }

      else
      {
        BOOL v4 = [v3 mediaSubtypes] == (id)0x40000;
        uint64_t v5 = 6LL;
LABEL_10:
        if (v4) {
          unint64_t v6 = v5 + 1;
        }
        else {
          unint64_t v6 = v5;
        }
      }

      break;
    case 5uLL:
      unint64_t v6 = 4LL;
      break;
    default:
      unint64_t v6 = 0LL;
      break;
  }

  return v6;
}

+ (void)animateAlbumHeader:(id)a3 focusedCellFrame:(CGRect)a4 adjustedHeaderFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  id v14 = a3;
  id v15 = [v14 tag];
  double v16 = 50.0;
  if (v15 != (id)10) {
    double v16 = 30.0;
  }
  v34.origin.CGFloat x = v12 + -20.0;
  v34.origin.CGFloat y = v11 - v16;
  v34.size.CGFloat width = v10 + 40.0;
  v34.size.CGFloat height = v9 + v16;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  BOOL v17 = CGRectIntersectsRect(v33, v34);
  id v18 = [v14 tag];
  if (v17 || v12 < 0.0)
  {
    if (v18 != (id)10)
    {
      [v14 frame];
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      uint64_t v24 = v23;
      double v26 = v25 + -27.0;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100041FC0;
      v27[3] = &unk_1000CB3A8;
      id v28 = v14;
      uint64_t v29 = v20;
      double v30 = v26;
      uint64_t v31 = v22;
      uint64_t v32 = v24;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196608LL,  v27,  0LL,  0.1,  0.0);
    }
  }

  else if (v18 == (id)10)
  {
    [a1 animateToBottom:v14];
  }
}

+ (void)animateToBottom:(id)a3
{
  id v3 = a3;
  [v3 frame];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004209C;
  v9[3] = &unk_1000CB3A8;
  id v10 = v3;
  uint64_t v11 = v4;
  double v12 = v5 + 27.0;
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  id v8 = v3;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196608LL,  v9,  0LL,  0.1,  0.0);
}

+ (void)activityBannerImageFromAssets:(id)a3 imageManager:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v52 = a4;
  double v9 = (void (**)(id, void))a5;
  v47 = v8;
  if ((unint64_t)[v8 count] < 2)
  {
    v9[2](v9, 0LL);
  }

  else
  {
    v46 = v9;
    v51 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
    uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, v10);
    [v11 setNetworkAccessAllowed:1];
    [v11 setDeliveryMode:1];
    v50 = v11;
    [v11 setAllowSecondaryDegradedImage:1];
    double v12 = dispatch_group_create();
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id obj = v8;
    id v13 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v62;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v62 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)v15);
          dispatch_group_enter(v12);
          BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
          [v17 bounds];
          double v19 = v18;
          double v21 = v20;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
          id v23 = [v22 scale];
          double v25 = PXSizeScale(v23, v19, v21, v24);
          double v27 = v26;
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472LL;
          v57[2] = sub_100042618;
          v57[3] = &unk_1000CB3D0;
          id v60 = a1;
          v58 = v51;
          v59 = v12;
          objc_msgSend( v52,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v16,  0,  v50,  v57,  v25,  v27);

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      }

      while (v13);
    }

    dispatch_time_t v28 = dispatch_time(0LL, 60000000000LL);
    dispatch_group_wait(v12, v28);
    uint64_t v30 = objc_opt_class(a1, v29);
    id obja = (id)objc_claimAutoreleasedReturnValue(v30);
    objc_sync_enter(obja);
    if ((unint64_t)-[NSMutableArray count](v51, "count") < 2)
    {
      v46[2](v46, 0LL);
    }

    else
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      uint64_t v32 = CGBitmapContextCreate(0LL, 0x6CCuLL, 0x23DuLL, 8uLL, 0LL, DeviceRGB, 0x2006u);
      CGColorSpaceRelease(DeviceRGB);
      CGContextSetInterpolationQuality(v32, kCGInterpolationHigh);
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      CGRect v33 = v51;
      id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v53,  v65,  16LL);
      if (v34)
      {
        uint64_t v35 = *(void *)v54;
        double height = CGSizeZero.height;
        double v37 = 0.0;
        do
        {
          v38 = 0LL;
          do
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(v33);
            }
            uint64_t v39 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)v38);
            id v40 = objc_msgSend( [TVImageScaleDecorator alloc],  "initWithScaleToSize:scaleMode:",  3,  1740.0 / (double)(unint64_t)-[NSMutableArray count](v33, "count"),  573.0);
            id v41 = objc_claimAutoreleasedReturnValue( objc_msgSend( v40, "decorate:scaledWithSize:croppedToFit:", v39, 0, CGSizeZero.width, height));
            v42 = (CGImage *)[v41 image];
            v67.size.CGFloat width = 1740.0 / (double)(unint64_t)-[NSMutableArray count](v33, "count");
            v67.origin.CGFloat y = 0.0;
            v67.origin.CGFloat x = v37;
            v67.size.double height = 573.0;
            CGContextDrawImage(v32, v67, v42);
            id v43 = -[NSMutableArray count](v33, "count");

            double v37 = v37 + 1740.0 / (double)(unint64_t)v43;
            v38 = (char *)v38 + 1;
          }

          while (v34 != v38);
          id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v53,  v65,  16LL);
        }

        while (v34);
      }

      Image = CGBitmapContextCreateImage(v32);
      CGContextRelease(v32);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](&OBJC_CLASS___UIImage, "imageWithCGImage:", Image));
      CGImageRelease(Image);
      ((void (**)(id, void *))v46)[2](v46, v45);
    }

    objc_sync_exit(obja);

    double v9 = v46;
  }
}

+ (id)photoLibraryEmptyViewWithBounds:(CGRect)a3 title:(id)a4 message:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  id v11 = a4;
  double v12 = -[TVPErrorView initWithFrame:](objc_alloc(&OBJC_CLASS___TVPErrorView), "initWithFrame:", x, y, width, height);
  -[TVPErrorView setErrorTitle:](v12, "setErrorTitle:", v11);

  -[TVPErrorView setErrorMessage:](v12, "setErrorMessage:", v10);
  return v12;
}

+ (id)photoLibraryEmptyViewInView:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subviews", 0));
  id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVPErrorView, v4);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

+ (BOOL)isValidIndexPath:(id)a3 collectionView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if (((unint64_t)[v5 section] & 0x8000000000000000) != 0
      || (id v9 = [v5 section], (uint64_t)v9 >= (uint64_t)objc_msgSend(v7, "numberOfSections"))
      || ((unint64_t)[v5 item] & 0x8000000000000000) != 0)
    {
      BOOL v8 = 0;
    }

    else
    {
      id v10 = [v5 item];
      BOOL v8 = (uint64_t)v10 < (uint64_t)objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v5, "section"));
    }
  }

  return v8;
}

+ (void)refreshSlideshowPreviewWithPhotoAssets:(id)a3 navigationController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v6 && v7)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers", 0));
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v11 = v9;
      uint64_t v12 = *(void *)v19;
      do
      {
        __int128 v13 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          __int128 v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v13);
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___TVPSlideshowSettingsViewController, v10);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0
            || (uint64_t v17 = objc_opt_class(&OBJC_CLASS___TVPSlideshowMarimbaViewController, v16),
                (objc_opt_isKindOfClass(v14, v17) & 1) != 0))
          {
            [v14 refreshPhotoAssets:v5];
          }

          __int128 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v11);
    }
  }
}

+ (id)photoLibraryEmptyViewWithBounds:(CGRect)a3 title:(id)a4 messageFormat:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v12, "activeAccount"));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 username]);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 username]);
    uint64_t v16 = PXStringWithValidatedFormat(v10, @"%@");
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"TVPDefaultEmptyMessage" value:&stru_1000CC6C8 table:0]);
  }

  __int128 v18 = (void *)v17;

  __int128 v19 = -[TVPErrorView initWithFrame:](objc_alloc(&OBJC_CLASS___TVPErrorView), "initWithFrame:", x, y, width, height);
  -[TVPErrorView setErrorTitle:](v19, "setErrorTitle:", v11);

  -[TVPErrorView setErrorMessage:](v19, "setErrorMessage:", v18);
  return v19;
}

+ (id)embedPhotosLoadingViewInView:(id)a3 topMargin:(double)a4 message:(id)a5
{
  id v7 = a5;
  id v85 = a3;
  BOOL v8 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8, "topAnchor"));
  id v10 = &ACAccountStoreDidChangeNotification_ptr;
  id v11 = &ACAccountStoreDidChangeNotification_ptr;
  v84 = v7;
  if ([v7 length])
  {
    id v86 = a1;
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___TVPVibrantLabel);
    -[TVPVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:]( v12,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVPVibrantLabel setNumberOfLines:](v12, "setNumberOfLines:", 0LL);
    v88 = (void *)v9;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    -[TVPVibrantLabel setTextColor:](v12, "setTextColor:", v13);

    -[TVPVibrantLabel setTextAlignment:](v12, "setTextAlignment:", 1LL);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title3Font](&OBJC_CLASS___TVPThemeManager, "title3Font"));
    -[TVPVibrantLabel setFont:](v12, "setFont:", v14);

    -[TVPVibrantLabel setText:](v12, "setText:", v7);
    LODWORD(v15) = 1148846080;
    -[TVPVibrantLabel setContentCompressionResistancePriority:forAxis:]( v12,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v15);
    -[UIView addSubview:](v8, "addSubview:", v12);
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel leadingAnchor](v12, "leadingAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8, "leadingAnchor"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v82 constraintEqualToAnchor:v79]);
    v93[0] = v16;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel trailingAnchor](v12, "trailingAnchor"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8, "trailingAnchor"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18]);
    v93[1] = v19;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel firstBaselineAnchor](v12, "firstBaselineAnchor"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8, "topAnchor"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21 constant:104.0]);
    v93[2] = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 3LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v23);

    id v11 = &ACAccountStoreDidChangeNotification_ptr;
    id v10 = &ACAccountStoreDidChangeNotification_ptr;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel bottomAnchor](v12, "bottomAnchor"));
    a1 = v86;
    double v24 = 50.0;
  }

  else
  {
    double v24 = 0.0;
  }

  v89 = (void *)v9;
  double v25 = (void *)objc_claimAutoreleasedReturnValue([a1 _vibrantEffectView]);
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UIView addSubview:](v8, "addSubview:", v25);
  v70 = (NSString **)v10[126];
  v80 = (void *)objc_claimAutoreleasedReturnValue([v25 leadingAnchor]);
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8, "leadingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v76]);
  v92[0] = v73;
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 trailingAnchor]);
  double v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8, "trailingAnchor"));
  dispatch_time_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v27]);
  v92[1] = v28;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v25 topAnchor]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v9 constant:v24]);
  v92[2] = v30;
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v25 bottomAnchor]);
  v87 = v8;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8, "bottomAnchor"));
  CGRect v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32]);
  v92[3] = v33;
  id v34 = (void *)objc_claimAutoreleasedReturnValue([(id)v11[98] arrayWithObjects:v92 count:4]);
  [v70 activateConstraints:v34];

  uint64_t v35 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v35,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v25 contentView]);
  [v36 addSubview:v35];

  v77 = (void *)objc_claimAutoreleasedReturnValue([v25 contentView]);
  v74 = (void *)objc_claimAutoreleasedReturnValue([v77 leadingAnchor]);
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](v35, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v74 constraintEqualToAnchor:v71]);
  v91[0] = v68;
  v66 = (void *)objc_claimAutoreleasedReturnValue([v25 contentView]);
  __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v66 trailingAnchor]);
  __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](v35, "trailingAnchor"));
  double v37 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToAnchor:v62]);
  v91[1] = v37;
  v38 = v25;
  v83 = v25;
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v25 contentView]);
  id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 topAnchor]);
  id v41 = v35;
  v81 = v35;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView topAnchor](v35, "topAnchor"));
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v42]);
  v91[2] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue([v38 contentView]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 bottomAnchor]);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](v41, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v46]);
  v91[3] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v48);

  [v85 addSubview:v87];
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v87, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v85 leadingAnchor]);
  v72 = (void *)objc_claimAutoreleasedReturnValue([v78 constraintGreaterThanOrEqualToAnchor:v75]);
  v90[0] = v72;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v87, "trailingAnchor"));
  CGRect v67 = (void *)objc_claimAutoreleasedReturnValue([v85 trailingAnchor]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v69 constraintLessThanOrEqualToAnchor:v67]);
  v90[1] = v65;
  __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v87, "topAnchor"));
  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v85 topAnchor]);
  id v60 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintGreaterThanOrEqualToAnchor:v61]);
  v90[2] = v60;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v87, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v85 bottomAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintLessThanOrEqualToAnchor:v50]);
  v90[3] = v51;
  id v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v87, "centerYAnchor"));
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v85 centerYAnchor]);
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v53]);
  v90[4] = v54;
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v87, "centerXAnchor"));
  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v85 centerXAnchor]);

  v57 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v56]);
  v90[5] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 6LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v58);

  -[UIActivityIndicatorView startAnimating](v81, "startAnimating");
  return v87;
}

+ (id)_vibrantEffectView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 1000LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v2));

  uint64_t v4 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v3);
  -[UIVisualEffectView setAutoresizingMask:](v4, "setAutoresizingMask:", 18LL);

  return v4;
}

@end
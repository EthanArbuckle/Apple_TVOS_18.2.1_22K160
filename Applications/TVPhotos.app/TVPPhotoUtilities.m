@interface TVPPhotoUtilities
+ (CGRect)getFrameForCommentsLabel:(CGRect)a3 textSize:(CGSize)a4;
+ (CGSize)getAttributedTextSize:(id)a3 font:(id)a4 maxWidth:(double)a5;
+ (id)_photoCollectionLabelWithText:(id)a3;
+ (id)_vibrantEffectView;
+ (id)formattedDateRangeForMomentClusterStartDate:(id)a3 endDate:(id)a4;
+ (id)formattedDateStringForMomentStartDate:(id)a3;
+ (id)formattedLocationInfoForLocationNames:(id)a3;
+ (id)getFormattedAssetCountStringForPhotoCount:(int64_t)a3 videoCount:(int64_t)a4;
+ (id)getPhotoBannerButtonWithTitle:(id)a3;
+ (id)sharedPhotoStreamCollectionViewWithDataSource:(id)a3 delegate:(id)a4 itemSize:(CGSize)a5 contentInset:(UIEdgeInsets)a6 frame:(CGRect)a7;
+ (id)tvPhotoLibrary;
+ (id)vibrantLabelWithText:(id)a3;
@end

@implementation TVPPhotoUtilities

+ (CGSize)getAttributedTextSize:(id)a3 font:(id)a4 maxWidth:(double)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a4,  NSFontAttributeName,  0LL));
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a5, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

+ (CGRect)getFrameForCommentsLabel:(CGRect)a3 textSize:(CGSize)a4
{
  float v4 = (a3.size.width - a4.width) * 0.5;
  double v5 = floorf(v4);
  float v6 = (a3.size.height - a4.height) * 0.5;
  double v7 = floorf(v6) + -3.0;
  double width = a4.width;
  double height = a4.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v7;
  result.origin.x = v5;
  return result;
}

+ (id)getFormattedAssetCountStringForPhotoCount:(int64_t)a3 videoCount:(int64_t)a4
{
  return (id)PLLocalizedCountDescription(a3, a4, 0LL, 1LL, 0LL);
}

+ (id)getPhotoBannerButtonWithTitle:(id)a3
{
  id v3 = a3;
  float v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
  [v4 setTitle:v3 forState:0];

  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  float v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  [v5 setFont:v6];

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  [v7 setCornerRadius:6.0];

  return v4;
}

+ (id)vibrantLabelWithText:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "_vibrantEffectView");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contentView]);
  id v10 = objc_msgSend((id)objc_opt_class(a1, v9), "_photoCollectionLabelWithText:", v4);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  [v8 addSubview:v11];
  return v7;
}

+ (id)sharedPhotoStreamCollectionViewWithDataSource:(id)a3 delegate:(id)a4 itemSize:(CGSize)a5 contentInset:(UIEdgeInsets)a6 frame:(CGRect)a7
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  double height = a5.height;
  double width = a5.width;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setItemSize:](v16, "setItemSize:", width, height);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v16, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v16, "setMinimumLineSpacing:", 50.0);
  -[UICollectionViewFlowLayout setScrollDirection:](v16, "setScrollDirection:", 1LL);
  -[UICollectionViewFlowLayout setSectionInset:](v16, "setSectionInset:", top, left, bottom, right);
  v17 = -[TVPCollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___TVPCollectionView),  "initWithFrame:collectionViewLayout:",  v16,  a7.origin.x,  a7.origin.y,  a7.size.width,  a7.size.height);
  -[TVPCollectionView setDataSource:](v17, "setDataSource:", v15);

  -[TVPCollectionView setDelegate:](v17, "setDelegate:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVPCollectionView setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[TVPCollectionView setClipsToBounds:](v17, "setClipsToBounds:", 0LL);
  return v17;
}

+ (id)tvPhotoLibrary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "sharedPhotoLibrary"));
  uint64_t v4 = 0LL;
  [v2 openAndWaitWithUpgrade:0 error:&v4];
  return v2;
}

+ (id)formattedLocationInfoForLocationNames:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    if ([v4 count] == (id)1)
    {
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    }

    else
    {
      id v6 = objc_alloc(&OBJC_CLASS___NSMutableString);
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
      uint64_t v5 = -[NSMutableString initWithString:](v6, "initWithString:", v7);

      if ((char *)[v4 count] - 3 <= (char *)0xFFFFFFFFFFFFFFFDLL)
      {
        unint64_t v8 = 1LL;
        do
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"PhotosLocationCommaSeparatorFormat" value:&stru_1000CC6C8 table:0]);
          double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v8]);
          -[__CFString appendFormat:](v5, "appendFormat:", v10, v11);

          ++v8;
        }

        while ((char *)v8 < (char *)[v4 count] - 1);
      }

      id v12 = [v4 count];
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v14 = v13;
      else {
        id v15 = @"PhotosLocationAmpersandSeparatorFormat";
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:v15 value:&stru_1000CC6C8 table:0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);
      -[__CFString appendFormat:](v5, "appendFormat:", v16, v17);
    }
  }

  else
  {
    uint64_t v5 = &stru_1000CC6C8;
  }

  return v5;
}

+ (id)formattedDateStringForMomentStartDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (qword_100103280 != -1)
  {
    dispatch_once(&qword_100103280, &stru_1000CB030);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0LL;
    goto LABEL_6;
  }

  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100103278 stringFromDate:v4]);
LABEL_6:

  return v5;
}

+ (id)formattedDateRangeForMomentClusterStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100103290 != -1) {
    dispatch_once(&qword_100103290, &stru_1000CB050);
  }
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 components:28 fromDate:v5]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 components:28 fromDate:v6]);

  id v11 = [v8 day];
  id v12 = [v10 day];
  id v13 = [v10 year];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100103288 stringFromDate:v5]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100103288 stringFromDate:v6]);
  if ([v14 isEqualToString:v15])
  {
    if (v11 == v12) {
      v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %lu, %lu",  v14,  v11,  v13,  v19,  v20);
    }
    else {
      v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %lu – %lu, %lu",  v14,  v11,  v12,  v13,  v20);
    }
  }

  else
  {
    v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %lu - %@ %lu, %lu",  v14,  v11,  v15,  v12,  v13);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

+ (id)_photoCollectionLabelWithText:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
  -[UILabel setFont:](v4, "setFont:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v4, "setBackgroundColor:", v6);

  -[UILabel setText:](v4, "setText:", v3);
  return v4;
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
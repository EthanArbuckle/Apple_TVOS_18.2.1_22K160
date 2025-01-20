@interface TVHPosterLockupConfigurator
+ (void)configurePhotoPosterLockup:(id)a3 withMediaEntity:(id)a4 mediaLibrary:(id)a5 includeTitle:(BOOL)a6;
+ (void)configurePosterLockup:(id)a3 withMediaEntity:(id)a4 mediaLibrary:(id)a5;
+ (void)configurePosterLockup:(id)a3 withMediaEntity:(id)a4 mediaLibrary:(id)a5 subtitle:(id)a6;
@end

@implementation TVHPosterLockupConfigurator

+ (void)configurePosterLockup:(id)a3 withMediaEntity:(id)a4 mediaLibrary:(id)a5
{
  id v24 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 type]);
  if ([v9 mediaEntityCollectionType] == (id)5)
  {
    id v10 = [v7 playlistType];
    BOOL v12 = v10 == (id)5 || v10 == (id)3;
  }

  else
  {
    BOOL v12 = 1;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v24 layout]);
  [v13 contentViewSize];
  double v15 = v14;
  double v17 = v16;

  if (v12)
  {
    [v24 cornerRadius];
    double v19 = v18;
    [v24 focusedSizeIncrease];
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:",  v7,  v8,  2LL,  v15,  v17,  v19,  v20));
  }

  else
  {
    v21 = 0LL;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvh_displayTitle"));
  [v24 setTitle:v22];

  [v24 setImageProxy:v21];
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForMediaEntity:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForMediaEntity:containerSize:",  v7,  v15,  v17));
  [v24 setPlaceholder:v23];
}

+ (void)configurePosterLockup:(id)a3 withMediaEntity:(id)a4 mediaLibrary:(id)a5 subtitle:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  [a1 configurePosterLockup:v11 withMediaEntity:a4 mediaLibrary:a5];
  [v11 setSubtitle:v10];
}

+ (void)configurePhotoPosterLockup:(id)a3 withMediaEntity:(id)a4 mediaLibrary:(id)a5 includeTitle:(BOOL)a6
{
  BOOL v6 = a6;
  id v24 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 type]);
  BOOL v12 = [v11 mediaEntityCollectionType] != (id)5
     || ((unint64_t)[v9 playlistType] & 0xFFFFFFFFFFFFFFFDLL) == 5;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v24 layout]);
  [v13 contentViewSize];
  double v15 = v14;
  double v17 = v16;

  if (v12)
  {
    [v24 cornerRadius];
    double v19 = v18;
    [v24 focusedSizeIncrease];
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:",  v9,  v10,  3LL,  v15,  v17,  v19,  v20));
  }

  else
  {
    v21 = 0LL;
  }

  [v24 setImageProxy:v21];
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForMediaEntity:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForMediaEntity:containerSize:",  v9,  v15,  v17));
  [v24 setPlaceholder:v22];
  if (v6) {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvh_displayTitle"));
  }
  else {
    v23 = 0LL;
  }
  [v24 setTitle:v23];
  objc_msgSend(v24, "setOverlayType:", objc_msgSend(v9, "tvh_isVideoItem"));
}

@end
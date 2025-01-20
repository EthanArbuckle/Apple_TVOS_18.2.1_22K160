@interface TVPOneupViewCachingManager
- (CGSize)targetSize;
- (NSSet)previousPreheatAssets;
- (TVPOneupView)oneupView;
- (TVPOneupViewCachingManagerDataSource)dataSource;
- (id)animatedImageRequestOptions;
- (id)autoloopVideoRequestOptions;
- (id)currentProgressHandler;
- (id)livePhotoRequestOptions;
- (id)requestOptions;
- (int64_t)contentMode;
- (void)_updateCachedAssets;
- (void)setDataSource:(id)a3;
- (void)setOneupView:(id)a3;
- (void)setPreviousPreheatAssets:(id)a3;
@end

@implementation TVPOneupViewCachingManager

- (CGSize)targetSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  id v7 = [v2 scale];
  double v9 = PXSizeScale(v7, v4, v6, v8);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (int64_t)contentMode
{
  return 0LL;
}

- (id)currentProgressHandler
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100022248;
  v5[3] = &unk_1000CA3E0;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  double v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)requestOptions
{
  double v3 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, a2);
  [v3 setNetworkAccessAllowed:1];
  [v3 setDeliveryMode:0];
  [v3 setAllowSecondaryDegradedImage:1];
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager currentProgressHandler](self, "currentProgressHandler"));
  [v3 setProgressHandler:v4];

  return v3;
}

- (id)livePhotoRequestOptions
{
  double v3 = objc_alloc_init(&OBJC_CLASS___PHLivePhotoRequestOptions);
  -[PHLivePhotoRequestOptions setNetworkAccessAllowed:](v3, "setNetworkAccessAllowed:", 1LL);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager currentProgressHandler](self, "currentProgressHandler"));
  -[PHLivePhotoRequestOptions setProgressHandler:](v3, "setProgressHandler:", v4);

  return v3;
}

- (id)animatedImageRequestOptions
{
  double v3 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, a2);
  [v3 setNetworkAccessAllowed:1];
  [v3 setVersion:2];
  [v3 setSynchronous:0];
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager currentProgressHandler](self, "currentProgressHandler"));
  [v3 setProgressHandler:v4];

  return v3;
}

- (id)autoloopVideoRequestOptions
{
  double v3 = (void *)objc_opt_new(&OBJC_CLASS___PHVideoRequestOptions, a2);
  [v3 setNetworkAccessAllowed:1];
  [v3 setVideoComplementAllowed:1];
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager currentProgressHandler](self, "currentProgressHandler"));
  [v3 setProgressHandler:v4];

  return v3;
}

- (void)_updateCachedAssets
{
  if ((-[TVPOneupView focusedItemIndex](self->_oneupView, "focusedItemIndex") & 0x8000000000000000LL) == 0)
  {
    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    int64_t v3 = -[TVPOneupView focusedItemIndex](self->_oneupView, "focusedItemIndex");
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager dataSource](self, "dataSource"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 oneUpViewCachingManager:self assetAtIndex:v3]);

    if (v5) {
      -[NSMutableSet addObject:](v34, "addObject:", v5);
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self->_oneupView, "dataSource"));
    id v7 = [v6 numberOfItemsInOneupView:self->_oneupView];

    uint64_t v8 = 0LL;
    int64_t v9 = v3 + 1;
    do
    {
      if (v9 + v8 < (uint64_t)v7)
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager dataSource](self, "dataSource"));
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 oneUpViewCachingManager:self assetAtIndex:v9 + v8]);

        if (v11)
        {
          -[NSMutableSet addObject:](v34, "addObject:", v11);
          double v5 = (void *)v11;
        }

        else
        {
          double v5 = 0LL;
        }
      }

      ++v8;
    }

    while (v8 != 4);
    for (uint64_t i = -1LL; i != -5; --i)
    {
      if (v3 + i >= 0)
      {
        double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager dataSource](self, "dataSource"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 oneUpViewCachingManager:self assetAtIndex:v3 + i]);

        if (v14)
        {
          -[NSMutableSet addObject:](v34, "addObject:", v14);
          double v5 = (void *)v14;
        }

        else
        {
          double v5 = 0LL;
        }
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", self->_previousPreheatAssets));
    [v15 minusSet:v34];
    -[NSMutableSet minusSet:](v34, "minusSet:", self->_previousPreheatAssets);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 allObjects]);
    -[TVPOneupViewCachingManager targetSize](self, "targetSize");
    double v19 = v18;
    double v21 = v20;
    int64_t v22 = -[TVPOneupViewCachingManager contentMode](self, "contentMode");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager requestOptions](self, "requestOptions"));
    objc_msgSend(v16, "stopCachingImagesForAssets:targetSize:contentMode:options:", v17, v22, v23, v19, v21);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v34, "allObjects"));
    -[TVPOneupViewCachingManager targetSize](self, "targetSize");
    double v27 = v26;
    double v29 = v28;
    int64_t v30 = -[TVPOneupViewCachingManager contentMode](self, "contentMode");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupViewCachingManager requestOptions](self, "requestOptions"));
    objc_msgSend(v24, "startCachingImagesForAssets:targetSize:contentMode:options:", v25, v30, v31, v27, v29);

    v32 = (NSSet *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithSet:]( &OBJC_CLASS___NSMutableSet,  "setWithSet:",  self->_previousPreheatAssets));
    -[NSSet minusSet:](v32, "minusSet:", v15);
    -[NSSet unionSet:](v32, "unionSet:", v34);
    previousPreheatAssets = self->_previousPreheatAssets;
    self->_previousPreheatAssets = v32;
  }

- (TVPOneupView)oneupView
{
  return self->_oneupView;
}

- (void)setOneupView:(id)a3
{
}

- (TVPOneupViewCachingManagerDataSource)dataSource
{
  return (TVPOneupViewCachingManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (NSSet)previousPreheatAssets
{
  return self->_previousPreheatAssets;
}

- (void)setPreviousPreheatAssets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
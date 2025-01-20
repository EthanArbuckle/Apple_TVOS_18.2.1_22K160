@interface TVPMemoriesTabPreviewManager
- (CGSize)previewSizeInPixels;
- (NSCache)previewAssetCache;
- (NSProgress)currentPreviewProgress;
- (PHMemory)memory;
- (PHMemory)presentedMemory;
- (TVPMemoriesTabPreviewManager)init;
- (TVPMemoriesTabPreviewManagerDelegate)delegate;
- (UIImage)previewImage;
- (id)_fetchCuratedPreviewAssetForMemory:(id)a3 completion:(id)a4;
- (id)_fetchImageForAsset:(id)a3 completion:(id)a4;
- (id)_waitForDebounce:(BOOL)a3 completion:(id)a4;
- (void)_reset;
- (void)_setPreviewImage:(id)a3 forMemory:(id)a4;
- (void)clearPreview;
- (void)dealloc;
- (void)setCurrentPreviewProgress:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMemory:(id)a3;
- (void)setPresentedMemory:(id)a3;
- (void)setPreviewImage:(id)a3;
- (void)setPreviewSizeInPixels:(CGSize)a3;
- (void)updateForMemory:(id)a3 defaultPreviewAsset:(id)a4 withDelay:(BOOL)a5;
@end

@implementation TVPMemoriesTabPreviewManager

- (TVPMemoriesTabPreviewManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabPreviewManager;
  v2 = -[TVPMemoriesTabPreviewManager init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_previewSizeInPixels = CGSizeZero;
    v4 = objc_alloc_init(&OBJC_CLASS___NSCache);
    previewAssetCache = v3->_previewAssetCache;
    v3->_previewAssetCache = v4;

    -[NSCache setCountLimit:](v3->_previewAssetCache, "setCountLimit:", 10LL);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("TVPMemoriesTab-CuratedPreviewAssetFetch", v7);
    assetFetchQueue = v3->_assetFetchQueue;
    v3->_assetFetchQueue = (OS_dispatch_queue *)v8;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabPreviewManager;
  -[TVPMemoriesTabPreviewManager dealloc](&v3, "dealloc");
}

- (void)updateForMemory:(id)a3 defaultPreviewAsset:(id)a4 withDelay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabPreviewManager memory](self, "memory"));
  unsigned __int8 v11 = [v10 isEqual:v8];

  if ((v11 & 1) == 0)
  {
    -[TVPMemoriesTabPreviewManager setMemory:](self, "setMemory:", v8);
    -[TVPMemoriesTabPreviewManager _reset](self, "_reset");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabPreviewManager memory](self, "memory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabPreviewManager presentedMemory](self, "presentedMemory"));
    unsigned __int8 v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      objc_initWeak(location, self);
      v38[0] = 0LL;
      v38[1] = v38;
      v38[2] = 0x3032000000LL;
      v38[3] = sub_100049F4C;
      v38[4] = sub_100049F5C;
      id v39 = 0LL;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  3LL));
      -[TVPMemoriesTabPreviewManager setCurrentPreviewProgress:](self, "setCurrentPreviewProgress:", v15);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100049F64;
      v33[3] = &unk_1000CB6E0;
      id v16 = v15;
      id v34 = v16;
      objc_copyWeak(&v37, location);
      v36 = v38;
      id v17 = v8;
      id v35 = v17;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100049FF0;
      v31[3] = &unk_1000C95F0;
      v18 = objc_retainBlock(v33);
      id v32 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabPreviewManager _waitForDebounce:completion:]( self,  "_waitForDebounce:completion:",  v5,  v31));
      [v16 addChild:v19 withPendingUnitCount:1];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100049FFC;
      v24[3] = &unk_1000CB730;
      id v20 = (id)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
      id v25 = v20;
      id v26 = v9;
      objc_copyWeak(&v30, location);
      v29 = v38;
      v21 = v18;
      id v28 = v21;
      id v22 = v16;
      id v27 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabPreviewManager _fetchCuratedPreviewAssetForMemory:completion:]( self,  "_fetchCuratedPreviewAssetForMemory:completion:",  v17,  v24));
      [v22 addChild:v23 withPendingUnitCount:1];
      v21[2](v21);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v37);

      _Block_object_dispose(v38, 8);
      objc_destroyWeak(location);
    }
  }
}

- (void)clearPreview
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabPreviewManager delegate](self, "delegate"));
  [v3 previewManagerDidUpdatePreview:self];
}

- (id)_fetchCuratedPreviewAssetForMemory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  1LL));
  id v9 = v8;
  if (v6)
  {
    objc_initWeak(&location, self);
    assetFetchQueue = (dispatch_queue_s *)self->_assetFetchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004A394;
    block[3] = &unk_1000CA900;
    objc_copyWeak(&v19, &location);
    id v11 = v9;
    id v16 = v11;
    id v17 = v6;
    id v18 = v7;
    dispatch_async(assetFetchQueue, block);
    v12 = v18;
    id v13 = v11;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  else
  {
    [v8 setCompletedUnitCount:1];
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }

  return v9;
}

- (id)_fetchImageForAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  1LL));
  id v9 = v8;
  if (v6)
  {
    double v10 = (double)(unint64_t)[v6 pixelWidth];
    double v11 = (double)(unint64_t)[v6 pixelHeight];
    -[TVPMemoriesTabPreviewManager previewSizeInPixels](self, "previewSizeInPixels");
    objc_msgSend(v6, "suggestedCropForTargetSize:");
    double v13 = v12 / v10;
    double v15 = v14 / v11;
    double v17 = v16 / v10;
    double v19 = v18 / v11;
    v21 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, v20);
    [v21 setDeliveryMode:1];
    [v21 setResizeMode:2];
    objc_msgSend(v21, "setNormalizedCropRect:", v13, v15, v17, v19);
    [v21 setNetworkAccessAllowed:1];
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
    -[TVPMemoriesTabPreviewManager previewSizeInPixels](self, "previewSizeInPixels");
    double v24 = v23;
    double v26 = v25;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10004A844;
    v34[3] = &unk_1000CB780;
    id v27 = v9;
    id v35 = v27;
    id v36 = v7;
    unsigned int v28 = objc_msgSend( v22,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v6,  1,  v21,  v34,  v24,  v26);

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10004A8A4;
    v32[3] = &unk_1000CB7A0;
    unsigned int v33 = v28;
    [v27 setCancellationHandler:v32];
    v29 = v36;
    id v30 = v27;
  }

  else
  {
    [v8 setCompletedUnitCount:1];
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }

  return v9;
}

- (id)_waitForDebounce:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  1LL));
  id v8 = v7;
  if (a3)
  {
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004AA84;
    v16[3] = &unk_1000CB7C8;
    objc_copyWeak(&v19, &location);
    id v9 = v8;
    id v17 = v9;
    double v18 = v6;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10004AAF0;
    v14[3] = &unk_1000C9528;
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v16,  0.1));
    id v15 = v10;
    [v9 setCancellationHandler:v14];
    double v11 = v15;
    id v12 = v9;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  else
  {
    [v7 setCompletedUnitCount:1];
    if (v6) {
      v6[2](v6);
    }
  }

  return v8;
}

- (void)_setPreviewImage:(id)a3 forMemory:(id)a4
{
  id v6 = a3;
  -[TVPMemoriesTabPreviewManager setPresentedMemory:](self, "setPresentedMemory:", a4);
  -[TVPMemoriesTabPreviewManager setPreviewImage:](self, "setPreviewImage:", v6);
}

- (void)_reset
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabPreviewManager currentPreviewProgress](self, "currentPreviewProgress"));
  [v3 cancel];

  -[TVPMemoriesTabPreviewManager setCurrentPreviewProgress:](self, "setCurrentPreviewProgress:", 0LL);
}

- (CGSize)previewSizeInPixels
{
  double width = self->_previewSizeInPixels.width;
  double height = self->_previewSizeInPixels.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviewSizeInPixels:(CGSize)a3
{
  self->_previewSizeInPixels = a3;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)setMemory:(id)a3
{
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
}

- (TVPMemoriesTabPreviewManagerDelegate)delegate
{
  return (TVPMemoriesTabPreviewManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSCache)previewAssetCache
{
  return self->_previewAssetCache;
}

- (PHMemory)presentedMemory
{
  return self->_presentedMemory;
}

- (void)setPresentedMemory:(id)a3
{
}

- (NSProgress)currentPreviewProgress
{
  return self->_currentPreviewProgress;
}

- (void)setCurrentPreviewProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface TVPCachingManager
- (BOOL)allowsCachingHighQualityImages;
- (CGSize)targetSize;
- (PHCachingImageManager)cachingImageManager;
- (PHImageRequestOptions)animatedImageRequestOptions;
- (PHImageRequestOptions)requestOptions;
- (PHLivePhotoRequestOptions)livePhotoRequestOptions;
- (PHVideoRequestOptions)autoloopVideoRequestOptions;
- (TVPCachingManager)init;
- (int)requestAnimatedImageForAsset:(id)a3 resultHandler:(id)a4;
- (int)requestAutoloopVideoForAsset:(id)a3 resultHandler:(id)a4;
- (int)requestImageForAsset:(id)a3 processingHandler:(id)a4 resultHandler:(id)a5;
- (int)requestImageForAsset:(id)a3 processingHandler:(id)a4 resultHandler:(id)a5 assetSize:(CGSize)a6;
- (int)requestLivePhotoForAsset:(id)a3 resultHandler:(id)a4;
- (int64_t)contentMode;
- (void)cancelImageRequest:(int)a3;
- (void)setAllowsCachingHighQualityImages:(BOOL)a3;
- (void)setCachingImageManager:(id)a3;
- (void)stopPrefetchingAssets;
@end

@implementation TVPCachingManager

- (TVPCachingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPCachingManager;
  v2 = -[TVPCachingManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PHCachingImageManager);
    cachingImageManager = v2->_cachingImageManager;
    v2->_cachingImageManager = v3;
  }

  return v2;
}

- (void)setAllowsCachingHighQualityImages:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
  [v4 setAllowsCachingHighQualityImages:v3];
}

- (BOOL)allowsCachingHighQualityImages
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
  unsigned __int8 v3 = [v2 allowsCachingHighQualityImages];

  return v3;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
  [v4 cancelImageRequest:v3];
}

- (int)requestImageForAsset:(id)a3 processingHandler:(id)a4 resultHandler:(id)a5
{
  return -[TVPCachingManager requestImageForAsset:processingHandler:resultHandler:assetSize:]( self,  "requestImageForAsset:processingHandler:resultHandler:assetSize:",  a3,  a4,  a5,  CGSizeZero.width,  CGSizeZero.height);
}

- (int)requestImageForAsset:(id)a3 processingHandler:(id)a4 resultHandler:(id)a5 assetSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    -[TVPCachingManager targetSize](self, "targetSize");
    double width = v15;
    double height = v16;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
  int64_t v18 = -[TVPCachingManager contentMode](self, "contentMode");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager requestOptions](self, "requestOptions"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10004373C;
  v23[3] = &unk_1000CB3F8;
  id v24 = v12;
  id v25 = v13;
  id v20 = v13;
  id v21 = v12;
  LODWORD(v18) = objc_msgSend( v17,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v11,  v18,  v19,  v23,  width,  height);

  return v18;
}

- (int)requestLivePhotoForAsset:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
  -[TVPCachingManager targetSize](self, "targetSize");
  double v10 = v9;
  double v12 = v11;
  int64_t v13 = -[TVPCachingManager contentMode](self, "contentMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager livePhotoRequestOptions](self, "livePhotoRequestOptions"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000438D8;
  v17[3] = &unk_1000CB420;
  id v18 = v6;
  id v15 = v6;
  LODWORD(v13) = objc_msgSend( v8,  "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:",  v7,  v13,  v14,  v17,  v10,  v12);

  return v13;
}

- (int)requestAnimatedImageForAsset:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager animatedImageRequestOptions](self, "animatedImageRequestOptions"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000439B8;
  v13[3] = &unk_1000CB448;
  id v14 = v6;
  id v10 = v6;
  int v11 = [v8 requestAnimatedImageForAsset:v7 options:v9 resultHandler:v13];

  return v11;
}

- (int)requestAutoloopVideoForAsset:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager autoloopVideoRequestOptions](self, "autoloopVideoRequestOptions"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100043A98;
  v13[3] = &unk_1000CB470;
  id v14 = v6;
  id v10 = v6;
  int v11 = [v8 requestPlayerItemForVideo:v7 options:v9 resultHandler:v13];

  return v11;
}

- (void)stopPrefetchingAssets
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
  [v2 stopCachingImagesForAllAssets];
}

- (CGSize)targetSize
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)contentMode
{
  return 0LL;
}

- (PHImageRequestOptions)requestOptions
{
  return 0LL;
}

- (PHLivePhotoRequestOptions)livePhotoRequestOptions
{
  return 0LL;
}

- (PHImageRequestOptions)animatedImageRequestOptions
{
  return 0LL;
}

- (PHVideoRequestOptions)autoloopVideoRequestOptions
{
  return 0LL;
}

- (PHCachingImageManager)cachingImageManager
{
  return self->_cachingImageManager;
}

- (void)setCachingImageManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
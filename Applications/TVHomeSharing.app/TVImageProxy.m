@interface TVImageProxy
+ (id)_tvh_imageDecoratorForMediaEntityImageLoadParams:(id)a3 imageDecoratorType:(unint64_t)a4 scaleToSize:(CGSize)a5 scaleMode:(int64_t)a6 cornerRadius:(double)a7 focusedSizeIncrease:(double)a8;
+ (id)_tvh_imageLoaderForMediaEntityImageLoadParams:(id)a3 mediaLibrary:(id)a4;
+ (id)_tvh_imageProxyWithMediaEntityImageLoadParams:(id)a3 mediaLibrary:(id)a4 imageDecoratorType:(unint64_t)a5 scaleToSize:(CGSize)a6 scaleMode:(int64_t)a7 cornerRadius:(double)a8 focusedSizeIncrease:(double)a9;
+ (id)tvh_fullSizeImageProxyForMediaEntities:(id)a3 mediaLibrary:(id)a4;
+ (id)tvh_fullSizeImageProxyForMediaEntity:(id)a3 mediaLibrary:(id)a4;
+ (id)tvh_imageProxyWithContributorName:(id)a3 mediaItem:(id)a4 scaleToSize:(CGSize)a5 focusedSizeIncrease:(double)a6;
+ (id)tvh_imageProxyWithMediaEntity:(id)a3 mediaLibrary:(id)a4 imageType:(unint64_t)a5 imageDecoratorType:(unint64_t)a6 scaleToSize:(CGSize)a7 scaleMode:(int64_t)a8 cornerRadius:(double)a9 focusedSizeIncrease:(double)a10;
+ (id)tvh_imageProxyWithMediaEntity:(id)a3 mediaLibrary:(id)a4 scaleToSize:(CGSize)a5;
+ (id)tvh_imageProxyWithMediaEntity:(id)a3 mediaLibrary:(id)a4 scaleToSize:(CGSize)a5 scaleMode:(int64_t)a6 cornerRadius:(double)a7 focusedSizeIncrease:(double)a8;
@end

@implementation TVImageProxy

+ (id)tvh_imageProxyWithMediaEntity:(id)a3 mediaLibrary:(id)a4 scaleToSize:(CGSize)a5
{
  return objc_msgSend( a1,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:",  a3,  a4,  2,  a5.width,  a5.height,  0.0,  0.0);
}

+ (id)tvh_imageProxyWithMediaEntity:(id)a3 mediaLibrary:(id)a4 scaleToSize:(CGSize)a5 scaleMode:(int64_t)a6 cornerRadius:(double)a7 focusedSizeIncrease:(double)a8
{
  double height = a5.height;
  double width = a5.width;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 type]);
  uint64_t v18 = objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType showEpisode](&OBJC_CLASS___TVHKMediaEntityType, "showEpisode"));
  if (v17 == (void *)v18)
  {
  }

  else
  {
    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType homeVideo](&OBJC_CLASS___TVHKMediaEntityType, "homeVideo"));

    if (v17 != v20)
    {
      uint64_t v21 = 0LL;
      goto LABEL_6;
    }
  }

  uint64_t v21 = 1LL;
LABEL_6:
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityImageLoadParams imageLoadParamsWithMediaEntity:imageType:]( &OBJC_CLASS___TVHKMediaEntityImageLoadParams,  "imageLoadParamsWithMediaEntity:imageType:",  v16,  v21));

  [v22 cutOutRect];
  if (CGRectIsEmpty(v26)) {
    uint64_t v23 = 0LL;
  }
  else {
    uint64_t v23 = 2LL;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_tvh_imageProxyWithMediaEntityImageLoadParams:mediaLibrary:imageDecoratorType:scaleToSize:scaleMode: cornerRadius:focusedSizeIncrease:",  v22,  v15,  v23,  a6,  width,  height,  a7,  a8));

  return v24;
}

+ (id)tvh_imageProxyWithMediaEntity:(id)a3 mediaLibrary:(id)a4 imageType:(unint64_t)a5 imageDecoratorType:(unint64_t)a6 scaleToSize:(CGSize)a7 scaleMode:(int64_t)a8 cornerRadius:(double)a9 focusedSizeIncrease:(double)a10
{
  double height = a7.height;
  double width = a7.width;
  id v19 = a4;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityImageLoadParams imageLoadParamsWithMediaEntity:imageType:]( &OBJC_CLASS___TVHKMediaEntityImageLoadParams,  "imageLoadParamsWithMediaEntity:imageType:",  a3,  a5));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_tvh_imageProxyWithMediaEntityImageLoadParams:mediaLibrary:imageDecoratorType:scaleToSize:scaleMode: cornerRadius:focusedSizeIncrease:",  v20,  v19,  a6,  a8,  width,  height,  a9,  a10));

  return v21;
}

+ (id)tvh_fullSizeImageProxyForMediaEntity:(id)a3 mediaLibrary:(id)a4
{
  return +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:",  a3,  a4,  CGSizeZero.width,  CGSizeZero.height);
}

+ (id)tvh_fullSizeImageProxyForMediaEntities:(id)a3 mediaLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_fullSizeImageProxyForMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVImageProxy,  "tvh_fullSizeImageProxyForMediaEntity:mediaLibrary:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12),  v6,  (void)v15));
        if (v13) {
          -[NSMutableArray addObject:](v7, "addObject:", v13);
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  return v7;
}

+ (id)tvh_imageProxyWithContributorName:(id)a3 mediaItem:(id)a4 scaleToSize:(CGSize)a5 focusedSizeIncrease:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKContributorImageLoadParams imageLoadParamsWithContributorName:mediaItem:]( &OBJC_CLASS___TVHKContributorImageLoadParams,  "imageLoadParamsWithContributorName:mediaItem:",  a3,  a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKContributorImageLoader sharedInstance]( &OBJC_CLASS___TVHKContributorImageLoader,  "sharedInstance"));
  id v11 = objc_msgSend( [TVHKCircularImageDecorator alloc],  "initWithScaleToSize:scaleMode:",  3,  width,  height);
  [v11 setFocusedSizeIncrease:a6];
  v12 = -[TVImageProxy initWithObject:imageLoader:groupType:]( objc_alloc(&OBJC_CLASS___TVImageProxy),  "initWithObject:imageLoader:groupType:",  v9,  v10,  0LL);
  -[TVImageProxy setDecorator:](v12, "setDecorator:", v11);

  return v12;
}

+ (id)_tvh_imageProxyWithMediaEntityImageLoadParams:(id)a3 mediaLibrary:(id)a4 imageDecoratorType:(unint64_t)a5 scaleToSize:(CGSize)a6 scaleMode:(int64_t)a7 cornerRadius:(double)a8 focusedSizeIncrease:(double)a9
{
  double height = a6.height;
  double width = a6.width;
  id v17 = a3;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_tvh_imageLoaderForMediaEntityImageLoadParams:mediaLibrary:", v17, a4));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_tvh_imageDecoratorForMediaEntityImageLoadParams:imageDecoratorType:scaleToSize:scaleMode:cornerRadi us:focusedSizeIncrease:",  v17,  a5,  a7,  width,  height,  a8,  a9));
  v20 = -[TVImageProxy initWithObject:imageLoader:groupType:]( objc_alloc(&OBJC_CLASS___TVImageProxy),  "initWithObject:imageLoader:groupType:",  v17,  v18,  0LL);

  -[TVImageProxy setDecorator:](v20, "setDecorator:", v19);
  return v20;
}

+ (id)_tvh_imageLoaderForMediaEntityImageLoadParams:(id)a3 mediaLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 imageType] == (id)1
    && [v5 mediaCategoryType] == (id)4
    && ![v5 mediaEntitySubtype]
    && [v5 isDRMProtected]
    && [v5 storeID])
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityStoreImageLoader sharedInstance]( &OBJC_CLASS___TVHKMediaEntityStoreImageLoader,  "sharedInstance"));
  }

  else
  {
    id v7 = v6;
  }

  id v8 = v7;

  return v8;
}

+ (id)_tvh_imageDecoratorForMediaEntityImageLoadParams:(id)a3 imageDecoratorType:(unint64_t)a4 scaleToSize:(CGSize)a5 scaleMode:(int64_t)a6 cornerRadius:(double)a7 focusedSizeIncrease:(double)a8
{
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  __int128 v15 = v14;
  if (a4 == 2)
  {
    [v14 cutOutRect];
    id v16 = objc_msgSend( [TVHKImageCutOutDecorator alloc],  "initWithCutOutFractionalRect:",  v18,  v19,  v20,  v21);
    objc_msgSend(v16, "setCutOutScaleToSize:", width, height);
    [v16 setCutOutCropToFit:1];
  }

  else if (a4 == 1)
  {
    id v16 = objc_msgSend( [TVHKCircularImageDecorator alloc],  "initWithScaleToSize:scaleMode:",  2,  width,  height);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v16 setBgColor:v22];

    [v16 setFocusedSizeIncrease:a8];
  }

  else if (a4)
  {
    id v16 = 0LL;
  }

  else
  {
    id v16 = objc_msgSend( [TVImageScaleDecorator alloc],  "initWithScaleToSize:scaleMode:",  a6,  width,  height);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v16 setBgColor:v17];

    [v16 setFocusedSizeIncrease:a8];
    if (BSFloatGreaterThanFloat(a7, 0.0))
    {
      +[TVCornerUtilities radiiFromRadius:](&OBJC_CLASS___TVCornerUtilities, "radiiFromRadius:", a7);
      objc_msgSend(v16, "setCornerRadii:");
    }
  }

  return v16;
}

@end
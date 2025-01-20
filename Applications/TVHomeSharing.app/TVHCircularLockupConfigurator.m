@interface TVHCircularLockupConfigurator
+ (void)configureCircularLockup:(id)a3 withMediaEntity:(id)a4 mediaLibrary:(id)a5;
@end

@implementation TVHCircularLockupConfigurator

+ (void)configureCircularLockup:(id)a3 withMediaEntity:(id)a4 mediaLibrary:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvh_displayTitle"));
  [v9 setTitle:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 layout]);
  [v11 contentViewSize];
  double v13 = v12;
  double v15 = v14;

  id v18 = (id)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForMediaEntity:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForMediaEntity:containerSize:",  v8,  v13,  v15));
  [v9 setPlaceholder:v18];
  [v9 focusedSizeIncrease];
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:imageType:imageDecoratorType:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:imageType:imageDecoratorType:scaleToSize:scaleMode:corner Radius:focusedSizeIncrease:",  v8,  v7,  0LL,  1LL,  2LL,  v13,  v15,  0.0,  v16));

  [v9 setImageProxy:v17];
}

@end
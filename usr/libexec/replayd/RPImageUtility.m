@interface RPImageUtility
+ (id)getImageDataFromExtensionContainingAppBundleUrl:(id)a3;
@end

@implementation RPImageUtility

+ (id)getImageDataFromExtensionContainingAppBundleUrl:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)ISIcon) initWithURL:v3];

  v6 = (void *)objc_opt_new(&OBJC_CLASS___ISImageDescriptor, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 imageForImageDescriptor:v6]);
  v8 = (CGImage *)[v7 CGImage];
  if (v8)
  {
    v9 = sub_100035144(v8, 0LL, @"public.png", &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v14)
    {
      id v12 = v10;
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

@end
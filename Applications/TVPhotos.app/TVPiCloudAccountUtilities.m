@interface TVPiCloudAccountUtilities
+ (void)handleNetworkAvailabilityChangeWithRootController:(id)a3;
+ (void)refreshUIForReAuthentication:(id)a3 forceRefresh:(BOOL)a4;
@end

@implementation TVPiCloudAccountUtilities

+ (void)refreshUIForReAuthentication:(id)a3 forceRefresh:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v10 topViewController]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVPRootViewController, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0 || v4)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___TVPRootViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v9 addObject:v8];
    [v10 setViewControllers:v9 animated:0];
  }
}

+ (void)handleNetworkAvailabilityChangeWithRootController:(id)a3
{
}

@end
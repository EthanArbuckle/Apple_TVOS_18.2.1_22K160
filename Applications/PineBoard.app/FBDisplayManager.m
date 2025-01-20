@interface FBDisplayManager
+ (id)pb_transformToAppJailConfigurationIfNeeded:(id)a3;
@end

@implementation FBDisplayManager

+ (id)pb_transformToAppJailConfigurationIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pb_transformToAppJailConfigurationIfNeeded:", v4));

  return v6;
}

@end
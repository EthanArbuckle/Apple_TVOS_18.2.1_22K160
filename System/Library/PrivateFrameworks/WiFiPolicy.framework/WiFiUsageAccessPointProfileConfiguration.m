@interface WiFiUsageAccessPointProfileConfiguration
+ (id)getConfigForKey:(id)a3;
+ (void)initialize;
+ (void)setConfig:(id)a3;
@end

@implementation WiFiUsageAccessPointProfileConfiguration

+ (void)initialize
{
  v2 = (void *)_apProfileConfig;
  _apProfileConfig = 0LL;
}

+ (void)setConfig:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToDictionary:_apProfileConfig] & 1) == 0)
  {
    objc_storeStrong((id *)&_apProfileConfig, a3);
    +[WiFiUsageAccessPointProfile updateConfig](&OBJC_CLASS___WiFiUsageAccessPointProfile, "updateConfig");
    NSLog( @"%s: Updated WiFiUsageAccessPointProfile config from Mobile Assets",  "+[WiFiUsageAccessPointProfileConfiguration setConfig:]");
  }
}

+ (id)getConfigForKey:(id)a3
{
  id v3 = a3;
  if (_apProfileConfig)
  {
    [(id)_apProfileConfig objectForKey:v3];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      NSLog( @"%s: %@ does not contain %@",  "+[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]",  @"AccessPointProfile",  v3);
    }
  }

  else
  {
    NSLog( @"%s: Feature %@ hasn't been initialized yet, waiting on MobileAssets callback",  "+[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]",  @"AccessPointProfile");
    id v4 = 0LL;
  }

  return v4;
}

@end
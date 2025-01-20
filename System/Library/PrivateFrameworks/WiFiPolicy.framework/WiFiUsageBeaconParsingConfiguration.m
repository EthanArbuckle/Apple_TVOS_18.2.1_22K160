@interface WiFiUsageBeaconParsingConfiguration
+ (id)getConfigForKey:(id)a3;
+ (void)initialize;
+ (void)setConfig:(id)a3;
@end

@implementation WiFiUsageBeaconParsingConfiguration

+ (void)initialize
{
  v2 = (void *)_beaconParsing;
  _beaconParsing = 0LL;
}

+ (void)setConfig:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToDictionary:_beaconParsing] & 1) == 0)
  {
    objc_storeStrong((id *)&_beaconParsing, a3);
    +[WiFiUsageParsedBeacon updateConfig](&OBJC_CLASS___WiFiUsageParsedBeacon, "updateConfig");
    NSLog( @"%s: Updated WiFiUsageParsedBeacon config from Mobile Assets",  "+[WiFiUsageBeaconParsingConfiguration setConfig:]");
  }
}

+ (id)getConfigForKey:(id)a3
{
  id v3 = a3;
  if (_beaconParsing)
  {
    [(id)_beaconParsing objectForKey:v3];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      NSLog( @"%s: %@ does not contain %@",  "+[WiFiUsageBeaconParsingConfiguration getConfigForKey:]",  @"BeaconParsing",  v3);
    }
  }

  else
  {
    NSLog( @"%s: Feature %@ hasn't been initialized yet, waiting on MobileAssets callback",  "+[WiFiUsageBeaconParsingConfiguration getConfigForKey:]",  @"BeaconParsing");
    id v4 = 0LL;
  }

  return v4;
}

@end
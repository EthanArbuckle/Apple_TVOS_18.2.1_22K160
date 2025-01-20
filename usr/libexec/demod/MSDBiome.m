@interface MSDBiome
+ (id)collectAppUsageDataFrom:(id)a3 to:(id)a4;
@end

@implementation MSDBiome

+ (id)collectAppUsageDataFrom:(id)a3 to:(id)a4
{
  return +[MSDBiomeAppInFocusStream collectAppUsageDataFrom:to:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "collectAppUsageDataFrom:to:",  a3,  a4);
}

@end
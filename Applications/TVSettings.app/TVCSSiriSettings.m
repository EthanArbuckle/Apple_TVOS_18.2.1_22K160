@interface TVCSSiriSettings
+ (id)tvsettings_dataSharingStatusFormatter;
@end

@implementation TVCSSiriSettings

+ (id)tvsettings_dataSharingStatusFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100195130];
}

@end
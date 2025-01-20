@interface TVSPreferences
+ (id)sharedTVSettingsPreferences;
@end

@implementation TVSPreferences

+ (id)sharedTVSettingsPreferences
{
  if (qword_1001E1910 != -1) {
    dispatch_once(&qword_1001E1910, &stru_100192118);
  }
  return (id)qword_1001E1908;
}

@end
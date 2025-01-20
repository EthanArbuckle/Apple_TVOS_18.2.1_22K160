@interface TVSPreferences
+ (id)sharedWhatsNewPreferences;
@end

@implementation TVSPreferences

+ (id)sharedWhatsNewPreferences
{
  if (qword_10000DC10 != -1) {
    dispatch_once(&qword_10000DC10, &stru_1000082E8);
  }
  return (id)qword_10000DC00;
}

@end
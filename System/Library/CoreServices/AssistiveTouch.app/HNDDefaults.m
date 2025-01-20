@interface HNDDefaults
+ (id)sharedDefaults;
+ (void)initialize;
- (id)preferenceForKey:(id)a3;
- (void)setPreference:(id)a3 forKey:(id)a4;
@end

@implementation HNDDefaults

+ (void)initialize
{
  id v2 = [objc_allocWithZone((Class)HNDDefaults) init];
  v3 = (void *)qword_100157670;
  qword_100157670 = (uint64_t)v2;
}

+ (id)sharedDefaults
{
  return (id)qword_100157670;
}

- (id)preferenceForKey:(id)a3
{
  if (a3) {
    return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.handtool");
  }
  else {
    return 0LL;
  }
}

- (void)setPreference:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    CFPreferencesSetAppValue((CFStringRef)a4, a3, @"com.apple.handtool");
    CFPreferencesAppSynchronize(@"com.apple.handtool");
  }

@end
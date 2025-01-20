@interface VOTConfiguration
+ (id)rootConfiguration;
+ (void)initialize;
- (id)preferenceForKey:(id)a3;
- (void)setPreference:(id)a3 forKey:(id)a4;
- (void)setPreferenceSync:(id)a3 forKey:(id)a4;
@end

@implementation VOTConfiguration

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___VOTConfiguration, a2) == a1)
  {
    CFPreferencesAppSynchronize(kAXSAccessibilityPreferenceDomain);
    id v2 = [objc_allocWithZone((Class)VOTConfiguration) init];
    v3 = (void *)qword_1001ACC20;
    qword_1001ACC20 = (uint64_t)v2;

    dispatch_queue_t v4 = dispatch_queue_create("vot-preference-storage-queue", 0LL);
    v5 = (void *)qword_1001ACC28;
    qword_1001ACC28 = (uint64_t)v4;
  }

+ (id)rootConfiguration
{
  return (id)qword_1001ACC20;
}

- (id)preferenceForKey:(id)a3
{
  if (a3) {
    return (id)(id)CFPreferencesCopyAppValue( (CFStringRef)a3,  kAXSAccessibilityPreferenceDomain);
  }
  else {
    return 0LL;
  }
}

- (void)setPreference:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 copyWithZone:0];

    v8 = (dispatch_queue_s *)qword_1001ACC28;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100012790;
    v9[3] = &unk_100176DA8;
    id v10 = v6;
    id v5 = v7;
    id v11 = v5;
    dispatch_async(v8, v9);
  }
}

- (void)setPreferenceSync:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v5)
  {
    id v6 = [v8 copyWithZone:0];

    id v7 = (dispatch_queue_s *)qword_1001ACC28;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100012888;
    block[3] = &unk_100176DA8;
    id v10 = v5;
    id v8 = v6;
    id v11 = v8;
    dispatch_sync(v7, block);
  }
}

@end
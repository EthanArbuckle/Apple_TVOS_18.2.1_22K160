@interface NSUserDefaults(NSUserDefaults_NSURLExtras)
+ (__CFString)_web_preferredLanguageCode;
+ (void)_web_addDefaultsChangeObserver;
+ (void)_web_defaultsDidChange;
@end

@implementation NSUserDefaults(NSUserDefaults_NSURLExtras)

+ (void)_web_defaultsDidChange
{
  qword_18C496CA0 = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_127);
}

+ (void)_web_addDefaultsChangeObserver
{
  if (_web_addDefaultsChangeObserver_addDefaultsChangeObserverOnce != -1) {
    dispatch_once(&_web_addDefaultsChangeObserver_addDefaultsChangeObserverOnce, &__block_literal_global_54);
  }
}

+ (__CFString)_web_preferredLanguageCode
{
  v2 = (void *)[a1 standardUserDefaults];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_127);
  uint64_t v3 = qword_18C496CA0;
  v4 = (__CFString *)qword_18C496CA0;
  if (!qword_18C496CA0)
  {
    v5 = (void *)[v2 stringArrayForKey:@"AppleLanguages"];
    if ([v5 count]) {
      v4 = (__CFString *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", 0), "_web_HTTPStyleLanguageCode"),  "copy");
    }
    else {
      v4 = @"en";
    }
    qword_18C496CA0 = (uint64_t)v4;
  }

  v6 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_127);
  if (!v3) {
    objc_msgSend(a1, "_web_addDefaultsChangeObserver");
  }
  return v6;
}

@end
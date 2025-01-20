@interface UARPUpdaterServiceAFUPreferences
+ (id)sharedInstance;
- (NSURL)overriddenFirmwareAssetDirectoryURL;
- (UARPUpdaterServiceAFUPreferences)init;
@end

@implementation UARPUpdaterServiceAFUPreferences

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002474;
  block[3] = &unk_100004290;
  block[4] = a1;
  if (qword_100008B70 != -1) {
    dispatch_once(&qword_100008B70, block);
  }
  return (id)qword_100008B68;
}

- (UARPUpdaterServiceAFUPreferences)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPUpdaterServiceAFUPreferences;
  v2 = -[UARPUpdaterServiceAFUPreferences init](&v8, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.UARPUpdaterServiceAFU", "preferences");
    log = v2->_log;
    v2->_log = v3;

    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.accessoryupdater.UARPUpdaterServiceAFU");
    userPrefs = v2->_userPrefs;
    v2->_userPrefs = v5;
  }

  return v2;
}

- (NSURL)overriddenFirmwareAssetDirectoryURL
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userPrefs, "objectForKey:", @"OverrideAssetDirectoryURL"));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000029A8((uint64_t)v3, log);
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  }
  else {
    v6 = 0LL;
  }

  return (NSURL *)v6;
}

- (void).cxx_destruct
{
}

@end
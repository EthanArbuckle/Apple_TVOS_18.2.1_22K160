@interface SUCoreDDMUtilities
+ (BOOL)_forceSupervision;
+ (id)sharedLogger;
+ (void)postNotificationOfType:(unsigned __int16)a3;
+ (void)postNotificationOfType:(unsigned __int16)a3 description:(id)a4;
@end

@implementation SUCoreDDMUtilities

+ (id)sharedLogger
{
  if (sharedLogger_loggerOnce != -1) {
    dispatch_once(&sharedLogger_loggerOnce, &__block_literal_global_7);
  }
  return (id)sharedLogger_logger;
}

void __34__SUCoreDDMUtilities_sharedLogger__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1896127A0]) initWithCategory:@"DDM"];
  v1 = (void *)sharedLogger_logger;
  sharedLogger_logger = v0;
}

+ (void)postNotificationOfType:(unsigned __int16)a3
{
}

+ (void)postNotificationOfType:(unsigned __int16)a3 description:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  if (v5)
  {
    v6 = +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
    [v6 oslog];
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 > 4) {
        v8 = @"Unknown";
      }
      else {
        v8 = off_18A0F1108[(__int16)v4];
      }
      int v9 = 136315650;
      v10 = "+[SUCoreDDMUtilities postNotificationOfType:description:]";
      __int16 v11 = 2114;
      v12 = v8;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Posting %{public}@ for %{public}@",  (uint8_t *)&v9,  0x20u);
    }
  }

  if (v4 <= 4) {
    notify_post((const char *)-[__CFString UTF8String](*off_18A0F1130[(__int16)v4], "UTF8String"));
  }
}

+ (BOOL)_forceSupervision
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ForceSupervision", @"com.apple.sucore.ddm", 0LL);
  if (AppBooleanValue)
  {
    v3 = +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
    [v3 oslog];
    unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "+[SUCoreDDMUtilities _forceSupervision]";
      _os_log_impl(&dword_187A54000, v4, OS_LOG_TYPE_DEFAULT, "%s: forceSupervision is set", (uint8_t *)&v6, 0xCu);
    }
  }

  return AppBooleanValue != 0;
}

@end
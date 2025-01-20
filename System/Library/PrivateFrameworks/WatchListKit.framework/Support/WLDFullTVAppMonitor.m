@interface WLDFullTVAppMonitor
+ (id)sharedInstance;
- (WLDFullTVAppMonitor)init;
- (void)_activeAccountChangedNotification:(id)a3;
- (void)dealloc;
@end

@implementation WLDFullTVAppMonitor

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_9);
  }
  return (id)sharedInstance___sharedInstance;
}

void __37__WLDFullTVAppMonitor_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___WLDFullTVAppMonitor);
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;
}

- (WLDFullTVAppMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WLDFullTVAppMonitor;
  v2 = -[WLDFullTVAppMonitor init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v4 = WLKAccountMonitorAccountDidChange;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAccountMonitor sharedInstance](&OBJC_CLASS___WLKAccountMonitor, "sharedInstance"));
    [v3 addObserver:v2 selector:"_activeAccountChangedNotification:" name:v4 object:v5];

    +[WLKURLBagUtilities isFullTVAppEnabledwithCompletion:]( &OBJC_CLASS___WLKURLBagUtilities,  "isFullTVAppEnabledwithCompletion:",  &__block_literal_global_7);
  }

  return v2;
}

void __27__WLDFullTVAppMonitor_init__block_invoke(id a1, BOOL a2)
{
  BOOL v2 = a2;
  uint64_t v3 = WLKSystemLogObject(a1);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"Disabled";
    if (v2) {
      v5 = @"Enabled";
    }
    int v6 = 138412290;
    objc_super v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "WLDFullTVAppMonitor - Full TV App %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WLDFullTVAppMonitor;
  -[WLDFullTVAppMonitor dealloc](&v4, "dealloc");
}

- (void)_activeAccountChangedNotification:(id)a3
{
  dispatch_time_t v3 = dispatch_time(0LL, 5000000000LL);
  dispatch_after(v3, &_dispatch_main_q, &__block_literal_global_13);
}

void __57__WLDFullTVAppMonitor__activeAccountChangedNotification___block_invoke(id a1)
{
}

void __57__WLDFullTVAppMonitor__activeAccountChangedNotification___block_invoke_2(id a1, BOOL a2)
{
  BOOL v2 = a2;
  uint64_t v3 = WLKSystemLogObject(a1);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"Disabled";
    if (v2) {
      v5 = @"Enabled";
    }
    int v6 = 138412290;
    objc_super v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "WLDFullTVAppMonitor - Account changes. Full TV App %@",  (uint8_t *)&v6,  0xCu);
  }
}

@end
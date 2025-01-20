@interface PluginAnalytics
+ (id)sharedInstance;
- (void)_recordEvent:(id)a3 field:(id)a4 value:(id)a5;
- (void)recordSettingsChange:(id)a3 value:(id)a4;
@end

@implementation PluginAnalytics

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __33__PluginAnalytics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  return (id)sharedInstance_sharedInstance;
}

void __33__PluginAnalytics_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

- (void)recordSettingsChange:(id)a3 value:(id)a4
{
}

- (void)_recordEvent:(id)a3 field:(id)a4 value:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __44__PluginAnalytics__recordEvent_field_value___block_invoke;
  v9[3] = &unk_10580;
  id v10 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  AnalyticsSendEventLazy(a3, v9);
}

id __44__PluginAnalytics__recordEvent_field_value___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end
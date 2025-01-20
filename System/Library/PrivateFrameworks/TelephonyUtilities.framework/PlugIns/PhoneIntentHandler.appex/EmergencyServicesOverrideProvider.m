@interface EmergencyServicesOverrideProvider
- (NSArray)emergencyServicesOverrides;
@end

@implementation EmergencyServicesOverrideProvider

- (NSArray)emergencyServicesOverrides
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"Siri.PhoneIntentHandler.EmergencyServicesOverride"]);

  id v4 = IntentHandlerDefaultLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100020544(v3, v5);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000D1AC;
  v8[3] = &unk_100034758;
  v6 =  -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  v9 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];

  return (NSArray *)v6;
}

@end
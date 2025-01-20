@interface ATEnforcementService
+ (BOOL)isAppTrackingTransparencyEnforced;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)appTrackingTransparencyBag;
+ (int64_t)appTrackingTransparencyEnforcementReason;
+ (int64_t)reasonCodeFromNumberValue:(id)a3;
- (BOOL)isInternalInstall;
- (int64_t)numberOfDayFrom:(id)a3 andNow:(id)a4;
- (void)appTrackingEnforcement:(id)a3;
@end

@implementation ATEnforcementService

+ (NSString)bagSubProfile
{
  if (qword_100008DF0 != -1) {
    dispatch_once(&qword_100008DF0, &stru_1000042B8);
  }
  return (NSString *)(id)qword_100008DF8;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_100008E00 != -1) {
    dispatch_once(&qword_100008E00, &stru_1000042D8);
  }
  return (NSString *)(id)qword_100008E08;
}

+ (id)appTrackingTransparencyBag
{
  if (qword_100008E10 != -1) {
    dispatch_once(&qword_100008E10, &stru_1000042F8);
  }
  id v2 = [[AMSProcessInfo alloc] initWithBundleIdentifier:@"com.apple.AppTrackingTransparency.EnforcementService"];
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 executableName]);
  id v4 = [v3 length];

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 processName]);
    [v2 setExecutableName:v6];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ATEnforcementService bagSubProfile](&OBJC_CLASS___ATEnforcementService, "bagSubProfile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[ATEnforcementService bagSubProfileVersion]( &OBJC_CLASS___ATEnforcementService,  "bagSubProfileVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:processInfo:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:processInfo:",  v7,  v8,  v2));

  return v9;
}

+ (BOOL)isAppTrackingTransparencyEnforced
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 appTrackingTransparencyBag]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 BOOLForKey:@"IsAppTrackingTransparencyEnforced"]);
  id v11 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueWithError:&v11]);
  id v6 = v11;
  if (v5)
  {
    unsigned __int8 v7 = [v5 BOOLValue];
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      id v9 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Unable to get the 'IsAppTrackingTransparencyEnforced' value from the bag. Error: %@",  buf,  0x16u);
    }

    unsigned __int8 v7 = 1;
  }

  return v7;
}

+ (int64_t)appTrackingTransparencyEnforcementReason
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 appTrackingTransparencyBag]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 integerForKey:@"AppTrackingTransparencyEnforcementReason"]);
  id v11 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueWithError:&v11]);
  id v6 = v11;
  if (v5)
  {
    id v7 = [a1 reasonCodeFromNumberValue:v5];
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      id v9 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Unable to get the 'AppTrackingTransparencyEnforcementReason' value from the bag. Error: %@",  buf,  0x16u);
    }

    id v7 = 0LL;
  }

  return (int64_t)v7;
}

- (void)appTrackingEnforcement:(id)a3
{
  id v4 = (void (**)(id, id, id, uint64_t))a3;
  if (-[ATEnforcementService isInternalInstall](self, "isInternalInstall"))
  {
    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.AppTrackingTransparency");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v5, "objectForKey:", @"TrackingEnforced"));
    if (v6)
    {
      id v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v5, "objectForKey:", @"ReasonCode"));

      if (v8)
      {
        v4[2]( v4,  (id)-[NSUserDefaults BOOLForKey:](v5, "BOOLForKey:", @"TrackingEnforced"),  (id)-[NSUserDefaults integerForKey:](v5, "integerForKey:", @"ReasonCode"),  1LL);
        goto LABEL_15;
      }
    }
  }

  v5 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v20 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[ATKeychainStore objectForKey:error:]( &OBJC_CLASS___ATKeychainStore,  "objectForKey:error:",  @"EnforcementService.enforced",  &v20));
  id v10 = v20;
  id v19 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[ATKeychainStore objectForKey:error:]( &OBJC_CLASS___ATKeychainStore,  "objectForKey:error:",  @"EnforcementService.reasonCode",  &v19));
  id v12 = v19;

  id v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[ATKeychainStore objectForKey:error:]( &OBJC_CLASS___ATKeychainStore,  "objectForKey:error:",  @"EnforcementService.lastBagLookup",  &v18));
  id v14 = v18;

  if (v9 && v13 && !v14) {
    v4[2]( v4,  [v9 BOOLValue],  (id)+[ATEnforcementService reasonCodeFromNumberValue:]( ATEnforcementService,  "reasonCodeFromNumberValue:",  v11),  0);
  }
  else {
    v4[2](v4, (id)1, 0LL, 1LL);
  }
  if (-[ATEnforcementService numberOfDayFrom:andNow:](self, "numberOfDayFrom:andNow:", v13, v5) > 0 || !v13)
  {
    BOOL v15 = +[ATEnforcementService isAppTrackingTransparencyEnforced]( &OBJC_CLASS___ATEnforcementService,  "isAppTrackingTransparencyEnforced");
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[ATEnforcementService appTrackingTransparencyEnforcementReason]( &OBJC_CLASS___ATEnforcementService,  "appTrackingTransparencyEnforcementReason")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
    +[ATKeychainStore setObject:forKey:]( &OBJC_CLASS___ATKeychainStore,  "setObject:forKey:",  v17,  @"EnforcementService.enforced");

    +[ATKeychainStore setObject:forKey:]( &OBJC_CLASS___ATKeychainStore,  "setObject:forKey:",  v16,  @"EnforcementService.reasonCode");
    +[ATKeychainStore setObject:forKey:]( &OBJC_CLASS___ATKeychainStore,  "setObject:forKey:",  v5,  @"EnforcementService.lastBagLookup");
  }

LABEL_15:
}

- (int64_t)numberOfDayFrom:(id)a3 andNow:(id)a4
{
  if (!a3) {
    return 0LL;
  }
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v14 = 0LL;
  [v7 rangeOfUnit:16 startDate:&v14 interval:0 forDate:v6];

  id v8 = v14;
  id v13 = 0LL;
  [v7 rangeOfUnit:16 startDate:&v13 interval:0 forDate:v5];

  id v9 = v13;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 components:16 fromDate:v8 toDate:v9 options:0]);
  id v11 = [v10 day];

  return (int64_t)v11;
}

- (BOOL)isInternalInstall
{
  return MGGetBoolAnswer(@"apple-internal-install", a2);
}

+ (int64_t)reasonCodeFromNumberValue:(id)a3
{
  int64_t result = (int64_t)[a3 integerValue];
  if (result == 1001) {
    int64_t v4 = 1001LL;
  }
  else {
    int64_t v4 = 0LL;
  }
  if (result != 1002) {
    return v4;
  }
  return result;
}

@end
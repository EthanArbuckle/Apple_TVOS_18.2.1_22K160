@interface NSURLSessionConfiguration
+ (id)_asset_configurationIdentifierUsingProperties:(id)a3;
+ (id)asset_backgroundSessionConfigurationUsingProperties:(id)a3;
+ (id)asset_configurationIdentifierUsingProperties:(id)a3;
+ (id)asset_ephemeralSessionConfigurationUsingProperties:(id)a3;
+ (void)_asset_initializeConnectionPools;
- (void)_asset_setConfigurationDefaults;
- (void)_asset_setConfigurationUsingProperties:(id)a3;
@end

@implementation NSURLSessionConfiguration

+ (id)asset_backgroundSessionConfigurationUsingProperties:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v5));
  objc_msgSend(v6, "_asset_setConfigurationDefaults");
  objc_msgSend(v6, "_asset_setConfigurationUsingProperties:", v3);

  return v6;
}

+ (id)asset_ephemeralSessionConfigurationUsingProperties:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  objc_msgSend(v4, "_asset_setConfigurationDefaults");
  objc_msgSend(v4, "_asset_setConfigurationUsingProperties:", v3);

  objc_msgSend(v4, "set_connectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v4, "set_longLivedConnectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v4, "set_preventsIdleSleepOnceConnected:", 1);
  return v4;
}

+ (id)asset_configurationIdentifierUsingProperties:(id)a3
{
  return _objc_msgSend(a1, "_asset_configurationIdentifierUsingProperties:", a3);
}

+ (id)_asset_configurationIdentifierUsingProperties:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObject:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObject:",  @"com.apple.storekit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 networkBudgetingIdentifier]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 networkBudgetingIdentifier]);
    [v4 addObject:v6];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 duetBudgetingIdentifier]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 duetBudgetingIdentifier]);
    [v4 addObject:v8];
  }

  if ([v3 discretionaryType])
  {
    id v9 = [v3 discretionaryType];
    if (v9 == (id)2)
    {
      v10 = @"discretionary-always";
    }

    else
    {
      if (v9 != (id)1) {
        goto LABEL_13;
      }
      v10 = @"discretionary-inferred";
    }

    [v4 addObject:v10];
  }

+ (void)_asset_initializeConnectionPools
{
  if (qword_10032E040 != -1) {
    dispatch_once(&qword_10032E040, &stru_1002E7AB0);
  }
}

- (void)_asset_setConfigurationDefaults
{
}

- (void)_asset_setConfigurationUsingProperties:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 networkBudgetingIdentifier]);
  -[NSURLSessionConfiguration set_sourceApplicationBundleIdentifier:]( self,  "set_sourceApplicationBundleIdentifier:",  v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 duetBudgetingIdentifier]);
  -[NSURLSessionConfiguration set_sourceApplicationSecondaryIdentifier:]( self,  "set_sourceApplicationSecondaryIdentifier:",  v6);

  if ([v4 enforceATS])
  {
    v18 = @"NSAllowsArbitraryLoads";
    v19 = &__kCFBooleanFalse;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    id v17 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v7,  200LL,  0LL,  &v17));
    id v9 = v17;

    if (v8)
    {
      -[NSURLSessionConfiguration set_atsContext:](self, "set_atsContext:", v8);
    }

    else
    {
      if (qword_10032E0A8 != -1) {
        dispatch_once(&qword_10032E0A8, &stru_1002E7B10);
      }
      v10 = (void *)qword_10032E060;
      if (os_log_type_enabled((os_log_t)qword_10032E060, OS_LOG_TYPE_ERROR)) {
        sub_10025C9D4(v10, v4, (uint64_t)v9);
      }
    }
  }

  -[NSURLSessionConfiguration set_requiresPowerPluggedIn:]( self,  "set_requiresPowerPluggedIn:",  [v4 requiresPowerPluggedIn]);
  -[NSURLSessionConfiguration setAllowsCellularAccess:]( self,  "setAllowsCellularAccess:",  [v4 allowsCellularAccess]);
  -[NSURLSessionConfiguration setAllowsConstrainedNetworkAccess:]( self,  "setAllowsConstrainedNetworkAccess:",  [v4 allowsConstrainedNetworkAccess]);
  -[NSURLSessionConfiguration setAllowsExpensiveNetworkAccess:]( self,  "setAllowsExpensiveNetworkAccess:",  [v4 allowsExpensiveNetworkAccess]);
  unint64_t v11 = (unint64_t)[v4 discretionaryType];
  if (v11 <= 2)
  {
    unint64_t v12 = v11 & 1;
    -[NSURLSessionConfiguration setDiscretionary:](self, "setDiscretionary:", (v11 & 7) == 2);
    -[NSURLSessionConfiguration set_infersDiscretionaryFromOriginatingClient:]( self,  "set_infersDiscretionaryFromOriginatingClient:",  v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 protocolClasses]);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 protocolClasses]);
    -[NSURLSessionConfiguration setProtocolClasses:](self, "setProtocolClasses:", v14);
  }

  if ([v4 connectionPool])
  {
    +[NSURLSessionConfiguration _asset_initializeConnectionPools]( &OBJC_CLASS___NSURLSessionConfiguration,  "_asset_initializeConnectionPools");
    id v15 = [v4 connectionPool];
    if (v15 == (id)1)
    {
      v16 = @"com.apple.storekit.connectionPool.apps";
      goto LABEL_18;
    }

    if (v15 == (id)2)
    {
      v16 = @"com.apple.storekit.connectionPool.odr";
LABEL_18:
      -[NSURLSessionConfiguration set_connectionPoolName:](self, "set_connectionPoolName:", v16);
    }
  }
}

@end
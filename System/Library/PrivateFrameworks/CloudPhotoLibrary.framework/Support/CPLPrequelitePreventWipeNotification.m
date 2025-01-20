@interface CPLPrequelitePreventWipeNotification
+ (void)resetNotificationForLibraryIdentifier:(id)a3;
- (BOOL)_warnUserAndReturnIfShouldPreventWipeOnUpgradeCreateRadar:(BOOL)a3;
- (BOOL)shouldPreventWipeOnUpgradeCreateRadar:(BOOL)a3;
- (CPLPrequelitePreventWipeNotification)initWithLibraryIdentifier:(id)a3 reason:(id)a4;
- (NSDate)ignoreBeforeDate;
- (NSString)defaultsKey;
- (NSString)libraryIdentifier;
- (NSString)reason;
- (id)createRadarURL;
- (void)_save;
@end

@implementation CPLPrequelitePreventWipeNotification

+ (void)resetNotificationForLibraryIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v4 = sub_100170548(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    [v6 removeObjectForKey:v5];
  }

- (CPLPrequelitePreventWipeNotification)initWithLibraryIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CPLPrequelitePreventWipeNotification;
  v8 = -[CPLPrequelitePreventWipeNotification init](&v24, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    libraryIdentifier = v8->_libraryIdentifier;
    v8->_libraryIdentifier = v9;

    v11 = (NSString *)[v7 copy];
    reason = v8->_reason;
    v8->_reason = v11;

    v13 = v8->_libraryIdentifier;
    if (v13)
    {
      v14 = sub_100170548(v13);
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
      defaultsKey = v8->_defaultsKey;
      v8->_defaultsKey = (NSString *)v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKey:v8->_defaultsKey]);
      ignoreBeforeDate = v8->_ignoreBeforeDate;
      v8->_ignoreBeforeDate = (NSDate *)v18;

      v20 = v8->_ignoreBeforeDate;
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDate);
      if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
      {
        v22 = v8->_ignoreBeforeDate;
        v8->_ignoreBeforeDate = 0LL;
      }
    }
  }

  return v8;
}

- (void)_save
{
  if (self->_defaultsKey)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    ignoreBeforeDate = self->_ignoreBeforeDate;
    if (ignoreBeforeDate) {
      [v4 setObject:ignoreBeforeDate forKey:self->_defaultsKey];
    }
    else {
      [v4 removeObjectForKey:self->_defaultsKey];
    }
    [v4 synchronize];
  }

- (BOOL)_warnUserAndReturnIfShouldPreventWipeOnUpgradeCreateRadar:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_reason)
  {
    v5 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@.", self->_reason);
    if (v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  v5 = @"iCloud Photo Library is about to wipe its whole sync state.";
  if (!a3)
  {
LABEL_3:
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v5,  "stringByAppendingString:",  @"\nThis will trigger a potential lengthy reset sync but should not lose any data."));

    v5 = (__CFString *)v6;
  }

- (BOOL)shouldPreventWipeOnUpgradeCreateRadar:(BOOL)a3
{
  if (!self->_libraryIdentifier) {
    return 0;
  }
  BOOL v3 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CPLPrequelitePreventWipeNotification ignoreBeforeDate](self, "ignoreBeforeDate"));
  if (v5
    && (uint64_t v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePreventWipeNotification ignoreBeforeDate](self, "ignoreBeforeDate")),
        [v7 timeIntervalSinceNow],
        double v9 = v8,
        v7,
        v6,
        v9 >= 0.0))
  {
    return 1;
  }

  else
  {
    return -[CPLPrequelitePreventWipeNotification _warnUserAndReturnIfShouldPreventWipeOnUpgradeCreateRadar:]( self,  "_warnUserAndReturnIfShouldPreventWipeOnUpgradeCreateRadar:",  v3);
  }

- (id)createRadarURL
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v3;
  if (self->_reason) {
    reason = (const __CFString *)self->_reason;
  }
  else {
    reason = @"CPL wants to wipe its database";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", reason, @"Title");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"Other Bug",  @"Classification");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"com.apple.PhotoLibraryServices.PhotosDiagnostics",  @"ExtensionIdentifiers");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"Not Applicable",  @"Reproducibility");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"Photos Backend iCloud",  @"ComponentName");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"630691",  @"ComponentID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"all",  @"ComponentVersion");
  if (self->_reason)
  {
    uint64_t v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@\nReason: %@.",  @"CPL presented a notification warning me that it was about to wipe its database.",  self->_reason);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"Description");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"CPL presented a notification warning me that it was about to wipe its database.",  @"Description");
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithString:]( &OBJC_CLASS___NSURLComponents,  "componentsWithString:",  @"tap-to-radar://new"));
  double v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  double v9 = v4;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v28,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v14));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  v14,  v15));
        -[NSMutableArray addObject:](v8, "addObject:", v16);
      }

      id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v28,  16LL);
    }

    while (v11);
  }

  [v7 setQueryItems:v8];
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v7 URL]);
  uint64_t v18 = (void *)v17;
  if (!_CPLSilentLogging)
  {
    uint64_t v19 = __CPLGenericOSLogDomain(v17);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Create radar URL: %@", buf, 0xCu);
    }
  }

  return v18;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)ignoreBeforeDate
{
  return self->_ignoreBeforeDate;
}

- (void).cxx_destruct
{
}

@end
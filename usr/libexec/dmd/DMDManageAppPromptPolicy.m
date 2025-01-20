@interface DMDManageAppPromptPolicy
+ (double)promptWindowInterval;
+ (id)timestampsKey;
+ (int64_t)promptsAllowedBeforeAutomaticDenial;
- (BOOL)isPromptAllowedRightNow;
- (DMDManageAppPromptPolicy)init;
- (NSArray)promptTimestamps;
- (NSDate)overrideDate;
- (double)promptResetTimeInterval;
- (id)_now;
- (id)_timestampDataForWritingToFile;
- (id)_timestampDictionaryForWritingToFile;
- (int64_t)promptsAllowed;
- (void)_removePromptTimestampsOutsideIntervalEnding:(id)a3;
- (void)readTimestampsFromFile;
- (void)recordNewPrompt;
- (void)setOverrideDate:(id)a3;
- (void)setPromptTimestamps:(id)a3;
- (void)writeTimestampsToFile;
@end

@implementation DMDManageAppPromptPolicy

+ (id)timestampsKey
{
  return @"PromptTimestamps";
}

+ (int64_t)promptsAllowedBeforeAutomaticDenial
{
  if (!+[DMDFeatureFlags isAppleInternal](&OBJC_CLASS___DMDFeatureFlags, "isAppleInternal")) {
    return 3LL;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"DMDMaxManagementDenialsBeforeAutomaticRefusal"]);

  if (v3) {
    int64_t v4 = (int64_t)[v2 integerForKey:@"DMDMaxManagementDenialsBeforeAutomaticRefusal"];
  }
  else {
    int64_t v4 = 3LL;
  }

  return v4;
}

+ (double)promptWindowInterval
{
  if (!+[DMDFeatureFlags isAppleInternal](&OBJC_CLASS___DMDFeatureFlags, "isAppleInternal")) {
    return 86400.0;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"DMDManagementPromptWindowMinutes"]);

  if (v3) {
    double v4 = (double)(uint64_t)[v2 integerForKey:@"DMDManagementPromptWindowMinutes"] * 60.0;
  }
  else {
    double v4 = 86400.0;
  }

  return v4;
}

- (DMDManageAppPromptPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDManageAppPromptPolicy;
  v2 = -[DMDManageAppPromptPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    promptTimestamps = v2->_promptTimestamps;
    v2->_promptTimestamps = (NSArray *)&__NSArray0__struct;

    v3->_promptsAllowed = +[DMDManageAppPromptPolicy promptsAllowedBeforeAutomaticDenial]( &OBJC_CLASS___DMDManageAppPromptPolicy,  "promptsAllowedBeforeAutomaticDenial");
    +[DMDManageAppPromptPolicy promptWindowInterval](&OBJC_CLASS___DMDManageAppPromptPolicy, "promptWindowInterval");
    v3->_promptResetTimeInterval = v5;
    overrideDate = v3->_overrideDate;
    v3->_overrideDate = 0LL;
  }

  return v3;
}

- (BOOL)isPromptAllowedRightNow
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy _now](self, "_now"));
  -[DMDManageAppPromptPolicy _removePromptTimestampsOutsideIntervalEnding:]( v2,  "_removePromptTimestampsOutsideIntervalEnding:",  v3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy promptTimestamps](v2, "promptTimestamps"));
  id v5 = [v4 count];
  LOBYTE(v2) = v5 < (id)-[DMDManageAppPromptPolicy promptsAllowed](v2, "promptsAllowed");

  return (char)v2;
}

- (void)recordNewPrompt
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy _now](self, "_now"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy promptTimestamps](self, "promptTimestamps"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObject:v5]);
  -[DMDManageAppPromptPolicy setPromptTimestamps:](self, "setPromptTimestamps:", v4);

  -[DMDManageAppPromptPolicy _removePromptTimestampsOutsideIntervalEnding:]( self,  "_removePromptTimestampsOutsideIntervalEnding:",  v5);
}

- (id)_now
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy overrideDate](self, "overrideDate"));
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  id v5 = v4;

  return v5;
}

- (void)_removePromptTimestampsOutsideIntervalEnding:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy promptTimestamps](self, "promptTimestamps", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        [v4 timeIntervalSinceDate:v11];
        if (v12 >= 0.0)
        {
          double v13 = v12;
          -[DMDManageAppPromptPolicy promptResetTimeInterval](self, "promptResetTimeInterval");
          if (v13 <= v14) {
            -[NSMutableArray addObject:](v5, "addObject:", v11);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v15 = -[NSMutableArray copy](v5, "copy");
  -[DMDManageAppPromptPolicy setPromptTimestamps:](self, "setPromptTimestamps:", v15);
}

- (void)readTimestampsFromFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managementPromptPolicyPath](&OBJC_CLASS___DMDPaths, "managementPromptPolicyPath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v3));

  if (!v4
    || (id v5 = [(id)objc_opt_class(self) timestampsKey],
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5),
        id v8 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]),
        v6,
        (id v7 = v8) == 0LL))
  {
    id v7 = &__NSArray0__struct;
  }

  id v9 = v7;
  -[DMDManageAppPromptPolicy setPromptTimestamps:](self, "setPromptTimestamps:", v7);
}

- (void)writeTimestampsToFile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy _timestampDataForWritingToFile](self, "_timestampDataForWritingToFile"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managementPromptPolicyPath](&OBJC_CLASS___DMDPaths, "managementPromptPolicyPath"));
    id v16 = 0LL;
    unsigned __int8 v4 = [v2 writeToFile:v3 options:1 error:&v16];
    id v5 = v16;

    if ((v4 & 1) == 0)
    {
      uint64_t v8 = DMFAppLog(v6, v7);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100064E6C((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
}

- (id)_timestampDataForWritingToFile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[DMDManageAppPromptPolicy _timestampDictionaryForWritingToFile]( self,  "_timestampDictionaryForWritingToFile"));
  id v16 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v2,  200LL,  0LL,  &v16));
  id v4 = v16;
  uint64_t v6 = v4;
  if (!v3)
  {
    uint64_t v7 = DMFAppLog(v4, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100064ED4((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  return v3;
}

- (id)_timestampDictionaryForWritingToFile
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManageAppPromptPolicy promptTimestamps](self, "promptTimestamps"));
  id v5 = [(id)objc_opt_class(self) timestampsKey];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, v6);

  id v7 = -[NSMutableDictionary copy](v3, "copy");
  return v7;
}

- (NSArray)promptTimestamps
{
  return self->_promptTimestamps;
}

- (void)setPromptTimestamps:(id)a3
{
}

- (int64_t)promptsAllowed
{
  return self->_promptsAllowed;
}

- (double)promptResetTimeInterval
{
  return self->_promptResetTimeInterval;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface AppCrashHistoryInputs
- (BOOL)_applyCrashTypesParameter:(id)a3;
- (BOOL)_applyWhitelistParameter:(id)a3;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)logIds;
- (NSSet)whitelist;
- (int)avgCrashesToConsider;
- (int)minCrashesToConsider;
- (void)setAvgCrashesToConsider:(int)a3;
- (void)setLogIds:(id)a3;
- (void)setMinCrashesToConsider:(int)a3;
- (void)setWhitelist:(id)a3;
@end

@implementation AppCrashHistoryInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  if (-[AppCrashHistoryInputs _applyCrashTypesParameter:](self, "_applyCrashTypesParameter:", v4)) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = -[AppCrashHistoryInputs _applyWhitelistParameter:](self, "_applyWhitelistParameter:", v4);
  }
  unsigned __int8 v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:",  @"minCrashesToConsider",  &off_100004420,  &off_100004438,  &off_100004420,  &v10));
  -[AppCrashHistoryInputs setMinCrashesToConsider:](self, "setMinCrashesToConsider:", [v6 intValue]);

  v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:",  @"avgCrashesToConsider",  &off_100004420,  &off_100004438,  &off_100004420,  &v10));
  -[AppCrashHistoryInputs setAvgCrashesToConsider:](self, "setAvgCrashesToConsider:", [v7 intValue]);

  BOOL v8 = v10 == 0;
  return v8;
}

- (BOOL)_applyCrashTypesParameter:(id)a3
{
  id v4 = a3;
  BOOL v25 = 0;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  v6 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v5, objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:",  @"crashTypes",  v7,  10,  &off_100004490,  &v25,  &stru_1000041C8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          [v9 addObject:v15];
        }

        else
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
            [v9 addObject:v18];
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v12);
  }

  -[AppCrashHistoryInputs setLogIds:](self, "setLogIds:", v9);
  BOOL v19 = v25;

  return v19;
}

- (BOOL)_applyWhitelistParameter:(id)a3
{
  char v10 = 0;
  id v4 = a3;
  uint64_t v5 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___NSString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:",  @"whitelistedAppNames",  v6,  10000,  &__NSArray0__struct,  &v10,  &stru_1000041E8));

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  -[AppCrashHistoryInputs setWhitelist:](self, "setWhitelist:", v8);

  LOBYTE(self) = v10;
  return (char)self;
}

- (int)minCrashesToConsider
{
  return self->_minCrashesToConsider;
}

- (void)setMinCrashesToConsider:(int)a3
{
  self->_minCrashesToConsider = a3;
}

- (int)avgCrashesToConsider
{
  return self->_avgCrashesToConsider;
}

- (void)setAvgCrashesToConsider:(int)a3
{
  self->_avgCrashesToConsider = a3;
}

- (NSArray)logIds
{
  return self->_logIds;
}

- (void)setLogIds:(id)a3
{
}

- (NSSet)whitelist
{
  return self->_whitelist;
}

- (void)setWhitelist:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
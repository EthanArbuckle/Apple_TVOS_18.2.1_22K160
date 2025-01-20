@interface CPLSimpleUpgradeHistory
+ (void)cleanupUnusedUpgradeHistoriesWithUsedBlock:(id)a3;
- (BOOL)versionHasChanged;
- (CPLSimpleUpgradeHistory)initWithLibraryIdentifier:(id)a3;
- (NSDate)lastCPLUpgradeDate;
- (NSDate)lastDBUpgradeDate;
- (NSDate)lastOSBuildUpgradeDate;
- (NSString)lastSeenCPLVersion;
- (NSString)lastSeenOSBuildVersion;
- (NSString)libraryIdentifier;
- (NSString)previousCPLVersion;
- (NSString)previousOSBuildVersion;
- (NSString)status;
- (id)_defaultsKey;
- (id)_valueForKey:(id)a3 class:(Class)a4;
- (int64_t)lastSeenDBVersion;
- (int64_t)previousDBVersion;
- (void)_save;
- (void)noteDatabaseWasUpgradedToVersion:(int64_t)a3 fromVersion:(int64_t)a4;
- (void)resetVersionHasChanged;
@end

@implementation CPLSimpleUpgradeHistory

- (id)_defaultsKey
{
  return [@"_CPLUpgradeHistory-" stringByAppendingString:self->_libraryIdentifier];
}

- (void)_save
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_100183948();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      libraryIdentifier = self->_libraryIdentifier;
      history = self->_history;
      int v10 = 138412546;
      v11 = libraryIdentifier;
      __int16 v12 = 2112;
      v13 = history;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Saving upgrade history for %@: %@",  (uint8_t *)&v10,  0x16u);
    }
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v8 = self->_history;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory _defaultsKey](self, "_defaultsKey"));
  [v7 setObject:v8 forKey:v9];
}

- (CPLSimpleUpgradeHistory)initWithLibraryIdentifier:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___CPLSimpleUpgradeHistory;
  v5 = -[CPLSimpleUpgradeHistory init](&v51, "init");
  if (!v5) {
    goto LABEL_67;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v7 = (NSString *)[v4 copy];
  libraryIdentifier = v5->_libraryIdentifier;
  v5->_libraryIdentifier = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory _defaultsKey](v5, "_defaultsKey"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v9]);

  if (!_CPLSilentLogging)
  {
    id v11 = sub_100183948();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = v5->_libraryIdentifier;
      *(_DWORD *)buf = 138412546;
      v53 = (const __CFString *)v13;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "At opening time, history for %@ is %@",  buf,  0x16u);
    }
  }

  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    history = v5->_history;
    v5->_history = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLLastOSBuildVersion"]);
    if (v19)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v19,  @"lastSeenOSBuildVersion");
      [v6 removeObjectForKey:@"_CPLLastOSBuildVersion"];
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLPreviousOSBuildVersion"]);
    if (v20)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v20,  @"previousOSBuildVersion");
      [v6 removeObjectForKey:@"_CPLPreviousOSBuildVersion"];
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLLastOSUpgrade"]);
    if (v21)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v21,  @"lastOSBuildUpgradeDate");
      [v6 removeObjectForKey:@"_CPLLastOSUpgrade"];
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLLastDBVersion"]);
    if (v22)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v22,  @"lastSeenDBVersion");
      [v6 removeObjectForKey:@"_CPLLastDBVersion"];
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLPreviousDBVersion"]);
    if (v23)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v23,  @"previousDBVersion");
      [v6 removeObjectForKey:@"_CPLPreviousDBVersion"];
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLLastDBUpgrade"]);
    if (v24)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v24,  @"lastDBUpgradeDate");
      [v6 removeObjectForKey:@"_CPLLastDBUpgrade"];
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLLastCPLVersion"]);
    if (v25)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v25,  @"lastSeenCPLVersion");
      [v6 removeObjectForKey:@"_CPLLastCPLVersion"];
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLPreviousCPLVersion"]);
    if (v26)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v26,  @"previousCPLVersion");
      [v6 removeObjectForKey:@"_CPLPreviousCPLVersion"];
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"_CPLLastCPLUpgrade"]);
    if (v27)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v27,  @"lastCPLUpgradeDate");
      [v6 removeObjectForKey:@"_CPLLastCPLUpgrade"];
    }

    id v28 = -[CPLSimpleUpgradeHistory _save](v5, "_save");
  }

  else
  {
    if (v10 && (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v10, v15) & 1) != 0)) {
      v16 = (NSMutableDictionary *)[v10 mutableCopy];
    }
    else {
      v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v29 = v5->_history;
    v5->_history = v16;
  }

  uint64_t v30 = __CPLBuildVersion(v28);
  uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
  uint64_t v32 = objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory lastSeenOSBuildVersion](v5, "lastSeenOSBuildVersion"));
  v33 = (__CFString *)v32;
  if (v32 && v31)
  {
    uint64_t v32 = (uint64_t)[(id)v32 isEqual:v31];
    if ((v32 & 1) != 0) {
      goto LABEL_50;
    }
  }

  else
  {
    if (!(v32 | v31)) {
      goto LABEL_50;
    }
    if (!v31)
    {
      if (!_CPLSilentLogging)
      {
        id v49 = sub_100183948();
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Running on a undetermined OS build",  buf,  2u);
        }
      }

      -[NSMutableDictionary removeObjectForKey:](v5->_history, "removeObjectForKey:", @"lastSeenOSBuildVersion");
      goto LABEL_47;
    }
  }

  if (!_CPLSilentLogging)
  {
    id v34 = sub_100183948();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = @"unknown";
      if (v33) {
        v36 = v33;
      }
      *(_DWORD *)buf = 138543618;
      v53 = v36;
      __int16 v54 = 2114;
      uint64_t v55 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "OS Build version has changed since last launch, from %{public}@ to %{public}@",  buf,  0x16u);
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v31,  @"lastSeenOSBuildVersion");
  v5->_versionHasChanged = 1;
LABEL_47:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v37,  @"lastOSBuildUpgradeDate");

  v38 = v5->_history;
  if (v33) {
    uint64_t v32 = (uint64_t)-[NSMutableDictionary setObject:forKeyedSubscript:]( v38,  "setObject:forKeyedSubscript:",  v33,  @"previousOSBuildVersion");
  }
  else {
    uint64_t v32 = (uint64_t)-[NSMutableDictionary removeObjectForKey:]( v38,  "removeObjectForKey:",  @"previousOSBuildVersion");
  }
LABEL_50:
  uint64_t v39 = __CPLVersion(v32);
  uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
  uint64_t v41 = objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory lastSeenCPLVersion](v5, "lastSeenCPLVersion"));
  v42 = (__CFString *)v41;
  if (v41 && v40)
  {
LABEL_55:
    if (!_CPLSilentLogging)
    {
      id v43 = sub_100183948();
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = @"unknown";
        if (v42) {
          v45 = v42;
        }
        *(_DWORD *)buf = 138412546;
        v53 = v45;
        __int16 v54 = 2112;
        uint64_t v55 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "CPL version has changed since last launch, from %@ to %@",  buf,  0x16u);
      }
    }

    v5->_versionHasChanged = 1;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v40,  @"lastSeenCPLVersion");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_history,  "setObject:forKeyedSubscript:",  v46,  @"lastCPLUpgradeDate");

    v47 = v5->_history;
    if (v42) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v42,  @"previousCPLVersion");
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](v47, "removeObjectForKey:", @"previousCPLVersion");
    }
    goto LABEL_64;
  }

  if (v41 | v40) {
    goto LABEL_55;
  }
LABEL_64:
  if (v5->_versionHasChanged) {
    -[CPLSimpleUpgradeHistory _save](v5, "_save");
  }

LABEL_67:
  return v5;
}

- (id)_valueForKey:(id)a3 class:(Class)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_history, "objectForKeyedSubscript:", a3));
  if ((objc_opt_isKindOfClass(v5, a4) & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)noteDatabaseWasUpgradedToVersion:(int64_t)a3 fromVersion:(int64_t)a4
{
  int64_t v7 = -[CPLSimpleUpgradeHistory lastSeenDBVersion](self, "lastSeenDBVersion");
  if (v7) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = a4;
  }
  if (v8 != a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_history,  "setObject:forKeyedSubscript:",  v9,  @"previousDBVersion");

    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_history,  "setObject:forKeyedSubscript:",  v10,  @"lastDBUpgradeDate");

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_history,  "setObject:forKeyedSubscript:",  v11,  @"lastSeenDBVersion");

    -[CPLSimpleUpgradeHistory _save](self, "_save");
  }

- (NSString)lastSeenOSBuildVersion
{
  return (NSString *)-[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"lastSeenOSBuildVersion",  objc_opt_class(&OBJC_CLASS___NSString));
}

- (NSString)previousOSBuildVersion
{
  return (NSString *)-[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"previousOSBuildVersion",  objc_opt_class(&OBJC_CLASS___NSString));
}

- (NSDate)lastOSBuildUpgradeDate
{
  return (NSDate *)-[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"lastOSBuildUpgradeDate",  objc_opt_class(&OBJC_CLASS___NSDate));
}

- (int64_t)lastSeenDBVersion
{
  id v2 = -[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"lastSeenDBVersion",  objc_opt_class(&OBJC_CLASS___NSNumber));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (int64_t)previousDBVersion
{
  id v2 = -[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"previousDBVersion",  objc_opt_class(&OBJC_CLASS___NSNumber));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (NSDate)lastDBUpgradeDate
{
  return (NSDate *)-[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"lastDBUpgradeDate",  objc_opt_class(&OBJC_CLASS___NSDate));
}

- (NSString)lastSeenCPLVersion
{
  return (NSString *)-[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"lastSeenCPLVersion",  objc_opt_class(&OBJC_CLASS___NSString));
}

- (NSString)previousCPLVersion
{
  return (NSString *)-[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"previousCPLVersion",  objc_opt_class(&OBJC_CLASS___NSString));
}

- (NSDate)lastCPLUpgradeDate
{
  return (NSDate *)-[CPLSimpleUpgradeHistory _valueForKey:class:]( self,  "_valueForKey:class:",  @"lastCPLUpgradeDate",  objc_opt_class(&OBJC_CLASS___NSDate));
}

- (void)resetVersionHasChanged
{
  self->_versionHasChanged = 0;
}

- (NSString)status
{
  id v3 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 3LL);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory lastOSBuildUpgradeDate](self, "lastOSBuildUpgradeDate"));
  id v6 = @"unknown";
  if (v5)
  {
    uint64_t v39 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory previousOSBuildVersion](self, "previousOSBuildVersion"));
    int64_t v8 = (void *)v7;
    if (v7) {
      id v6 = (const __CFString *)v7;
    }
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory lastSeenOSBuildVersion](self, "lastSeenOSBuildVersion"));
    int v10 = (void *)v9;
    id v11 = v3;
    if (v9) {
      __int16 v12 = (const __CFString *)v9;
    }
    else {
      __int16 v12 = @"unknown";
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  v5,  v4));
    v38 = v12;
    id v3 = v11;
    v36 = v6;
    id v6 = @"unknown";
    BOOL v14 = -[NSString initWithFormat:](v39, "initWithFormat:", @"last upgrade from %@ to %@, %@", v36, v38, v13);
    -[NSMutableArray addObject:](v11, "addObject:", v14);
  }

  uint64_t v40 = (void *)v4;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory lastCPLUpgradeDate](self, "lastCPLUpgradeDate"));
  if (v15)
  {
    v16 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory previousCPLVersion](self, "previousCPLVersion"));
    v18 = (void *)v17;
    v19 = v3;
    v20 = v5;
    if (v17) {
      v21 = (const __CFString *)v17;
    }
    else {
      v21 = @"unknown";
    }
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory lastSeenCPLVersion](self, "lastSeenCPLVersion"));
    v23 = (void *)v22;
    if (v22) {
      id v6 = (const __CFString *)v22;
    }
    v24 = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  v15,  v40));
    v37 = v21;
    v5 = v20;
    id v3 = v19;
    v26 = -[NSString initWithFormat:](v16, "initWithFormat:", @"last CPL upgrade from %@ to %@, %@", v37, v6, v25);
    -[NSMutableArray addObject:](v19, "addObject:", v26);

    uint64_t v15 = v24;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory lastDBUpgradeDate](self, "lastDBUpgradeDate"));
  if (v27)
  {
    id v28 = objc_alloc(&OBJC_CLASS___NSString);
    int64_t v29 = -[CPLSimpleUpgradeHistory previousDBVersion](self, "previousDBVersion");
    int64_t v30 = -[CPLSimpleUpgradeHistory lastSeenDBVersion](self, "lastSeenDBVersion");
    uint64_t v31 = v15;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  v27,  v40));
    v33 = -[NSString initWithFormat:]( v28,  "initWithFormat:",  @"last DB upgrade from %lld to %lld, %@",  v29,  v30,  v32);
    -[NSMutableArray addObject:](v3, "addObject:", v33);

    uint64_t v15 = v31;
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @"\n"));

  return (NSString *)v34;
}

+ (void)cleanupUnusedUpgradeHistoriesWithUsedBlock:(id)a3
{
  id v3 = (uint64_t (**)(id, void *))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = [@"_CPLUpgradeHistory-" length];
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v28 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);

  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v8)
  {
    id v9 = v8;
    int v10 = 0LL;
    uint64_t v11 = *(void *)v35;
    __int16 v12 = @"_CPLUpgradeHistory-";
    uint64_t v29 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v7);
        }
        BOOL v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        if ([v14 hasPrefix:v12])
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 substringFromIndex:v5]);
          if ((v3[2](v3, v15) & 1) == 0)
          {
            v16 = v3;
            uint64_t v17 = v12;
            v18 = v7;
            id v19 = v5;
            if (!_CPLSilentLogging)
            {
              v20 = v10;
              id v21 = sub_100183948();
              uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v40 = v15;
                _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Removing unused history for %@",  buf,  0xCu);
              }

              int v10 = v20;
            }

            if (!v10) {
              int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            -[NSMutableArray addObject:](v10, "addObject:", v14);
            id v5 = v19;
            uint64_t v7 = v18;
            __int16 v12 = v17;
            id v3 = v16;
            uint64_t v11 = v29;
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }

    while (v9);
  }

  else
  {
    int v10 = 0LL;
  }

  if (-[NSMutableArray count](v10, "count"))
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v23 = v10;
    id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          [v28 removeObjectForKey:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
        }

        id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
      }

      while (v25);
    }

    [v28 synchronize];
  }
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (BOOL)versionHasChanged
{
  return self->_versionHasChanged;
}

- (void).cxx_destruct
{
}

@end
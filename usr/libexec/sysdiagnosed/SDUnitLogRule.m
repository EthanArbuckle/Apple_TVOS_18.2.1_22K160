@interface SDUnitLogRule
- (BOOL)canAddToCandidateList;
- (BOOL)considerURL:(id)a3 forRejection:(unint64_t *)a4;
- (BOOL)pipelineFlush;
- (BOOL)resolveHomeDirs;
- (NSArray)offsets;
- (NSArray)sizes;
- (NSDate)createdSince;
- (NSDate)createdUntil;
- (NSMutableArray)logArray;
- (NSMutableArray)logDates;
- (NSMutableArray)matchEnumerator;
- (NSPredicate)filter;
- (NSString)headDir;
- (NSString)mobileContainer;
- (NSString)relative;
- (SDUnitLogRule)initWithDate:(id)a3 withFilter:(id)a4 newestFileCount:(unint64_t)a5 atInternalDirectory:(id)a6 withRuntimeChecks:(unint64_t)a7;
- (id)_localUserHomeDirectories;
- (id)advanceMatchEnumerator;
- (id)applyFilters;
- (id)getNextMatch;
- (id)resolveCrashReporterPath:(id)a3;
- (id)resolvePathToMobileContainer:(id)a3;
- (unint64_t)maxDepth;
- (unint64_t)mobileContainerClass;
- (unint64_t)newestFileLimit;
- (void)_getNextVariedSet:(id)a3 withLogs:(id)a4;
- (void)addPathsToArray:(id)a3 withHighPriority:(id)a4 withMaxVariety:(BOOL)a5;
- (void)generateMaxVariety:(id)a3 withLogs:(id)a4 withHighPriority:(id)a5;
- (void)resolvePaths;
- (void)setCreatedSince:(id)a3;
- (void)setCreatedUntil:(id)a3;
- (void)setFilter:(id)a3;
- (void)setHeadDir:(id)a3;
- (void)setLogArray:(id)a3;
- (void)setLogDates:(id)a3;
- (void)setMatchEnumerator:(id)a3;
- (void)setMaxDepth:(unint64_t)a3;
- (void)setMobileContainer:(id)a3;
- (void)setMobileContainerClass:(unint64_t)a3;
- (void)setNewestFileLimit:(unint64_t)a3;
- (void)setOffsets:(id)a3;
- (void)setPipelineFlush:(BOOL)a3;
- (void)setRelative:(id)a3;
- (void)setResolveHomeDirs:(BOOL)a3;
- (void)setSizes:(id)a3;
@end

@implementation SDUnitLogRule

- (SDUnitLogRule)initWithDate:(id)a3 withFilter:(id)a4 newestFileCount:(unint64_t)a5 atInternalDirectory:(id)a6 withRuntimeChecks:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (__CFString *)a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SDUnitLogRule;
  v15 = -[SDUnitLogRule init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    -[SDUnitLogRule setCreatedSince:](v15, "setCreatedSince:", v12);
    -[SDUnitLogRule setFilter:](v16, "setFilter:", v13);
    -[SDUnitLogRule setNewestFileLimit:](v16, "setNewestFileLimit:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", a5));
    -[SDUnitLogRule setLogArray:](v16, "setLogArray:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", a5));
    -[SDUnitLogRule setLogDates:](v16, "setLogDates:", v18);

    if (v14) {
      v19 = v14;
    }
    else {
      v19 = @".";
    }
    -[SDUnitLogRule setRelative:](v16, "setRelative:", v19);
    -[SDUnitLogRule setMaxDepth:](v16, "setMaxDepth:", 1024LL);
    -[SDUnit setRuntimeChecks:](v16, "setRuntimeChecks:", a7);
    -[SDUnitLogRule setMobileContainerClass:](v16, "setMobileContainerClass:", 0LL);
    -[SDUnitLogRule setMobileContainer:](v16, "setMobileContainer:", 0LL);
    -[SDUnitLogRule setMatchEnumerator:](v16, "setMatchEnumerator:", 0LL);
    -[SDUnitLogRule setHeadDir:](v16, "setHeadDir:", @".");
    -[SDUnitLogRule setResolveHomeDirs:](v16, "setResolveHomeDirs:", 1LL);
    -[SDUnitLogRule setPipelineFlush:](v16, "setPipelineFlush:", 0LL);
    -[SDUnitLogRule setOffsets:](v16, "setOffsets:", 0LL);
    -[SDUnitLogRule setSizes:](v16, "setSizes:", 0LL);
  }

  return v16;
}

- (id)getNextMatch
{
  return 0LL;
}

- (id)advanceMatchEnumerator
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = 0LL;
    while (1)
    {
      v6 = v5;
      v7 = objc_autoreleasePoolPush();
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 getNextMatch]);
      if (v9) {
        break;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
      [v10 removeObjectAtIndex:0];

      objc_autoreleasePoolPop(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
      id v12 = [v11 count];

      if (!v12)
      {
        id v13 = 0LL;
        goto LABEL_8;
      }
    }

    id v13 = v9;
    objc_autoreleasePoolPop(v7);

    v5 = v13;
LABEL_8:
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (BOOL)considerURL:(id)a3 forRejection:(unint64_t *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6 || (v8 = (void *)objc_claimAutoreleasedReturnValue([v6 path]), v8, !v8))
  {
    BOOL v12 = 0;
    unint64_t v13 = 1LL;
    goto LABEL_6;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  unsigned int v11 = [v9 containsObject:v10];

  if (!v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    int v17 = [v15 fileExistsAtPath:v16];

    if ((v17 & 1) == 0)
    {
      v42 = sub_1000241E4();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
        *(_DWORD *)buf = 138412290;
        v72 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%@ failed due to file not found",  buf,  0xCu);
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      v46 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
      [v45 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ failed due to file not found", v46 category msg];

      BOOL v12 = 0;
      unint64_t v13 = 10LL;
      goto LABEL_6;
    }

    id v70 = 0LL;
    id v69 = 0LL;
    unsigned int v18 = [v7 getResourceValue:&v70 forKey:NSURLCreationDateKey error:&v69];
    id v19 = v70;
    id v20 = v69;
    if (!v18 || !v19)
    {
      v47 = sub_1000241E4();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
        v50 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedDescription]);
        *(_DWORD *)buf = 138412546;
        v72 = v49;
        __int16 v73 = 2112;
        *(void *)v74 = v50;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%@ failed to get date with error %@",  buf,  0x16u);
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      v52 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
      v53 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedDescription]);
      [v51 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ failed to get date with error %@", v52, v53 category msg];

      BOOL v12 = 0;
      *a4 = 5LL;
      goto LABEL_36;
    }

    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdSince](self, "createdSince"));

    if (v21
      && (v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdSince](self, "createdSince")),
          id v23 = (id)objc_claimAutoreleasedReturnValue([v19 earlierDate:v22]),
          v23,
          v22,
          v23 == v19))
    {
      *a4 = 6LL;
      v54 = sub_1000241E4();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
      [v19 timeIntervalSince1970];
      int v58 = (int)v57;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdSince](self, "createdSince"));
      [v59 timeIntervalSince1970];
      *(_DWORD *)buf = 138412802;
      v72 = v56;
      __int16 v73 = 1024;
      *(_DWORD *)v74 = v58;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = (int)v60;
      v61 = "%@ failed to pass date test %{time_t}d < %{time_t}d ";
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdUntil](self, "createdUntil"));

      if (!v24
        || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdUntil](self, "createdUntil")),
            id v26 = (id)objc_claimAutoreleasedReturnValue([v19 laterDate:v25]),
            v26,
            v25,
            v26 != v19))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule filter](self, "filter"));

        if (!v27
          || (v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule filter](self, "filter")),
              v29 = (void *)objc_claimAutoreleasedReturnValue([v7 path]),
              unsigned __int8 v30 = [v28 evaluateWithObject:v29],
              v29,
              v28,
              (v30 & 1) != 0))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
          id v32 = [v31 count];

          unint64_t v33 = 0LL;
          if (v32)
          {
            do
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logDates](self, "logDates"));
              v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndexedSubscript:v33]);
              id v36 = (id)objc_claimAutoreleasedReturnValue([v35 laterDate:v19]);

              if (v36 == v19) {
                break;
              }
              ++v33;
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
              id v38 = [v37 count];
            }

            while ((unint64_t)v38 > v33);
          }

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
          v40 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
          [v39 insertObject:v40 atIndex:v33];

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logDates](self, "logDates"));
          [v41 insertObject:v19 atIndex:v33];

          BOOL v12 = 1;
          goto LABEL_36;
        }

        *a4 = 8LL;
        v62 = sub_1000241E4();
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule filter](self, "filter"));
          *(_DWORD *)buf = 138412546;
          v72 = v56;
          __int16 v73 = 2112;
          *(void *)v74 = v59;
          v61 = "%@ failed to pass predicate %@ ";
          v63 = v55;
          uint32_t v64 = 22;
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, v61, buf, v64);
        }

- (id)applyFilters
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[SDUnitLogRule newestFileLimit](self, "newestFileLimit"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
    id v5 = [v4 count];
    unint64_t v6 = -[SDUnitLogRule newestFileLimit](self, "newestFileLimit");

    if ((unint64_t)v5 > v6)
    {
      unint64_t v8 = objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
      unsigned int v7 = [(id)v8 count];

      LODWORD(v8) = v7 - 1;
      if (-[SDUnitLogRule newestFileLimit](self, "newestFileLimit") <= (int)(v7 - 1))
      {
        unint64_t v8 = (int)v8;
        do
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v8]);

          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
          [v11 removeLastObject];

          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logDates](self, "logDates"));
          [v12 removeLastObject];

          [v3 addObject:v10];
          --v8;
        }

        while (-[SDUnitLogRule newestFileLimit](self, "newestFileLimit") <= v8);
      }
    }
  }

  return v3;
}

- (void)_getNextVariedSet:(id)a3 withLogs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys", 0));
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v13]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);
        [v7 addObject:v15];

        [v14 removeLastObject];
        if (![v14 count]) {
          [v5 removeObjectForKey:v13];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"compareLogDateDescending:"]);
  [v6 addObjectsFromArray:v16];
}

- (void)generateMaxVariety:(id)a3 withLogs:(id)a4 withHighPriority:(id)a5
{
  id v7 = a3;
  id v45 = a4;
  id v44 = a5;
  id v57 = 0LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"[.]synced$",  1LL,  &v57));
  id v9 = v57;
  v50 = (void *)v8;
  if (!v8)
  {
    id v10 = sub_1000241E4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      double v60 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to compile generateMaxVariety::syncedRegex with error: %@",  buf,  0xCu);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to compile generateMaxVariety::syncedRegex with error: %@", v14 category msg];

    id v9 = 0LL;
  }

  id v56 = v9;
  uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"[.][0-9]{3}[.]ips",  1LL,  &v56));
  id v16 = v56;

  v49 = (void *)v15;
  if (!v15)
  {
    __int128 v17 = sub_1000241E4();
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      double v60 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Failed to compile generateMaxVariety::stackTripleRegex with error: %@",  buf,  0xCu);
    }

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedDescription]);
    [v20 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to compile generateMaxVariety::stackTripleRegex with error: %@", v21 category msg];

    id v16 = 0LL;
  }

  id v55 = v16;
  uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"([0-9]{4}(-|_)[0-9]{2}(-|_)[0-9]{2}(-|_)([0-9]{6}|[0-9]{2}(-|_)[0-9]{2}(-|_)[0-9]{2}))",  1LL,  &v55));
  id v23 = v55;

  v48 = (void *)v22;
  if (!v22)
  {
    v24 = sub_1000241E4();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      double v60 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Failed to compile generateMaxVariety::regex with error: %@",  buf,  0xCu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
    [v27 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to compile generateMaxVariety::regex with error: %@", v28 category msg];

    id v23 = 0LL;
  }

  v42 = v23;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  v46 = v7;
  id obj = (id)objc_claimAutoreleasedReturnValue([v7 reverseObjectEnumerator]);
  id v30 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        v35 = objc_autoreleasePoolPush();
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 path]);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v34 path]);
        id v38 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v50,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v36,  0,  0,  objc_msgSend(v37, "length"),  &stru_10008D288));

        v39 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v49,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v38,  0,  0,  objc_msgSend(v38, "length"),  @".ips"));
        v40 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v48,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v39,  0,  0,  objc_msgSend(v39, "length"),  &stru_10008D288));

        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:v40]);
          if (v41
            || (v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array")),
                [v29 setObject:v41 forKey:v40],
                v41))
          {
            [v41 addObject:v34];
          }
        }

        objc_autoreleasePoolPop(v35);
      }

      id v31 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }

    while (v31);
  }

  -[SDUnitLogRule _getNextVariedSet:withLogs:](self, "_getNextVariedSet:withLogs:", v29, v44);
  while ([v29 count])
    -[SDUnitLogRule _getNextVariedSet:withLogs:](self, "_getNextVariedSet:withLogs:", v29, v45);
}

- (void)addPathsToArray:(id)a3 withHighPriority:(id)a4 withMaxVariety:(BOOL)a5
{
  BOOL v5 = a5;
  id v41 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule headDir](self, "headDir"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 standardizedURL]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
  id v14 = [v13 count];

  if (v14)
  {
    BOOL v39 = v5;
    v43 = v9;
    id v40 = v8;
    unint64_t v15 = 0LL;
    id v16 = 0LL;
    __int128 v17 = 0LL;
    __int128 v18 = 0LL;
    __int128 v19 = 0LL;
    do
    {
      __int128 v20 = v16;
      objc_super v21 = objc_autoreleasePoolPush();
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v15]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v23 stringByDeletingLastPathComponent]);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule headDir](self, "headDir"));
      LODWORD(v23) = [v24 isEqualToString:@"."];

      if ((_DWORD)v23)
      {
        v25 = v19;
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule headDir](self, "headDir"));
      }

      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v16 componentsSeparatedByString:v42]);
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 lastObject]);

        __int128 v19 = (void *)v26;
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule relative](self, "relative"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v19]);

      v29 = objc_alloc(&OBJC_CLASS___SDLog);
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:v15]);
      uint64_t v32 = -[SDLog initWithPath:subdirectory:error:](v29, "initWithPath:subdirectory:error:", v31, v28, 0LL);

      if (v32)
      {
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule offsets](self, "offsets"));
        -[SDLog setOffsets:](v32, "setOffsets:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule sizes](self, "sizes"));
        -[SDLog setSizes:](v32, "setSizes:", v34);

        [v43 addObject:v32];
      }

      objc_autoreleasePoolPop(v21);
      ++v15;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
      id v36 = [v35 count];

      __int128 v17 = v32;
      __int128 v18 = v28;
    }

    while ((unint64_t)v36 > v15);

    id v8 = v40;
    id v9 = v43;
    BOOL v5 = v39;
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
  [v37 removeAllObjects];

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logDates](self, "logDates"));
  [v38 removeAllObjects];

  if (v5) {
    -[SDUnitLogRule generateMaxVariety:withLogs:withHighPriority:]( self,  "generateMaxVariety:withLogs:withHighPriority:",  v9,  v41,  v8);
  }
  else {
    [v41 addObjectsFromArray:v9];
  }
}

- (id)_localUserHomeDirectories
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (sub_100023F2C())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/private/var/Users",  1LL));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:7 errorHandler:&stru_100088FA0]);

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
          BOOL v12 = objc_autoreleasePoolPush();
          objc_msgSend(v2, "addObject:", v11, (void)v14);
          objc_autoreleasePoolPop(v12);
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/private/var/mobile/",  1LL));
    [v2 addObject:v6];
  }

  return v2;
}

- (id)resolvePathToMobileContainer:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"~"]
    && ([v4 hasPrefix:@"~~"] & 1) == 0)
  {
    id v10 = sub_100021004();
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
    if (v9)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"~" withString:v9]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___SDUnitLogDirectory, v12);
      if ((objc_opt_isKindOfClass(self, v13) & 1) != 0) {
        -[SDUnitLogRule setHeadDir:](self, "setHeadDir:", v11);
      }
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByReplacingOccurrencesOfString:@"~" withString:@"/private/var/root"]);
      uint64_t v22 = sub_1000241E4();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v27 = (unint64_t)v4;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ cannot be resolved to user home directory. Setting to root home directory.",  buf,  0xCu);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v24 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ cannot be resolved to user home directory. Setting to root home directory.", v4 category msg];
    }
  }

  else
  {
    if (-[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass")
      && (BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule mobileContainer](self, "mobileContainer")),
          v5,
          v5))
    {
      uint64_t v25 = 1LL;
      unint64_t v6 = -[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass");
      if (v6 == 2)
      {
        id v7 = objc_claimAutoreleasedReturnValue(-[SDUnitLogRule mobileContainer](self, "mobileContainer"));
        uint64_t v8 = container_create_or_lookup_path_for_current_user(2, [v7 UTF8String], 0, 0, 0, &v25);
      }

      else if (v6 == 1)
      {
        id v7 = objc_claimAutoreleasedReturnValue(-[SDUnitLogRule mobileContainer](self, "mobileContainer"));
        uint64_t v8 = container_system_group_path_for_identifier(0, [v7 UTF8String], &v25);
      }

      else
      {
        id v7 = objc_claimAutoreleasedReturnValue(-[SDUnitLogRule mobileContainer](self, "mobileContainer"));
        uint64_t v8 = container_system_path_for_identifier([v7 UTF8String], &v25);
      }

      __int128 v14 = (void *)v8;

      if (v14)
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v14,  1LL,  0LL));
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 path]);

        free(v14);
      }

      else
      {
        if ((id)-[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass") == (id)2) {
          uint64_t v9 = @"/private/var/mobile/";
        }
        else {
          uint64_t v9 = @"/DUMMY/";
        }
        __int128 v16 = sub_1000241E4();
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v18 = -[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass");
          *(_DWORD *)buf = 134218240;
          unint64_t v27 = v18;
          __int16 v28 = 2048;
          uint64_t v29 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Error finding container of type %lu with error %llu, setting to bogus path.",  buf,  0x16u);
        }

        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        unint64_t v20 = -[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass");
        objc_msgSend( v19,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Error finding container of type %lu with error %llu, setting to bogus path.",  v20,  v25);
      }
    }

    else
    {
      uint64_t v9 = @"/";
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", v4));
  }

  return v11;
}

- (BOOL)canAddToCandidateList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 0x3E8)
  {
    BOOL v5 = sub_1000241E4();
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Hit candidate limit -- flushing the log collection pipeline",  v9,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v7 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Hit candidate limit -- flushing the log collection pipeline"];

    -[SDUnitLogRule setPipelineFlush:](self, "setPipelineFlush:", 1LL);
  }

  return (unint64_t)v4 < 0x3E8;
}

- (id)resolveCrashReporterPath:(id)a3
{
  id v3 = a3;
  if (sub_100023F2C())
  {
    id v4 = [v3 length];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathSubmission]);

    uint64_t v7 = objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"/private/var/mobile/Library/Logs/CrashReporter",  v6,  9,  0,  v4));
    id v3 = (id)v7;
  }

  return v3;
}

- (void)resolvePaths
{
}

- (NSDate)createdSince
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCreatedSince:(id)a3
{
}

- (NSDate)createdUntil
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCreatedUntil:(id)a3
{
}

- (NSPredicate)filter
{
  return (NSPredicate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFilter:(id)a3
{
}

- (unint64_t)newestFileLimit
{
  return self->_newestFileLimit;
}

- (void)setNewestFileLimit:(unint64_t)a3
{
  self->_newestFileLimit = a3;
}

- (NSString)relative
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRelative:(id)a3
{
}

- (NSString)headDir
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setHeadDir:(id)a3
{
}

- (unint64_t)maxDepth
{
  return self->_maxDepth;
}

- (void)setMaxDepth:(unint64_t)a3
{
  self->_maxDepth = a3;
}

- (unint64_t)mobileContainerClass
{
  return self->_mobileContainerClass;
}

- (void)setMobileContainerClass:(unint64_t)a3
{
  self->_mobileContainerClass = a3;
}

- (NSString)mobileContainer
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setMobileContainer:(id)a3
{
}

- (BOOL)resolveHomeDirs
{
  return self->_resolveHomeDirs;
}

- (void)setResolveHomeDirs:(BOOL)a3
{
  self->_resolveHomeDirs = a3;
}

- (BOOL)pipelineFlush
{
  return self->_pipelineFlush;
}

- (void)setPipelineFlush:(BOOL)a3
{
  self->_pipelineFlush = a3;
}

- (NSArray)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(id)a3
{
}

- (NSArray)sizes
{
  return self->_sizes;
}

- (void)setSizes:(id)a3
{
}

- (NSMutableArray)matchEnumerator
{
  return self->_matchEnumerator;
}

- (void)setMatchEnumerator:(id)a3
{
}

- (NSMutableArray)logArray
{
  return self->_logArray;
}

- (void)setLogArray:(id)a3
{
}

- (NSMutableArray)logDates
{
  return self->_logDates;
}

- (void)setLogDates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
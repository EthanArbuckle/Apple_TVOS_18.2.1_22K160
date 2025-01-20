@interface SDUnitLogPathArray
+ (id)logRuleWithMutablePaths:(id)a3;
+ (id)logRuleWithPaths:(id)a3;
+ (id)logRuleWithPaths:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8;
- (NSMutableArray)paths;
- (id)description;
- (id)getNextMatch;
- (void)expandHomeDirectoriesAtPath:(id)a3 andAddToURLArray:(id)a4;
- (void)resolvePaths;
- (void)setPaths:(id)a3;
@end

@implementation SDUnitLogPathArray

+ (id)logRuleWithPaths:(id)a3
{
  id v3 = a3;
  v4 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( objc_alloc(&OBJC_CLASS___SDUnitLogPathArray),  "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  0LL,  0LL,  0LL,  0LL,  0LL);
  if (v4)
  {
    id v5 = [v3 mutableCopy];
    -[SDUnitLogPathArray setPaths:](v4, "setPaths:", v5);
  }

  return v4;
}

+ (id)logRuleWithMutablePaths:(id)a3
{
  id v3 = a3;
  v4 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( objc_alloc(&OBJC_CLASS___SDUnitLogPathArray),  "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  0LL,  0LL,  0LL,  0LL,  0LL);
  id v5 = v4;
  if (v4) {
    -[SDUnitLogPathArray setPaths:](v4, "setPaths:", v3);
  }

  return v5;
}

+ (id)logRuleWithPaths:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  v17 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( objc_alloc(&OBJC_CLASS___SDUnitLogPathArray),  "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  v16,  v15,  a6,  v14,  a8);

  if (v17)
  {
    id v18 = [v13 mutableCopy];
    -[SDUnitLogPathArray setPaths:](v17, "setPaths:", v18);
  }

  return v17;
}

- (void)expandHomeDirectoriesAtPath:(id)a3 andAddToURLArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[SDUnitLogRule resolveHomeDirs](self, "resolveHomeDirs")) {
    goto LABEL_13;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([&off_100099850 objectAtIndexedSubscript:0]);
  if (![v6 hasPrefix:v8])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([&off_100099850 objectAtIndexedSubscript:1]);
    unsigned int v10 = [v6 hasPrefix:v9];

    if (v10) {
      goto LABEL_5;
    }
LABEL_13:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolvePathToMobileContainer:](self, "resolvePathToMobileContainer:", v6));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v22));
    [v7 addObject:v23];

    goto LABEL_14;
  }

LABEL_5:
  v11 = (void *)objc_claimAutoreleasedReturnValue([&off_100099850 objectAtIndexedSubscript:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( &off_100099850,  "objectAtIndexedSubscript:",  objc_msgSend(v6, "hasPrefix:", v11) ^ 1));

  -[SDUnitLogRule setHeadDir:](self, "setHeadDir:", @".");
  id v24 = v6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:v12 withString:&stru_10008D288]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule _localUserHomeDirectories](self, "_localUserHomeDirectories"));
  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v25 + 1) + 8 * (void)i) path]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathComponent:v13]);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v20));
        [v7 addObject:v21];
      }

      id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v16);
  }

  id v6 = v24;
LABEL_14:
}

- (id)getNextMatch
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[SDUnitLogRule setMatchEnumerator:](self, "setMatchEnumerator:", v4);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          -[SDUnitLogPathArray expandHomeDirectoriesAtPath:andAddToURLArray:]( self,  "expandHomeDirectoriesAtPath:andAddToURLArray:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)i),  v5);
        }

        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v8);
    }

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      id v14 = 0LL;
      uint64_t v15 = *(void *)v21;
      do
      {
        id v16 = 0LL;
        uint64_t v17 = v14;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v11);
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue( +[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:]( &OBJC_CLASS___BFSDirectoryEnumerator,  "BFSEnumeratorWithPath:withDepth:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v16),  1LL,  (void)v20));

          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
          [v18 addObject:v14];

          id v16 = (char *)v16 + 1;
          uint64_t v17 = v14;
        }

        while (v13 != v16);
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v13);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( -[SDUnitLogRule advanceMatchEnumerator]( self,  "advanceMatchEnumerator",  (void)v20));
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"SDUnitLogPathArray with %lu paths",  [v2 count]));

  return v3;
}

- (void)resolvePaths
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
  id v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0LL;
    do
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v5]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolveCrashReporterPath:](self, "resolveCrashReporterPath:", v7));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
      [v9 setObject:v8 atIndexedSubscript:v5];

      ++v5;
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
      id v11 = [v10 count];
    }

    while ((unint64_t)v11 > v5);
  }

- (NSMutableArray)paths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
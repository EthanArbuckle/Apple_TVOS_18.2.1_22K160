@interface SDUnitLogGlob
+ (id)logRuleWithGlob:(id)a3;
+ (id)logRuleWithGlob:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8;
- (NSString)glob;
- (id)description;
- (id)getNextMatch;
- (void)addGlobContents:(id)a3 toURLArray:(id)a4;
- (void)expandHomeDirectoriesForGlob:(id)a3 andAddToURLArray:(id)a4;
- (void)resolvePaths;
- (void)setGlob:(id)a3;
@end

@implementation SDUnitLogGlob

+ (id)logRuleWithGlob:(id)a3
{
  id v3 = a3;
  v4 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( objc_alloc(&OBJC_CLASS___SDUnitLogGlob),  "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  0LL,  0LL,  0LL,  0LL,  0LL);
  v5 = v4;
  if (v4) {
    -[SDUnitLogGlob setGlob:](v4, "setGlob:", v3);
  }

  return v5;
}

+ (id)logRuleWithGlob:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  v17 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( objc_alloc(&OBJC_CLASS___SDUnitLogGlob),  "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  v16,  v15,  a6,  v14,  a8);

  if (v17) {
    -[SDUnitLogGlob setGlob:](v17, "setGlob:", v13);
  }

  return v17;
}

- (void)addGlobContents:(id)a3 toURLArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v16.gl_matchc = 1000;
  v7 = sub_1000241E4();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = [v5 fileSystemRepresentation];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Querying glob %s", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v10 = v5;
  objc_msgSend( v9,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Querying glob %s",  objc_msgSend(v10, "fileSystemRepresentation"));

  id v11 = v10;
  glob_b((const char *)[v11 fileSystemRepresentation], 4264, &stru_100088FE0, &v16);
  if (v16.gl_pathc)
  {
    size_t v12 = 0LL;
    do
    {
      id v13 = objc_autoreleasePoolPush();
      id v14 = v16.gl_pathv[v12];
      if (v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v14,  0LL,  0LL));
        if (v15) {
          [v6 addObject:v15];
        }
      }

      objc_autoreleasePoolPop(v13);
      ++v12;
    }

    while (v16.gl_pathc > v12);
  }

  globfree(&v16);
}

- (void)expandHomeDirectoriesForGlob:(id)a3 andAddToURLArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[SDUnitLogRule resolveHomeDirs](self, "resolveHomeDirs")) {
    goto LABEL_13;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([&off_100099868 objectAtIndexedSubscript:0]);
  if (![v6 hasPrefix:v8])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([&off_100099868 objectAtIndexedSubscript:1]);
    unsigned int v10 = [v6 hasPrefix:v9];

    if (v10) {
      goto LABEL_5;
    }
LABEL_13:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogGlob glob](self, "glob"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolvePathToMobileContainer:](self, "resolvePathToMobileContainer:", v21));

    -[SDUnitLogGlob addGlobContents:toURLArray:](self, "addGlobContents:toURLArray:", v22, v7);
    goto LABEL_14;
  }

LABEL_5:
  id v11 = (void *)objc_claimAutoreleasedReturnValue([&off_100099868 objectAtIndexedSubscript:0]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue( objc_msgSend( &off_100099868,  "objectAtIndexedSubscript:",  objc_msgSend(v6, "hasPrefix:", v11) ^ 1));

  -[SDUnitLogRule setHeadDir:](self, "setHeadDir:", @".");
  v23 = (void *)v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:v12 withString:&stru_10008D288]);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule _localUserHomeDirectories](self, "_localUserHomeDirectories"));
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)v18) path]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingString:v13]);
        -[SDUnitLogGlob addGlobContents:toURLArray:](self, "addGlobContents:toURLArray:", v20, v7);

        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v16);
  }

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
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogGlob glob](self, "glob"));
    -[SDUnitLogGlob expandHomeDirectoriesForGlob:andAddToURLArray:]( self,  "expandHomeDirectoriesForGlob:andAddToURLArray:",  v6,  v5);

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      unsigned int v10 = 0LL;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0LL;
        id v13 = v10;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:]( &OBJC_CLASS___BFSDirectoryEnumerator,  "BFSEnumeratorWithPath:withDepth:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v12),  1LL,  (void)v16));

          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
          [v14 addObject:v10];

          uint64_t v12 = (char *)v12 + 1;
          id v13 = v10;
        }

        while (v9 != v12);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( -[SDUnitLogRule advanceMatchEnumerator]( self,  "advanceMatchEnumerator",  (void)v16));
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogGlob glob](self, "glob"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SDUnitLogGlob with glob '%@'",  v2));

  return v3;
}

- (void)resolvePaths
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogGlob glob](self, "glob"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolveCrashReporterPath:](self, "resolveCrashReporterPath:", v4));
  -[SDUnitLogGlob setGlob:](self, "setGlob:", v3);
}

- (NSString)glob
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setGlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
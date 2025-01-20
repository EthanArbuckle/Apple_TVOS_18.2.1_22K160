@interface SDUnitLogDirectory
+ (id)logRuleWithDirectory:(id)a3;
+ (id)logRuleWithDirectory:(id)a3 atInternalDirectory:(id)a4;
+ (id)logRuleWithDirectory:(id)a3 withDepth:(unint64_t)a4 withDate:(id)a5 withFilter:(id)a6 newestFileCount:(unint64_t)a7 atInternalDirectory:(id)a8 withRuntimeChecks:(unint64_t)a9;
- (NSString)directory;
- (id)description;
- (id)getNextMatch;
- (void)resolvePaths;
- (void)setDirectory:(id)a3;
@end

@implementation SDUnitLogDirectory

+ (id)logRuleWithDirectory:(id)a3
{
  id v3 = a3;
  v4 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( objc_alloc(&OBJC_CLASS___SDUnitLogDirectory),  "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  0LL,  0LL,  0LL,  0LL,  0LL);
  v5 = v4;
  if (v4)
  {
    -[SDUnitLogDirectory setDirectory:](v4, "setDirectory:", v3);
    -[SDUnitLogRule setHeadDir:](v5, "setHeadDir:", v3);
  }

  return v5;
}

+ (id)logRuleWithDirectory:(id)a3 withDepth:(unint64_t)a4 withDate:(id)a5 withFilter:(id)a6 newestFileCount:(unint64_t)a7 atInternalDirectory:(id)a8 withRuntimeChecks:(unint64_t)a9
{
  id v14 = a3;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  v18 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( objc_alloc(&OBJC_CLASS___SDUnitLogDirectory),  "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  v17,  v16,  a7,  v15,  a9);

  if (v18)
  {
    -[SDUnitLogDirectory setDirectory:](v18, "setDirectory:", v14);
    -[SDUnitLogRule setHeadDir:](v18, "setHeadDir:", v14);
    -[SDUnitLogRule setMaxDepth:](v18, "setMaxDepth:", a4);
  }

  return v18;
}

+ (id)logRuleWithDirectory:(id)a3 atInternalDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( objc_alloc(&OBJC_CLASS___SDUnitLogDirectory),  "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  0LL,  0LL,  0LL,  v6,  0LL);

  if (v7)
  {
    -[SDUnitLogDirectory setDirectory:](v7, "setDirectory:", v5);
    -[SDUnitLogRule setHeadDir:](v7, "setHeadDir:", v5);
  }

  return v7;
}

- (id)getNextMatch
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[SDUnitLogRule setMatchEnumerator:](v2, "setMatchEnumerator:", v4);

    if (-[SDUnitLogRule resolveHomeDirs](v2, "resolveHomeDirs"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([&off_100099880 objectAtIndexedSubscript:0]);
      if ([v5 hasPrefix:v6])
      {

LABEL_6:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([&off_100099880 objectAtIndexedSubscript:0]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( &off_100099880,  "objectAtIndexedSubscript:",  objc_msgSend(v10, "hasPrefix:", v11) ^ 1));

        -[SDUnitLogRule setHeadDir:](v2, "setHeadDir:", @".");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByReplacingOccurrencesOfString:v12 withString:&stru_10008D288]);

        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule _localUserHomeDirectories](v2, "_localUserHomeDirectories"));
        id v14 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v14)
        {
          id v15 = v14;
          v34 = v12;
          id v16 = v2;
          id v17 = 0LL;
          v18 = 0LL;
          uint64_t v19 = *(void *)v38;
          do
          {
            v20 = 0LL;
            v21 = v17;
            v22 = v18;
            do
            {
              if (*(void *)v38 != v19) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v20);
              v24 = objc_autoreleasePoolPush();
              v25 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
              v41[0] = v25;
              v41[1] = v36;
              v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v41,  2LL));
              id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPathComponents:]( &OBJC_CLASS___NSURL,  "fileURLWithPathComponents:",  v26));

              v18 = (void *)objc_claimAutoreleasedReturnValue( +[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:]( &OBJC_CLASS___BFSDirectoryEnumerator,  "BFSEnumeratorWithPath:withDepth:",  v17,  -[SDUnitLogRule maxDepth](v16, "maxDepth")));
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](v16, "matchEnumerator"));
              [v27 addObject:v18];

              objc_autoreleasePoolPop(v24);
              v20 = (char *)v20 + 1;
              v21 = v17;
              v22 = v18;
            }

            while (v15 != v20);
            id v15 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
          }

          while (v15);

          v2 = v16;
          v12 = v34;
        }

        else
        {
          v18 = 0LL;
        }

        goto LABEL_17;
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([&off_100099880 objectAtIndexedSubscript:1]);
      unsigned int v9 = [v7 hasPrefix:v8];

      if (v9) {
        goto LABEL_6;
      }
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolvePathToMobileContainer:](v2, "resolvePathToMobileContainer:", v28));

    id v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  [v30 fileSystemRepresentation],  1,  0));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:]( &OBJC_CLASS___BFSDirectoryEnumerator,  "BFSEnumeratorWithPath:withDepth:",  v31,  -[SDUnitLogRule maxDepth](v2, "maxDepth")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](v2, "matchEnumerator"));
    [v32 addObject:v18];

LABEL_17:
  }

  return (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule advanceMatchEnumerator](v2, "advanceMatchEnumerator"));
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](self, "directory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SDUnitLogDirectory with directory '%@'",  v2));

  return v3;
}

- (void)resolvePaths
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule headDir](self, "headDir"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolveCrashReporterPath:](self, "resolveCrashReporterPath:", v3));
  -[SDUnitLogRule setHeadDir:](self, "setHeadDir:", v4);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](self, "directory"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolveCrashReporterPath:](self, "resolveCrashReporterPath:", v6));
  -[SDUnitLogDirectory setDirectory:](self, "setDirectory:", v5);
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDirectory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
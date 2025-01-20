@interface LogArchiveAggregator
+ (void)_addAWDLogFilesToArchive:(id *)a3;
+ (void)_addCrashLogFilesToArchive:(id *)a3;
+ (void)_addFiles:(id)a3 archive:(id *)a4 lastPathComponent:(id)a5;
+ (void)_addLaunchdLogFilesToArchive:(id *)a3;
+ (void)_addMobileGeneralLogFilesToArchive:(id *)a3;
+ (void)_addRootGeneralLogFilesToArchive:(id *)a3;
+ (void)addLogTypes:(unint64_t)a3 archive:(id *)a4 prefix:(id)a5;
@end

@implementation LogArchiveAggregator

+ (void)addLogTypes:(unint64_t)a3 archive:(id *)a4 prefix:(id)a5
{
  char v6 = a3;
  v7 = (__CFString *)a5;
  v9 = v7;
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &stru_100004278;
  }
  objc_storeStrong((id *)&qword_1000082B0, v8);
  if ((v6 & 2) != 0)
  {
    +[LogArchiveAggregator _addRootGeneralLogFilesToArchive:]( &OBJC_CLASS___LogArchiveAggregator,  "_addRootGeneralLogFilesToArchive:",  a4);
    if ((v6 & 4) == 0)
    {
LABEL_6:
      if ((v6 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }

  else if ((v6 & 4) == 0)
  {
    goto LABEL_6;
  }

  +[LogArchiveAggregator _addMobileGeneralLogFilesToArchive:]( &OBJC_CLASS___LogArchiveAggregator,  "_addMobileGeneralLogFilesToArchive:",  a4);
  if ((v6 & 8) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_14:
    +[LogArchiveAggregator _addCrashLogFilesToArchive:]( &OBJC_CLASS___LogArchiveAggregator,  "_addCrashLogFilesToArchive:",  a4);
    if ((v6 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

+ (void)_addRootGeneralLogFilesToArchive:(id *)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/logs/AppleSupport"));
  char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"lastPathComponent BEGINSWITH 'general' AND lastPathComponent ENDSWITH '.log'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:&__NSArray0__struct options:1 error:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredArrayUsingPredicate:v6]);
  [v9 addObjectsFromArray:v8];

  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:]( &OBJC_CLASS___LogArchiveAggregator,  "_addFiles:archive:lastPathComponent:",  v9,  a3,  @"root");
}

+ (void)_addMobileGeneralLogFilesToArchive:(id *)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/mobile/Library/Logs/AppleSupport"));
  char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"lastPathComponent BEGINSWITH 'general' AND lastPathComponent ENDSWITH '.log'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:&__NSArray0__struct options:1 error:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredArrayUsingPredicate:v6]);
  [v9 addObjectsFromArray:v8];

  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:]( &OBJC_CLASS___LogArchiveAggregator,  "_addFiles:archive:lastPathComponent:",  v9,  a3,  @"mobile");
}

+ (void)_addAWDLogFilesToArchive:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/private/var/wireless/awdd"));
  char v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:]( &OBJC_CLASS___LogArchiveAggregator,  "_addFiles:archive:lastPathComponent:",  v5,  a3,  @"AWD");
}

+ (void)_addCrashLogFilesToArchive:(id *)a3
{
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v21 = [&off_100004638 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(&off_100004638);
        }
        uint64_t v22 = v4;
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * v4);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v6 = [&off_100004650 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v24;
          do
          {
            id v9 = 0LL;
            do
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(&off_100004650);
              }
              v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v23 + 1) + 8 * (void)v9) stringByAppendingString:v5]);
              v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"lastPathComponent BEGINSWITH '%@'",  v10));
              [v3 addObject:v11];

              id v9 = (char *)v9 + 1;
            }

            while (v7 != v9);
            id v7 = [&off_100004650 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }

          while (v7);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"lastPathComponent BEGINSWITH '%@'",  v5));
        [v3 addObject:v12];

        uint64_t v4 = v22 + 1;
      }

      while ((id)(v22 + 1) != v21);
      id v21 = [&off_100004638 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v21);
  }

  [v3 addObject:@"lastPathComponent BEGINSWITH 'JetsamEvent-'"];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@" OR "]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/mobile/Library/Logs/CrashReporter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( [v19 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:&__NSArray0__struct options:1 error:0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 filteredArrayUsingPredicate:v16]);

  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:]( &OBJC_CLASS___LogArchiveAggregator,  "_addFiles:archive:lastPathComponent:",  v17,  a3,  0LL);
}

+ (void)_addLaunchdLogFilesToArchive:(id *)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/log/com.apple.xpc.launchd"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [v6 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:&__NSArray0__struct options:1 error:0]);
  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:]( &OBJC_CLASS___LogArchiveAggregator,  "_addFiles:archive:lastPathComponent:",  v5,  a3,  @"launchd");
}

+ (void)_addFiles:(id)a3 archive:(id *)a4 lastPathComponent:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (__CFString *)a5;
  id v9 = v8;
  v10 = &stru_100004278;
  if (v8) {
    v10 = v8;
  }
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000082B0 stringByAppendingPathComponent:v11]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend( *a4,  "addURL:prefix:error:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)v17),  v12,  0,  (void)v18);
        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v15);
  }
}

@end
@interface DEVPNExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEVPNExtension

- (id)attachmentsForParameters:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/Library/Logs/CrashReporter"));
  v24 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:&__NSArray0__struct options:4 error:0]);

  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 absoluteString]);
        id v14 = [v13 rangeOfString:@"com.apple.networking.networkextension.log"];

        if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v12 pathExtension]);
          -[NSMutableArray addObject:](v6, "addObject:", v15);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v9);
  }

  -[NSMutableArray addObject:](v6, "addObject:", @"log");
  +[DELogMover moveSystemLogsWithExtensions:](&OBJC_CLASS___DELogMover, "moveSystemLogsWithExtensions:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"com.apple.networking.networkextension.log.*",  1LL,  0LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( -[DEVPNExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v17,  v16,  0LL));
  id v19 = [v18 mutableCopy];

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/log/ppp.log",  0LL));
  uint64_t v25 = 0LL;
  if (([v20 checkResourceIsReachableAndReturnError:&v25] & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v20));
    [v19 addObject:v21];
  }

  return v19;
}

@end
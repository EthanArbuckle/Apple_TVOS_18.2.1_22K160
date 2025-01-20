@interface DEPanicExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)getAllCoreFiles;
- (id)getAllPanicLogs;
@end

@implementation DEPanicExtension

- (id)getAllPanicLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @".*panic.*\\.ips.*",  1LL,  0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DEPanicExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v4,  v3,  0LL));
  id v6 = [v5 mutableCopy];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"modificationDate",  1LL));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  [v6 sortUsingDescriptors:v8];

  return v6;
}

- (id)getAllCoreFiles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:@"Panics"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DEPanicExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v4,  0LL,  0LL));
  id v6 = [v5 mutableCopy];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"modificationDate",  1LL));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  [v6 sortUsingDescriptors:v8];

  return v6;
}

- (id)attachmentsForParameters:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DEPanicExtension getAllPanicLogs](self, "getAllPanicLogs", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DEPanicExtension getAllCoreFiles](self, "getAllCoreFiles"));
  id v41 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v5 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v8));

    v10 = (char *)[v9 rangeOfString:@".core."];
    v11 = v10 - 1;
    do
    {
      unsigned int v12 = [v9 characterAtIndex:v11];
      BOOL v14 = v11-- != 0LL;
    }

    while (v12 != 46 && v14);
    if (v11 == (char *)-1LL || v11 == (char *)0x7FFFFFFFFFFFFFFELL)
    {
LABEL_42:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to find date in most recent filename (%@), including this coredump and associated log",  buf,  0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByDeletingPathExtension]);
      id v18 = (id)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathExtension:@"log"]);

      [v41 addObject:v15];
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v18));
      [v41 addObject:v19];
    }

    else
    {
      v40 = v4;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 substringToIndex:v11 + 1]);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v53 = [v5 count];
        __int16 v54 = 2112;
        v55 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Found %lu coredumps, including all panic related files from : %@",  buf,  0x16u);
      }

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      v39 = v5;
      id v22 = v5;
      id v23 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v47;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v47 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
            v28 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
            v29 = (void *)objc_claimAutoreleasedReturnValue([v28 lastPathComponent]);
            id v30 = [v29 rangeOfString:v15];

            if (v30 != (id)0x7FFFFFFFFFFFFFFFLL) {
              [v41 addObject:v27];
            }
          }

          id v24 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }

        while (v24);
      }

      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      v4 = v40;
      id v18 = v40;
      id v31 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v43;
        do
        {
          for (j = 0LL; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v43 != v33) {
              objc_enumerationMutation(v18);
            }
            v35 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v35 path]);
            v37 = (void *)objc_claimAutoreleasedReturnValue([v36 lastPathComponent]);
            id v38 = [v37 rangeOfString:v15];

            if (v38 != (id)0x7FFFFFFFFFFFFFFFLL) {
              [v41 addObject:v35];
            }
          }

          id v32 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }

        while (v32);
        v4 = v40;
      }

      v5 = v39;
    }
  }

  else if ([v4 count])
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);
    [v41 addObject:v20];
  }

  return v41;
}

- (id)attachmentList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DEPanicExtension getAllPanicLogs](self, "getAllPanicLogs"));
  [v3 addObjectsFromArray:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DEPanicExtension getAllCoreFiles](self, "getAllCoreFiles"));
  [v3 addObjectsFromArray:v5];

  return v3;
}

@end
@interface SDCacheEnumerator
+ (id)sysdiagnoseDirectory;
+ (id)sysdiagnoseEnumerator:(id)a3 WithVolume:(id)a4 WithFlags:(unint64_t)a5;
+ (id)sysdiagnoseInternalDirectory;
+ (id)validFileSubstrings;
- (BOOL)isSysdiagnoseFile:(id)a3;
- (NSArray)enumerators;
- (id)initCacheEnumerator;
- (id)initCacheEnumeratorWithVolume:(id)a3;
- (id)initCacheEnumeratorWithVolume:(id)a3 WithFlags:(unint64_t)a4;
- (id)nextSysdiagnoseFile;
- (id)nextValidURL;
- (void)setEnumerators:(id)a3;
@end

@implementation SDCacheEnumerator

+ (id)sysdiagnoseDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pathSubmission]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"DiagnosticLogs/sysdiagnose"]);

  return v4;
}

+ (id)sysdiagnoseInternalDirectory
{
  return @"/private/var/db/sysdiagnose/com.apple.sysdiagnose";
}

+ (id)validFileSubstrings
{
  if (qword_1000A51B0 != -1) {
    dispatch_once(&qword_1000A51B0, &stru_1000891C0);
  }
  return (id)qword_1000A51A8;
}

+ (id)sysdiagnoseEnumerator:(id)a3 WithVolume:(id)a4 WithFlags:(unint64_t)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", a4, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  if ([v7 hasPrefix:v9])
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v9, "length")));

    id v7 = (id)v10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDCacheEnumerator sysdiagnoseInternalDirectory]( &OBJC_CLASS___SDCacheEnumerator,  "sysdiagnoseInternalDirectory"));
  unsigned int v12 = [v7 isEqualToString:v11];

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    v24[0] = v14;
    v24[1] = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v15));
  }

  id v16 = sub_10001F89C();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v23 = [v13 fileSystemRepresentation];
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Creating an enumerator at %{public}s",  buf,  0xCu);
  }

  if (v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLIsDirectoryKey,  NSURLNameKey,  NSURLPathKey,  NSURLCreationDateKey,  0LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v18 enumeratorAtURL:v13 includingPropertiesForKeys:v19 options:a5 errorHandler:&stru_1000891E0]);
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

- (id)initCacheEnumeratorWithVolume:(id)a3
{
  return -[SDCacheEnumerator initCacheEnumeratorWithVolume:WithFlags:]( self,  "initCacheEnumeratorWithVolume:WithFlags:",  a3,  5LL);
}

- (id)initCacheEnumeratorWithVolume:(id)a3 WithFlags:(unint64_t)a4
{
  v6 = (__CFString *)a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SDCacheEnumerator;
  id v7 = -[SDCacheEnumerator init](&v32, "init");
  if (v7)
  {
    if (!v6) {
      v6 = @"/";
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
    v36[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDCacheEnumerator sysdiagnoseInternalDirectory]( &OBJC_CLASS___SDCacheEnumerator,  "sysdiagnoseInternalDirectory"));
    v36[1] = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v12)
    {
      id v14 = v12;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v18 = objc_msgSend((id)objc_opt_class(v7, v13), "sysdiagnoseEnumerator:WithVolume:WithFlags:", v17, v6, a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          if (v19)
          {
            -[NSMutableArray addObject:](v11, "addObject:", v19);
          }

          else
          {
            id v20 = sub_10001F89C();
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = [v17 UTF8String];
              *(_DWORD *)buf = 136446210;
              id v34 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "CacheEnumerator: got nil enumerator for dir '%{public}s'",  buf,  0xCu);
            }
          }
        }

        id v14 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
      }

      while (v14);
    }

    id v23 = (NSArray *)-[NSMutableArray copy](v11, "copy");
    enumerators = v7->_enumerators;
    v7->_enumerators = v23;

    v25 = v7;
  }

  return v7;
}

- (id)initCacheEnumerator
{
  id v3 = -[SDCacheEnumerator initCacheEnumeratorWithVolume:]( objc_alloc(&OBJC_CLASS___SDCacheEnumerator),  "initCacheEnumeratorWithVolume:",  0LL);

  return v3;
}

- (BOOL)isSysdiagnoseFile:(id)a3
{
  id v3 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator validFileSubstrings](&OBJC_CLASS___SDCacheEnumerator, "validFileSubstrings", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([v3 rangeOfString:*(void *)(*((void *)&v9 + 1) + 8 * (void)i)] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (id)nextSysdiagnoseFile
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDCacheEnumerator enumerators](self, "enumerators"));
  id v16 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    id v18 = v3;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v3);
        }
        id v5 = 0LL;
        uint64_t v6 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        while (1)
        {
          id v7 = v5;
          id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 nextObject]);

          if (!v5) {
            break;
          }
          v8 = objc_autoreleasePoolPush();
          id v20 = 0LL;
          [v5 getResourceValue:&v20 forKey:NSURLIsDirectoryKey error:0];
          id v9 = v20;
          if ([v9 BOOLValue])
          {
            int v10 = 4;
          }

          else
          {
            __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 relativePath]);
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pathComponents]);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

            if (-[SDCacheEnumerator isSysdiagnoseFile:](self, "isSysdiagnoseFile:", v13))
            {
              id v19 = v5;
              int v10 = 1;
            }

            else
            {
              [v6 skipDescendants];
              int v10 = 4;
            }
          }

          objc_autoreleasePoolPop(v8);
          if (v10 != 4)
          {

            id v3 = v18;
            id v14 = v19;
            goto LABEL_20;
          }
        }

        id v3 = v18;
      }

      id v14 = 0LL;
      id v16 = [v18 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v16);
  }

  else
  {
    id v14 = 0LL;
  }

- (id)nextValidURL
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDCacheEnumerator enumerators](self, "enumerators", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = 0LL;
        id v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        while (1)
        {
          int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nextObject]);

          if (!v10) {
            break;
          }
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
          unsigned __int8 v13 = -[SDCacheEnumerator isSysdiagnoseFile:](self, "isSysdiagnoseFile:", v12);

          v8 = v10;
          if ((v13 & 1) != 0) {
            goto LABEL_14;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      int v10 = 0LL;
    }

    while (v5);
  }

  else
  {
    int v10 = 0LL;
  }

- (NSArray)enumerators
{
  return self->_enumerators;
}

- (void)setEnumerators:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
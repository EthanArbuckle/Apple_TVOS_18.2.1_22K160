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
  if (qword_1000103F8 != -1) {
    dispatch_once(&qword_1000103F8, &stru_10000C648);
  }
  return (id)qword_1000103F0;
}

+ (id)sysdiagnoseEnumerator:(id)a3 WithVolume:(id)a4 WithFlags:(unint64_t)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", a4, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  if ([v7 hasPrefix:v9])
  {
    uint64_t v10 = [v7 substringFromIndex:[v9 length]];

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

  id v16 = sub_10000760C();
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
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v18 enumeratorAtURL:v13 includingPropertiesForKeys:v19 options:a5 errorHandler:&stru_10000C688]);
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
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SDCacheEnumerator;
  id v7 = -[SDCacheEnumerator init](&v31, "init");
  if (v7)
  {
    if (!v6) {
      v6 = @"/";
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
    v35[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDCacheEnumerator sysdiagnoseInternalDirectory]( &OBJC_CLASS___SDCacheEnumerator,  "sysdiagnoseInternalDirectory"));
    v35[1] = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v17 = [(id)objc_opt_class(v7) sysdiagnoseEnumerator:v16 WithVolume:v6 WithFlags:a4];
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          if (v18)
          {
            -[NSMutableArray addObject:](v11, "addObject:", v18);
          }

          else
          {
            id v19 = sub_10000760C();
            v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = [v16 UTF8String];
              *(_DWORD *)buf = 136446210;
              id v33 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "CacheEnumerator: got nil enumerator for dir '%{public}s'",  buf,  0xCu);
            }
          }
        }

        id v13 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
      }

      while (v13);
    }

    v22 = (NSArray *)-[NSMutableArray copy](v11, "copy");
    enumerators = v7->_enumerators;
    v7->_enumerators = v22;

    v24 = v7;
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
    v18 = v3;
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
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

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
            uint64_t v14 = v19;
            goto LABEL_20;
          }
        }

        id v3 = v18;
      }

      uint64_t v14 = 0LL;
      id v16 = [v18 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v16);
  }

  else
  {
    uint64_t v14 = 0LL;
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
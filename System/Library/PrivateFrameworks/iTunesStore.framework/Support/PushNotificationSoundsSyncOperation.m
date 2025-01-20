@interface PushNotificationSoundsSyncOperation
- (BOOL)_downloadSoundFileWithURL:(id)a3 name:(id)a4 cache:(id)a5 error:(id *)a6;
- (BOOL)_downloadSoundFiles:(id)a3 error:(id *)a4;
- (id)_newSoundFileURLCache;
- (void)run;
@end

@implementation PushNotificationSoundsSyncOperation

- (void)run
{
  uint64_t v19 = 0LL;
  v3 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL);
  if ((-[PushNotificationSoundsSyncOperation loadURLBagWithContext:returningError:]( self,  "loadURLBagWithContext:returningError:",  v3,  &v19) & 1) != 0)
  {
    id v4 = objc_msgSend( objc_msgSend( +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"),  "URLBagForContext:",  v3),  "valueForKey:",  @"push-notifications");
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = [v4 objectForKey:@"sound-files"];
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
        id v8 = v6;
      }
      else {
        id v8 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }

    BOOL v17 = -[PushNotificationSoundsSyncOperation _downloadSoundFiles:error:]( self,  "_downloadSoundFiles:error:",  v8,  &v19);
  }

  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      uint64_t v13 = objc_opt_class(self);
      int v20 = 138412546;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v19;
      uint64_t v14 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Could not load URL bag: %@",  &v20,  22);
      if (v14)
      {
        v15 = (void *)v14;
        v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        v18 = v16;
        SSFileLog(v9, @"%@");
      }
    }

    BOOL v17 = 0LL;
  }

  -[PushNotificationSoundsSyncOperation setError:](self, "setError:", v19, v18);
  -[PushNotificationSoundsSyncOperation setSuccess:](self, "setSuccess:", v17);
}

- (BOOL)_downloadSoundFileWithURL:(id)a3 name:(id)a4 cache:(id)a5 error:(id *)a6
{
  v53 = 0LL;
  unsigned int v10 = -[NSURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSURLRequest), "initWithURL:", a3);
  id v51 = a5;
  id v11 = [a5 cachedResponseForRequest:v10];
  if (!v11) {
    goto LABEL_13;
  }
  objc_msgSend(objc_msgSend(v11, "response"), "_calculatedExpiration");
  double v13 = v12;
  id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v14) {
    id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  LODWORD(v15) = [v14 shouldLog];
  v16 = (os_log_s *)[v14 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    uint64_t v15 = v15;
  }
  else {
    v15 &= 2u;
  }
  if ((_DWORD)v15)
  {
    uint64_t v17 = objc_opt_class(self);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    int v54 = 138412546;
    uint64_t v55 = v17;
    __int16 v56 = 2048;
    double v57 = v13 - v18;
    uint64_t v19 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Sound file expires in %.2f seconds",  &v54,  22);
    if (v19)
    {
      int v20 = (void *)v19;
      uint64_t v21 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
      free(v20);
      v48 = v21;
      SSFileLog(v14, @"%@");
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate", v48);
  if (v13 >= v22)
  {
    LOBYTE(v34) = 1;
  }

  else
  {
LABEL_13:
    id v23 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    v24 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  a3);
    -[SSMutableURLRequestProperties setCachePolicy:](v24, "setCachePolicy:", 1LL);
    [v23 setRequestProperties:v24];

    id v25 = objc_alloc_init(&OBJC_CLASS___ISHashedDownloadProvider);
    objc_msgSend( v25,  "setLocalFilePath:",  objc_msgSend( +[PushNotificationController soundFilesDirectoryPath]( PushNotificationController,  "soundFilesDirectoryPath"),  "stringByAppendingPathComponent:",  a4));
    [v25 resetStream];
    id v26 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v26) {
      id v26 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v27) = [v26 shouldLog];
    v28 = (os_log_s *)[v26 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
      uint64_t v27 = v27;
    }
    else {
      v27 &= 2u;
    }
    if ((_DWORD)v27)
    {
      uint64_t v29 = objc_opt_class(self);
      id v30 = [v25 localFilePath];
      int v54 = 138412802;
      uint64_t v55 = v29;
      __int16 v56 = 2112;
      double v57 = *(double *)&a3;
      __int16 v58 = 2112;
      id v59 = v30;
      LODWORD(v50) = 32;
      uint64_t v31 = _os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  1LL,  "%@: Downloading sound file %@ to %@",  &v54,  v50);
      if (v31)
      {
        v32 = (void *)v31;
        v33 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v31, 4LL);
        free(v32);
        v48 = v33;
        SSFileLog(v26, @"%@");
      }
    }

    objc_msgSend(v23, "setDataProvider:", v25, v48);

    unsigned int v34 = -[PushNotificationSoundsSyncOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v23,  &v53);
    if (v34)
    {
      v35 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 1LL);
      v36 = -[NSCachedURLResponse initWithResponse:data:]( [NSCachedURLResponse alloc],  "initWithResponse:data:",  [v23 response],  v35);
      id v37 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v37) {
        id v37 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v38) = [v37 shouldLog];
      v39 = (os_log_s *)[v37 OSLogObject];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
        uint64_t v38 = v38;
      }
      else {
        v38 &= 2u;
      }
      if ((_DWORD)v38)
      {
        uint64_t v40 = objc_opt_class(self);
        objc_msgSend(objc_msgSend(v23, "response"), "_calculatedExpiration");
        double v42 = v41;
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        int v54 = 138412546;
        uint64_t v55 = v40;
        __int16 v56 = 2048;
        double v57 = v42 - v43;
        LODWORD(v50) = 22;
        uint64_t v44 = _os_log_send_and_compose_impl( v38,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  1LL,  "%@: Cache sound file expiring in %.2f seconds",  &v54,  v50);
        if (v44)
        {
          v45 = (void *)v44;
          v46 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v44, 4LL);
          free(v45);
          v49 = v46;
          SSFileLog(v37, @"%@");
        }
      }

      objc_msgSend(v51, "storeCachedResponse:forRequest:", v36, v10, v49);
      [v51 saveMemoryCacheToDisk];
    }
  }

  if (a6) {
    *a6 = v53;
  }
  return v34;
}

- (BOOL)_downloadSoundFiles:(id)a3 error:(id *)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v7 = +[PushNotificationController soundFilesDirectoryPath]( &OBJC_CLASS___PushNotificationController,  "soundFilesDirectoryPath");
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v6,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v7,  1LL,  0LL,  0LL);
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = -[NSFileManager contentsOfDirectoryAtPath:error:](v6, "contentsOfDirectoryAtPath:error:", v7, 0LL);
  if (v9) {
    -[NSMutableSet addObjectsFromArray:](v8, "addObjectsFromArray:", v9);
  }
  id v53 = a3;
  id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  double v13 = (os_log_s *)[v10 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if ((_DWORD)v12)
  {
    *(_DWORD *)v64 = 138412546;
    *(void *)&v64[4] = objc_opt_class(self);
    __int16 v65 = 2048;
    id v66 = [v53 count];
    uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Loading %lu sound files",  v64,  22);
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
      free(v15);
      v46 = v16;
      SSFileLog(v10, @"%@");
    }
  }

  uint64_t v17 = v53;
  if (objc_msgSend(v53, "count", v46))
  {
    id v49 = -[PushNotificationSoundsSyncOperation _newSoundFileURLCache](self, "_newSoundFileURLCache");
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v18 = [v53 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v18)
    {
      id v19 = v18;
      v52 = 0LL;
      uint64_t v20 = *(void *)v59;
      int v51 = 1;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v59 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
          uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
          {
            id v24 = [v22 objectForKey:@"name"];
            id v25 = [v22 objectForKey:@"url"];
            uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
            {
              uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v25, v27) & 1) != 0)
              {
                v28 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v25);
                if (v28)
                {
                  uint64_t v29 = v28;
                  *(void *)v64 = 0LL;
                  v51 &= -[PushNotificationSoundsSyncOperation _downloadSoundFileWithURL:name:cache:error:]( self,  "_downloadSoundFileWithURL:name:cache:error:",  v28,  v24,  v49,  v64);
                  id v30 = v52;
                  if (!v52) {
                    id v30 = *(void **)v64;
                  }
                  v52 = v30;
                  -[NSMutableSet removeObject:](v8, "removeObject:", v24);
                }
              }
            }

            uint64_t v17 = v53;
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v58 objects:v63 count:16];
      }

      while (v19);
    }

    else
    {
      v52 = 0LL;
      LOBYTE(v51) = 1;
    }

    BOOL v31 = v51 & 1;
  }

  else
  {
    v52 = 0LL;
    BOOL v31 = 1;
  }

  id v32 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v32) {
    id v32 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v33 = [v32 shouldLog];
  else {
    LODWORD(v34) = v33;
  }
  v35 = (os_log_s *)[v32 OSLogObject];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
    uint64_t v34 = v34;
  }
  else {
    v34 &= 2u;
  }
  if ((_DWORD)v34)
  {
    uint64_t v36 = objc_opt_class(self);
    id v37 = -[NSMutableSet count](v8, "count");
    *(_DWORD *)v64 = 138412546;
    *(void *)&v64[4] = v36;
    __int16 v65 = 2048;
    id v66 = v37;
    LODWORD(v48) = 22;
    uint64_t v38 = _os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  1LL,  "%@: Removing %lu dead sound files",  v64,  v48);
    if (v38)
    {
      v39 = (void *)v38;
      uint64_t v40 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v38, 4LL);
      free(v39);
      v47 = v40;
      SSFileLog(v32, @"%@");
    }
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v54,  v62,  16LL,  v47);
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v55;
    do
    {
      for (j = 0LL; j != v42; j = (char *)j + 1)
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(v8);
        }
        -[NSFileManager removeItemAtPath:error:]( v6,  "removeItemAtPath:error:",  [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v54 + 1) + 8 * (void)j)],  0);
      }

      id v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v54,  v62,  16LL);
    }

    while (v42);
  }

  if (a4) {
    *a4 = v52;
  }
  return v31;
}

- (id)_newSoundFileURLCache
{
  id v2 = objc_alloc_init(&OBJC_CLASS___ISURLCacheConfiguration);
  [v2 setPersistentIdentifier:@"com.apple.itunesstored.APNS_Sounds_Cache"];
  [v2 setDiskCapacity:10485760];
  [v2 setMemoryCapacity:0x100000];
  id v3 = [[ISURLCache alloc] initWithCacheConfiguration:v2];

  return v3;
}

@end
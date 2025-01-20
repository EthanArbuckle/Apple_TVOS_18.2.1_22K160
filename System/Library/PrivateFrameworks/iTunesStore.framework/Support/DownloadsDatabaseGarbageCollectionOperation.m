@interface DownloadsDatabaseGarbageCollectionOperation
+ (BOOL)garbageCollectionTimerIsExpired;
- (void)_garbageCollectPersistentManagers;
- (void)_garbageCollectSoftwareDownloads;
- (void)_garbageCollectWorkingDirectory;
- (void)_garbageCollectWorkingDirectoryPath:(id)a3;
- (void)run;
@end

@implementation DownloadsDatabaseGarbageCollectionOperation

+ (BOOL)garbageCollectionTimerIsExpired
{
  v2 = (void *)CFPreferencesCopyAppValue(@"DownloadsScratchGarbageCollectionTime", kSSUserDefaultsIdentifier);
  v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    BOOL v5 = v4 < -86400.0;
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)run
{
  v3 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  double v4 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"DownloadsScratchGarbageCollectionTime", v3, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v4);
  -[DownloadsDatabaseGarbageCollectionOperation setSuccess:](self, "setSuccess:", 1LL);
}

- (void)_garbageCollectPersistentManagers
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100156290;
  v20[3] = &unk_10034FCC0;
  BOOL v5 = v3;
  v21 = v5;
  [v4 readUsingTransactionBlock:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100156450;
  v18[3] = &unk_10034FCE8;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v19 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v18);
  if (-[NSMutableArray count](v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      v11 = (void *)objc_opt_class(self);
      id v12 = v11;
      id v13 = -[NSMutableArray count](v6, "count");
      int v22 = 138412546;
      v23 = v11;
      __int16 v24 = 2048;
      id v25 = v13;
      v14 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "[%@]: Garbage collecting %lu persistent managers",  &v22,  22);

      if (!v14)
      {
LABEL_14:

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_1001564B0;
        v16[3] = &unk_10034CEB8;
        v17 = v6;
        id v15 = [v4 modifyUsingTransactionBlock:v16];

        goto LABEL_15;
      }

      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_14;
  }

- (void)_garbageCollectSoftwareDownloads
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v12 = 138412290;
  id v13 = (id)objc_opt_class(self);
  id v7 = v13;
  unsigned int v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "[%@]: Garbage collecting software downloads",  &v12,  12);

  if (v8)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10015679C;
  v11[3] = &unk_10034CEB8;
  v11[4] = self;
  id v10 = [v9 modifyUsingTransactionBlock:v11];
}

- (void)_garbageCollectWorkingDirectory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ScratchManager baseDirectoryPath](&OBJC_CLASS___ScratchManager, "baseDirectoryPath"));
  -[DownloadsDatabaseGarbageCollectionOperation _garbageCollectWorkingDirectoryPath:]( self,  "_garbageCollectWorkingDirectoryPath:",  v3);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
  unsigned int v5 = [v4 isMultiUser];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[ScratchManager containerDirectoryPath](&OBJC_CLASS___ScratchManager, "containerDirectoryPath"));
    -[DownloadsDatabaseGarbageCollectionOperation _garbageCollectWorkingDirectoryPath:]( self,  "_garbageCollectWorkingDirectoryPath:",  v6);
  }

- (void)_garbageCollectWorkingDirectoryPath:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    int v68 = 138412546;
    id v69 = (id)objc_opt_class(self);
    __int16 v70 = 2112;
    id v71 = v3;
    id v8 = v69;
    uint64_t v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "[%@]: Garbage collecting download scratch directory: %@",  &v68,  22);

    if (!v9) {
      goto LABEL_13;
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    v44 = v7;
    SSFileLog(v4, @"%@");
  }

LABEL_13:
  id v10 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSFileManager contentsOfDirectoryAtPath:error:](v10, "contentsOfDirectoryAtPath:error:", v3, 0LL));
  id v12 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * (void)i), "longLongValue", v44);
        if (v16)
        {
          v17 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", v16);
          -[NSMutableSet addObject:](v11, "addObject:", v17);
        }
      }

      id v13 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }

    while (v13);
  }

  if (-[NSMutableSet count](v11, "count", v44))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_100157294;
    v57[3] = &unk_10034EEC8;
    v19 = v11;
    v58 = v19;
    v59 = self;
    id v49 = v3;
    id v20 = v3;
    id v60 = v20;
    v48 = v10;
    v21 = v10;
    v61 = v21;
    [v18 readUsingTransactionBlock:v57];

    int v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v22) {
      int v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    v47 = v11;
    unsigned int v23 = [v22 shouldLog];
    else {
      unsigned int v24 = v23;
    }
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = v24 & 2;
    }
    if ((_DWORD)v26)
    {
      v27 = (void *)objc_opt_class(self);
      id v28 = v27;
      id v29 = -[NSMutableSet count](v19, "count");
      int v68 = 138412546;
      id v69 = v27;
      __int16 v70 = 2048;
      id v71 = v29;
      LODWORD(v46) = 22;
      v30 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  1LL,  "[%@]: Garbage collecting %lu scratch directories",  &v68,  v46);

      if (!v30)
      {
LABEL_35:

        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        v50 = v19;
        id v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v53,  v66,  16LL);
        if (!v31) {
          goto LABEL_53;
        }
        id v32 = v31;
        uint64_t v33 = *(void *)v54;
        while (1)
        {
          v34 = 0LL;
          v35 = &ACSLocateCachingServer_ptr;
          do
          {
            if (*(void *)v54 != v33) {
              objc_enumerationMutation(v50);
            }
            v37 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingPathComponent:v36]);

            -[NSFileManager removeItemAtPath:error:](v21, "removeItemAtPath:error:", v37, 0LL);
            v38 = (void *)objc_claimAutoreleasedReturnValue([v35[459] sharedDaemonConfig]);
            if (!v38) {
              v38 = (void *)objc_claimAutoreleasedReturnValue([v35[459] sharedConfig]);
            }
            LODWORD(v39) = [v38 shouldLog];
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 OSLogObject]);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
              uint64_t v39 = v39;
            }
            else {
              v39 &= 2u;
            }
            if ((_DWORD)v39)
            {
              v41 = (void *)objc_opt_class(self);
              int v68 = 138412546;
              id v69 = v41;
              __int16 v70 = 2112;
              id v71 = v37;
              id v42 = v41;
              LODWORD(v46) = 22;
              v43 = (void *)_os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &_mh_execute_header,  v40,  1LL,  "[%@]: Removed: %@",  &v68,  v46);

              v35 = &ACSLocateCachingServer_ptr;
              if (!v43) {
                goto LABEL_51;
              }
              v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v43,  4LL));
              free(v43);
              v45 = v40;
              SSFileLog(v38, @"%@");
            }

LABEL_51:
            v34 = (char *)v34 + 1;
          }

          while (v32 != v34);
          id v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v53,  v66,  16LL);
          if (!v32)
          {
LABEL_53:

            id v10 = v48;
            id v3 = v49;
            v11 = v47;
            goto LABEL_54;
          }
        }
      }

      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
      free(v30);
      v45 = v25;
      SSFileLog(v22, @"%@");
    }

    goto LABEL_35;
  }

@end
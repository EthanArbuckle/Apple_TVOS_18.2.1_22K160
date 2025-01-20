@interface SDCacheDeleter
+ (void)registerCallbacks;
- (NSString)archivesDirectory;
- (SDCacheDeleter)init;
- (SDCacheDeleter)initWithArchivesDirectory:(id)a3;
- (__CFDictionary)periodicAPFSMarkAsPurgeable:(id)a3;
- (id)getEnumeratorForVolume:(id)a3;
- (void)setArchivesDirectory:(id)a3;
@end

@implementation SDCacheDeleter

- (SDCacheDeleter)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
  v4 = -[SDCacheDeleter initWithArchivesDirectory:](self, "initWithArchivesDirectory:", v3);

  return v4;
}

- (SDCacheDeleter)initWithArchivesDirectory:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDCacheDeleter;
  v6 = -[SDCacheDeleter init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archivesDirectory, a3);
    v8 = v7;
  }

  return v7;
}

- (id)getEnumeratorForVolume:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDCacheDeleter archivesDirectory](self, "archivesDirectory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));

    if (v7) {
      id v8 = -[SDCacheEnumerator initCacheEnumeratorWithVolume:WithFlags:]( objc_alloc(&OBJC_CLASS___SDCacheEnumerator),  "initCacheEnumeratorWithVolume:WithFlags:",  v4,  16LL);
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (__CFDictionary)periodicAPFSMarkAsPurgeable:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDCacheDeleter getEnumeratorForVolume:](self, "getEnumeratorForVolume:", a3));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -3600.0));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 nextSysdiagnoseFile]);
    if (v5)
    {
      v7 = (void *)v5;
      *(void *)&__int128 v6 = 136446978LL;
      __int128 v27 = v6;
      do
      {
        id v29 = 0LL;
        objc_msgSend(v7, "getResourceValue:forKey:error:", &v29, NSURLCreationDateKey, 0, v27);
        id v8 = v29;
        if ([v8 compare:v4] != (id)1)
        {
          uint64_t v28 = 0LL;
          id v9 = v7;
          int v10 = open((const char *)[v9 fileSystemRepresentation], 0);
          if (v10 < 0)
          {
            id v19 = sub_10004DC5C();
            v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v23 = [v9 fileSystemRepresentation];
              v24 = __error();
              v25 = strerror(*v24);
              *(_DWORD *)buf = 136446466;
              id v31 = v23;
              __int16 v32 = 2082;
              *(void *)v33 = v25;
              _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to open '%{public}s' with error: %{public}s",  buf,  0x16u);
            }
          }

          else
          {
            int v11 = v10;
            uint64_t v28 = 66052LL;
            int v12 = ffsctl(v10, 0xC0084A44uLL, &v28, 0);
            id v13 = sub_10004DC5C();
            v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            v15 = v14;
            if (v12)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                id v16 = [v9 fileSystemRepresentation];
                v17 = __error();
                v18 = strerror(*v17);
                *(_DWORD *)buf = v27;
                id v31 = v16;
                __int16 v32 = 1024;
                *(_DWORD *)v33 = v12;
                *(_WORD *)&v33[4] = 2082;
                *(void *)&v33[6] = v18;
                __int16 v34 = 2048;
                uint64_t v35 = v28;
                _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to mark '%{public}s' as purgeable with error %d (%{public}s) (flags 0x%llx)",  buf,  0x26u);
              }
            }

            else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = [v9 fileSystemRepresentation];
              *(_DWORD *)buf = 136446466;
              id v31 = v21;
              __int16 v32 = 2048;
              *(void *)v33 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Marked '%{public}s' purgeable with flags 0x%llx",  buf,  0x16u);
            }

            close(v11);
          }
        }

        uint64_t v22 = objc_claimAutoreleasedReturnValue([v3 nextSysdiagnoseFile]);
        v7 = (void *)v22;
      }

      while (v22);
    }
  }

  return 0LL;
}

+ (void)registerCallbacks
{
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    *(void *)buf = 0LL;
    __int128 v6 = buf;
    uint64_t v7 = 0x3032000000LL;
    id v8 = sub_10004DDCC;
    id v9 = sub_10004DDDC;
    int v10 = objc_alloc_init(&OBJC_CLASS___SDCacheDeleter);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10004DFC0;
    v4[3] = &unk_100089D78;
    v4[4] = buf;
    CacheDeleteRegisterInfoCallbacks( @"com.apple.sysdiagnose.CacheDelete",  &stru_100089D10,  &stru_100089D30,  &stru_100089D50,  v4);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    id v2 = sub_10004DC5C();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Not registering for CacheDelete, as the framework is missing",  buf,  2u);
    }
  }

- (NSString)archivesDirectory
{
  return self->_archivesDirectory;
}

- (void)setArchivesDirectory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
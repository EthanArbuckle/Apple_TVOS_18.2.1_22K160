@interface DIIOCacheDelete
- (BOOL)registerPeriodicCallback;
- (BOOL)setupNewConnection:(id)a3;
- (DIIOCacheDelete)initWithDebugServiceName:(id)a3;
- (NSString)debugServiceName;
- (NSTimer)exitTimer;
- (OS_dispatch_source)sigtermHandler;
- (id)onPeriodicWithInfo:(id)a3 urgency:(int)a4;
- (id)sandboxProfile;
- (id)serviceName;
- (unint64_t)eraseOldCacheFiles;
- (void)restartExitTimer;
- (void)setExitTimer:(id)a3;
- (void)setSigtermHandler:(id)a3;
- (void)setupExitTimer:(id)a3;
- (void)setupSigtermHandler;
@end

@implementation DIIOCacheDelete

- (DIIOCacheDelete)initWithDebugServiceName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIIOCacheDelete;
  v6 = -[DIBaseServiceDelegate init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_debugServiceName, a3);
    -[DIIOCacheDelete setupSigtermHandler](v7, "setupSigtermHandler");
  }

  return v7;
}

- (id)sandboxProfile
{
  return @"com.apple.diskimagesiod";
}

- (void)setupSigtermHandler
{
  v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  &_dispatch_main_q);
  sigtermHandler = self->_sigtermHandler;
  self->_sigtermHandler = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_sigtermHandler, &stru_100165500);
  dispatch_resume((dispatch_object_t)self->_sigtermHandler);
}

- (void)restartExitTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIIOCacheDelete exitTimer](self, "exitTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIIOCacheDelete exitTimer](self, "exitTimer"));
    [v4 invalidate];

    -[DIIOCacheDelete setExitTimer:](self, "setExitTimer:", 0LL);
  }

  -[DIIOCacheDelete performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "setupExitTimer:",  0LL,  0LL);
}

- (void)setupExitTimer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005588;
  v6[3] = &unk_100165528;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v6,  20.0));
  -[DIIOCacheDelete setExitTimer:](self, "setExitTimer:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (unint64_t)eraseOldCacheFiles
{
  if (confstr(65538, v105, 0x400uLL))
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v105,  1LL,  0LL));
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"^%@.*\\.%@$",  @"diskimage_",  @"cache"));
    v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v104[0] = NSURLContentAccessDateKey;
    v104[1] = NSURLFileSizeKey;
    v104[2] = NSURLNameKey;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v104, 3LL));
    v76 = (void *)v2;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [v3 enumeratorAtURL:v2 includingPropertiesForKeys:v4 options:5 errorHandler:&stru_100165568]);

    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v90 objects:v103 count:16];
    if (!v6)
    {
      unint64_t v79 = 0LL;
      unint64_t v78 = 0LL;
      HIDWORD(v77) = 0;
      int v80 = 0;
      goto LABEL_68;
    }

    id v7 = v6;
    unint64_t v79 = 0LL;
    unint64_t v78 = 0LL;
    HIDWORD(v77) = 0;
    int v80 = 0;
    uint64_t v8 = *(void *)v91;
    NSURLResourceKey v9 = NSURLNameKey;
    while (1)
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v91 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)v10);
        id v89 = 0LL;
        unsigned int v12 = [v11 getResourceValue:&v89 forKey:v9 error:0];
        id v13 = v89;
        v14 = v13;
        if (v12
          && objc_msgSend(v81, "numberOfMatchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length")))
        {
          id v87 = 0LL;
          id v88 = 0LL;
          unsigned int v15 = [v11 getResourceValue:&v88 forKey:NSURLContentAccessDateKey error:&v87];
          id v16 = v88;
          id v17 = v87;
          v83 = v16;
          if (v15)
          {
            id v85 = 0LL;
            id v86 = 0LL;
            unsigned __int8 v18 = [v11 getResourceValue:&v86 forKey:NSURLFileSizeKey error:&v85];
            id v19 = v86;
            id v20 = v85;

            if ((v18 & 1) != 0)
            {
              ++v80;
              v79 += (unint64_t)[v19 unsignedLongLongValue];
              [v16 timeIntervalSinceNow];
              double v22 = v21;
              int v23 = *__error();
              int v24 = sub_1000B8654();
              if (v22 >= -259200.0)
              {
                if (v24)
                {
                  uint64_t v94 = 0LL;
                  uint64_t v40 = sub_1000B85DC();
                  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
                    uint64_t v42 = 3LL;
                  }
                  else {
                    uint64_t v42 = 2LL;
                  }
                  *(_DWORD *)buf = 68158466;
                  int v96 = 37;
                  __int16 v97 = 2080;
                  v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                  __int16 v99 = 2114;
                  *(void *)v100 = v11;
                  *(_WORD *)&v100[8] = 2048;
                  *(double *)&v100[10] = v22 / -86400.0;
                  LODWORD(v73) = 38;
                  v43 = (char *)_os_log_send_and_compose_impl( v42,  &v94,  0LL,  0LL,  &_mh_execute_header,  v41,  0LL,  "%.*s: Skipping %{public}@ (last access time was %.2f days ago)",  buf,  v73);

                  if (v43)
                  {
                    fprintf(__stderrp, "%s\n", v43);
                    free(v43);
                  }

                  NSURLResourceKey v9 = NSURLNameKey;
                }

                else
                {
                  uint64_t v48 = sub_1000B85DC();
                  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
                  NSURLResourceKey v9 = NSURLNameKey;
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 68158466;
                    int v96 = 37;
                    __int16 v97 = 2080;
                    v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                    __int16 v99 = 2114;
                    *(void *)v100 = v11;
                    *(_WORD *)&v100[8] = 2048;
                    *(double *)&v100[10] = v22 / -86400.0;
                    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%.*s: Skipping %{public}@ (last access time was %.2f days ago)",  buf,  0x26u);
                  }
                }

                *__error() = v23;
                id v17 = v20;
                goto LABEL_33;
              }

              if (v24)
              {
                uint64_t v94 = 0LL;
                uint64_t v25 = sub_1000B85DC();
                v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
                  uint64_t v27 = 3LL;
                }
                else {
                  uint64_t v27 = 2LL;
                }
                *(_DWORD *)buf = 68158466;
                int v96 = 37;
                __int16 v97 = 2080;
                v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                __int16 v99 = 2114;
                *(void *)v100 = v11;
                *(_WORD *)&v100[8] = 2048;
                *(double *)&v100[10] = v22 / -86400.0;
                LODWORD(v73) = 38;
                v28 = (char *)_os_log_send_and_compose_impl( v27,  &v94,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%.*s: Last access time expired for %{public}@ (%.2f days), removing",  buf,  v73);

                if (v28)
                {
                  fprintf(__stderrp, "%s\n", v28);
                  free(v28);
                }
              }

              else
              {
                uint64_t v44 = sub_1000B85DC();
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 68158466;
                  int v96 = 37;
                  __int16 v97 = 2080;
                  v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                  __int16 v99 = 2114;
                  *(void *)v100 = v11;
                  *(_WORD *)&v100[8] = 2048;
                  *(double *)&v100[10] = v22 / -86400.0;
                  _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%.*s: Last access time expired for %{public}@ (%.2f days), removing",  buf,  0x26u);
                }
              }

              *__error() = v23;
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              id v84 = v20;
              unsigned int v47 = [v46 removeItemAtURL:v11 error:&v84];
              id v17 = v84;

              if (v47)
              {
                ++HIDWORD(v77);
                v78 += (unint64_t)[v19 unsignedLongLongValue];
                NSURLResourceKey v9 = NSURLNameKey;
                goto LABEL_33;
              }

              int v29 = *__error();
              if (sub_1000B8654())
              {
                uint64_t v94 = 0LL;
                uint64_t v50 = sub_1000B85DC();
                v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                BOOL v51 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
                *(_DWORD *)buf = 68158466;
                if (v51) {
                  uint64_t v52 = 3LL;
                }
                else {
                  uint64_t v52 = 2LL;
                }
                int v96 = 37;
                __int16 v97 = 2080;
                v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                __int16 v99 = 2114;
                *(void *)v100 = v11;
                *(_WORD *)&v100[8] = 2114;
                *(void *)&v100[10] = v17;
                LODWORD(v73) = 38;
                uint64_t v34 = _os_log_send_and_compose_impl( v52,  &v94,  0LL,  0LL,  &_mh_execute_header,  v31,  16LL,  "%.*s: Failed to remove %{public}@: %{public}@",  buf,  v73);
                goto LABEL_25;
              }

              uint64_t v53 = sub_1000B85DC();
              v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
              NSURLResourceKey v9 = NSURLNameKey;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 68158466;
                int v96 = 37;
                __int16 v97 = 2080;
                v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                __int16 v99 = 2114;
                *(void *)v100 = v11;
                *(_WORD *)&v100[8] = 2114;
                *(void *)&v100[10] = v17;
                v38 = v37;
                v39 = "%.*s: Failed to remove %{public}@: %{public}@";
LABEL_30:
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v39, buf, 0x26u);
              }

              goto LABEL_31;
            }

            id v17 = v20;
            NSURLResourceKey v9 = NSURLNameKey;
          }

          else
          {
            id v19 = 0LL;
          }

          int v29 = *__error();
          if (sub_1000B8654())
          {
            uint64_t v94 = 0LL;
            uint64_t v30 = sub_1000B85DC();
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 68158466;
            if (v32) {
              uint64_t v33 = 3LL;
            }
            else {
              uint64_t v33 = 2LL;
            }
            int v96 = 37;
            __int16 v97 = 2080;
            v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
            __int16 v99 = 2114;
            *(void *)v100 = v11;
            *(_WORD *)&v100[8] = 2114;
            *(void *)&v100[10] = v17;
            LODWORD(v73) = 38;
            uint64_t v34 = _os_log_send_and_compose_impl( v33,  &v94,  0LL,  0LL,  &_mh_execute_header,  v31,  16LL,  "%.*s: Failed retrieving property for %{public}@: %{public}@",  buf,  v73);
LABEL_25:
            v35 = (char *)v34;

            if (v35)
            {
              fprintf(__stderrp, "%s\n", v35);
              free(v35);
            }

            NSURLResourceKey v9 = NSURLNameKey;
          }

          else
          {
            uint64_t v36 = sub_1000B85DC();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68158466;
              int v96 = 37;
              __int16 v97 = 2080;
              v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
              __int16 v99 = 2114;
              *(void *)v100 = v11;
              *(_WORD *)&v100[8] = 2114;
              *(void *)&v100[10] = v17;
              v38 = v37;
              v39 = "%.*s: Failed retrieving property for %{public}@: %{public}@";
              goto LABEL_30;
            }

- (id)onPeriodicWithInfo:(id)a3 urgency:(int)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  int v7 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v18 = 0LL;
    uint64_t v8 = sub_1000B85DC();
    NSURLResourceKey v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 68158467;
    int v22 = 46;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    __int16 v23 = 2080;
    int v24 = "-[DIIOCacheDelete onPeriodicWithInfo:urgency:]";
    __int16 v25 = 1024;
    int v26 = a4;
    __int16 v27 = 2113;
    v28 = v6;
    int v17 = 34;
    v11 = (char *)_os_log_send_and_compose_impl( v10,  &v18,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%.*s: Reached periodic cache delete with urgency %d, volume: %{private}@",  buf,  v17);

    if (v11)
    {
      fprintf(__stderrp, "%s\n", v11);
      free(v11);
    }
  }

  else
  {
    uint64_t v12 = sub_1000B85DC();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158467;
      int v22 = 46;
      __int16 v23 = 2080;
      int v24 = "-[DIIOCacheDelete onPeriodicWithInfo:urgency:]";
      __int16 v25 = 1024;
      int v26 = a4;
      __int16 v27 = 2113;
      v28 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%.*s: Reached periodic cache delete with urgency %d, volume: %{private}@",  buf,  0x22u);
    }
  }

  *__error() = v7;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[DIIOCacheDelete eraseOldCacheFiles](self, "eraseOldCacheFiles")));
  -[DIIOCacheDelete restartExitTimer](self, "restartExitTimer");
  v19[0] = @"CACHE_DELETE_VOLUME";
  v19[1] = @"CACHE_DELETE_AMOUNT";
  v20[0] = v6;
  v20[1] = v14;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));

  return v15;
}

- (BOOL)registerPeriodicCallback
{
  v27[1] = &_CacheDeleteRegisterInfoCallbacks;
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100006D40;
    v25[3] = &unk_100165590;
    objc_copyWeak(&v26, &location);
    int v2 = CacheDeleteRegisterInfoCallbacks(@"com.apple.diskimagesiod.cachedelete", 0LL, 0LL, 0LL, v25);
    BOOL v3 = v2 == 0;
    if (v2)
    {
      int v4 = *__error();
      if (!sub_1000B8654())
      {
        uint64_t v17 = sub_1000B85DC();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68157954;
          int v30 = 43;
          __int16 v31 = 2080;
          BOOL v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%.*s: CacheDelete registration failed",  buf,  0x12u);
        }

        goto LABEL_32;
      }

      v27[0] = 0LL;
      uint64_t v5 = sub_1000B85DC();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        uint64_t v7 = 3LL;
      }
      else {
        uint64_t v7 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v30 = 43;
      __int16 v31 = 2080;
      BOOL v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
      LODWORD(v24) = 18;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl( v7,  v27,  0LL,  0LL,  &_mh_execute_header,  v6,  16LL,  "%.*s: CacheDelete registration failed",  (int)buf,  v24);

      if (v8) {
        goto LABEL_20;
      }
    }

    else
    {
      int v4 = *__error();
      if (!sub_1000B8654())
      {
        uint64_t v21 = sub_1000B85DC();
        int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v30 = 43;
          __int16 v31 = 2080;
          BOOL v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%.*s: Cache delete periodic registered",  buf,  0x12u);
        }

        goto LABEL_32;
      }

      v27[0] = 0LL;
      uint64_t v14 = sub_1000B85DC();
      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v16 = 3LL;
      }
      else {
        uint64_t v16 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v30 = 43;
      __int16 v31 = 2080;
      BOOL v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
      LODWORD(v24) = 18;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl( v16,  v27,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%.*s: Cache delete periodic registered",  (int)buf,  v24);

      if (v8)
      {
LABEL_20:
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }

- (id)serviceName
{
  return -[DIIOCacheDelete debugServiceName](self, "debugServiceName");
}

- (BOOL)setupNewConnection:(id)a3
{
  id v3 = a3;
  int v4 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v12 = 0LL;
    uint64_t v5 = sub_1000B85DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v14 = 38;
    __int16 v15 = 2080;
    uint64_t v16 = "-[DIIOCacheDelete setupNewConnection:]";
    LODWORD(v11) = 18;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl( v7,  &v12,  0LL,  0LL,  &_mh_execute_header,  v6,  16LL,  "%.*s: Connection to cache delete instance is not allowed, quitting",  (int)buf,  v11);

    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }

  else
  {
    uint64_t v9 = sub_1000B85DC();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v14 = 38;
      __int16 v15 = 2080;
      uint64_t v16 = "-[DIIOCacheDelete setupNewConnection:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%.*s: Connection to cache delete instance is not allowed, quitting",  buf,  0x12u);
    }
  }

  *__error() = v4;
  exit(0);
}

- (NSString)debugServiceName
{
  return self->_debugServiceName;
}

- (OS_dispatch_source)sigtermHandler
{
  return self->_sigtermHandler;
}

- (void)setSigtermHandler:(id)a3
{
}

- (NSTimer)exitTimer
{
  return self->_exitTimer;
}

- (void)setExitTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
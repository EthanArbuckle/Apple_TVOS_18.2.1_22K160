@interface DIDiskArb
+ (id)diskArbWithError:(id *)a3;
- (BOOL)callbackReached;
- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4;
- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4;
- (BOOL)waitForDAIdleWithError:(id *)a3;
- (DIDisappearedMountPointDelegate)delegate;
- (DIDiskArb)initWithError:(id *)a3;
- (NSArray)shadowMountedOnURLs;
- (NSError)operationError;
- (NSURL)inputMountedOnURL;
- (__DASession)daSession;
- (id)copyDescriptionWithBSDName:(id)a3;
- (void)addDisappearedCallbackWithMountPoint:(id)a3 shadowMountPoints:(id)a4 delegate:(id)a5;
- (void)onDiskDisappearedWithDisk:(__DADisk *)a3;
- (void)setCallbackReached:(BOOL)a3;
- (void)setDaSession:(__DASession *)a3;
- (void)setDelegate:(id)a3;
- (void)setInputMountedOnURL:(id)a3;
- (void)setOperationError:(id)a3;
- (void)setShadowMountedOnURLs:(id)a3;
- (void)stop;
@end

@implementation DIDiskArb

+ (id)diskArbWithError:(id *)a3
{
  v3 = -[DIDiskArb initWithError:](objc_alloc(&OBJC_CLASS___DIDiskArb), "initWithError:", 0LL);
  if (!v3) {
    v3 = objc_alloc_init(&OBJC_CLASS___DIDiskArbEmulation);
  }
  return v3;
}

- (DIDiskArb)initWithError:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIDiskArb;
  v4 = -[DIDiskArb init](&v11, sel_init);
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (!MEMORY[0x18960F1D0])
  {
    daSession = v4->_daSession;
    if (daSession) {
      goto LABEL_4;
    }
LABEL_7:
    +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  156LL,  @"Failed DA init",  a3);
    v8 = (DIDiskArb *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  daSession = DASessionCreate(0LL);
  v5->_daSession = daSession;
  if (!daSession) {
    goto LABEL_7;
  }
LABEL_4:
  Current = CFRunLoopGetCurrent();
  DASessionScheduleWithRunLoop(daSession, Current, (CFStringRef)*MEMORY[0x1896051B0]);
LABEL_5:
  v8 = v5;
LABEL_8:
  v9 = v8;

  return v9;
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  daSession = obj->_daSession;
  if (daSession)
  {
    if (obj->_inputMountedOnURL || obj->_shadowMountedOnURLs)
    {
      MEMORY[0x1895BBDE0](obj->_daSession, _diskDisappearedCallback);
      daSession = obj->_daSession;
    }

    Current = CFRunLoopGetCurrent();
    DASessionUnscheduleFromRunLoop(daSession, Current, (CFStringRef)*MEMORY[0x1896051B0]);
    CFRelease(obj->_daSession);
    v2 = obj;
    obj->_daSession = 0LL;
  }

  objc_sync_exit(v2);
}

- (void)onDiskDisappearedWithDisk:(__DADisk *)a3
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (-[DIDiskArb daSession](self, "daSession"))
  {
    CFDictionaryRef v5 = DADiskCopyDescription(a3);
    v6 = -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x18960F1F0]);
    if (DIDebugLogsEnabled())
    {
      int v7 = *__error();
      if (DIForwardLogs())
      {
        uint64_t v45 = 0LL;
        getDIOSLog();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
        *(_DWORD *)buf = 68158210;
        int v48 = 39;
        __int16 v49 = 2080;
        v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
        __int16 v51 = 2114;
        v52 = v6;
        LODWORD(v40) = 28;
        v39 = buf;
        v9 = (char *)_os_log_send_and_compose_impl();

        if (v9)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
          free(v9);
        }
      }

      else
      {
        getDIOSLog();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68158210;
          int v48 = 39;
          __int16 v49 = 2080;
          v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
          __int16 v51 = 2114;
          v52 = v6;
          _os_log_impl(&dword_188046000, v14, OS_LOG_TYPE_DEBUG, "%.*s: Reached with diskURL=%{public}@", buf, 0x1Cu);
        }
      }

      *__error() = v7;
    }

    if (v6)
    {
      uint64_t v15 = -[DIDiskArb inputMountedOnURL](self, "inputMountedOnURL");
      if (v15)
      {
        v16 = (void *)v15;
        v17 = -[DIDiskArb inputMountedOnURL](self, "inputMountedOnURL");
        int v18 = [v6 isEqual:v17];

        if (v18)
        {
          int v19 = *__error();
          if (DIForwardLogs())
          {
            uint64_t v45 = 0LL;
            getDIOSLog();
            v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
            objc_msgSend(v6, "path", v39, v40);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158211;
            int v48 = 39;
            __int16 v49 = 2080;
            v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
            __int16 v51 = 2113;
            v52 = v21;
            LODWORD(v40) = 28;
            v39 = buf;
            v22 = (char *)_os_log_send_and_compose_impl();

            if (v22)
            {
              fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v22);
              free(v22);
            }
          }

          else
          {
            getDIOSLog();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              [v6 path];
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 68158211;
              int v48 = 39;
              __int16 v49 = 2080;
              v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
              __int16 v51 = 2113;
              v52 = v24;
              _os_log_impl( &dword_188046000,  v23,  OS_LOG_TYPE_ERROR,  "%.*s: Mount point %{private}@ disappeared",  buf,  0x1Cu);
            }
          }

          *__error() = v19;
          v25 = -[DIDiskArb delegate](self, "delegate");
          [v25 onDisappearedMountPoint];
        }
      }
      v26 = -[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs", v39, v40);
      if (v26)
      {
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        v27 = -[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs");
        uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v42;
          while (2)
          {
            for (uint64_t i = 0LL; i != v29; ++i)
            {
              if (*(void *)v42 != v30) {
                objc_enumerationMutation(v27);
              }
              if ([v6 isEqual:*(void *)(*((void *)&v41 + 1) + 8 * i)])
              {
                int v32 = *__error();
                if (DIForwardLogs())
                {
                  uint64_t v45 = 0LL;
                  getDIOSLog();
                  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
                  [v6 path];
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 68158211;
                  int v48 = 39;
                  __int16 v49 = 2080;
                  v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                  __int16 v51 = 2113;
                  v52 = v34;
                  v35 = (char *)_os_log_send_and_compose_impl();

                  if (v35)
                  {
                    fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v35);
                    free(v35);
                  }
                }

                else
                {
                  getDIOSLog();
                  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    [v6 path];
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 68158211;
                    int v48 = 39;
                    __int16 v49 = 2080;
                    v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                    __int16 v51 = 2113;
                    v52 = v37;
                    _os_log_impl( &dword_188046000,  v36,  OS_LOG_TYPE_ERROR,  "%.*s: Mount point %{private}@ disappeared (shadow's mount point)",  buf,  0x1Cu);
                  }
                }

                *__error() = v32;
                v38 = -[DIDiskArb delegate](self, "delegate");
                [v38 onDisappearedMountPoint];

                goto LABEL_44;
              }
            }

            uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v46 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }

- (BOOL)waitForDAIdleWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v4 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    CFDictionaryRef v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v19 = 36;
    __int16 v20 = 2080;
    v21 = "-[DIDiskArb waitForDAIdleWithError:]";
    LODWORD(v17) = 18;
    v16 = buf;
    v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v6);
      free(v6);
    }
  }

  else
  {
    getDIOSLog();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v19 = 36;
      __int16 v20 = 2080;
      v21 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl(&dword_188046000, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Waiting for disk arbitration idle", buf, 0x12u);
    }
  }

  *__error() = v4;
  -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0LL);
  -[DIDiskArb daSession](self, "daSession");
  DARegisterIdleCallback();
  [MEMORY[0x189604008] currentRunLoop];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[DIDiskArb callbackReached](self, "callbackReached"))
  {
    uint64_t v9 = *MEMORY[0x189603A40];
    do
    {
      objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceNow:", 1.0, v16, v17);
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 runMode:v9 beforeDate:v10];
    }

    while (!-[DIDiskArb callbackReached](self, "callbackReached"));
  }

  MEMORY[0x1895BBDE0](-[DIDiskArb daSession](self, "daSession", v16), _idleCallback, self);
  int v11 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v19 = 36;
    __int16 v20 = 2080;
    v21 = "-[DIDiskArb waitForDAIdleWithError:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    if (v13)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v13);
      free(v13);
    }
  }

  else
  {
    getDIOSLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v19 = 36;
      __int16 v20 = 2080;
      v21 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl( &dword_188046000,  v14,  OS_LOG_TYPE_DEFAULT,  "%.*s: Disk arbitration idle callback received",  buf,  0x12u);
    }
  }

  *__error() = v11;

  return 1;
}

- (void)addDisappearedCallbackWithMountPoint:(id)a3 shadowMountPoints:(id)a4 delegate:(id)a5
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    -[DIDiskArb setInputMountedOnURL:](self, "setInputMountedOnURL:", v8);
    id v34 = v9;
    -[DIDiskArb setShadowMountedOnURLs:](self, "setShadowMountedOnURLs:", v9);
    id v33 = v10;
    -[DIDiskArb setDelegate:](self, "setDelegate:", v10);
    int v11 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v41 = 0LL;
      getDIOSLog();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      [v8 path];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      int v44 = 77;
      __int16 v45 = 2080;
      v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
      __int16 v47 = 2113;
      int v48 = v13;
      LODWORD(v31) = 28;
      uint64_t v29 = buf;
      v14 = (char *)_os_log_send_and_compose_impl();

      if (v14)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v14);
        free(v14);
      }
    }

    else
    {
      getDIOSLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        [v8 path];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158211;
        int v44 = 77;
        __int16 v45 = 2080;
        v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
        __int16 v47 = 2113;
        int v48 = v16;
        _os_log_impl( &dword_188046000,  v15,  OS_LOG_TYPE_DEFAULT,  "%.*s: Registering DiskDisappearedCallback for %{private}@",  buf,  0x1Cu);
      }
    }

    id v36 = v8;
    *__error() = v11;
  }

  else
  {
    if (![v9 count]) {
      goto LABEL_25;
    }
    id v36 = 0LL;
    -[DIDiskArb setInputMountedOnURL:](self, "setInputMountedOnURL:", 0LL);
    id v34 = v9;
    -[DIDiskArb setShadowMountedOnURLs:](self, "setShadowMountedOnURLs:", v9);
    id v33 = v10;
    -[DIDiskArb setDelegate:](self, "setDelegate:", v10);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v35 = self;
  -[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs", v29, v31);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int v23 = *__error();
        if (DIForwardLogs())
        {
          uint64_t v41 = 0LL;
          getDIOSLog();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          objc_msgSend(v22, "path", v30, v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158211;
          int v44 = 77;
          __int16 v45 = 2080;
          v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
          __int16 v47 = 2113;
          int v48 = v25;
          LODWORD(v32) = 28;
          uint64_t v30 = buf;
          v26 = (char *)_os_log_send_and_compose_impl();

          if (v26)
          {
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v26);
            free(v26);
          }
        }

        else
        {
          getDIOSLog();
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            [v22 path];
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158211;
            int v44 = 77;
            __int16 v45 = 2080;
            v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
            __int16 v47 = 2113;
            int v48 = v28;
            _os_log_impl( &dword_188046000,  v27,  OS_LOG_TYPE_DEFAULT,  "%.*s: Registering DiskDisappearedCallback for %{private}@ (shadow's mount point)",  buf,  0x1Cu);
          }
        }

        *__error() = v23;
      }

      uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v19);
  }

  DARegisterDiskDisappearedCallback( -[DIDiskArb daSession](v35, "daSession"),  0LL,  (DADiskDisappearedCallback)_diskDisappearedCallback,  v35);
  id v8 = v36;
  id v10 = v33;
  id v9 = v34;
LABEL_25:
}

- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  int v7 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v27 = 36;
    __int16 v28 = 2080;
    uint64_t v29 = "-[DIDiskArb ejectWithBSDName:error:]";
    __int16 v30 = 2112;
    id v31 = v6;
    LODWORD(v25) = 28;
    v24 = buf;
    id v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    getDIOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v27 = 36;
      __int16 v28 = 2080;
      uint64_t v29 = "-[DIDiskArb ejectWithBSDName:error:]";
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_188046000, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }
  }

  *__error() = v7;
  int v11 = -[DIDiskArb daSession](self, "daSession");
  id v12 = v6;
  v13 = DADiskCreateFromBSDName(0, v11, (const char *)[v12 fileSystemRepresentation]);
  if (v13)
  {
    -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0LL);
    -[DIDiskArb setOperationError:](self, "setOperationError:", 0LL);
    DADiskEject(v13, 0, (DADiskEjectCallback)_daOperationCallback, self);
    [MEMORY[0x189604008] currentRunLoop];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[DIDiskArb callbackReached](self, "callbackReached"))
    {
      uint64_t v15 = *MEMORY[0x189603A40];
      do
      {
        objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceNow:", 1.0, v24, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 runMode:v15 beforeDate:v16];
      }

      while (!-[DIDiskArb callbackReached](self, "callbackReached"));
    }

    -[DIDiskArb operationError](self, "operationError", v24);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v18 = v17 == 0LL;
    if (v17)
    {
      if (a4)
      {
        -[DIDiskArb operationError](self, "operationError");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      int v19 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158210;
        int v27 = 36;
        __int16 v28 = 2080;
        uint64_t v29 = "-[DIDiskArb ejectWithBSDName:error:]";
        __int16 v30 = 2112;
        id v31 = v12;
        v21 = (char *)_os_log_send_and_compose_impl();

        if (v21)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v21);
          free(v21);
        }
      }

      else
      {
        getDIOSLog();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          int v27 = 36;
          __int16 v28 = 2080;
          uint64_t v29 = "-[DIDiskArb ejectWithBSDName:error:]";
          __int16 v30 = 2112;
          id v31 = v12;
          _os_log_impl(&dword_188046000, v22, OS_LOG_TYPE_DEFAULT, "%.*s: %@ ejected successfully", buf, 0x1Cu);
        }
      }

      *__error() = v19;
    }
  }

  else
  {
    BOOL v18 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  156LL,  @"Failed to create DADisk during eject",  a4);
  }

  return v18;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  int v7 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158211;
    int v26 = 41;
    __int16 v27 = 2080;
    __int16 v28 = "-[DIDiskArb unmountWithMountPoint:error:]";
    __int16 v29 = 2113;
    id v30 = v6;
    LODWORD(v24) = 28;
    int v23 = buf;
    id v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    getDIOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158211;
      int v26 = 41;
      __int16 v27 = 2080;
      __int16 v28 = "-[DIDiskArb unmountWithMountPoint:error:]";
      __int16 v29 = 2113;
      id v30 = v6;
      _os_log_impl(&dword_188046000, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Unmounting %{private}@", buf, 0x1Cu);
    }
  }

  *__error() = v7;
  [MEMORY[0x189604030] fileURLWithPath:v6];
  int v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  id v12 = DADiskCreateFromVolumePath(0LL, -[DIDiskArb daSession](self, "daSession"), v11);
  if (v12)
  {
    -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0LL);
    -[DIDiskArb setOperationError:](self, "setOperationError:", 0LL);
    DADiskUnmount(v12, 0, (DADiskUnmountCallback)_daOperationCallback, self);
    [MEMORY[0x189604008] currentRunLoop];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[DIDiskArb callbackReached](self, "callbackReached"))
    {
      uint64_t v14 = *MEMORY[0x189603A40];
      do
      {
        objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceNow:", 1.0, v23, v24);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 runMode:v14 beforeDate:v15];
      }

      while (!-[DIDiskArb callbackReached](self, "callbackReached"));
    }
    v16 = -[DIDiskArb operationError](self, "operationError", v23);
    BOOL v17 = v16 == 0LL;
    if (v16)
    {
      if (a4)
      {
        -[DIDiskArb operationError](self, "operationError");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      int v18 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158211;
        int v26 = 41;
        __int16 v27 = 2080;
        __int16 v28 = "-[DIDiskArb unmountWithMountPoint:error:]";
        __int16 v29 = 2113;
        id v30 = v6;
        uint64_t v20 = (char *)_os_log_send_and_compose_impl();

        if (v20)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v20);
          free(v20);
        }
      }

      else
      {
        getDIOSLog();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158211;
          int v26 = 41;
          __int16 v27 = 2080;
          __int16 v28 = "-[DIDiskArb unmountWithMountPoint:error:]";
          __int16 v29 = 2113;
          id v30 = v6;
          _os_log_impl( &dword_188046000,  v21,  OS_LOG_TYPE_DEFAULT,  "%.*s: %{private}@ unmounted successfully",  buf,  0x1Cu);
        }
      }

      *__error() = v18;
    }
  }

  else
  {
    BOOL v17 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  156LL,  @"Failed to create DADisk during unmount",  a4);
  }

  return v17;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = -[DIDiskArb daSession](self, "daSession");
  id v6 = v4;
  int v7 = (const char *)[v6 fileSystemRepresentation];

  id v8 = DADiskCreateFromBSDName(0LL, v5, v7);
  id v9 = v8;
  if (v8) {
    CFDictionaryRef v10 = DADiskCopyDescription(v8);
  }
  else {
    CFDictionaryRef v10 = 0LL;
  }

  return v10;
}

- (DIDisappearedMountPointDelegate)delegate
{
  return (DIDisappearedMountPointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (__DASession)daSession
{
  return self->_daSession;
}

- (void)setDaSession:(__DASession *)a3
{
  self->_daSession = a3;
}

- (NSURL)inputMountedOnURL
{
  return self->_inputMountedOnURL;
}

- (void)setInputMountedOnURL:(id)a3
{
}

- (NSArray)shadowMountedOnURLs
{
  return self->_shadowMountedOnURLs;
}

- (void)setShadowMountedOnURLs:(id)a3
{
}

- (BOOL)callbackReached
{
  return self->_callbackReached;
}

- (void)setCallbackReached:(BOOL)a3
{
  self->_callbackReached = a3;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface DIDiskArb
+ (DIDiskArb)diskArbWithError:(id *)a3;
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

+ (DIDiskArb)diskArbWithError:(id *)a3
{
  v3 = -[DIDiskArb initWithError:](objc_alloc(&OBJC_CLASS___DIDiskArb), "initWithError:", 0LL);
  if (!v3) {
    v3 = objc_alloc_init(&OBJC_CLASS___DIDiskArbEmulation);
  }
  return (DIDiskArb *)v3;
}

- (DIDiskArb)initWithError:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIDiskArb;
  v4 = -[DIDiskArb init](&v11, "init");
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (!&_DASessionCreate)
  {
    daSession = v4->_daSession;
    if (daSession) {
      goto LABEL_4;
    }
LABEL_7:
    v8 = (DIDiskArb *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  156LL,  @"Failed DA init",  a3));
    goto LABEL_8;
  }

  daSession = DASessionCreate(0LL);
  v5->_daSession = daSession;
  if (!daSession) {
    goto LABEL_7;
  }
LABEL_4:
  Current = CFRunLoopGetCurrent();
  DASessionScheduleWithRunLoop(daSession, Current, kCFRunLoopDefaultMode);
LABEL_5:
  v8 = v5;
LABEL_8:
  v9 = v8;

  return v9;
}

- (void)stop
{
  context = self;
  objc_sync_enter(context);
  v2 = context;
  daSession = context->_daSession;
  if (daSession)
  {
    if (context->_inputMountedOnURL || context->_shadowMountedOnURLs)
    {
      DAUnregisterCallback(context->_daSession, sub_1000276A4, context);
      daSession = context->_daSession;
    }

    Current = CFRunLoopGetCurrent();
    DASessionUnscheduleFromRunLoop(daSession, Current, kCFRunLoopDefaultMode);
    CFRelease(context->_daSession);
    v2 = context;
    context->_daSession = 0LL;
  }

  objc_sync_exit(v2);
}

- (void)onDiskDisappearedWithDisk:(__DADisk *)a3
{
  if (-[DIDiskArb daSession](self, "daSession"))
  {
    CFDictionaryRef v5 = DADiskCopyDescription(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v5, "objectForKey:", kDADiskDescriptionVolumePathKey));
    if (sub_1000B866C())
    {
      int v7 = *__error();
      if (sub_1000B8654())
      {
        uint64_t v56 = 0LL;
        uint64_t v8 = sub_1000B85DC();
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          uint64_t v10 = 3LL;
        }
        else {
          uint64_t v10 = 2LL;
        }
        *(_DWORD *)buf = 68158210;
        int v59 = 39;
        __int16 v60 = 2080;
        v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
        __int16 v62 = 2114;
        v63 = v6;
        objc_super v11 = (char *)_os_log_send_and_compose_impl( v10,  &v56,  0LL,  0LL,  &_mh_execute_header,  v9,  2LL,  "%.*s: Reached with diskURL=%{public}@",  buf,  28);

        if (v11)
        {
          fprintf(__stderrp, "%s\n", v11);
          free(v11);
        }
      }

      else
      {
        uint64_t v19 = sub_1000B85DC();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68158210;
          int v59 = 39;
          __int16 v60 = 2080;
          v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
          __int16 v62 = 2114;
          v63 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%.*s: Reached with diskURL=%{public}@",  buf,  0x1Cu);
        }
      }

      *__error() = v7;
    }

    if (v6)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue(-[DIDiskArb inputMountedOnURL](self, "inputMountedOnURL"));
      if (v21)
      {
        v22 = (void *)v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb inputMountedOnURL](self, "inputMountedOnURL"));
        unsigned int v24 = [v6 isEqual:v23];

        if (v24)
        {
          int v25 = *__error();
          if (sub_1000B8654())
          {
            uint64_t v56 = 0LL;
            uint64_t v26 = sub_1000B85DC();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              uint64_t v28 = 3LL;
            }
            else {
              uint64_t v28 = 2LL;
            }
            v29 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
            *(_DWORD *)buf = 68158211;
            int v59 = 39;
            __int16 v60 = 2080;
            v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
            __int16 v62 = 2113;
            v63 = v29;
            LODWORD(v51) = 28;
            v30 = (char *)_os_log_send_and_compose_impl( v28,  &v56,  0LL,  0LL,  &_mh_execute_header,  v27,  16LL,  "%.*s: Mount point %{private}@ disappeared",  buf,  v51);

            if (v30)
            {
              fprintf(__stderrp, "%s\n", v30);
              free(v30);
            }
          }

          else
          {
            uint64_t v31 = sub_1000B85DC();
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
              *(_DWORD *)buf = 68158211;
              int v59 = 39;
              __int16 v60 = 2080;
              v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
              __int16 v62 = 2113;
              v63 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%.*s: Mount point %{private}@ disappeared",  buf,  0x1Cu);
            }
          }

          *__error() = v25;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb delegate](self, "delegate"));
          [v34 onDisappearedMountPoint];
        }
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs"));

      if (v35)
      {
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs"));
        id v37 = [v36 countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = *(void *)v53;
          while (2)
          {
            for (i = 0LL; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v53 != v39) {
                objc_enumerationMutation(v36);
              }
              if ([v6 isEqual:*(void *)(*((void *)&v52 + 1) + 8 * (void)i)])
              {
                int v41 = *__error();
                if (sub_1000B8654())
                {
                  uint64_t v56 = 0LL;
                  uint64_t v42 = sub_1000B85DC();
                  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                    uint64_t v44 = 3LL;
                  }
                  else {
                    uint64_t v44 = 2LL;
                  }
                  v45 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
                  *(_DWORD *)buf = 68158211;
                  int v59 = 39;
                  __int16 v60 = 2080;
                  v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                  __int16 v62 = 2113;
                  v63 = v45;
                  LODWORD(v51) = 28;
                  v46 = (char *)_os_log_send_and_compose_impl( v44,  &v56,  0LL,  0LL,  &_mh_execute_header,  v43,  16LL,  "%.*s: Mount point %{private}@ disappeared (shadow's mount point)",  buf,  v51);

                  if (v46)
                  {
                    fprintf(__stderrp, "%s\n", v46);
                    free(v46);
                  }
                }

                else
                {
                  uint64_t v47 = sub_1000B85DC();
                  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    v49 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
                    *(_DWORD *)buf = 68158211;
                    int v59 = 39;
                    __int16 v60 = 2080;
                    v61 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                    __int16 v62 = 2113;
                    v63 = v49;
                    _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%.*s: Mount point %{private}@ disappeared (shadow's mount point)",  buf,  0x1Cu);
                  }
                }

                *__error() = v41;
                v50 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb delegate](self, "delegate"));
                [v50 onDisappearedMountPoint];

                goto LABEL_56;
              }
            }

            id v38 = [v36 countByEnumeratingWithState:&v52 objects:v57 count:16];
            if (v38) {
              continue;
            }
            break;
          }
        }

- (BOOL)waitForDAIdleWithError:(id *)a3
{
  int v4 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v22 = 0LL;
    uint64_t v5 = sub_1000B85DC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v24 = 36;
    __int16 v25 = 2080;
    uint64_t v26 = "-[DIDiskArb waitForDAIdleWithError:]";
    LODWORD(v21) = 18;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl( v7,  &v22,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%.*s: Waiting for disk arbitration idle",  (int)buf,  v21);

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
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v24 = 36;
      __int16 v25 = 2080;
      uint64_t v26 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%.*s: Waiting for disk arbitration idle",  buf,  0x12u);
    }
  }

  *__error() = v4;
  -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0LL);
  DARegisterIdleCallback(-[DIDiskArb daSession](self, "daSession"), sub_100028188, self);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  if (!-[DIDiskArb callbackReached](self, "callbackReached"))
  {
    do
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  1.0));
      [v11 runMode:NSDefaultRunLoopMode beforeDate:v12];
    }

    while (!-[DIDiskArb callbackReached](self, "callbackReached"));
  }

  DAUnregisterCallback(-[DIDiskArb daSession](self, "daSession"), sub_100028188, self);
  int v13 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v22 = 0LL;
    uint64_t v14 = sub_1000B85DC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = 3LL;
    }
    else {
      uint64_t v16 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v24 = 36;
    __int16 v25 = 2080;
    uint64_t v26 = "-[DIDiskArb waitForDAIdleWithError:]";
    LODWORD(v21) = 18;
    uint64_t v17 = (char *)_os_log_send_and_compose_impl( v16,  &v22,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%.*s: Disk arbitration idle callback received",  (int)buf,  v21);

    if (v17)
    {
      fprintf(__stderrp, "%s\n", v17);
      free(v17);
    }
  }

  else
  {
    uint64_t v18 = sub_1000B85DC();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v24 = 36;
      __int16 v25 = 2080;
      uint64_t v26 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%.*s: Disk arbitration idle callback received",  buf,  0x12u);
    }
  }

  *__error() = v13;

  return 1;
}

- (void)addDisappearedCallbackWithMountPoint:(id)a3 shadowMountPoints:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    -[DIDiskArb setInputMountedOnURL:](self, "setInputMountedOnURL:", v8);
    id v37 = v9;
    -[DIDiskArb setShadowMountedOnURLs:](self, "setShadowMountedOnURLs:", v9);
    id v36 = v10;
    -[DIDiskArb setDelegate:](self, "setDelegate:", v10);
    int v11 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v44 = 0LL;
      uint64_t v12 = sub_1000B85DC();
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = 3LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      *(_DWORD *)buf = 68158211;
      int v47 = 77;
      __int16 v48 = 2080;
      v49 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
      __int16 v50 = 2113;
      v51 = v15;
      uint64_t v16 = (char *)_os_log_send_and_compose_impl( v14,  &v44,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%.*s: Registering DiskDisappearedCallback for %{private}@",  buf,  28);

      if (v16)
      {
        fprintf(__stderrp, "%s\n", v16);
        free(v16);
      }
    }

    else
    {
      uint64_t v17 = sub_1000B85DC();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
        *(_DWORD *)buf = 68158211;
        int v47 = 77;
        __int16 v48 = 2080;
        v49 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
        __int16 v50 = 2113;
        v51 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%.*s: Registering DiskDisappearedCallback for %{private}@",  buf,  0x1Cu);
      }
    }

    id v39 = v8;
    *__error() = v11;
  }

  else
  {
    if (![v9 count]) {
      goto LABEL_31;
    }
    id v39 = 0LL;
    -[DIDiskArb setInputMountedOnURL:](self, "setInputMountedOnURL:", 0LL);
    id v37 = v9;
    -[DIDiskArb setShadowMountedOnURLs:](self, "setShadowMountedOnURLs:", v9);
    id v36 = v10;
    -[DIDiskArb setDelegate:](self, "setDelegate:", v10);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v38 = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs"));
  id v21 = [v20 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        __int16 v25 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        int v26 = *__error();
        if (sub_1000B8654())
        {
          uint64_t v44 = 0LL;
          uint64_t v27 = sub_1000B85DC();
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v29 = 3LL;
          }
          else {
            uint64_t v29 = 2LL;
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue([v25 path]);
          *(_DWORD *)buf = 68158211;
          int v47 = 77;
          __int16 v48 = 2080;
          v49 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
          __int16 v50 = 2113;
          v51 = v30;
          LODWORD(v35) = 28;
          uint64_t v31 = (char *)_os_log_send_and_compose_impl( v29,  &v44,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%.*s: Registering DiskDisappearedCallback for %{private}@ (shadow's mount point)",  buf,  v35);

          if (v31)
          {
            fprintf(__stderrp, "%s\n", v31);
            free(v31);
          }
        }

        else
        {
          uint64_t v32 = sub_1000B85DC();
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue([v25 path]);
            *(_DWORD *)buf = 68158211;
            int v47 = 77;
            __int16 v48 = 2080;
            v49 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
            __int16 v50 = 2113;
            v51 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%.*s: Registering DiskDisappearedCallback for %{private}@ (shadow's mount point)",  buf,  0x1Cu);
          }
        }

        *__error() = v26;
      }

      id v22 = [v20 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v22);
  }

  DARegisterDiskDisappearedCallback( -[DIDiskArb daSession](v38, "daSession"),  0LL,  (DADiskDisappearedCallback)sub_1000276A4,  v38);
  id v8 = v39;
  id v10 = v36;
  id v9 = v37;
LABEL_31:
}

- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v30 = 0LL;
    uint64_t v8 = sub_1000B85DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    int v32 = 36;
    __int16 v33 = 2080;
    v34 = "-[DIDiskArb ejectWithBSDName:error:]";
    __int16 v35 = 2112;
    id v36 = v6;
    int v11 = (char *)_os_log_send_and_compose_impl( v10,  &v30,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%.*s: Ejecting %@",  buf,  28);

    if (v11)
    {
      fprintf(__stderrp, "%s\n", v11);
      free(v11);
    }
  }

  else
  {
    uint64_t v12 = sub_1000B85DC();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v32 = 36;
      __int16 v33 = 2080;
      v34 = "-[DIDiskArb ejectWithBSDName:error:]";
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }
  }

  *__error() = v7;
  uint64_t v14 = -[DIDiskArb daSession](self, "daSession");
  id v15 = v6;
  uint64_t v16 = DADiskCreateFromBSDName(0, v14, (const char *)[v15 fileSystemRepresentation]);
  if (v16)
  {
    -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0LL);
    -[DIDiskArb setOperationError:](self, "setOperationError:", 0LL);
    DADiskEject(v16, 0, (DADiskEjectCallback)sub_100028AAC, self);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    if (!-[DIDiskArb callbackReached](self, "callbackReached"))
    {
      do
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  1.0));
        [v17 runMode:NSDefaultRunLoopMode beforeDate:v18];
      }

      while (!-[DIDiskArb callbackReached](self, "callbackReached"));
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb operationError](self, "operationError"));

    unsigned __int8 v20 = v19 == 0LL;
    if (v19)
    {
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue(-[DIDiskArb operationError](self, "operationError"));
      }
    }

    else
    {
      int v21 = *__error();
      if (sub_1000B8654())
      {
        uint64_t v30 = 0LL;
        uint64_t v22 = sub_1000B85DC();
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v24 = 3LL;
        }
        else {
          uint64_t v24 = 2LL;
        }
        *(_DWORD *)buf = 68158210;
        int v32 = 36;
        __int16 v33 = 2080;
        v34 = "-[DIDiskArb ejectWithBSDName:error:]";
        __int16 v35 = 2112;
        id v36 = v15;
        LODWORD(v29) = 28;
        __int16 v25 = (char *)_os_log_send_and_compose_impl( v24,  &v30,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%.*s: %@ ejected successfully",  buf,  v29);

        if (v25)
        {
          fprintf(__stderrp, "%s\n", v25);
          free(v25);
        }
      }

      else
      {
        uint64_t v26 = sub_1000B85DC();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          int v32 = 36;
          __int16 v33 = 2080;
          v34 = "-[DIDiskArb ejectWithBSDName:error:]";
          __int16 v35 = 2112;
          id v36 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%.*s: %@ ejected successfully",  buf,  0x1Cu);
        }
      }

      *__error() = v21;
    }
  }

  else
  {
    unsigned __int8 v20 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  156LL,  @"Failed to create DADisk during eject",  a4);
  }

  return v20;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v29 = 0LL;
    uint64_t v8 = sub_1000B85DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    *(_DWORD *)buf = 68158211;
    int v31 = 41;
    __int16 v32 = 2080;
    __int16 v33 = "-[DIDiskArb unmountWithMountPoint:error:]";
    __int16 v34 = 2113;
    id v35 = v6;
    int v11 = (char *)_os_log_send_and_compose_impl( v10,  &v29,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%.*s: Unmounting %{private}@",  buf,  28);

    if (v11)
    {
      fprintf(__stderrp, "%s\n", v11);
      free(v11);
    }
  }

  else
  {
    uint64_t v12 = sub_1000B85DC();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158211;
      int v31 = 41;
      __int16 v32 = 2080;
      __int16 v33 = "-[DIDiskArb unmountWithMountPoint:error:]";
      __int16 v34 = 2113;
      id v35 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Unmounting %{private}@", buf, 0x1Cu);
    }
  }

  *__error() = v7;
  uint64_t v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
  id v15 = DADiskCreateFromVolumePath(0LL, -[DIDiskArb daSession](self, "daSession"), v14);
  if (v15)
  {
    -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0LL);
    -[DIDiskArb setOperationError:](self, "setOperationError:", 0LL);
    DADiskUnmount(v15, 0, (DADiskUnmountCallback)sub_100028AAC, self);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    if (!-[DIDiskArb callbackReached](self, "callbackReached"))
    {
      do
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  1.0));
        [v16 runMode:NSDefaultRunLoopMode beforeDate:v17];
      }

      while (!-[DIDiskArb callbackReached](self, "callbackReached"));
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIDiskArb operationError](self, "operationError"));

    unsigned __int8 v19 = v18 == 0LL;
    if (v18)
    {
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue(-[DIDiskArb operationError](self, "operationError"));
      }
    }

    else
    {
      int v20 = *__error();
      if (sub_1000B8654())
      {
        uint64_t v29 = 0LL;
        uint64_t v21 = sub_1000B85DC();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v23 = 3LL;
        }
        else {
          uint64_t v23 = 2LL;
        }
        *(_DWORD *)buf = 68158211;
        int v31 = 41;
        __int16 v32 = 2080;
        __int16 v33 = "-[DIDiskArb unmountWithMountPoint:error:]";
        __int16 v34 = 2113;
        id v35 = v6;
        LODWORD(v28) = 28;
        uint64_t v24 = (char *)_os_log_send_and_compose_impl( v23,  &v29,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%.*s: %{private}@ unmounted successfully",  buf,  v28);

        if (v24)
        {
          fprintf(__stderrp, "%s\n", v24);
          free(v24);
        }
      }

      else
      {
        uint64_t v25 = sub_1000B85DC();
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158211;
          int v31 = 41;
          __int16 v32 = 2080;
          __int16 v33 = "-[DIDiskArb unmountWithMountPoint:error:]";
          __int16 v34 = 2113;
          id v35 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%.*s: %{private}@ unmounted successfully",  buf,  0x1Cu);
        }
      }

      *__error() = v20;
    }
  }

  else
  {
    unsigned __int8 v19 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  156LL,  @"Failed to create DADisk during unmount",  a4);
  }

  return v19;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[DIDiskArb daSession](self, "daSession");
  id v6 = v4;
  int v7 = (const char *)[v6 fileSystemRepresentation];

  uint64_t v8 = DADiskCreateFromBSDName(0LL, v5, v7);
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
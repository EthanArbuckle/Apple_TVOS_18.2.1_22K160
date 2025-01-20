@interface BTStateWatcher
+ (id)monitorBuddyStateWithAction:(id)a3;
+ (id)monitorFirstUnlockWithAction:(id)a3;
+ (id)monitorURL:(id)a3 action:(id)a4;
- (BOOL)isWatchingBuddy;
- (BOOL)start;
- (BOOL)triggered;
- (BTStateWatcher)initWithURL:(id)a3 action:(id)a4;
- (NSString)targetFilename;
- (NSURL)directoryURL;
- (OS_dispatch_source)dispatchSourceAbort;
- (OS_dispatch_source)dispatchSourceChange;
- (id)block;
- (int)fd;
- (void)cancel;
- (void)dealloc;
- (void)directoryChanged;
- (void)fileDiscovered;
- (void)setBlock:(id)a3;
- (void)setDirectoryURL:(id)a3;
- (void)setDispatchSourceAbort:(id)a3;
- (void)setDispatchSourceChange:(id)a3;
- (void)setFd:(int)a3;
- (void)setIsWatchingBuddy:(BOOL)a3;
- (void)setTargetFilename:(id)a3;
- (void)setTriggered:(BOOL)a3;
@end

@implementation BTStateWatcher

- (BTStateWatcher)initWithURL:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___BTStateWatcher;
  v8 = -[BTStateWatcher init](&v19, "init");
  if (v8)
  {
    v9 = v8;
    v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v6 standardizedURL]);
    v11 = (__CFString *)CFURLCopyPath(v10);
    unsigned int v12 = -[__CFString hasSuffix:](v11, "hasSuffix:", @"/");
    CFRelease(v11);
    v18.receiver = v9;
    v18.super_class = (Class)&OBJC_CLASS___BTStateWatcher;
    v13 = -[BTStateWatcher init](&v18, "init");
    v14 = v13;
    if (v12)
    {
      -[BTStateWatcher setDirectoryURL:](v13, "setDirectoryURL:", v10);
      -[BTStateWatcher setTargetFilename:](v14, "setTargetFilename:", 0LL);
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL URLByDeletingLastPathComponent](v10, "URLByDeletingLastPathComponent"));
      -[BTStateWatcher setDirectoryURL:](v14, "setDirectoryURL:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL lastPathComponent](v10, "lastPathComponent"));
      -[BTStateWatcher setTargetFilename:](v14, "setTargetFilename:", v16);
    }

    -[BTStateWatcher setBlock:](v14, "setBlock:", v7);
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTStateWatcher;
  -[BTStateWatcher dealloc](&v3, "dealloc");
}

- (BOOL)start
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher block](self, "block"));

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006C1E0;
    block[3] = &unk_100206058;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
    return 1;
  }

  else
  {
    objc_initWeak(&location, self);
    v5 = (os_log_s *)(id)qword_10023DCB8;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher targetFilename](self, "targetFilename"));
      sub_10018FE2C(v6, v7, v41, v5);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 path]);
    -[BTStateWatcher setFd:](self, "setFd:", open((const char *)[v9 fileSystemRepresentation], 0x8000));

    int v10 = -[BTStateWatcher fd](self, "fd");
    BOOL v4 = v10 > 0;
    if (v10 < 1)
    {
      v26 = (os_log_s *)(id)qword_10023DCB8;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
        sub_10018FDDC(v27, buf, v26);
      }
    }

    else
    {
      uintptr_t v11 = -[BTStateWatcher fd](self, "fd");
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v11, 2uLL, v13);
      -[BTStateWatcher setDispatchSourceChange:](self, "setDispatchSourceChange:", v14);

      v15 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceChange](self, "dispatchSourceChange"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10006C24C;
      handler[3] = &unk_100207CE0;
      handler[4] = self;
      objc_copyWeak(&v36, &location);
      dispatch_source_set_event_handler(v15, handler);

      v16 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceChange](self, "dispatchSourceChange"));
      dispatch_resume(v16);

      v17 = (os_log_s *)(id)qword_10023DCB8;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
        sub_10018FD8C(v19, (uint64_t)buf, v17, v18);
      }

      dispatch_source_t v20 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_vnode,  -[BTStateWatcher fd](self, "fd"),  0x61uLL,  v13);
      -[BTStateWatcher setDispatchSourceAbort:](self, "setDispatchSourceAbort:", v20);

      v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));
      v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472LL;
      v31 = sub_10006C2A8;
      v32 = &unk_100207CE0;
      v33 = self;
      objc_copyWeak(&v34, &location);
      dispatch_source_set_event_handler(v21, &v29);

      v22 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue( -[BTStateWatcher dispatchSourceAbort]( self,  "dispatchSourceAbort",  v29,  v30,  v31,  v32,  v33));
      dispatch_resume(v22);

      v23 = (os_log_s *)(id)qword_10023DCB8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
        sub_10018FD3C(v25, (uint64_t)v39, v23, v24);
      }

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
    }

    objc_destroyWeak(&location);
  }

  return v4;
}

+ (id)monitorURL:(id)a3 action:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[BTStateWatcher initWithURL:action:](objc_alloc(&OBJC_CLASS___BTStateWatcher), "initWithURL:action:", v6, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher targetFilename](v7, "targetFilename"));
  if (v8)
  {
    id v9 = (os_log_s *)qword_10023DCB8;
    if (os_log_type_enabled((os_log_t)qword_10023DCB8, OS_LOG_TYPE_DEBUG)) {
      sub_10018FFB4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    -[BTStateWatcher directoryChanged](v7, "directoryChanged");
  }

  if (!-[BTStateWatcher triggered](v7, "triggered") && !-[BTStateWatcher start](v7, "start"))
  {
    -[BTStateWatcher cancel](v7, "cancel");

    id v7 = 0LL;
  }

  return v7;
}

+ (id)monitorBuddyStateWithAction:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new(&OBJC_CLASS___BTStateWatcher);
  -[BTStateWatcher setIsWatchingBuddy:](v4, "setIsWatchingBuddy:", 1LL);
  -[BTStateWatcher setBlock:](v4, "setBlock:", v3);

  int out_token = -1;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_10006C4DC;
  uint64_t v12 = &unk_100208220;
  int v14 = -1;
  uint64_t v13 = v4;
  id v5 = v4;
  notify_register_dispatch("com.apple.purplebuddy.setupdone", &out_token, &_dispatch_main_q, &v9);
  if (-[BTStateWatcher start](v5, "start", v9, v10, v11, v12)) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

+ (id)monitorFirstUnlockWithAction:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new(&OBJC_CLASS___BTStateWatcher);
  -[BTStateWatcher setBlock:](v4, "setBlock:", v3);

  int out_token = -1;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_10006C650;
  uint64_t v12 = &unk_100208220;
  int v14 = -1;
  uint64_t v13 = v4;
  id v5 = v4;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, &_dispatch_main_q, &v9);
  if (-[BTStateWatcher start](v5, "start", v9, v10, v11, v12)) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (void)directoryChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher targetFilename](self, "targetFilename"));

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
    id v23 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:0 error:&v23]);
    id v7 = v23;

    if (v7)
    {
      v8 = (void *)qword_10023DCB8;
      if (os_log_type_enabled((os_log_t)qword_10023DCB8, OS_LOG_TYPE_ERROR)) {
        sub_100190068(v8, self, (uint64_t)v7);
      }
      -[BTStateWatcher cancel](self, "cancel");
    }

    else
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      objc_super v18 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher targetFilename](self, "targetFilename"));
            unsigned int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              -[BTStateWatcher fileDiscovered](self, "fileDiscovered");

              id v6 = v18;
              goto LABEL_18;
            }

            uint64_t v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      v17 = (void *)qword_10023DCB8;
      id v6 = v18;
      if (os_log_type_enabled((os_log_t)qword_10023DCB8, OS_LOG_TYPE_DEBUG)) {
        sub_10018FFE8(v17);
      }
    }

- (void)fileDiscovered
{
  id v3 = (void *)qword_10023DCB8;
  if (os_log_type_enabled((os_log_t)qword_10023DCB8, OS_LOG_TYPE_DEBUG)) {
    sub_100190110(v3);
  }
  -[BTStateWatcher setTriggered:](self, "setTriggered:", 1LL);
  -[BTStateWatcher cancel](self, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006CA38;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)cancel
{
  id v3 = (os_log_s *)qword_10023DCB8;
  if (os_log_type_enabled((os_log_t)qword_10023DCB8, OS_LOG_TYPE_DEBUG)) {
    sub_100190190(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceChange](self, "dispatchSourceChange"));

  if (v11)
  {
    uint64_t v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceChange](self, "dispatchSourceChange"));
    dispatch_source_cancel(v12);

    -[BTStateWatcher setDispatchSourceChange:](self, "setDispatchSourceChange:", 0LL);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));

  if (v13)
  {
    int v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));
    dispatch_source_cancel(v14);

    -[BTStateWatcher setDispatchSourceAbort:](self, "setDispatchSourceAbort:", 0LL);
  }

  if (-[BTStateWatcher fd](self, "fd") >= 1)
  {
    close(-[BTStateWatcher fd](self, "fd"));
    -[BTStateWatcher setFd:](self, "setFd:", 0LL);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter) {
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, BYSetupAssistantFinishedDarwinNotification, 0LL);
  }
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
}

- (NSString)targetFilename
{
  return self->_targetFilename;
}

- (void)setTargetFilename:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (OS_dispatch_source)dispatchSourceChange
{
  return self->_dispatchSourceChange;
}

- (void)setDispatchSourceChange:(id)a3
{
}

- (OS_dispatch_source)dispatchSourceAbort
{
  return self->_dispatchSourceAbort;
}

- (void)setDispatchSourceAbort:(id)a3
{
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (void)setTriggered:(BOOL)a3
{
  self->_triggered = a3;
}

- (BOOL)isWatchingBuddy
{
  return self->_isWatchingBuddy;
}

- (void)setIsWatchingBuddy:(BOOL)a3
{
  self->_isWatchingBuddy = a3;
}

- (void).cxx_destruct
{
}

@end
@interface MRDMediaAppInFocusMonitor
+ (BOOL)isRemoteControllableApp:(id)a3;
- (BOOL)lockScreenVisible;
- (MRDDisplayMonitor)displayMonitor;
- (MRDMediaAppInFocusMonitor)initWithDelegate:(id)a3;
- (MRDMediaAppInFocusMonitorDelegate)delegate;
- (NSSet)bundlesInFocus;
- (NSSet)mediaBundlesInFocus;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)notifyDelegate;
- (void)setBundlesInFocus:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setLockScreenVisible:(BOOL)a3;
- (void)setMediaBundlesInFocus:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MRDMediaAppInFocusMonitor

- (MRDMediaAppInFocusMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MRDMediaAppInFocusMonitor;
  v5 = -[MRDMediaAppInFocusMonitor init](&v22, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaremote.MediaAppInFocus", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremote.MediaAppInFocusDelegate", v11);
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
    displayMonitor = v5->_displayMonitor;
    v5->_displayMonitor = (MRDDisplayMonitor *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    bundlesInFocus = v5->_bundlesInFocus;
    v5->_bundlesInFocus = (NSSet *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    mediaBundlesInFocus = v5->_mediaBundlesInFocus;
    v5->_mediaBundlesInFocus = (NSSet *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v20 addObserver:v5 selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v5->_displayMonitor];
  }

  return v5;
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor displayMonitor](self, "displayMonitor"));
  unsigned int v6 = [v5 displayOn];

  if (!v6)
  {
    -[MRDMediaAppInFocusMonitor setLockScreenVisible:](self, "setLockScreenVisible:", 0LL);
LABEL_10:
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    -[MRDMediaAppInFocusMonitor setBundlesInFocus:](self, "setBundlesInFocus:", v16);

    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    -[MRDMediaAppInFocusMonitor setMediaBundlesInFocus:](self, "setMediaBundlesInFocus:", v17);
    goto LABEL_19;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor displayMonitor](self, "displayMonitor"));
  if ([v7 lockScreenVisible])
  {
    dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor displayMonitor](self, "displayMonitor"));
    uint64_t v9 = [v8 controlCenterVisible] ^ 1;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor displayMonitor](self, "displayMonitor"));
  unsigned __int8 v11 = [v10 controlCenterVisible];

  -[MRDMediaAppInFocusMonitor setLockScreenVisible:](self, "setLockScreenVisible:", v9);
  if ((v9 & 1) != 0 || (v11 & 1) != 0) {
    goto LABEL_10;
  }
  dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor displayMonitor](self, "displayMonitor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 presentedBundleIdentifiers]);
  uint64_t v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  uint64_t v18 = v15;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaBundleManager shared](&OBJC_CLASS___MRDMediaBundleManager, "shared"));
  unsigned __int8 v20 = [v19 isSupported];

  if ((v20 & 1) == 0)
  {
    uint64_t v22 = _MRLogForCategory(13LL, v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IFM MRDMediaBundleManager not supported on this platform",  (uint8_t *)buf,  2u);
    }
  }

  uint64_t v24 = _MRLogForCategory(13LL, v21);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IFM always using dynamicEligibility check",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaBundleManager shared](&OBJC_CLASS___MRDMediaBundleManager, "shared"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v18 allObjects]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100072994;
  v28[3] = &unk_10039CD68;
  objc_copyWeak(&v30, buf);
  id v17 = v18;
  id v29 = v17;
  [v26 queryEligibilityOfAll:v27 completionHandler:v28];

  objc_destroyWeak(&v30);
  objc_destroyWeak(buf);
LABEL_19:
}

- (NSSet)bundlesInFocus
{
  uint64_t v7 = 0LL;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  dispatch_queue_attr_t v10 = sub_100072B58;
  unsigned __int8 v11 = sub_100072B68;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100072B70;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)setBundlesInFocus:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100072C1C;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSSet)mediaBundlesInFocus
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  dispatch_queue_attr_t v10 = sub_100072B58;
  unsigned __int8 v11 = sub_100072B68;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100072D08;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)setMediaBundlesInFocus:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100072DB4;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)lockScreenVisible
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100072EE8;
  v5[3] = &unk_100399278;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setLockScreenVisible:(BOOL)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100072F78;
  v6[3] = &unk_10039A9E0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)notifyDelegate
{
  id v3 = -[NSSet copy](self->_mediaBundlesInFocus, "copy");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaAppInFocusMonitor delegateQueue](self, "delegateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100073038;
  v6[3] = &unk_100398E60;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

+ (BOOL)isRemoteControllableApp:(id)a3
{
  uint64_t v3 = qword_1003FDD48;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1003FDD48, &stru_10039CD88);
  }
  unsigned __int8 v5 = [(id)qword_1003FDD50 containsObject:v4];

  return v5;
}

- (MRDMediaAppInFocusMonitorDelegate)delegate
{
  return (MRDMediaAppInFocusMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (MRDDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
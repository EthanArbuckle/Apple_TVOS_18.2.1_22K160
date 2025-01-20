@interface MSDUIHelper
+ (id)sharedInstance;
- (BOOL)allowCancel;
- (BOOL)disableIdleTimer;
- (BOOL)launchFullScreenUI;
- (BOOL)launchFullScreenUI_tv;
- (MSDUIHelper)init;
- (NSString)fullScreenUIAppId;
- (NSString)message;
- (OS_dispatch_queue)uiHelperQueue;
- (OS_xpc_object)connection;
- (OS_xpc_object)pendingMessage;
- (RBSProcessMonitor)fullScreenUIAppMonitor;
- (int)fullScreenState;
- (int64_t)currentProgress;
- (void)activateFullScreenUIAppMonitor;
- (void)deactivateFullScreenUIAppMonitor;
- (void)demoUpdateAllowCancel:(BOOL)a3;
- (void)demoUpdateCompleted:(id)a3;
- (void)demoUpdateFailed:(id)a3;
- (void)demoUpdateProgress:(int64_t)a3;
- (void)fullScreenUICanceledByUser;
- (void)handleFullScreenUIAppStateChange:(unsigned __int8)a3 withVisibility:(BOOL)a4;
- (void)requestFullScreenUI;
- (void)setAllowCancel:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentProgress:(int64_t)a3;
- (void)setDisableIdleTimer:(BOOL)a3;
- (void)setFullScreenState:(int)a3;
- (void)setFullScreenUIAppId:(id)a3;
- (void)setFullScreenUIAppMonitor:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPendingMessage:(id)a3;
- (void)setUiHelperQueue:(id)a3;
- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4;
- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4 disableIdleTimer:(BOOL)a5;
- (void)stopFullScreenUI:(id)a3;
@end

@implementation MSDUIHelper

+ (id)sharedInstance
{
  if (qword_100125598 != -1) {
    dispatch_once(&qword_100125598, &stru_1000FAA40);
  }
  return (id)qword_100125590;
}

- (MSDUIHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDUIHelper;
  v2 = -[MSDUIHelper init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDUIHelper setFullScreenState:](v2, "setFullScreenState:", 0LL);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.msduihelper", 0LL);
    -[MSDUIHelper setUiHelperQueue:](v3, "setUiHelperQueue:", v4);

    -[MSDUIHelper setCurrentProgress:](v3, "setCurrentProgress:", 0LL);
    -[MSDUIHelper setFullScreenUIAppId:](v3, "setFullScreenUIAppId:", @"com.apple.StoreDemoViewService");
    v5 = v3;
  }

  return v3;
}

- (void)setConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100084B4C;
  v7[3] = &unk_1000FAA68;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  objc_copyWeak(&v10, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4
{
}

- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4 disableIdleTimer:(BOOL)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100084DF4;
  v11[3] = &unk_1000FAA90;
  objc_copyWeak(&v13, &location);
  BOOL v14 = a4;
  id v12 = v8;
  BOOL v15 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)stopFullScreenUI:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085034;
  block[3] = &unk_1000F93B8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)fullScreenUICanceledByUser
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100085468;
  v4[3] = &unk_1000F96A8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)requestFullScreenUI
{
  unsigned int v3 = -[MSDUIHelper launchFullScreenUI](self, "launchFullScreenUI");
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Request to launch blocking UI: %d",  (uint8_t *)&buf,  8u);
  }

  objc_initWeak(&buf, self);
  dispatch_time_t v6 = dispatch_time(0LL, 15000000000LL);
  objc_super v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085640;
  block[3] = &unk_1000F96A8;
  objc_copyWeak(&v9, &buf);
  dispatch_after(v6, v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&buf);
}

- (BOOL)launchFullScreenUI
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trying to start blocking UI...", v6, 2u);
  }

  return -[MSDUIHelper launchFullScreenUI_tv](self, "launchFullScreenUI_tv");
}

- (void)activateFullScreenUIAppMonitor
{
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  dispatch_time_t v6 = sub_100085824;
  objc_super v7 = &unk_1000FAB08;
  objc_copyWeak(&v8, &location);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  &v4));
  -[MSDUIHelper setFullScreenUIAppMonitor:](self, "setFullScreenUIAppMonitor:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)deactivateFullScreenUIAppMonitor
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper fullScreenUIAppMonitor](self, "fullScreenUIAppMonitor"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper fullScreenUIAppMonitor](self, "fullScreenUIAppMonitor"));
    [v4 invalidate];

    -[MSDUIHelper setFullScreenUIAppMonitor:](self, "setFullScreenUIAppMonitor:", 0LL);
  }

- (void)handleFullScreenUIAppStateChange:(unsigned __int8)a3 withVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v5 = a3;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v5;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Full screen UI app state change to %d, visible:%d",  (uint8_t *)&buf,  0xEu);
  }

  objc_initWeak(&buf, self);
  if (v5 <= 1)
  {
    id v9 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "App is crashed or terminated.", v20, 2u);
    }

    dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100085D34;
    block[3] = &unk_1000F96A8;
    id v13 = &v19;
    objc_copyWeak(&v19, &buf);
    dispatch_after(v11, v12, block);
LABEL_13:

    objc_destroyWeak(v13);
    goto LABEL_14;
  }

  if (v5 == 3 || v5 == 4 && !v4)
  {
    id v14 = sub_10003A95C();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "App is no longer in foreground.", v20, 2u);
    }

    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100085DBC;
    v16[3] = &unk_1000F96A8;
    id v13 = &v17;
    objc_copyWeak(&v17, &buf);
    dispatch_async(v12, v16);
    goto LABEL_13;
  }

- (BOOL)launchFullScreenUI_tv
{
  id v3 = sub_10003A95C();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Launching fullScreenUI_Tv", buf, 2u);
  }

  v33[0] = @"DisplayString";
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper message](self, "message"));
  v33[1] = @"CancelButton";
  v34[0] = v5;
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MSDUIHelper allowCancel](self, "allowCancel")));
  v34[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  2LL));

  v31[0] = PBSUPRDialogTypeKey;
  v31[1] = PBSUPRDialogCustomViewServiceNameKey;
  v32[0] = PBSUPRDialogTypeCustom;
  v32[1] = @"com.apple.StoreDemoViewService";
  v31[2] = PBSUPRDialogCustomViewControllerClassNameKey;
  v31[3] = @"AppleTvBlockingUIOption";
  v32[2] = @"MSDViewServiceRootViewController";
  v32[3] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  4LL));
  id v9 = [[PBSUserPresentationRequest alloc] initWithType:0 options:v8];
  *(void *)id buf = 0LL;
  v24 = buf;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_100086230;
  v27 = sub_100086240;
  id v28 = (id)objc_claimAutoreleasedReturnValue(+[PBSUserPresentationService sharedInstance](&OBJC_CLASS___PBSUserPresentationService, "sharedInstance"));
  id v10 = (void *)*((void *)v24 + 5);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100086248;
  v22[3] = &unk_1000FAB30;
  v22[4] = buf;
  [v10 presentUIWithRequest:v9 completion:v22];
  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Waiting for fullScreenUI_Tv to launch",  v29,  2u);
  }

  id v13 = 0LL;
  unsigned __int8 v14 = 0;
  for (uint64_t i = -60LL; v14 != 4 && i != 0; ++i)
  {
    if (v13
      || (v17 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  @"com.apple.StoreDemoViewService")),  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v17,  0LL)),  v17,  v13))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v13 currentState]);
      unsigned __int8 v14 = [v18 taskState];
    }

    sleep(1u);
  }

  id v19 = sub_10003A95C();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v29 = 67109120;
    int v30 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "fullScreenUI_Tv launched with state: %hhu",  v29,  8u);
  }

  _Block_object_dispose(buf, 8);
  return v14 == 4;
}

- (void)demoUpdateFailed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000863FC;
  block[3] = &unk_1000FAB80;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)demoUpdateProgress:(int64_t)a3
{
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086860;
  block[3] = &unk_1000FABA8;
  v7[1] = (id)a3;
  objc_copyWeak(v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)demoUpdateAllowCancel:(BOOL)a3
{
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086A90;
  block[3] = &unk_1000FABD0;
  BOOL v8 = a3;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)demoUpdateCompleted:(id)a3
{
}

- (NSString)fullScreenUIAppId
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFullScreenUIAppId:(id)a3
{
}

- (OS_dispatch_queue)uiHelperQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setUiHelperQueue:(id)a3
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMessage:(id)a3
{
}

- (BOOL)allowCancel
{
  return self->_allowCancel;
}

- (void)setAllowCancel:(BOOL)a3
{
  self->_allowCancel = a3;
}

- (BOOL)disableIdleTimer
{
  return self->_disableIdleTimer;
}

- (void)setDisableIdleTimer:(BOOL)a3
{
  self->_disableIdleTimer = a3;
}

- (int)fullScreenState
{
  return self->_fullScreenState;
}

- (void)setFullScreenState:(int)a3
{
  self->_fullScreenState = a3;
}

- (OS_xpc_object)pendingMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPendingMessage:(id)a3
{
}

- (int64_t)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(int64_t)a3
{
  self->_currentProgress = a3;
}

- (RBSProcessMonitor)fullScreenUIAppMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setFullScreenUIAppMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
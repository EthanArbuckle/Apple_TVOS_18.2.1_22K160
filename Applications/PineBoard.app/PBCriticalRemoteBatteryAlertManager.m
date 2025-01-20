@interface PBCriticalRemoteBatteryAlertManager
+ (id)sharedInstance;
- (BOOL)isPresenting;
- (PBCriticalAlertContext)currentAlertContext;
- (id)_init;
- (void)dismiss;
- (void)presentIfNeededWithCompletion:(id)a3;
- (void)setCurrentAlertContext:(id)a3;
@end

@implementation PBCriticalRemoteBatteryAlertManager

+ (id)sharedInstance
{
  if (qword_100471238 != -1) {
    dispatch_once(&qword_100471238, &stru_1003DAC10);
  }
  return (id)qword_100471230;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBCriticalRemoteBatteryAlertManager;
  return -[PBCriticalRemoteBatteryAlertManager init](&v3, "init");
}

- (BOOL)isPresenting
{
  return self->_currentAlertContext != 0LL;
}

- (void)presentIfNeededWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (-[PBCriticalRemoteBatteryAlertManager isPresenting](self, "isPresenting"))
  {
    id v5 = sub_100196708();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Critical remote battery alert is already being presented. Will disallow sleep",  buf,  2u);
    }

    v4[2](v4, 0LL);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote"));
    if ([v7 isConnected])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      id v9 = +[TVSBluetoothRemoteUtilities batteryLevelForRemoteName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "batteryLevelForRemoteName:",  v8);
      unsigned __int8 v10 = +[TVSBluetoothRemoteUtilities chargingStateForRemoteName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "chargingStateForRemoteName:",  v8);
      else {
        char v11 = v10;
      }
      if ((v11 & 1) == 0)
      {
        id v12 = sub_100196708();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v25 = v8;
          __int16 v26 = 2048;
          id v27 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Remote battery level is critical. Will display alert. remote=%{public}@, batteryLevel=%lu%%",  buf,  0x16u);
        }

        v14 = objc_alloc_init(&OBJC_CLASS___PBCriticalRemoteBatteryWarningViewController);
        -[PBCriticalRemoteBatteryWarningViewController setRemoteType:]( v14,  "setRemoteType:",  [v7 remoteType]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[PBCriticalAlertContext contextWithViewController:]( &OBJC_CLASS___PBCriticalAlertContext,  "contextWithViewController:",  v14));
        -[PBCriticalRemoteBatteryAlertManager setCurrentAlertContext:](self, "setCurrentAlertContext:", v15);
        objc_initWeak((id *)buf, self);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10019674C;
        v20[3] = &unk_1003DAC38;
        id v16 = v15;
        id v21 = v16;
        objc_copyWeak(&v23, (id *)buf);
        v22 = v4;
        -[PBCriticalRemoteBatteryWarningViewController setDismissalCompletion:](v14, "setDismissalCompletion:", v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBCriticalAlertManager sharedInstance](&OBJC_CLASS___PBCriticalAlertManager, "sharedInstance"));
        [v17 presentAlertWithContext:v16];

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
    }

    if (!-[PBCriticalRemoteBatteryAlertManager isPresenting](self, "isPresenting"))
    {
      id v18 = sub_100196708();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Critical remote battery alert is not required will allow sleep.",  buf,  2u);
      }

      v4[2](v4, 1LL);
    }
  }
}

- (void)dismiss
{
  if (-[PBCriticalRemoteBatteryAlertManager isPresenting](self, "isPresenting"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBCriticalAlertManager sharedInstance](&OBJC_CLASS___PBCriticalAlertManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCriticalRemoteBatteryAlertManager currentAlertContext](self, "currentAlertContext"));
    [v3 dismissAlertWithContext:v4];
  }

- (PBCriticalAlertContext)currentAlertContext
{
  return self->_currentAlertContext;
}

- (void)setCurrentAlertContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
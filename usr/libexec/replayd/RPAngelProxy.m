@interface RPAngelProxy
+ (id)sharedInstance;
- (RPAngelProxy)init;
- (id)connectionManagerQueue;
- (id)getBSServiceInterface;
- (void)connectToAngelWithCompletionHandler:(id)a3;
- (void)disableCameraPip;
- (void)enableCameraPip;
- (void)hideAndStopRecordingBanner;
- (void)pauseCurrentSystemSession;
- (void)resumeCurrentSystemSession;
- (void)setupConnection;
- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5 completionHandler:(id)a6;
- (void)updateTimer:(id)a3;
@end

@implementation RPAngelProxy

+ (id)sharedInstance
{
  if (qword_100084788 != -1) {
    dispatch_once(&qword_100084788, &stru_100071950);
  }
  return (id)qword_100084780;
}

- (id)connectionManagerQueue
{
  if (qword_100084798 != -1) {
    dispatch_once(&qword_100084798, &stru_100071970);
  }
  return (id)qword_100084790;
}

- (id)getBSServiceInterface
{
  if (qword_1000847A8 != -1) {
    dispatch_once(&qword_1000847A8, &stru_100071990);
  }
  return (id)qword_1000847A0;
}

- (RPAngelProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPAngelProxy;
  v2 = -[RPAngelProxy init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[RPAngelProxy setupConnection](v2, "setupConnection");
  }
  return v3;
}

- (void)setupConnection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionEndpoint endpointForMachName:service:instance:]( &OBJC_CLASS___BSServiceConnectionEndpoint,  "endpointForMachName:service:instance:",  @"com.apple.ReplayKitAngel.mach",  @"com.apple.ReplayKitAngel.session",  0LL));
  if (v3)
  {
    v4 = (BSServiceConnectionClient *)objc_claimAutoreleasedReturnValue( +[BSServiceConnection connectionWithEndpoint:]( &OBJC_CLASS___BSServiceConnection,  "connectionWithEndpoint:",  v3));
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002DEA8;
    v7[3] = &unk_100071A40;
    v7[4] = self;
    -[BSServiceConnectionClient configureConnection:](v6, "configureConnection:", v7);
    -[BSServiceConnectionClient activate](self->_connection, "activate");
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy setupConnection]";
    __int16 v10 = 1024;
    int v11 = 99;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAngel endpoint nil",  buf,  0x12u);
  }
}

- (void)hideAndStopRecordingBanner
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy hideAndStopRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 106;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  connection = self->_connection;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v7 = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v5));

  if (v6)
  {
    [v6 hideAndStopRecordingBanner];
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy hideAndStopRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 113;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAngelServerProtocol nil",  buf,  0x12u);
  }
}

- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPAngelProxy showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
    __int16 v22 = 1024;
    int v23 = 118;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  connection = self->_connection;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v19 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v16));

  if (v17)
  {
    [v17 showSavedToPhotosBannerWithPhotosURL:v10 identifier:v11 sessionID:v12 completionHandler:v13];
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[RPAngelProxy showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
      __int16 v22 = 1024;
      int v23 = 125;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAngelServerProtocol nil",  buf,  0x12u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5800LL,  0LL));
    v13[2](v13, v18);
  }
}

- (void)updateTimer:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = "-[RPAngelProxy updateTimer:]";
    __int16 v12 = 1024;
    int v13 = 132;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (v4)
  {
    connection = self->_connection;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v7));

    if (v8)
    {
      [v8 updateTimer:v4];
    }

    else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v11 = "-[RPAngelProxy updateTimer:]";
      __int16 v12 = 1024;
      int v13 = 144;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAngelServerProtocol nil",  buf,  0x12u);
    }
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000456DC();
  }
}

- (void)connectToAngelWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v12 = "-[RPAngelProxy connectToAngelWithCompletionHandler:]";
    __int16 v13 = 1024;
    int v14 = 149;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  connection = self->_connection;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  id v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v7));

  if (v8)
  {
    [v8 connectToAngelWithCompletionHandler:v4];
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v12 = "-[RPAngelProxy connectToAngelWithCompletionHandler:]";
      __int16 v13 = 1024;
      int v14 = 156;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAngelServerProtocol nil",  buf,  0x12u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5800LL,  0LL));
    v4[2](v4, 0LL, v9);
  }
}

- (void)enableCameraPip
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy enableCameraPip]";
    __int16 v10 = 1024;
    int v11 = 163;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  connection = self->_connection;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v7 = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v5));

  if (v6)
  {
    [v6 enableCameraPip];
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy enableCameraPip]";
    __int16 v10 = 1024;
    int v11 = 168;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAngelServerProtocol nil",  buf,  0x12u);
  }
}

- (void)disableCameraPip
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy disableCameraPip]";
    __int16 v10 = 1024;
    int v11 = 173;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  connection = self->_connection;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v7 = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v5));

  if (v6)
  {
    [v6 disableCameraPip];
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy disableCameraPip]";
    __int16 v10 = 1024;
    int v11 = 178;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAngelServerProtocol nil",  buf,  0x12u);
  }
}

- (void)pauseCurrentSystemSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    v3 = "-[RPAngelProxy pauseCurrentSystemSession]";
    __int16 v4 = 1024;
    int v5 = 184;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v2,  0x12u);
  }

- (void)resumeCurrentSystemSession
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    v3 = "-[RPAngelProxy resumeCurrentSystemSession]";
    __int16 v4 = 1024;
    int v5 = 192;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v2,  0x12u);
  }

- (void).cxx_destruct
{
}

@end
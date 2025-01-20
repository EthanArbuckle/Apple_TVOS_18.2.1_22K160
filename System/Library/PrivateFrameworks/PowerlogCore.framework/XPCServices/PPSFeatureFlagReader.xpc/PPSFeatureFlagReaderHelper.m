@interface PPSFeatureFlagReaderHelper
- (NSXPCConnection)connectionToServer;
- (id)createXPCConnection;
- (id)getFeatureFlags;
- (void)closeXPCConnection;
- (void)setConnectionToServer:(id)a3;
@end

@implementation PPSFeatureFlagReaderHelper

- (id)getFeatureFlags
{
  id v3 = logPPSFeatureFlagReaderHelper();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000026C0();
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PPSFeatureFlagReaderHelper createXPCConnection](self, "createXPCConnection"));
  uint64_t v17 = 0LL;
  v18[0] = &v17;
  v18[1] = 0x3032000000LL;
  v18[2] = sub_10000213C;
  v18[3] = sub_10000214C;
  id v19 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100002154;
  v16[3] = &unk_100004300;
  v16[4] = &v17;
  [v6 getFeatureFlags:v16];
  id v7 = logPPSFeatureFlagReaderHelper();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100002644((uint64_t)v18, v8);
  }

  -[PPSFeatureFlagReaderHelper closeXPCConnection](self, "closeXPCConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v9 timeIntervalSinceDate:v5];
  uint64_t v11 = v10;
  id v12 = logPPSFeatureFlagReaderHelper();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    v23 = v5;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "[PPSFeatureFlagReader] Time for getting getFeatureFlags reading to run: %f, %@, %@",  buf,  0x20u);
  }

  id v14 = *(id *)(v18[0] + 40LL);
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (id)createXPCConnection
{
  id v3 = logPPSFeatureFlagReaderHelper();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100002718();
  }

  v5 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.PPSFeatureFlagReader");
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PPSFeatureFlagReaderProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToServer, "setRemoteObjectInterface:", v7);

  -[NSXPCConnection setInterruptionHandler:](self->_connectionToServer, "setInterruptionHandler:", &stru_100004320);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToServer, "setInvalidationHandler:", &stru_100004340);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  id v8 = logPPSFeatureFlagReaderHelper();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000026EC();
  }

  return (id)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToServer,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_100004380));
}

- (void)closeXPCConnection
{
  id v3 = logPPSFeatureFlagReaderHelper();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100002830();
  }

  -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
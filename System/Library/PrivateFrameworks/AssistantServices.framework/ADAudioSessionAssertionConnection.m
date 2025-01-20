@interface ADAudioSessionAssertionConnection
- (ADAudioSessionAssertionConnection)initWithXPCConnection:(id)a3;
- (NSString)description;
- (void)_clearXPCConnection;
- (void)_finalizeWithContext:(id)a3 error:(id)a4;
- (void)_relinquishAssertionWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5;
- (void)acquireAudioSessionWithContext:(id)a3 relinquishmentHandler:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)relinquishAudioSessionWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5 completion:(id)a6;
@end

@implementation ADAudioSessionAssertionConnection

- (ADAudioSessionAssertionConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ADAudioSessionAssertionConnection;
  v6 = -[ADAudioSessionAssertionConnection init](&v18, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t ConnectionWorkloop = AFAudioSessionAssertionGetConnectionWorkloop();
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(ConnectionWorkloop);
    dispatch_queue_t v13 = dispatch_queue_create_with_target_V2( "com.apple.assistant.audio-session-assertion.server-connection",  v10,  v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v6->_int processIdentifier = [v5 processIdentifier];
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    -[NSXPCConnection _setQueue:](v6->_xpcConnection, "_setQueue:", v6->_queue);
    v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int processIdentifier = v6->_processIdentifier;
      *(_DWORD *)buf = 136315650;
      v20 = "-[ADAudioSessionAssertionConnection initWithXPCConnection:]";
      __int16 v21 = 2048;
      v22 = v6;
      __int16 v23 = 1024;
      int v24 = processIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %p (pid = %d)", buf, 0x1Cu);
    }
  }

  return v6;
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADAudioSessionAssertionConnection;
  v4 = -[ADAudioSessionAssertionConnection description](&v8, "description");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ {pid = %d}",  v5,  self->_processIdentifier);

  return v6;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int processIdentifier = self->_processIdentifier;
    *(_DWORD *)buf = 136315650;
    dispatch_queue_attr_t v9 = "-[ADAudioSessionAssertionConnection dealloc]";
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 1024;
    int v13 = processIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p (pid = %d)", buf, 0x1Cu);
  }

  id v5 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@ Deallocated", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:description:](&OBJC_CLASS___AFError, "errorWithCode:description:", 41LL, v5));

  -[ADAudioSessionAssertionConnection _relinquishAssertionWithContext:error:options:]( self,  "_relinquishAssertionWithContext:error:options:",  0LL,  v6,  0LL);
  -[ADAudioSessionAssertionConnection _finalizeWithContext:error:](self, "_finalizeWithContext:error:", 0LL, v6);

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADAudioSessionAssertionConnection;
  -[ADAudioSessionAssertionConnection dealloc](&v7, "dealloc");
}

- (void)acquireAudioSessionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int processIdentifier = self->_processIdentifier;
    *(_DWORD *)buf = 136315906;
    v17 = "-[ADAudioSessionAssertionConnection acquireAudioSessionWithContext:relinquishmentHandler:]";
    __int16 v18 = 2048;
    v19 = self;
    __int16 v20 = 1024;
    int v21 = processIdentifier;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %p (pid = %d) context = %@", buf, 0x26u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100102840;
  block[3] = &unk_1004FD9E0;
  id v14 = v6;
  id v15 = v7;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(queue, block);
}

- (void)relinquishAudioSessionWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int processIdentifier = self->_processIdentifier;
    id v15 = v13;
    uint64_t Names = AFAssertionRelinquishmentOptionsGetNames(a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(Names);
    *(_DWORD *)buf = 136316418;
    v28 = "-[ADAudioSessionAssertionConnection relinquishAudioSessionWithContext:error:options:completion:]";
    __int16 v29 = 2048;
    v30 = self;
    __int16 v31 = 1024;
    int v32 = processIdentifier;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 2112;
    v38 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s %p (pid = %d) context = %@, error = %@, options = %@",  buf,  0x3Au);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100102758;
  block[3] = &unk_1004F8BA0;
  block[4] = self;
  id v23 = v10;
  id v25 = v12;
  unint64_t v26 = a5;
  id v24 = v11;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int processIdentifier = self->_processIdentifier;
    *(_DWORD *)buf = 136315650;
    objc_super v8 = "-[ADAudioSessionAssertionConnection invalidate]";
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 1024;
    int v12 = processIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p (pid = %d)", buf, 0x1Cu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001026BC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_finalizeWithContext:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[AFTwoArgumentSafetyBlock invokeWithValue:andValue:]( self->_relinquishmentHandler,  "invokeWithValue:andValue:",  v6,  v7))
  {
    objc_super v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (v7)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int processIdentifier = self->_processIdentifier;
        int v11 = 136315906;
        int v12 = "-[ADAudioSessionAssertionConnection _finalizeWithContext:error:]";
        __int16 v13 = 2048;
        id v14 = self;
        __int16 v15 = 1024;
        int v16 = processIdentifier;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s %p (pid = %d) error = %@",  (uint8_t *)&v11,  0x26u);
      }
    }

    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = self->_processIdentifier;
      int v11 = 136315906;
      int v12 = "-[ADAudioSessionAssertionConnection _finalizeWithContext:error:]";
      __int16 v13 = 2048;
      id v14 = self;
      __int16 v15 = 1024;
      int v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s %p (pid = %d) context = %@",  (uint8_t *)&v11,  0x26u);
    }
  }

  -[ADAudioSessionAssertionConnection _clearXPCConnection](self, "_clearXPCConnection");
}

- (void)_relinquishAssertionWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  assertion = self->_assertion;
  if (assertion)
  {
    int v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int processIdentifier = self->_processIdentifier;
      int v14 = 136315906;
      __int16 v15 = "-[ADAudioSessionAssertionConnection _relinquishAssertionWithContext:error:options:]";
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 1024;
      int v19 = processIdentifier;
      __int16 v20 = 2112;
      id v21 = assertion;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s %p (pid = %d) assertion = %@",  (uint8_t *)&v14,  0x26u);
      assertion = self->_assertion;
    }

    if (v9) {
      -[AFRelinquishableAssertion relinquishWithError:options:](assertion, "relinquishWithError:options:", v9, a5);
    }
    else {
      -[AFRelinquishableAssertion relinquishWithContext:options:](assertion, "relinquishWithContext:options:", v8, a5);
    }
    __int16 v13 = self->_assertion;
    self->_assertion = 0LL;
  }
}

- (void)_clearXPCConnection
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int processIdentifier = self->_processIdentifier;
      int v7 = 136315906;
      id v8 = "-[ADAudioSessionAssertionConnection _clearXPCConnection]";
      __int16 v9 = 2048;
      int v10 = self;
      __int16 v11 = 1024;
      int v12 = processIdentifier;
      __int16 v13 = 2112;
      int v14 = xpcConnection;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s %p (pid = %d) xpcConnection = %@",  (uint8_t *)&v7,  0x26u);
      xpcConnection = self->_xpcConnection;
    }

    -[NSXPCConnection setExportedObject:](xpcConnection, "setExportedObject:", 0LL);
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    id v6 = self->_xpcConnection;
    self->_xpcConnection = 0LL;
  }

- (void).cxx_destruct
{
}

@end
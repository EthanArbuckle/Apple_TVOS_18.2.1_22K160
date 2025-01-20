@interface ADDeviceAuthenticationSessionV0
- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4;
- (id)handshakeRequestWithCertificateData:(id)a3 error:(id *)a4;
- (id)signData:(id)a3 error:(id *)a4;
- (unint64_t)sessionState;
- (unint64_t)strategyVersion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ADDeviceAuthenticationSessionV0

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADDeviceAuthenticationSessionV0;
  -[ADDeviceAuthenticationSessionV0 dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  nacContext = self->_nacContext;
  if (nacContext)
  {
    int v4 = sub_100008E44((uint64_t)nacContext);
    if (v4)
    {
      int v5 = v4;
      v6 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315394;
        v8 = "-[ADDeviceAuthenticationSessionV0 invalidate]";
        __int16 v9 = 1026;
        int v10 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Error destroying NACContext %{public}d",  (uint8_t *)&v7,  0x12u);
      }
    }
  }

  self->_sessionState = 0LL;
}

- (unint64_t)strategyVersion
{
  return 0LL;
}

- (id)handshakeRequestWithCertificateData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADDeviceAuthenticationSessionV0 handshakeRequestWithCertificateData:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (self->_sessionState) {
    -[ADDeviceAuthenticationSessionV0 invalidate](self, "invalidate");
  }
  id v8 = v6;
  sub_1000075E0((uint64_t)[v8 bytes], (int)objc_msgSend(v8, "length"));
  int v10 = (os_log_s *)AFSiriLogContextSession;
  if (v9)
  {
    int v11 = v9;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADDeviceAuthenticationSessionV0 handshakeRequestWithCertificateData:error:]";
      __int16 v24 = 1026;
      LODWORD(v25) = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Error during NACInit %{public}d",  buf,  0x12u);
    }

    -[ADDeviceAuthenticationSessionV0 invalidate](self, "invalidate");
    if (a4)
    {
      BOOL v12 = (v11 & 0xFFFFFFEE) == 0xFFFF540A || v11 == -44204;
      v13 = @"com.apple.assistant.deviceAuth.session.GenericError";
      if (v12) {
        v13 = @"com.apple.assistant.deviceAuth.session.badCertificateError";
      }
      v14 = v13;
      id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  v11,  &off_100513A48));

      v16 = 0LL;
      *a4 = v15;
    }

    else
    {
      v16 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      nacContext = self->_nacContext;
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADDeviceAuthenticationSessionV0 handshakeRequestWithCertificateData:error:]";
      __int16 v24 = 2048;
      v25 = nacContext;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Got context %p from NACInit", buf, 0x16u);
    }

    self->_sessionState = 1LL;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", 0LL, 0LL));
    int v18 = sub_100008CF8(0LL);
    if (v18)
    {
      int v19 = v18;
      v20 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[ADDeviceAuthenticationSessionV0 handshakeRequestWithCertificateData:error:]";
        __int16 v24 = 1026;
        LODWORD(v25) = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Disposing request data failed %{public}d",  buf,  0x12u);
      }
    }
  }

  return v16;
}

- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    int v19 = "-[ADDeviceAuthenticationSessionV0 completeWithHandshakeResponse:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v18, 0xCu);
  }

  unint64_t sessionState = self->_sessionState;
  if (sessionState != 1)
  {
    if (a4)
    {
      v14 = @"com.apple.assistant.deviceAuth.session.StateError";
      id v15 = 0LL;
      goto LABEL_11;
    }

- (id)signData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADDeviceAuthenticationSessionV0 signData:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t sessionState = self->_sessionState;
  if (sessionState != 2)
  {
    if (a4)
    {
      v14 = @"com.apple.assistant.deviceAuth.session.StateError";
      id v15 = 0LL;
      goto LABEL_11;
    }

- (unint64_t)sessionState
{
  return self->_sessionState;
}

@end
@interface ADDeviceAuthenticationSessionV1
- (ADDeviceAuthenticationSessionV1)init;
- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4;
- (id)_exchangeData:(id)a3 error:(id *)a4;
- (id)handshakeRequestWithCertificateData:(id)a3 error:(id *)a4;
- (id)signData:(id)a3 error:(id *)a4;
- (unint64_t)sessionState;
- (unint64_t)strategyVersion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ADDeviceAuthenticationSessionV1

- (ADDeviceAuthenticationSessionV1)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADDeviceAuthenticationSessionV1;
  v2 = -[ADDeviceAuthenticationSessionV1 init](&v10, "init");
  if (v2)
  {
    sub_100038E18(0LL, 0LL, (uint64_t)&v2->_hardwareInfo);
    if (v3)
    {
      int v4 = v3;
      v5 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[ADDeviceAuthenticationSessionV1 init]";
        __int16 v13 = 1026;
        int v14 = v4;
        v6 = "%s Could not initialize hardware info: %{public}d";
LABEL_10:
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
        goto LABEL_7;
      }

      goto LABEL_7;
    }

    sub_10001A034((uint64_t)&v2->_fairplayContext, (uint64_t)&v2->_hardwareInfo);
    if (v7)
    {
      int v8 = v7;
      v5 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[ADDeviceAuthenticationSessionV1 init]";
        __int16 v13 = 1026;
        int v14 = v8;
        v6 = "%s Could not create SAP session: %{public}d";
        goto LABEL_10;
      }

- (void)invalidate
{
  int v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[ADDeviceAuthenticationSessionV1 invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  self->_sessionState = 0LL;
  fairplayContext = self->_fairplayContext;
  if (fairplayContext)
  {
    sub_100015150((uint64_t)fairplayContext);
    self->_fairplayContext = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADDeviceAuthenticationSessionV1;
  -[ADDeviceAuthenticationSessionV1 dealloc](&v3, "dealloc");
}

- (unint64_t)strategyVersion
{
  return 1LL;
}

- (id)handshakeRequestWithCertificateData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[ADDeviceAuthenticationSessionV1 handshakeRequestWithCertificateData:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceAuthenticationSessionV1 _exchangeData:error:](self, "_exchangeData:error:", v6, a4));

  return v8;
}

- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "-[ADDeviceAuthenticationSessionV1 completeWithHandshakeResponse:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceAuthenticationSessionV1 _exchangeData:error:](self, "_exchangeData:error:", v6, a4));
  BOOL v9 = v8 != 0LL;

  return v9;
}

- (id)_exchangeData:(id)a3 error:(id *)a4
{
  fairplayContext = self->_fairplayContext;
  if (fairplayContext)
  {
    uint64_t v24 = 0LL;
    unsigned int v23 = 0;
    char v22 = -1;
    p_hardwareInfo = &self->_hardwareInfo;
    id v8 = a3;
    id v9 = [v8 bytes];
    id v10 = [v8 length];

    sub_100041920( 200LL,  (uint64_t)p_hardwareInfo,  (uint64_t)fairplayContext,  (uint64_t)v9,  (uint64_t)v10,  (uint64_t)&v24,  (uint64_t)&v23,  (uint64_t)&v22);
    if (v11)
    {
      signed int v12 = v11;
      __int16 v13 = (os_log_s *)AFSiriLogContextSession;
      uint64_t v14 = v11;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[ADDeviceAuthenticationSessionV1 _exchangeData:error:]";
        __int16 v27 = 2050;
        uint64_t v28 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s SAP exchange failed: %{public}li",  buf,  0x16u);
      }

      -[ADDeviceAuthenticationSessionV1 invalidate](self, "invalidate");
      if ((vaddvq_s32((int32x4_t)vandq_s8( (int8x16_t)vceqq_s32(vdupq_n_s32(v12), (int32x4_t)xmmword_1003CA2A0),  (int8x16_t)xmmword_1003CA2B0)) & 0xF) != 0) {
        v15 = @"com.apple.assistant.deviceAuth.session.badCertificateError";
      }
      else {
        v15 = @"com.apple.assistant.deviceAuth.session.GenericError";
      }
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  v14,  &off_1005138B8));
      v18 = v17;
      if (a4) {
        *a4 = v17;
      }

      goto LABEL_12;
    }

    unint64_t v20 = v22;
    if ((_DWORD)v20 != 1)
    {
      if (v22)
      {
LABEL_17:
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v24, v23));
        sub_100026C3C(v24);
        v18 = 0LL;
        goto LABEL_18;
      }

      unint64_t v20 = 2LL;
    }

    self->_sessionState = v20;
    goto LABEL_17;
  }

  v18 = 0LL;
LABEL_12:
  v19 = 0LL;
LABEL_18:

  return v19;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ADDeviceAuthenticationSessionV1 signData:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (self->_fairplayContext)
  {
    *(void *)buf = 0LL;
    unsigned int v16 = 0;
    id v8 = objc_alloc_init(&OBJC_CLASS___NSData);
    fairplayContext = self->_fairplayContext;
    id v10 = v8;
    sub_1000270C4( (uint64_t)fairplayContext,  (uint64_t)-[NSData bytes](v10, "bytes"),  -[NSData length](v10, "length"),  (uint64_t)buf,  (uint64_t)&v16);
    if (v11)
    {
      signed int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.assistant.deviceAuth.session.GenericError",  v11,  &off_1005138E0));
      id v13 = v12;
      if (a4)
      {
        id v13 = v12;
        uint64_t v14 = 0LL;
        *a4 = v13;
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }

    else
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  *(void *)buf,  v16));
      sub_100026C3C(*(uint64_t *)buf);
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  return v14;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

@end
@interface GKFairPlaySAPSession
- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3;
- (BOOL)isComplete;
- (GKFairPlaySAPSession)init;
- (NSString)SAPVersion;
- (id)exchangeData:(id)a3 error:(id *)a4;
- (id)processSignedData:(id)a3 withSignature:(id)a4 error:(id *)a5;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (id)signatureStringForData:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)setSAPVersion:(id)a3;
@end

@implementation GKFairPlaySAPSession

- (GKFairPlaySAPSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKFairPlaySAPSession;
  v2 = -[GKFairPlaySAPSession init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    if (!-[GKFairPlaySAPSession _getHardwareInfo:](v2, "_getHardwareInfo:", &v2->_hardwareInfo))
    {
LABEL_8:

      return 0LL;
    }

    sub_1001A3D04((uint64_t)&v3->_session, (uint64_t)&v3->_hardwareInfo);
    if ((_DWORD)v4)
    {
      int v5 = v4;
      if (!os_log_GKGeneral) {
        GKOSLoggers(v4);
      }
      v6 = (os_log_s *)os_log_GKHTTP;
      if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v10 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "MESCAL:Could not create SAP session: %d",  buf,  8u);
      }

      goto LABEL_8;
    }
  }

  return v3;
}

- (void)dealloc
{
  session = self->_session;
  if (session) {
    sub_100195338((uint64_t)session);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKFairPlaySAPSession;
  -[GKFairPlaySAPSession dealloc](&v4, "dealloc");
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  session = self->_session;
  if (!session)
  {
    int v10 = 0LL;
    goto LABEL_11;
  }

  v15 = 0LL;
  unsigned int v14 = 0;
  char v13 = -1;
  sub_1001C8FA8( 200,  (uint64_t)&self->_hardwareInfo,  (uint64_t)session,  (uint64_t)[a3 bytes],  (uint64_t)objc_msgSend(a3, "length"),  (uint64_t)&v15,  (uint64_t)&v14,  (uint64_t)&v13);
  if ((_DWORD)v7)
  {
    int v8 = v7;
    if (!os_log_GKGeneral) {
      GKOSLoggers(v7);
    }
    v9 = (os_log_s *)os_log_GKHTTP;
    if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MESCAL:Could not SAP exchange: %li", buf, 0xCu);
    }

    int v10 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"GKFairPlay",  v8,  0LL);
LABEL_11:
    CFDataRef v11 = 0LL;
    if (!a4) {
      return v11;
    }
    goto LABEL_12;
  }

  CFDataRef v11 = sub_1000F5750(v15, v14);
  int v10 = 0LL;
  self->_complete = v13 == 0;
  if (!a4) {
    return v11;
  }
LABEL_12:
  if (!v11) {
    *a4 = v10;
  }
  return v11;
}

- (id)processSignedData:(id)a3 withSignature:(id)a4 error:(id *)a5
{
  if (self->_session)
  {
    id v8 = [a3 mutableCopy];
    [a4 bytes];
    [a4 length];
    [v8 mutableBytes];
    [v8 length];
    sub_1001BFB88();
    int v10 = v9;
    if (!os_log_GKGeneral) {
      GKOSLoggers(v9);
    }
    CFDataRef v11 = (os_log_s *)os_log_GKHTTP;
    if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class(self, v12);
      __int16 v21 = 2048;
      v22 = (NSError *)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "SIGNATURE VERIF1:%@: processed signature of SAP response: %li",  (uint8_t *)&v19,  0x16u);
    }

    if (!v10)
    {
      unsigned int v14 = 0LL;
      if (!a5) {
        return v8;
      }
      goto LABEL_16;
    }

    char v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"GKFairPlay",  v10,  0LL);
    unsigned int v14 = v13;
    if (!os_log_GKGeneral) {
      GKOSLoggers(v13);
    }
    v15 = (os_log_s *)os_log_GKHTTP;
    if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_opt_class(self, v16);
      int v19 = 138412546;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "SIGNATURE VERIF2:%@: Could not process SAP response: %@",  (uint8_t *)&v19,  0x16u);
    }
  }

  else
  {
    unsigned int v14 = 0LL;
  }

  id v8 = 0LL;
  if (!a5) {
    return v8;
  }
LABEL_16:
  if (!v8) {
    *a5 = v14;
  }
  return v8;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  session = self->_session;
  if (!session)
  {
    uint64_t v9 = 0LL;
    goto LABEL_11;
  }

  char v13 = 0LL;
  unsigned int v12 = 0;
  sub_1001A4C10( (uint64_t)session,  (uint64_t)[a3 bytes],  (uint64_t)objc_msgSend(a3, "length"),  (uint64_t)&v13,  (uint64_t)&v12);
  if ((_DWORD)v6)
  {
    int v7 = v6;
    if (!os_log_GKGeneral) {
      GKOSLoggers(v6);
    }
    id v8 = (os_log_s *)os_log_GKHTTP;
    if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Could not SAP sign: %li", buf, 0xCu);
    }

    uint64_t v9 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"GKFairPlay",  v7,  0LL);
LABEL_11:
    CFDataRef v10 = 0LL;
    if (!a4) {
      return v10;
    }
    goto LABEL_12;
  }

  CFDataRef v10 = sub_1000F5750(v13, v12);
  uint64_t v9 = 0LL;
  if (!a4) {
    return v10;
  }
LABEL_12:
  if (!v10) {
    *a4 = v9;
  }
  return v10;
}

- (id)signatureStringForData:(id)a3 error:(id *)a4
{
  int v7 = 0LL;
  id v5 = -[GKFairPlaySAPSession signatureForData:error:](self, "signatureForData:error:", a3, &v7);
  id result = [v5 length];
  if (result) {
    id result = [v5 base64EncodedStringWithOptions:0];
  }
  if (a4)
  {
    if (!result) {
      *a4 = v7;
    }
  }

  return result;
}

- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3
{
  int v4 = v3;
  if ((_DWORD)v3)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers(v3);
    }
    id v5 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000F5C2C(v5);
    }
  }

  return v4 == 0;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (NSString)SAPVersion
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSAPVersion:(id)a3
{
}

@end
@interface IDSValidationSession
+ (BOOL)_isAbsintheV3EnabledByServerBag;
+ (BOOL)_isBAAOptionEnabledByServerBag;
+ (BOOL)isSigningSupported;
+ (id)_BAACertTTLInMinutesFromServerBag;
+ (id)_BAAFetchTimeoutFromServerBag;
+ (id)retrieveLocalUDID;
+ (void)absintheValidationSessionOnQueue:(id)a3 withCompletion:(id)a4;
+ (void)baaOnlyValidationSessionOnQueue:(id)a3 withCompletion:(id)a4;
+ (void)validationSessionOnQueue:(id)a3 mechanism:(int64_t)a4 withCompletion:(id)a5;
- (BOOL)_shouldUseAbsintheV3;
- (BOOL)_shouldUseAbsintheV4;
- (BOOL)_shouldUseBAACertOption;
- (BOOL)_shouldUseDebugPiscoLogging;
- (BOOL)_shouldUsePSCBAA;
- (BOOL)isInitializedForSigning;
- (BOOL)isUsingAbsintheV3;
- (BOOL)isUsingAbsintheV4;
- (BOOL)isUsingBAA;
- (IDSBAASigner)baaSigner;
- (IDSValidationSession)initWithQueue:(id)a3 mechanism:(int64_t)a4;
- (NSData)BAACert;
- (NSData)helloMessage;
- (NSData)intermediateRootCert;
- (NSError)lastBAAError;
- (NSString)IMEI;
- (NSString)MEID;
- (NSString)UDID;
- (NSString)serialNumber;
- (OS_dispatch_queue)BAAQueue;
- (OS_dispatch_queue)queue;
- (PSCSessionInternal_)pscSession;
- (__SecKey)BIKKeyRef;
- (id)_deviceAbsintheIMEI;
- (id)_deviceAbsintheMEID;
- (id)_deviceAbsintheSerialNumber;
- (id)_deviceAbsintheUDID;
- (id)activateWithValidationData:(id)a3 serverKey:(id)a4;
- (id)description;
- (int64_t)mechanism;
- (int64_t)stateFlags;
- (void)_fetchDeviceIdentityIfNeededWithCompletion:(id)a3;
- (void)dealloc;
- (void)headersBySigningData:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)purgeCachedCertsForSubsystemMechanism:(int64_t)a3;
- (void)setBAACert:(id)a3;
- (void)setBAAQueue:(id)a3;
- (void)setBIKKeyRef:(__SecKey *)a3;
- (void)setHelloMessage:(id)a3;
- (void)setIMEI:(id)a3;
- (void)setIntermediateRootCert:(id)a3;
- (void)setLastBAAError:(id)a3;
- (void)setMEID:(id)a3;
- (void)setPscSession:(PSCSessionInternal_ *)a3;
- (void)setQueue:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStateFlags:(int64_t)a3;
- (void)setUDID:(id)a3;
- (void)signData:(id)a3 completion:(id)a4;
@end

@implementation IDSValidationSession

- (IDSValidationSession)initWithQueue:(id)a3 mechanism:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSValidationSession;
  v8 = -[IDSValidationSession init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_stateFlags = 0LL;
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_mechanism = a4;
    v10 = -[IDSBAASigner initWithQueue:](objc_alloc(&OBJC_CLASS___IDSBAASigner), "initWithQueue:", v7);
    baaSigner = v9->_baaSigner;
    v9->_baaSigner = v10;
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  unsigned int v4 = -[IDSValidationSession isInitializedForSigning](self, "isInitializedForSigning");
  v5 = @"NO";
  if (v4) {
    v5 = @"YES";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p isInitializedForSigning: %@>",  v3,  self,  v5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSValidationSession;
  -[IDSValidationSession dealloc](&v3, "dealloc");
}

+ (void)validationSessionOnQueue:(id)a3 mechanism:(int64_t)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    [a1 baaOnlyValidationSessionOnQueue:v9 withCompletion:v8];
  }

  else if (!a4)
  {
    [a1 absintheValidationSessionOnQueue:v9 withCompletion:v8];
  }
}

+ (void)baaOnlyValidationSessionOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[IDSValidationSession initWithQueue:mechanism:]( objc_alloc(&OBJC_CLASS___IDSValidationSession),  "initWithQueue:mechanism:",  v6,  1LL);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession baaSigner](v7, "baaSigner"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013627C;
  v11[3] = &unk_1008FB618;
  v12 = v7;
  id v13 = v5;
  id v9 = v5;
  v10 = v7;
  [v8 fetchBAAIdentityIfNeededWithCompletion:v11];
}

+ (void)absintheValidationSessionOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, IDSValidationSession *, void *))a4;
  id v7 = -[IDSValidationSession initWithQueue:mechanism:]( objc_alloc(&OBJC_CLASS___IDSValidationSession),  "initWithQueue:mechanism:",  v5,  0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession queue](v7, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Initializing validation session { self: %@ }",  (uint8_t *)&buf,  0xCu);
  }

  -[IDSValidationSession setHelloMessage:](v7, "setHelloMessage:", 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession _deviceAbsintheUDID](v7, "_deviceAbsintheUDID"));
  -[IDSValidationSession setUDID:](v7, "setUDID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession UDID](v7, "UDID"));
  LODWORD(v10) = v11 == 0LL;

  if ((_DWORD)v10)
  {
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10069D0C8(v16);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSValidationSessionErrorDomain",  -3000LL,  0LL));
    v6[2](v6, v7, v17);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession _deviceAbsintheSerialNumber](v7, "_deviceAbsintheSerialNumber"));
    -[IDSValidationSession setSerialNumber:](v7, "setSerialNumber:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession _deviceAbsintheIMEI](v7, "_deviceAbsintheIMEI"));
    -[IDSValidationSession setIMEI:](v7, "setIMEI:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession _deviceAbsintheMEID](v7, "_deviceAbsintheMEID"));
    -[IDSValidationSession setMEID:](v7, "setMEID:", v14);

    if (-[IDSValidationSession pscSession](v7, "pscSession"))
    {
      sub_100668A98((uint64_t)-[IDSValidationSession pscSession](v7, "pscSession"));
      -[IDSValidationSession setPscSession:](v7, "setPscSession:", 0LL);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x2020000000LL;
    int v24 = 0;
    if (-[IDSValidationSession _shouldUseAbsintheV3](v7, "_shouldUseAbsintheV3"))
    {
      *(_DWORD *)(*((void *)&buf + 1) + 24LL) = 1;
      -[IDSValidationSession setStateFlags:]( v7,  "setStateFlags:",  (unint64_t)-[IDSValidationSession stateFlags](v7, "stateFlags") | 4);
      if (-[IDSValidationSession _shouldUseAbsintheV4](v7, "_shouldUseAbsintheV4"))
      {
        *(_DWORD *)(*((void *)&buf + 1) + 24LL) |= 2u;
        -[IDSValidationSession setStateFlags:]( v7,  "setStateFlags:",  (unint64_t)-[IDSValidationSession stateFlags](v7, "stateFlags") | 8);
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession baaSigner](v7, "baaSigner"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10013674C;
    v18[3] = &unk_1008FB640;
    p___int128 buf = &buf;
    v19 = v7;
    v20 = v6;
    [v15 fetchBAAIdentityIfNeededWithCompletion:v18];

    _Block_object_dispose(&buf, 8);
  }
}

- (void)purgeCachedCertsForSubsystemMechanism:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSValidationSession baaSigner](self, "baaSigner"));
    [v3 purgeBAACertForTopic:0];
  }

- (id)activateWithValidationData:(id)a3 serverKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"YES";
    if (v6) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    *(_DWORD *)__int128 buf = 138412802;
    *(void *)&buf[4] = self;
    v38 = v10;
    __int16 v37 = 2112;
    if (!v7) {
      id v9 = @"NO";
    }
    __int16 v39 = 2112;
    v40 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Activating validation session { self: %@, validationData: %@, serverKey: %@ }",  buf,  0x20u);
  }

  if (-[IDSValidationSession _shouldUseDebugPiscoLogging](self, "_shouldUseDebugPiscoLogging"))
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sysdiagnose_oversized](&OBJC_CLASS___IMRGLog, "sysdiagnose_oversized"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Pisco] {validationData: %@}", buf, 0xCu);
    }

    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sysdiagnose_oversized](&OBJC_CLASS___IMRGLog, "sysdiagnose_oversized"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Pisco] {serverKey: %@}", buf, 0xCu);
    }
  }

  id v13 = 0LL;
  if (v6 && v7)
  {
    if (!-[IDSValidationSession pscSession](self, "pscSession")
      || -[IDSValidationSession _shouldUsePSCBAA](self, "_shouldUsePSCBAA"))
    {
LABEL_18:
      id v13 = 0LL;
      goto LABEL_25;
    }

    v14 = -[IDSValidationSession pscSession](self, "pscSession");
    id v15 = v6;
    id v16 = [v15 bytes];
    LODWORD(v15) = [v15 length];
    id v17 = v7;
    LODWORD(v15) = sub_1005E43F4( (uint64_t)v14,  (uint64_t)v16,  (int)v15,  (uint64_t)[v17 bytes],  (int)objc_msgSend(v17, "length"));
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    v19 = v18;
    if ((_DWORD)v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_10069D164();
      }

      if (-[IDSValidationSession pscSession](self, "pscSession"))
      {
        sub_100668A98((uint64_t)-[IDSValidationSession pscSession](self, "pscSession"));
        -[IDSValidationSession setPscSession:](self, "setPscSession:", 0LL);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSValidationSessionErrorDomain",  -4000LL,  0LL));
    }

    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Successfully activated validation session",  buf,  2u);
      }

      -[IDSValidationSession setStateFlags:]( self,  "setStateFlags:",  (unint64_t)-[IDSValidationSession stateFlags](self, "stateFlags") | 1);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession BAACert](self, "BAACert"));
      if (v13)
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue(-[IDSValidationSession intermediateRootCert](self, "intermediateRootCert"));
        if (v21)
        {
          v22 = (void *)v21;
          uint64_t v23 = -[IDSValidationSession BIKKeyRef](self, "BIKKeyRef");

          if (v23)
          {
            int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Adding option to validation session",  buf,  2u);
            }

            *(void *)__int128 buf = -[IDSValidationSession pscSession](self, "pscSession");
            v34 = -[IDSValidationSession BIKKeyRef](self, "BIKKeyRef");
            id v25 = objc_claimAutoreleasedReturnValue(-[IDSValidationSession BAACert](self, "BAACert"));
            id v33 = [v25 bytes];
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession BAACert](self, "BAACert"));
            int v27 = [v26 length];
            id v28 = objc_claimAutoreleasedReturnValue( -[IDSValidationSession intermediateRootCert]( self, "intermediateRootCert"));
            id v29 = [v28 bytes];
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession intermediateRootCert](self, "intermediateRootCert"));
            LODWORD(v29) = sub_1005E4334( (uint64_t)buf,  (uint64_t)v34,  (uint64_t)v33,  v27,  (uint64_t)v29,  (int)[v30 length]);

            if ((_DWORD)v29 || !*(void *)buf)
            {
              v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
                sub_10069D104();
              }
            }

            else
            {
              v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v35 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Successfully added option to validation session",  v35,  2u);
              }

              -[IDSValidationSession setPscSession:](self, "setPscSession:", *(void *)buf);
              -[IDSValidationSession setStateFlags:]( self,  "setStateFlags:",  (unint64_t)-[IDSValidationSession stateFlags](self, "stateFlags") | 0x10);
            }
          }
        }

        else
        {
        }

        goto LABEL_18;
      }
    }
  }

- (void)signData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    v40 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Signing data using validation session { self: %@ }",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 sha256Digest]);
  int64_t v10 = -[IDSValidationSession mechanism](self, "mechanism");
  if (v10 == 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession baaSigner](self, "baaSigner"));
    v20 = -[IDSValidationSession BIKKeyRef](self, "BIKKeyRef");
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100137A50;
    v28[3] = &unk_1008FB690;
    id v29 = v7;
    [v19 signData:v6 withKey:v20 completion:v28];

    id v17 = v29;
    goto LABEL_14;
  }

  if (!v10)
  {
    if (-[IDSValidationSession pscSession](self, "pscSession"))
    {
      uint64_t v38 = 0LL;
      unsigned int v37 = 0;
      uint64_t v36 = 0LL;
      unsigned int v35 = 0;
      v11 = -[IDSValidationSession pscSession](self, "pscSession");
      v12 = v9;
      if (sub_100668B4C( (uint64_t)v11,  (uint64_t)-[IDSValidationSession bytes](v12, "bytes"),  (int)-[IDSValidationSession length](v12, "length"),  (uint64_t)&v38,  (uint64_t)&v37,  (uint64_t)&v36,  (uint64_t)&v35))
      {
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_10069D1C4();
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSValidationSessionErrorDomain",  -5000LL,  0LL));
        id v15 = 0LL;
        id v16 = 0LL;
      }

      else
      {
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Successfully signed data in validation session",  buf,  2u);
        }

        id v15 = (IDSValidationSession *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v38,  v37));
        id v16 = (IDSValidationSession *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v36,  v35));
        if (-[IDSValidationSession _shouldUseDebugPiscoLogging](self, "_shouldUseDebugPiscoLogging"))
        {
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sysdiagnose_oversized](&OBJC_CLASS___IMRGLog, "sysdiagnose_oversized"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            v40 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[Pisco] {dataToSign: %@}", buf, 0xCu);
          }

          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sysdiagnose_oversized](&OBJC_CLASS___IMRGLog, "sysdiagnose_oversized"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            v40 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[Pisco] {absintheSignature: %@}",  buf,  0xCu);
          }

          int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sysdiagnose_oversized](&OBJC_CLASS___IMRGLog, "sysdiagnose_oversized"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            v40 = v16;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Pisco] {outServKey: %@}", buf, 0xCu);
          }
        }

        v14 = 0LL;
      }

      if (v38)
      {
        sub_100558064(v38);
        uint64_t v38 = 0LL;
      }

      if (v36)
      {
        sub_100558064(v36);
        uint64_t v36 = 0LL;
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession baaSigner](self, "baaSigner"));
      v26 = -[IDSValidationSession BIKKeyRef](self, "BIKKeyRef");
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1001379DC;
      v30[3] = &unk_1008FB668;
      v31 = v15;
      v32 = v16;
      id v33 = v14;
      id v34 = v7;
      id v17 = v14;
      int v27 = v16;
      v18 = v15;
      [v25 signData:v6 withKey:v26 completion:v30];

      goto LABEL_13;
    }

- (void)headersBySigningData:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100137B6C;
  v7[3] = &unk_1008FB6B8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[IDSValidationSession signData:completion:](v8, "signData:completion:", v6, v7);
}

- (void)invalidate
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Invalidating validation session { self: %@ }",  (uint8_t *)&v4,  0xCu);
  }

  -[IDSValidationSession setStateFlags:](self, "setStateFlags:", 0LL);
  -[IDSValidationSession setHelloMessage:](self, "setHelloMessage:", 0LL);
  -[IDSValidationSession setUDID:](self, "setUDID:", 0LL);
  -[IDSValidationSession setSerialNumber:](self, "setSerialNumber:", 0LL);
  -[IDSValidationSession setIMEI:](self, "setIMEI:", 0LL);
  -[IDSValidationSession setMEID:](self, "setMEID:", 0LL);
  -[IDSValidationSession setBAACert:](self, "setBAACert:", 0LL);
  -[IDSValidationSession setIntermediateRootCert:](self, "setIntermediateRootCert:", 0LL);
  if (-[IDSValidationSession pscSession](self, "pscSession"))
  {
    sub_100668A98((uint64_t)-[IDSValidationSession pscSession](self, "pscSession"));
    -[IDSValidationSession setPscSession:](self, "setPscSession:", 0LL);
  }

  if (-[IDSValidationSession BIKKeyRef](self, "BIKKeyRef"))
  {
    CFRelease(-[IDSValidationSession BIKKeyRef](self, "BIKKeyRef"));
    -[IDSValidationSession setBIKKeyRef:](self, "setBIKKeyRef:", 0LL);
  }

- (BOOL)isInitializedForSigning
{
  return -[IDSValidationSession stateFlags](self, "stateFlags") & 1;
}

- (BOOL)isUsingAbsintheV3
{
  return ((unint64_t)-[IDSValidationSession stateFlags](self, "stateFlags") >> 2) & 1;
}

- (BOOL)isUsingAbsintheV4
{
  return ((unint64_t)-[IDSValidationSession stateFlags](self, "stateFlags") >> 3) & 1;
}

- (BOOL)isUsingBAA
{
  return ((unint64_t)-[IDSValidationSession stateFlags](self, "stateFlags") >> 4) & 1;
}

+ (BOOL)isSigningSupported
{
  if ([a1 _isAbsintheV3EnabledByServerBag])
  {
    if (+[IMUserDefaults isPiscoDisabled](&OBJC_CLASS___IMUserDefaults, "isPiscoDisabled"))
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
      unsigned int v3 = [v2 isInternalInstall] ^ 1;
    }

    else
    {
      LOBYTE(v3) = 1;
    }
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

+ (BOOL)_isAbsintheV3EnabledByServerBag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"absinthe-v3-enabled"]);
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (BOOL)_isBAAOptionEnabledByServerBag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"absinthe-baa-option-enabled-ios13"]);
  if ((v4
     || (int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"absinthe-baa-option-enabled"])) != 0)
    && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    unsigned __int8 v6 = [v4 BOOLValue];
  }

  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (id)_BAAFetchTimeoutFromServerBag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"absinthe-baa-timeout"]);
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)_BAACertTTLInMinutesFromServerBag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"absinthe-baa-cert-ttl-minutes"]);
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)_shouldUseAbsintheV3
{
  return 1;
}

- (BOOL)_shouldUseAbsintheV4
{
  if (!-[IDSValidationSession _shouldUseAbsintheV3](self, "_shouldUseAbsintheV3")
    || !+[IMUserDefaults isAbsintheV4Enabled](&OBJC_CLASS___IMUserDefaults, "isAbsintheV4Enabled"))
  {
    return 0;
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 isInternalInstall];

  return v3;
}

- (BOOL)_shouldUsePSCBAA
{
  return 0;
}

- (BOOL)_shouldUseBAACertOption
{
  if (objc_msgSend((id)objc_opt_class(self, a2), "_isBAAOptionEnabledByServerBag"))
  {
    if (+[IMUserDefaults isBAACertDisabled](&OBJC_CLASS___IMUserDefaults, "isBAACertDisabled"))
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
      unsigned int v3 = [v2 isInternalInstall] ^ 1;
    }

    else
    {
      LOBYTE(v3) = 1;
    }
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)_shouldUseDebugPiscoLogging
{
  BOOL v2 = +[IMUserDefaults isDebugPiscoLoggingEnabled](&OBJC_CLASS___IMUserDefaults, "isDebugPiscoLoggingEnabled");
  if (v2)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned __int8 v4 = [v3 isInternalInstall];

    LOBYTE(v2) = v4;
  }

  return v2;
}

- (void)_fetchDeviceIdentityIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (-[IDSValidationSession _shouldUseBAACertOption](self, "_shouldUseBAACertOption"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationSession BAAQueue](self, "BAAQueue"));

    if (!v6)
    {
      dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.IDS.IDSValidationSession.BAA", v9);
      -[IDSValidationSession setBAAQueue:](self, "setBAAQueue:", v10);
    }

    v47[0] = 0LL;
    v47[1] = v47;
    v47[2] = 0x2020000000LL;
    v47[3] = 0LL;
    v45[0] = 0LL;
    v45[1] = v45;
    v45[2] = 0x3032000000LL;
    v45[3] = sub_100138AD8;
    v45[4] = sub_100138AE8;
    id v46 = 0LL;
    v43[0] = 0LL;
    v43[1] = v43;
    v43[2] = 0x3032000000LL;
    v43[3] = sub_100138AD8;
    v43[4] = sub_100138AE8;
    id v44 = 0LL;
    id v11 = objc_msgSend((id)objc_opt_class(self, v7), "_BAACertTTLInMinutesFromServerBag");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)v12;
    v14 = &off_1009489B8;
    if (v12) {
      v14 = (_UNKNOWN **)v12;
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100138AF0;
    v37[3] = &unk_1008FB730;
    id v15 = v14;
    id v38 = v15;
    __int16 v39 = self;
    v40 = v47;
    v41 = v45;
    v42 = v43;
    id v16 = objc_retainBlock(v37);
    id v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    v30 = sub_100138EF8;
    v31 = &unk_1008FB7A8;
    v32 = self;
    id v34 = v47;
    unsigned int v35 = v45;
    uint64_t v36 = v43;
    id v33 = v4;
    id v17 = objc_retainBlock(&v28);
    v19 = (void *)objc_opt_class(self, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_BAAFetchTimeoutFromServerBag", v28, v29, v30, v31, v32));
    uint64_t v21 = v20;
    if (v20)
    {
      [v20 doubleValue];
      double v23 = v22;
    }

    else
    {
      double v23 = 60.0;
    }

    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      double v51 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Starting device identity fetch task with timeout {timeoutInSeconds: %f}",  buf,  0xCu);
    }

    dispatch_time_t v27 = dispatch_time(0LL, (uint64_t)(v23 * 1000000000.0));
    im_dispatch_async_with_timeout(v27, v16, v17, &stru_1008FB7C8);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);

    _Block_object_dispose(v47, 8);
  }

  else if (v4)
  {
    NSErrorUserInfoKey v48 = NSDebugDescriptionErrorKey;
    v49 = @"Device identity fetch disabled";
    int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSValidationSessionInternalErrorDomain",  -12000LL,  v24));

    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0LL, 0LL, v25);
  }
}

+ (id)retrieveLocalUDID
{
  return (id)MGCopyAnswer(@"UniqueDeviceID", 0LL);
}

- (id)_deviceAbsintheUDID
{
  return +[IDSValidationSession retrieveLocalUDID](&OBJC_CLASS___IDSValidationSession, "retrieveLocalUDID");
}

- (id)_deviceAbsintheSerialNumber
{
  return (id)MGCopyAnswer(@"SerialNumber", 0LL);
}

- (id)_deviceAbsintheIMEI
{
  return (id)MGCopyAnswer(@"InternationalMobileEquipmentIdentity", 0LL);
}

- (id)_deviceAbsintheMEID
{
  return (id)MGCopyAnswer(@"MobileEquipmentIdentifier", 0LL);
}

- (NSData)helloMessage
{
  return self->_helloMessage;
}

- (void)setHelloMessage:(id)a3
{
}

- (NSString)UDID
{
  return self->_UDID;
}

- (void)setUDID:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (void)setIMEI:(id)a3
{
}

- (NSString)MEID
{
  return self->_MEID;
}

- (void)setMEID:(id)a3
{
}

- (PSCSessionInternal_)pscSession
{
  return self->_pscSession;
}

- (void)setPscSession:(PSCSessionInternal_ *)a3
{
  self->_pscSession = a3;
}

- (__SecKey)BIKKeyRef
{
  return self->_BIKKeyRef;
}

- (void)setBIKKeyRef:(__SecKey *)a3
{
  self->_BIKKeyRef = a3;
}

- (OS_dispatch_queue)BAAQueue
{
  return self->_BAAQueue;
}

- (void)setBAAQueue:(id)a3
{
}

- (NSError)lastBAAError
{
  return self->_lastBAAError;
}

- (void)setLastBAAError:(id)a3
{
}

- (IDSBAASigner)baaSigner
{
  return self->_baaSigner;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(int64_t)a3
{
  self->_stateFlags = a3;
}

- (NSData)BAACert
{
  return self->_BAACert;
}

- (void)setBAACert:(id)a3
{
}

- (NSData)intermediateRootCert
{
  return self->_intermediateRootCert;
}

- (void)setIntermediateRootCert:(id)a3
{
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (void).cxx_destruct
{
}

@end
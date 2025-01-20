@interface DCClientHandler
- (BOOL)_isSupported;
- (DCClientHandler)initWithConnection:(id)a3;
- (id)_generateAppIDFromCurrentConnection;
- (id)_stringValueForEntitlement:(id)a3;
- (void)appAttestationAssert:(id)a3 keyId:(id)a4 clientDataHash:(id)a5 completion:(id)a6;
- (void)appAttestationAttestKey:(id)a3 keyId:(id)a4 clientDataHash:(id)a5 completion:(id)a6;
- (void)appAttestationCreateKey:(id)a3 completion:(id)a4;
- (void)appAttestationIsSupportedWithCompletion:(id)a3;
- (void)baaSignatureForData:(id)a3 completion:(id)a4;
- (void)baaSignaturesForData:(id)a3 completion:(id)a4;
- (void)fetchOpaqueBlobWithCompletion:(id)a3;
- (void)isSupportedDeviceWithCompletion:(id)a3;
@end

@implementation DCClientHandler

- (DCClientHandler)initWithConnection:(id)a3
{
  id v5 = a3;
  v6 = -[DCClientHandler init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)fetchOpaqueBlobWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  id v5 = sub_1000043BC();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling device look up request",  (uint8_t *)v14,  2u);
  }

  if (-[DCClientHandler _isSupported](self, "_isSupported"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DCClientHandler _generateAppIDFromCurrentConnection](self, "_generateAppIDFromCurrentConnection"));
    if (v7)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___DCContext);
      [v8 setClientAppID:v7];
      id v9 = objc_alloc(&OBJC_CLASS___DCDDeviceMetadata);
      id v10 = objc_alloc_init(&OBJC_CLASS___DCCryptoProxyImpl);
      id v11 = [v9 initWithContext:v8 cryptoProxy:v10];

      [v11 generateEncryptedBlobWithCompletion:v4];
    }

    else
    {
      id v12 = sub_1000043BC();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100005B08();
      }

      id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError dc_errorWithCode:](&OBJC_CLASS___NSError, "dc_errorWithCode:", 0LL));
      v4[2](v4, 0LL, v8);
    }
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dc_errorWithCode:](&OBJC_CLASS___NSError, "dc_errorWithCode:", 1LL));
    v4[2](v4, 0LL, v7);
  }
}

- (void)baaSignaturesForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000043BC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100005B34();
  }

  if (-[DCClientHandler _isSupported](self, "_isSupported"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DCClientHandler _generateAppIDFromCurrentConnection](self, "_generateAppIDFromCurrentConnection"));
    if (v10)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___DCContext);
      [v11 setClientAppID:v10];
      id v12 = objc_alloc(&OBJC_CLASS___DCDDeviceMetadata);
      id v13 = objc_alloc_init(&OBJC_CLASS___DCCryptoProxyImpl);
      id v14 = [v12 initWithContext:v11 cryptoProxy:v13];

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100004E24;
      v17[3] = &unk_1000083B8;
      id v18 = v7;
      [v14 baaSignaturesForData:v6 completion:v17];
    }

    else
    {
      id v15 = sub_1000043BC();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100005B08();
      }

      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError dc_errorWithCode:](&OBJC_CLASS___NSError, "dc_errorWithCode:", 0LL));
      (*((void (**)(id, void, void, id))v7 + 2))(v7, 0LL, 0LL, v11);
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.devicecheck.error.baa",  -10000LL,  0LL));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v10);
  }
}

- (void)baaSignatureForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000043BC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100005B34();
  }

  if (-[DCClientHandler _isSupported](self, "_isSupported"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DCClientHandler _generateAppIDFromCurrentConnection](self, "_generateAppIDFromCurrentConnection"));
    if (v10)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___DCContext);
      [v11 setClientAppID:v10];
      id v12 = objc_alloc(&OBJC_CLASS___DCDDeviceMetadata);
      id v13 = objc_alloc_init(&OBJC_CLASS___DCCryptoProxyImpl);
      id v14 = [v12 initWithContext:v11 cryptoProxy:v13];

      [v14 baaSignatureForData:v6 completion:v7];
    }

    else
    {
      id v15 = sub_1000043BC();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100005B08();
      }

      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError dc_errorWithCode:](&OBJC_CLASS___NSError, "dc_errorWithCode:", 0LL));
      (*((void (**)(id, void, void, id))v7 + 2))(v7, 0LL, 0LL, v11);
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.devicecheck.error.baa",  -10000LL,  0LL));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v10);
  }
}

- (void)isSupportedDeviceWithCompletion:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))(v5, -[DCClientHandler _isSupported](self, "_isSupported"), 0LL);
}

- (BOOL)_isSupported
{
  char IsSupported = DeviceIdentityIsSupported(self, a2);
  id v3 = sub_1000043BC();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100005B60();
  }

  return IsSupported;
}

- (id)_generateAppIDFromCurrentConnection
{
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[DCClientHandler _stringValueForEntitlement:]( self,  "_stringValueForEntitlement:",  @"application-identifier"));
  if (!-[__CFString length](v3, "length"))
  {
    connection = self->_connection;
    if (connection) {
      -[NSXPCConnection auditToken](connection, "auditToken");
    }
    else {
      memset(&buf, 0, sizeof(buf));
    }
    audit_token_t token = buf;
    SecTaskRef v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    if (v5)
    {
      id v6 = v5;
      id v7 = (void *)SecTaskCopyTeamIdentifier(v5, 0LL);
      id v8 = (__CFString *)SecTaskCopySigningIdentifier(v6, 0LL);
      if (v7
        && [v7 length]
        && ([v7 isEqualToString:@"0000000000"] & 1) == 0)
      {
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v7,  v8));
      }

      else
      {
        id v9 = v8;
      }

      id v10 = v9;

      id v11 = sub_1000043BC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "  Using codesign identifier: %@",  (uint8_t *)&token,  0xCu);
      }

      CFRelease(v6);
      id v3 = v10;
    }
  }

  id v13 = sub_1000043BC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    buf.val[0] = 138412290;
    *(void *)&buf.val[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client App ID: %@", (uint8_t *)&buf, 0xCu);
  }

  if (-[__CFString length](v3, "length")) {
    id v15 = v3;
  }
  else {
    id v15 = 0LL;
  }

  return v15;
}

- (id)_stringValueForEntitlement:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (void)appAttestationCreateKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection auditToken](connection, "auditToken");
  }

  else
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
  }

  v9[0] = v10;
  v9[1] = v11;
  AppAttest_AppAttestation_CreateKey(v9, v6, v7);
}

- (void)appAttestationAttestKey:(id)a3 keyId:(id)a4 clientDataHash:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection auditToken](connection, "auditToken");
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
  }

  v15[0] = v16;
  v15[1] = v17;
  AppAttest_AppAttestation_AttestKey(v15, v10, v11, v12, v13);
}

- (void)appAttestationAssert:(id)a3 keyId:(id)a4 clientDataHash:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection auditToken](connection, "auditToken");
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
  }

  v15[0] = v16;
  v15[1] = v17;
  AppAttest_AppAttestation_Assert(v15, v10, v11, v12, v13);
}

- (void)appAttestationIsSupportedWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  connection = self->_connection;
  if (connection)
  {
    connection = (NSXPCConnection *)-[NSXPCConnection auditToken](connection, "auditToken");
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
  }

  int IsSupported = AppAttest_AppAttestation_IsSupported(connection);
  v15[0] = v16;
  v15[1] = v17;
  unsigned int IsEligibleApplication = AppAttest_AppAttestation_IsEligibleApplication(v15);
  id v8 = sub_10000442C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100005CC8();
  }
  uint64_t v10 = IsSupported & IsEligibleApplication;

  id v11 = sub_10000442C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100005C50();
  }

  id v13 = sub_10000442C();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100005BD8();
  }

  v4[2](v4, v10, 0LL);
}

- (void).cxx_destruct
{
}

@end
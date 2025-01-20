@interface AKClientAnisetteService
- (AKClientAnisetteService)initWithClient:(id)a3 context:(id)a4;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation AKClientAnisetteService

- (AKClientAnisetteService)initWithClient:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[AKClientAnisetteService init](self, "init");
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 proxyWithErrorHandler:&stru_1001CA288]);
    clientProxy = v8->_clientProxy;
    v8->_clientProxy = (AKAnisetteProvisioningClientProtocol *)v9;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = _AKLogSystem(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10013D358();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    -[AKAnisetteProvisioningClientProtocol fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:]( clientProxy,  "fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:",  self->_context,  v4,  v6);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7061LL));
    v6[2](v6, 0LL, v10);
  }
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013D3CC();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    -[AKAnisetteProvisioningClientProtocol syncAnisetteForContext:withSIMData:completion:]( clientProxy,  "syncAnisetteForContext:withSIMData:completion:",  self->_context,  v6,  v7);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7061LL));
    v7[2](v7, 0LL, v11);
  }
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013D440();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    -[AKAnisetteProvisioningClientProtocol eraseAnisetteForContext:withCompletion:]( clientProxy,  "eraseAnisetteForContext:withCompletion:",  self->_context,  v4);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7061LL));
    v4[2](v4, 0LL, v8);
  }
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013D4B4();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    -[AKAnisetteProvisioningClientProtocol provisionAnisetteForContext:withCompletion:]( clientProxy,  "provisionAnisetteForContext:withCompletion:",  self->_context,  v4);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7061LL));
    v4[2](v4, 0LL, v8);
  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013D528();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    -[AKAnisetteProvisioningClientProtocol legacyAnisetteDataForContext:DSID:withCompletion:]( clientProxy,  "legacyAnisetteDataForContext:DSID:withCompletion:",  self->_context,  v6,  v7);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7061LL));
    v7[2](v7, 0LL, v11);
  }
}

- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013D59C();
  }

  if (self->_clientProxy)
  {
    uint64_t v11 = _AKLogSystem(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      context = self->_context;
      int v15 = 138412802;
      v16 = self;
      __int16 v17 = 2112;
      v18 = context;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Calling client proxy to fetch peer attestation data for context (%@) with request (%@)",  (uint8_t *)&v15,  0x20u);
    }

    -[AKAnisetteProvisioningClientProtocol fetchPeerAttestationDataForContext:withRequest:completion:]( self->_clientProxy,  "fetchPeerAttestationDataForContext:withRequest:completion:",  self->_context,  v6,  v7);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7061LL));
    v7[2](v7, 0LL, v14);
  }
}

- (void).cxx_destruct
{
}

@end
@interface AKAuthorizationEndorserRapportClient
- (AKAuthorizationDaemonService)authorizationService;
- (AKAuthorizationEndorserRapportClient)initWithDeviceID:(id)a3;
- (AKAuthorizationEndorserRapportClientDelegate)delegate;
- (RPCompanionLinkClient)endorseeClient;
- (RPCompanionLinkDevice)endorseeDevice;
- (void)_deactivate;
- (void)_handleStartAuthorizationWithResponse:(id)a3;
- (void)_sendAuthorizationDidFinishRequestWithAuthorization:(id)a3;
- (void)_sendAuthorizationDidFinishRequestWithError:(id)a3;
- (void)_sendDidStartServerAuthorizationEvent;
- (void)_sendStartAuthorizationRequest;
- (void)authorizationDaemonServiceWillProcessUserResponse:(id)a3;
- (void)setAuthorizationService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndorseeClient:(id)a3;
- (void)setEndorseeDevice:(id)a3;
- (void)startAuthorization;
- (void)startAuthorizationWithCompanionLinkClient:(id)a3;
@end

@implementation AKAuthorizationEndorserRapportClient

- (AKAuthorizationEndorserRapportClient)initWithDeviceID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKAuthorizationEndorserRapportClient;
  v5 = -[AKAuthorizationEndorserRapportClient init](&v10, "init");
  if (v5)
  {
    v6 = (objc_class *)sub_1000641E8(0LL);
    if (v6) {
      v6 = (objc_class *)sub_10006440C();
    }
    id v7 = objc_alloc_init(v6);
    [v7 setIdentifier:v4];
    endorseeDevice = v5->_endorseeDevice;
    v5->_endorseeDevice = (RPCompanionLinkDevice *)v7;
  }

  return v5;
}

- (void)startAuthorization
{
  v3 = (objc_class *)sub_1000641E8(0LL);
  if (v3) {
    v3 = (objc_class *)sub_100064304();
  }
  id v4 = objc_alloc_init(v3);
  -[AKAuthorizationEndorserRapportClient startAuthorizationWithCompanionLinkClient:]( self,  "startAuthorizationWithCompanionLinkClient:",  v4);
}

- (void)startAuthorizationWithCompanionLinkClient:(id)a3
{
  id v5 = a3;
  endorseeClient = self->_endorseeClient;
  uint64_t v8 = _AKLogSiwa(v5, v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (endorseeClient)
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Authorization Endorser already in progress, ignoring startAuthorization.",  (uint8_t *)buf,  2u);
    }
  }

  else
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Authorization Endorser Started.",  (uint8_t *)buf,  2u);
    }

    [v5 setDestinationDevice:self->_endorseeDevice];
    objc_storeStrong((id *)&self->_endorseeClient, a3);
    objc_initWeak(buf, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100074118;
    v11[3] = &unk_1001C94F0;
    objc_copyWeak(&v12, buf);
    [v5 activateWithCompletion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

- (void)authorizationDaemonServiceWillProcessUserResponse:(id)a3
{
}

- (void)_deactivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "authorizationEndorserRapportClientDidFinish:") & 1) != 0) {
    [WeakRetained authorizationEndorserRapportClientDidFinish:self];
  }
  -[RPCompanionLinkClient invalidate](self->_endorseeClient, "invalidate");
  endorseeClient = self->_endorseeClient;
  self->_endorseeClient = 0LL;
}

- (void)_sendStartAuthorizationRequest
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    endorseeDevice = self->_endorseeDevice;
    *(_DWORD *)buf = 138412546;
    v13 = endorseeDevice;
    __int16 v14 = 2048;
    v15 = endorseeDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Sending StartAuthorizationRequest. {device=%@, device_ptr=%p}",  buf,  0x16u);
  }

  objc_initWeak((id *)buf, self);
  endorseeClient = self->_endorseeClient;
  uint64_t v7 = sub_1000641E8(0LL);
  if (v7)
  {
    id v8 = sub_1000645A0();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    v9 = 0LL;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10007439C;
  v10[3] = &unk_1001C9518;
  objc_copyWeak(&v11, (id *)buf);
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:]( endorseeClient,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.AuthKit.StartAuthorization",  &__NSDictionary0__struct,  v9,  0LL,  v10);
  if (v7) {

  }
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_handleStartAuthorizationWithResponse:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _AKLogSiwa(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Handling StartAuthorizationResponse. {response=%@}",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CredentialRequest"]);
  id v31 = 0LL;
  id v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___AKCredentialRequestContext, v9),  v8,  &v31);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v31;
  __int16 v14 = v12;
  if (v11)
  {
    id v15 = objc_msgSend(v11, "set_isRapportLogin:", 1);
    uint64_t v17 = _AKLogSiwa(v15, v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100138BCC(v11, v18);
    }

    id v19 = objc_msgSend(v11, "set_requirePassword:", 0);
    uint64_t v21 = _AKLogSiwa(v19, v20);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "StartAuthorization presenting authorization UI for Rapport request. {credentialRequestContext=%@}",  buf,  0xCu);
    }

    v23 = -[AKOwnerProxyClient initWithCredentialRequest:]( objc_alloc(&OBJC_CLASS___AKOwnerProxyClient),  "initWithCredentialRequest:",  v11);
    v24 = -[AKAuthorizationDaemonService initWithClient:]( objc_alloc(&OBJC_CLASS___AKAuthorizationDaemonService),  "initWithClient:",  v23);
    authorizationService = self->_authorizationService;
    self->_authorizationService = v24;

    -[AKAuthorizationDaemonService setDelegate:](self->_authorizationService, "setDelegate:", self);
    objc_initWeak((id *)buf, self);
    v26 = self->_authorizationService;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000747A8;
    v29[3] = &unk_1001C9540;
    objc_copyWeak(&v30, (id *)buf);
    -[AKAuthorizationDaemonService performAuthorization:completion:](v26, "performAuthorization:completion:", v11, v29);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    uint64_t v27 = _AKLogSiwa(v12, v13);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100138B4C((uint64_t)v14, (uint64_t)v8, v28);
    }

    -[AKAuthorizationEndorserRapportClient _sendAuthorizationDidFinishRequestWithError:]( self,  "_sendAuthorizationDidFinishRequestWithError:",  v14);
  }
}

- (void)_sendAuthorizationDidFinishRequestWithAuthorization:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _AKLogSiwa(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    endorseeDevice = self->_endorseeDevice;
    *(_DWORD *)buf = 138412802;
    id v32 = v4;
    __int16 v33 = 2112;
    v34 = endorseeDevice;
    __int16 v35 = 2048;
    v36 = endorseeDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Sending AuthorizationDidFinish. {authorization=%@, device=%@, device_ptr=%p}",  buf,  0x20u);
  }

  id v28 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v28));
  id v10 = v28;
  id v12 = v10;
  if (v9)
  {
    objc_initWeak((id *)buf, self);
    endorseeClient = self->_endorseeClient;
    v29 = @"Authorization";
    id v30 = v9;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    uint64_t v15 = sub_1000641E8(0LL);
    if (v15)
    {
      id v16 = sub_1000645A0();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100074A78;
    v26[3] = &unk_1001C9518;
    objc_copyWeak(&v27, (id *)buf);
    -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:]( endorseeClient,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.AuthKit.AuthorizationDidFinish",  v14,  v17,  0LL,  v26);
    if (v15) {

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    uint64_t v18 = _AKLogSiwa(v10, v11);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100138C54((uint64_t)v12, v19, v20, v21, v22, v23, v24, v25);
    }

    -[AKAuthorizationEndorserRapportClient _sendAuthorizationDidFinishRequestWithError:]( self,  "_sendAuthorizationDidFinishRequestWithError:",  v12);
  }
}

- (void)_sendAuthorizationDidFinishRequestWithError:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _AKLogSiwa(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100138D1C(v4);
  }

  if (!v4) {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7001LL));
  }
  id v32 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v32));
  id v9 = v32;
  uint64_t v11 = v9;
  if (v8)
  {
    v39 = @"Error";
    v40 = v8;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    __int16 v14 = (void *)v12;
  }

  else
  {
    uint64_t v15 = _AKLogSiwa(v9, v10);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100138CB8((uint64_t)v11, v16, v17, v18, v19, v20, v21, v22);
    }

    __int16 v14 = &__NSDictionary0__struct;
  }

  uint64_t v23 = _AKLogSiwa(v12, v13);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    endorseeDevice = self->_endorseeDevice;
    *(_DWORD *)buf = 138412802;
    id v34 = v4;
    __int16 v35 = 2112;
    v36 = endorseeDevice;
    __int16 v37 = 2048;
    v38 = endorseeDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Sending AuthorizationDidFinish. {error=%@, device=%@, device_ptr=%p}",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  endorseeClient = self->_endorseeClient;
  uint64_t v27 = sub_1000641E8(0LL);
  if (v27)
  {
    id v28 = sub_1000645A0();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  }

  else
  {
    v29 = 0LL;
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100074E4C;
  v30[3] = &unk_1001C9518;
  objc_copyWeak(&v31, (id *)buf);
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:]( endorseeClient,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.AuthKit.AuthorizationDidFinish",  v14,  v29,  0LL,  v30);
  if (v27) {

  }
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (void)_sendDidStartServerAuthorizationEvent
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    endorseeDevice = self->_endorseeDevice;
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = endorseeDevice;
    __int16 v14 = 2048;
    uint64_t v15 = endorseeDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Sending DidStartServerAuthorization event. {device=%@, device_ptr=%p}",  buf,  0x16u);
  }

  objc_initWeak((id *)buf, self);
  endorseeClient = self->_endorseeClient;
  uint64_t v7 = sub_1000641E8(0LL);
  if (v7)
  {
    id v8 = sub_1000645A0();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v9 = 0LL;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100075110;
  v10[3] = &unk_1001C94F0;
  objc_copyWeak(&v11, (id *)buf);
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( endorseeClient,  "sendEventID:event:destinationID:options:completion:",  @"com.apple.AuthKit.DidStartServerAuthorization",  &__NSDictionary0__struct,  v9,  0LL,  v10);
  if (v7) {

  }
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (AKAuthorizationEndorserRapportClientDelegate)delegate
{
  return (AKAuthorizationEndorserRapportClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RPCompanionLinkClient)endorseeClient
{
  return self->_endorseeClient;
}

- (void)setEndorseeClient:(id)a3
{
}

- (RPCompanionLinkDevice)endorseeDevice
{
  return self->_endorseeDevice;
}

- (void)setEndorseeDevice:(id)a3
{
}

- (AKAuthorizationDaemonService)authorizationService
{
  return self->_authorizationService;
}

- (void)setAuthorizationService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
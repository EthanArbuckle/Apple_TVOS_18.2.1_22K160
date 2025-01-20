@interface AKAuthorizationEndorserRapportDiscovery
- (AKAuthorizationEndorserRapportClient)authorizationEndorser;
- (AKAuthorizationEndorserRapportDiscovery)initWithClient:(id)a3;
- (AKClient)client;
- (BOOL)activateWithError:(id *)a3;
- (RPCompanionLinkClient)deviceDiscovery;
- (id)didDeactivateBlock;
- (void)_handleFoundDevice:(id)a3;
- (void)authorizationEndorserRapportClientDidFinish:(id)a3;
- (void)deactivate;
- (void)setAuthorizationEndorser:(id)a3;
- (void)setClient:(id)a3;
- (void)setDeviceDiscovery:(id)a3;
- (void)setDidDeactivateBlock:(id)a3;
@end

@implementation AKAuthorizationEndorserRapportDiscovery

- (AKAuthorizationEndorserRapportDiscovery)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKAuthorizationEndorserRapportDiscovery;
  v6 = -[AKAuthorizationEndorserRapportDiscovery init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (BOOL)activateWithError:(id *)a3
{
  uint64_t v4 = _AKLogSiwa(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100135388(v5);
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  }
  return 0;
}

- (void)deactivate
{
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0LL;

  didDeactivateBlock = (uint64_t (**)(void))self->_didDeactivateBlock;
  if (didDeactivateBlock) {
    didDeactivateBlock = (uint64_t (**)(void))didDeactivateBlock[2]();
  }
  uint64_t v6 = _AKLogSiwa(didDeactivateBlock, v4);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Authorization Endorser discovery deactivated.",  v8,  2u);
  }
}

- (void)authorizationEndorserRapportClientDidFinish:(id)a3
{
}

- (void)_handleFoundDevice:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4;
  if (self->_authorizationEndorser)
  {
    uint64_t v7 = _AKLogSiwa(v4, v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Authorization Endorser already in progress, ignoring device found. {device=%@}",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    objc_super v9 = objc_alloc(&OBJC_CLASS___AKAuthorizationEndorserRapportClient);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v11 = -[AKAuthorizationEndorserRapportClient initWithDeviceID:](v9, "initWithDeviceID:", v10);
    authorizationEndorser = self->_authorizationEndorser;
    self->_authorizationEndorser = v11;

    -[AKAuthorizationEndorserRapportClient setDelegate:](self->_authorizationEndorser, "setDelegate:", self);
    -[AKAuthorizationEndorserRapportClient startAuthorization](self->_authorizationEndorser, "startAuthorization");
    -[RPCompanionLinkClient invalidate](self->_deviceDiscovery, "invalidate");
  }
}

- (id)didDeactivateBlock
{
  return self->_didDeactivateBlock;
}

- (void)setDidDeactivateBlock:(id)a3
{
}

- (RPCompanionLinkClient)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (void)setDeviceDiscovery:(id)a3
{
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (AKAuthorizationEndorserRapportClient)authorizationEndorser
{
  return self->_authorizationEndorser;
}

- (void)setAuthorizationEndorser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
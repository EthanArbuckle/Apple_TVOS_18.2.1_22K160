@interface AKCustodianDaemonService
- (AKClient)client;
- (AKCustodianDaemonService)init;
- (AKCustodianDaemonService)initWithClient:(id)a3;
- (BOOL)verifyRecoveryTransactionWithContext:(id)a3 verifySessionID:(BOOL)a4 error:(id *)a5;
- (id)_trustedContactOperationsByIDFromArray:(id)a3;
- (void)dealloc;
- (void)fetchCustodianDataRecoveryKeyWithContext:(id)a3 completion:(id)a4;
- (void)fetchCustodianRecoveryCodeConfigurationWithCompletion:(id)a3;
- (void)fetchCustodianRecoveryTokenWithContext:(id)a3 completion:(id)a4;
- (void)finalizeCustodianSetupWithContext:(id)a3 completion:(id)a4;
- (void)initiateCustodianSetupWithContext:(id)a3 completion:(id)a4;
- (void)performTrustedContactsDataSync:(id)a3 completion:(id)a4;
- (void)revokeCustodianWithContext:(id)a3 completion:(id)a4;
- (void)sendEmbargoEndNotificationFeedbackWithContext:(id)a3 urlKey:(id)a4 completion:(id)a5;
- (void)startCustodianRecoveryRequestWithContext:(id)a3 completion:(id)a4;
- (void)startCustodianRecoveryTransactionWithContext:(id)a3 completion:(id)a4;
- (void)updateCustodianRecoveryKeyWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKCustodianDaemonService

- (AKCustodianDaemonService)init
{
  return 0LL;
}

- (AKCustodianDaemonService)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKCustodianDaemonService;
  v6 = -[AKCustodianDaemonService init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10013A76C();
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKCustodianDaemonService;
  -[AKCustodianDaemonService dealloc](&v5, "dealloc");
}

- (void)initiateCustodianSetupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianUUID]);

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianSetupToken]);

      if (v11)
      {
        v13 = objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider);
        v14 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( v13,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianInitiation);
        -[AKCustodianRequestProvider setAuthenticatedRequest:](v14, "setAuthenticatedRequest:", 1LL);
        -[AKURLRequestProviderImpl setClient:](v14, "setClient:", self->_client);
        v15 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v14);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1000815A0;
        v23[3] = &unk_1001C8058;
        v24 = v14;
        id v25 = v6;
        id v26 = v7;
        v16 = v14;
        -[AKServiceControllerImpl executeRequestWithCompletion:](v15, "executeRequestWithCompletion:", v23);

LABEL_16:
        goto LABEL_17;
      }

      uint64_t v22 = _AKLogSystem(v12);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10013A7F8();
      }
    }

    else
    {
      uint64_t v20 = _AKLogSystem(v10);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10013A7CC();
      }
    }

    if (v7)
    {
      uint64_t v19 = -7044LL;
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v17 = _AKLogSystem(v8);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10013A824();
    }

    if (v7)
    {
      uint64_t v19 = -7026LL;
LABEL_15:
      v15 = (AKServiceControllerImpl *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v19));
      (*((void (**)(id, void, AKServiceControllerImpl *))v7 + 2))(v7, 0LL, v15);
      goto LABEL_16;
    }
  }

- (void)finalizeCustodianSetupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianUUID]);

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

      if (v11)
      {
        v13 = objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider);
        v14 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( v13,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianApproval);
        -[AKCustodianRequestProvider setAuthenticatedRequest:](v14, "setAuthenticatedRequest:", 1LL);
        -[AKCustodianRequestProvider setSignWithIdentityToken:](v14, "setSignWithIdentityToken:", 1LL);
        -[AKURLRequestProviderImpl setClient:](v14, "setClient:", self->_client);
        v15 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v14);
        id v16 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
        [v16 setForceSilentAuth:1];
        -[AKServiceControllerImpl setAuthenticationDelegate:](v15, "setAuthenticationDelegate:", v16);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100081A40;
        v24[3] = &unk_1001C6568;
        id v27 = v7;
        id v25 = v14;
        id v26 = v6;
        uint64_t v17 = v14;
        -[AKServiceControllerImpl executeRequestWithCompletion:](v15, "executeRequestWithCompletion:", v24);

LABEL_16:
        goto LABEL_17;
      }

      uint64_t v23 = _AKLogSystem(v12);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10013A8DC();
      }
    }

    else
    {
      uint64_t v21 = _AKLogSystem(v10);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10013A8B0();
      }
    }

    if (v7)
    {
      uint64_t v20 = -7044LL;
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v18 = _AKLogSystem(v8);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10013A908();
    }

    if (v7)
    {
      uint64_t v20 = -7026LL;
LABEL_15:
      v15 = (AKServiceControllerImpl *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v20));
      (*((void (**)(id, AKServiceControllerImpl *))v7 + 2))(v7, v15);
      goto LABEL_16;
    }
  }

- (void)revokeCustodianWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianUUID]);

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

      if (v11)
      {
        v13 = objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider);
        v14 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( v13,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianDeletion);
        -[AKCustodianRequestProvider setAuthenticatedRequest:](v14, "setAuthenticatedRequest:", 1LL);
        -[AKCustodianRequestProvider setSignWithIdentityToken:](v14, "setSignWithIdentityToken:", 1LL);
        -[AKURLRequestProviderImpl setClient:](v14, "setClient:", self->_client);
        v15 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v14);
        id v16 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
        [v16 setForceSilentAuth:1];
        -[AKServiceControllerImpl setAuthenticationDelegate:](v15, "setAuthenticationDelegate:", v16);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100081E14;
        v24[3] = &unk_1001C6568;
        id v27 = v7;
        id v25 = v14;
        id v26 = v6;
        uint64_t v17 = v14;
        -[AKServiceControllerImpl executeRequestWithCompletion:](v15, "executeRequestWithCompletion:", v24);

LABEL_16:
        goto LABEL_17;
      }

      uint64_t v23 = _AKLogSystem(v12);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10013A8DC();
      }
    }

    else
    {
      uint64_t v21 = _AKLogSystem(v10);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10013A994();
      }
    }

    if (v7)
    {
      uint64_t v20 = -7044LL;
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v18 = _AKLogSystem(v8);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10013A9C0();
    }

    if (v7)
    {
      uint64_t v20 = -7026LL;
LABEL_15:
      v15 = (AKServiceControllerImpl *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v20));
      (*((void (**)(id, AKServiceControllerImpl *))v7 + 2))(v7, v15);
      goto LABEL_16;
    }
  }

- (void)updateCustodianRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianUUID]);

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v6 wrappingKeyRKC]);

        if (v13)
        {
          v15 = objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider);
          id v16 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( v15,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianUpdateRecoveryKey);
          -[AKCustodianRequestProvider setAuthenticatedRequest:](v16, "setAuthenticatedRequest:", 1LL);
          -[AKCustodianRequestProvider setSignWithIdentityToken:](v16, "setSignWithIdentityToken:", 1LL);
          -[AKURLRequestProviderImpl setClient:](v16, "setClient:", self->_client);
          uint64_t v17 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v16);
          id v18 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
          [v18 setForceSilentAuth:1];
          -[AKServiceControllerImpl setAuthenticationDelegate:](v17, "setAuthenticationDelegate:", v18);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_100082210;
          v26[3] = &unk_1001C7F68;
          id v28 = v7;
          id v27 = v6;
          -[AKServiceControllerImpl executeRequestWithCompletion:](v17, "executeRequestWithCompletion:", v26);

LABEL_19:
          goto LABEL_20;
        }

        uint64_t v25 = _AKLogSystem(v14);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10013AAA4();
        }
      }

      else
      {
        uint64_t v24 = _AKLogSystem(v12);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10013AA78();
        }
      }
    }

    else
    {
      uint64_t v22 = _AKLogSystem(v10);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10013AA4C();
      }
    }

    if (v7)
    {
      uint64_t v21 = -7044LL;
      goto LABEL_18;
    }
  }

  else
  {
    uint64_t v19 = _AKLogSystem(v8);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10013AAD0();
    }

    if (v7)
    {
      uint64_t v21 = -7026LL;
LABEL_18:
      id v16 = (AKCustodianRequestProvider *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  v21));
      (*((void (**)(id, AKCustodianRequestProvider *))v7 + 2))(v7, v16);
      goto LABEL_19;
    }
  }

- (void)startCustodianRecoveryRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013AB94();
  }

  id v27 = 0LL;
  unsigned __int8 v10 = -[AKCustodianDaemonService verifyRecoveryTransactionWithContext:verifySessionID:error:]( self,  "verifyRecoveryTransactionWithContext:verifySessionID:error:",  v6,  0LL,  &v27);
  id v11 = v27;
  if ((v10 & 1) != 0)
  {
    uint64_t v12 = objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider);
    v13 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( v12,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianRecoveryRequest);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 primaryAuthKitAccount]);
    id v16 = -[AKCustodianRequestProvider setAuthenticatedRequest:](v13, "setAuthenticatedRequest:", 0LL);
    if (v15)
    {
      uint64_t v17 = _AKLogSystem(v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10013AB5C();
      }

      -[AKCustodianRequestProvider setAuthenticatedRequest:](v13, "setAuthenticatedRequest:", 1LL);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 altDSIDForAccount:v15]);
      [v6 setAltDSID:v19];
    }

    -[AKURLRequestProviderImpl setClient:](v13, "setClient:", self->_client);
    v25[0] = 0LL;
    v25[1] = v25;
    v25[2] = 0x3032000000LL;
    v25[3] = sub_1000825C4;
    v25[4] = sub_1000825D4;
    id v26 = 0LL;
    uint64_t v20 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v13);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000825DC;
    v21[3] = &unk_1001C9C60;
    id v22 = v6;
    uint64_t v24 = v25;
    id v23 = v7;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v20, "executeRequestWithCompletion:", v21);

    _Block_object_dispose(v25, 8);
  }

  else if (v7)
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)fetchCustodianRecoveryCodeConfigurationWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", 0LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianCodeConfiguration]);

    if (v4) {
      v4[2](v4, v7, 0LL);
    }
    goto LABEL_8;
  }

  uint64_t v8 = _AKLogSystem(v5);
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10013AC54();
  }

  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    ((void (**)(id, void *, void *))v4)[2](v4, 0LL, v7);
LABEL_8:
  }
}

- (void)startCustodianRecoveryTransactionWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = 0LL;
  unsigned __int8 v8 = -[AKCustodianDaemonService verifyRecoveryTransactionWithContext:verifySessionID:error:]( self,  "verifyRecoveryTransactionWithContext:verifySessionID:error:",  v6,  0LL,  &v20);
  id v9 = v20;
  if ((v8 & 1) != 0)
  {
    unsigned __int8 v10 = objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider);
    id v11 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( v10,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianRecoveryCircle);
    -[AKURLRequestProviderImpl setClient:](v11, "setClient:", self->_client);
    if ([v6 ownerDevice])
    {
      -[AKCustodianRequestProvider setAuthenticatedRequest:](v11, "setAuthenticatedRequest:", 0LL);
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSIDforPrimaryiCloudAccount]);

      [v6 setAltDSID:v13];
      -[AKCustodianRequestProvider setAuthenticatedRequest:](v11, "setAuthenticatedRequest:", 1LL);
    }

    v18[0] = 0LL;
    v18[1] = v18;
    v18[2] = 0x2020000000LL;
    char v19 = 0;
    uint64_t v14 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000829F0;
    v15[3] = &unk_1001C9C88;
    uint64_t v17 = v18;
    id v16 = v7;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v14, "executeRequestWithCompletion:", v15);

    _Block_object_dispose(v18, 8);
  }

  else if (v7)
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
  }
}

- (void)fetchCustodianRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  char v19 = sub_1000825C4;
  id v20 = sub_1000825D4;
  id v21 = 0LL;
  id obj = 0LL;
  unsigned __int8 v8 = -[AKCustodianDaemonService verifyRecoveryTransactionWithContext:verifySessionID:error:]( self,  "verifyRecoveryTransactionWithContext:verifySessionID:error:",  v6,  1LL,  &obj);
  objc_storeStrong(&v21, obj);
  if ((v8 & 1) != 0)
  {
    id v9 = objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider);
    unsigned __int8 v10 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( v9,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianPostCircle);
    -[AKURLRequestProviderImpl setClient:](v10, "setClient:", self->_client);
    -[AKCustodianRequestProvider setAuthenticatedRequest:](v10, "setAuthenticatedRequest:", 0LL);
    id v11 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100082CC4;
    v12[3] = &unk_1001C9CB0;
    id v13 = v7;
    uint64_t v14 = &v16;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v11, "executeRequestWithCompletion:", v12);
  }

  else if (v7)
  {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0LL, v17[5]);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)fetchCustodianDataRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 recoverySessionID]);
    if (v9)
    {
      unsigned __int8 v10 = (void *)v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianRecoveryToken]);

      if (v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSIDforPrimaryiCloudAccount]);

        if (v13)
        {
          [v6 setAltDSID:v13];
          v15 = objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider);
          uint64_t v16 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( v15,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyCustodianRecoveryWrappingKey);
          -[AKCustodianRequestProvider setAuthenticatedRequest:](v16, "setAuthenticatedRequest:", 1LL);
          -[AKCustodianRequestProvider setSignWithIdentityToken:](v16, "setSignWithIdentityToken:", 1LL);
          -[AKURLRequestProviderImpl setClient:](v16, "setClient:", self->_client);
          v29[0] = 0LL;
          v29[1] = v29;
          v29[2] = 0x3032000000LL;
          v29[3] = sub_1000825C4;
          v29[4] = sub_1000825D4;
          id v30 = 0LL;
          uint64_t v17 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v16);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_10008342C;
          v25[3] = &unk_1001C9C60;
          id v26 = v13;
          id v28 = v29;
          id v27 = v7;
          -[AKServiceControllerImpl executeRequestWithCompletion:](v17, "executeRequestWithCompletion:", v25);

          _Block_object_dispose(v29, 8);
        }

        else
        {
          uint64_t v23 = _AKLogSystem(v14);
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_10013AD6C();
          }

          if (!v7) {
            goto LABEL_20;
          }
          uint64_t v16 = (AKCustodianRequestProvider *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7055LL));
          (*((void (**)(id, void, AKCustodianRequestProvider *))v7 + 2))(v7, 0LL, v16);
        }

LABEL_20:
        goto LABEL_21;
      }
    }

    uint64_t v21 = _AKLogSystem(v9);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10013AD40();
    }

    if (v7)
    {
      uint64_t v20 = -7044LL;
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v18 = _AKLogSystem(v8);
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10013AD98();
    }

    if (v7)
    {
      uint64_t v20 = -7026LL;
LABEL_14:
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v20));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v13);
      goto LABEL_20;
    }
  }

- (void)sendEmbargoEndNotificationFeedbackWithContext:(id)a3 urlKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void *))a5;
  BOOL v11 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (!v11)
  {
    uint64_t v22 = _AKLogSystem(v11);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10013AE8C();
    }

    if (!v10) {
      goto LABEL_23;
    }
    uint64_t v24 = -7026LL;
LABEL_21:
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v24));
    v10[2](v10, v17);
LABEL_22:

    goto LABEL_23;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);

  if (!v12)
  {
    uint64_t v25 = _AKLogSystem(v13);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10013ADC4();
    }

    if (!v10) {
      goto LABEL_23;
    }
    uint64_t v24 = -7025LL;
    goto LABEL_21;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 recoverySessionID]);

  if (v14)
  {
    id v16 = v9;
    uint64_t v17 = v16;
    if (!v16)
    {
      id v16 = AKURLBagKeyCustodianRecoveryFeedback;
      uint64_t v17 = v16;
    }

    uint64_t v18 = _AKLogSystem(v16);
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10013AE1C();
    }

    uint64_t v20 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider),  "initWithContext:urlBagKey:",  v8,  v17);
    -[AKCustodianRequestProvider setAuthenticatedRequest:](v20, "setAuthenticatedRequest:", 0LL);
    -[AKURLRequestProviderImpl setClient:](v20, "setClient:", self->_client);
    uint64_t v21 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v20);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000837EC;
    v29[3] = &unk_1001C6C28;
    id v30 = v10;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v21, "executeRequestWithCompletion:", v29);

    goto LABEL_22;
  }

  uint64_t v27 = _AKLogSystem(v15);
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_10013ADF0();
  }

  if (v10)
  {
    uint64_t v24 = -7044LL;
    goto LABEL_21;
  }

- (BOOL)verifyRecoveryTransactionWithContext:(id)a3 verifySessionID:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v9)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 ownerAppleID]);
    if (v10 || (unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 ownerCustodianAltDSID])) != 0)
    {
    }

    else
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 custodianUUID]);

      if (!v25)
      {
        uint64_t v27 = _AKLogSystem(v26);
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10013AF18();
        }

        if (a5)
        {
          uint64_t v15 = -7022LL;
          goto LABEL_12;
        }

        goto LABEL_33;
      }
    }

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pushToken]);

    if (v11)
    {
      if (!v6) {
        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v17 = _AKLogSystem(v12);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Custodian context does not provide a pushToken, fetching pushToken...",  v32,  2u);
      }

      char v19 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDPushHelperService sharedService]( &OBJC_CLASS___AKAppleIDPushHelperService,  "sharedService"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 publicAPSTokenString]);

      if (![v20 length])
      {
        uint64_t v29 = _AKLogSystem(0LL);
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_10013AF44();
        }

        if (a5) {
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7041LL));
        }

        goto LABEL_33;
      }

      [v8 setPushToken:v20];

      if (!v6)
      {
LABEL_18:
        BOOL v16 = 1;
        goto LABEL_34;
      }
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v8 recoverySessionID]);

    if (v21) {
      goto LABEL_18;
    }
    uint64_t v23 = _AKLogSystem(v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10013AF70();
    }

    if (a5)
    {
      uint64_t v15 = -7044LL;
      goto LABEL_12;
    }

- (void)performTrustedContactsDataSync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  uint64_t v9 = AKURLBagKeyTrustedContactsDataSync;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 urlAtKey:AKURLBagKeyTrustedContactsDataSync]);

  if (!v10)
  {
    uint64_t v23 = _AKLogSystem(v11);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10013AF9C();
    }

    if (!v7) {
      goto LABEL_26;
    }
    uint64_t v25 = -7097LL;
LABEL_18:
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v25));
    v7[2](v7, 0LL, v16);
LABEL_25:

    goto LABEL_26;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 lastDataSyncTimestamp]);

  if (!v12)
  {
    uint64_t v26 = _AKLogSystem(v13);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10013AFC8();
    }

    if (!v7) {
      goto LABEL_26;
    }
    uint64_t v25 = -7044LL;
    goto LABEL_18;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

  if (v14)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 authKitAccountWithAltDSID:v17 error:0]);

    char v19 = (void *)objc_claimAutoreleasedReturnValue([v16 hearbeatTokenForAccount:v18]);
    if (v19)
    {
      [v6 _setHeartbeatToken:v19];
      uint64_t v20 = -[AKCustodianRequestProvider initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKCustodianRequestProvider),  "initWithContext:urlBagKey:",  v6,  v9);
      -[AKCustodianRequestProvider setAuthenticatedRequest:](v20, "setAuthenticatedRequest:", 1LL);
      -[AKURLRequestProviderImpl setClient:](v20, "setClient:", self->_client);
      uint64_t v21 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v20);
      id v22 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
      [v22 setForceSilentAuth:1];
      -[AKServiceControllerImpl setAuthenticationDelegate:](v21, "setAuthenticationDelegate:", v22);
      objc_initWeak(&location, self);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100083FDC;
      v32[3] = &unk_1001C8FC8;
      objc_copyWeak(&v36, &location);
      id v33 = v16;
      id v34 = v18;
      v35 = v7;
      -[AKServiceControllerImpl executeRequestWithCompletion:](v21, "executeRequestWithCompletion:", v32);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }

    else
    {
      uint64_t v30 = _AKLogSystem(0LL);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10013B020();
      }

      if (!v7) {
        goto LABEL_24;
      }
      uint64_t v20 = (AKCustodianRequestProvider *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7042LL));
      v7[2](v7, 0LL, v20);
    }

LABEL_24:
    goto LABEL_25;
  }

  uint64_t v28 = _AKLogSystem(v15);
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_10013AFF4();
  }

  if (v7)
  {
    uint64_t v25 = -7025LL;
    goto LABEL_18;
  }

- (id)_trustedContactOperationsByIDFromArray:(id)a3
{
  id v3 = a3;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v32;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v8);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
        id v11 = v9;
        if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
          id v12 = v11;
        }
        else {
          id v12 = 0LL;
        }

        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
        id v15 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"uuid"]);
        if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
          id v16 = v15;
        }
        else {
          id v16 = 0LL;
        }

        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17);
        id v19 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"op"]);
        if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0) {
          id v20 = v19;
        }
        else {
          id v20 = 0LL;
        }

        uint64_t v21 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v16);
        uint64_t v22 = AKTrustedContactSyncOperationFromIntegerValue([v20 integerValue]);
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
        uint64_t v24 = (void *)v23;
        if (v21 && v23)
        {
          [v29 setObject:v23 forKeyedSubscript:v21];
        }

        else
        {
          uint64_t v25 = _AKLogSystem(v23);
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Unexpected IdMS trusted contact operation response: %@",  buf,  0xCu);
          }
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v6);
  }

  id v27 = [v29 copy];
  return v27;
}

- (AKClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end
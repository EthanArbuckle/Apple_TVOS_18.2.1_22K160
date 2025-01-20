@interface IDSPhoneUserRegistry
- (IDSPhoneNumberValidationStateMachine)phoneNumberValidator;
- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4;
- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4 deviceSupport:(id)a5;
- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4 server:(id)a5 phoneNumberValidator:(id)a6 deviceSupport:(id)a7;
- (IDSPhoneUserRegistryDeviceSupport)deviceSupport;
- (IDSServer)server;
- (IDSUserStore)userStore;
- (OS_dispatch_queue)queue;
- (__SecKey)phoneAuthenticationCertificatePrivateKey;
- (__SecKey)phoneAuthenticationCertificatePublicKey;
- (id)authenticatePhoneUser;
- (id)localPhoneAuthenticationCertificates;
- (id)phoneAuthenticationCertificateSigningRequestForUser:(id)a3;
- (void)requestUserConsentToValidatePhoneNumberForCTPNR:(id)a3 completion:(id)a4;
@end

@implementation IDSPhoneUserRegistry

- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[IDSServer initWithQueue:](objc_alloc(&OBJC_CLASS___IDSServer), "initWithQueue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  v10 = -[IDSPhoneUserRegistry initWithQueue:userStore:server:phoneNumberValidator:deviceSupport:]( self,  "initWithQueue:userStore:server:phoneNumberValidator:deviceSupport:",  v7,  v6,  v8,  0LL,  v9);

  return v10;
}

- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4 deviceSupport:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[IDSServer initWithQueue:](objc_alloc(&OBJC_CLASS___IDSServer), "initWithQueue:", v10);
  v12 = -[IDSPhoneUserRegistry initWithQueue:userStore:server:phoneNumberValidator:deviceSupport:]( self,  "initWithQueue:userStore:server:phoneNumberValidator:deviceSupport:",  v10,  v9,  v11,  0LL,  v8);

  return v12;
}

- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4 server:(id)a5 phoneNumberValidator:(id)a6 deviceSupport:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSPhoneUserRegistry;
  v17 = -[IDSPhoneUserRegistry init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    objc_storeStrong((id *)&v18->_userStore, a4);
    objc_storeStrong((id *)&v18->_server, a5);
    objc_storeStrong((id *)&v18->_phoneNumberValidator, a6);
    objc_storeStrong((id *)&v18->_deviceSupport, a7);
  }

  return v18;
}

- (__SecKey)phoneAuthenticationCertificatePublicKey
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserRegistry queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  v4 = (__SecKey *)[v3 identityPublicKey];

  return v4;
}

- (__SecKey)phoneAuthenticationCertificatePrivateKey
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserRegistry queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  v4 = (__SecKey *)[v3 identityPrivateKey];

  return v4;
}

- (id)phoneAuthenticationCertificateSigningRequestForUser:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserRegistry queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumber]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 generateCSRForUserID:v7]);
  return v8;
}

- (id)localPhoneAuthenticationCertificates
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserRegistry queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserRegistry deviceSupport](self, "deviceSupport"));
  unsigned int v5 = [v4 supportsIdentification];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserRegistry userStore](self, "userStore"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 usersWithRealm:0]);

    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v13);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserRegistry userStore](self, "userStore", (void)v32));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 authenticationCertificateForUser:v14]);

          if (v16)
          {
            v17 = -[IDSPhoneUserAuthenticationCertificate initWithPhoneUser:authenticationCertificate:]( objc_alloc(&OBJC_CLASS___IDSPhoneUserAuthenticationCertificate),  "initWithPhoneUser:authenticationCertificate:",  v14,  v16);
            -[NSMutableArray addObject:](v8, "addObject:", v17);
          }

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }

      while (v11);
    }

    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Fetched phone auth certificate from phone user registry {userAuthCerts: %@}",  buf,  0xCu);
    }

    if (-[NSMutableArray count](v8, "count"))
    {
      id v19 = -[NSMutableArray copy](v8, "copy");
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[CUTPromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTPromise,  "fulfilledPromiseWithValue:",  v19));
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
      id v19 = (id)objc_claimAutoreleasedReturnValue([v25 fetchCurrentPACState]);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 underlyingErrorForPACState:v19]);

      NSErrorUserInfoKey v38 = NSDebugDescriptionErrorKey;
      v39 = @"This device is not currently authenticated for a phone user";
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v28));

      if (v27) {
        [v29 setObject:v27 forKeyedSubscript:NSUnderlyingErrorKey];
      }
      v30 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"IDSPhoneUserRegistryErrorDomain",  -5000LL,  v29);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[CUTPromise failedPromiseWithError:](&OBJC_CLASS___CUTPromise, "failedPromiseWithError:", v30));
    }
  }

  else
  {
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
    id v9 = (id)objc_claimAutoreleasedReturnValue([v21 fetchCurrentPACState]);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
    id v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v22 underlyingErrorForPACState:v9]);

    NSErrorUserInfoKey v36 = NSDebugDescriptionErrorKey;
    v37 = @"This device does not support phone number authentication";
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v23));

    if (v8) {
      [v19 setObject:v8 forKeyedSubscript:NSUnderlyingErrorKey];
    }
    v24 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"IDSPhoneUserRegistryErrorDomain",  -1000LL,  v19);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[CUTPromise failedPromiseWithError:](&OBJC_CLASS___CUTPromise, "failedPromiseWithError:", v24));
  }

  return v20;
}

- (id)authenticatePhoneUser
{
  return 0LL;
}

- (void)requestUserConsentToValidatePhoneNumberForCTPNR:(id)a3 completion:(id)a4
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (IDSServer)server
{
  return self->_server;
}

- (IDSPhoneNumberValidationStateMachine)phoneNumberValidator
{
  return self->_phoneNumberValidator;
}

- (IDSPhoneUserRegistryDeviceSupport)deviceSupport
{
  return self->_deviceSupport;
}

- (void).cxx_destruct
{
}

@end
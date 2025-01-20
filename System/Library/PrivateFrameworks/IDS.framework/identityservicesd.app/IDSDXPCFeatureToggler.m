@interface IDSDXPCFeatureToggler
- (IDSDXPCFeatureToggler)initWithService:(id)a3 queue:(id)a4 connection:(id)a5;
- (NSString)service;
- (OS_dispatch_queue)queue;
- (id)_accountToUse;
- (void)retrieveFeatureToggleStateForOptions:(id)a3 completion:(id)a4;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)updateFeatureToggleStateWithOptions:(id)a3 completion:(id)a4;
@end

@implementation IDSDXPCFeatureToggler

- (IDSDXPCFeatureToggler)initWithService:(id)a3 queue:(id)a4 connection:(id)a5
{
  id v7 = a3;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForEntitlement:kIDSRegistrationEntitlement]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
  {
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString, v15);
    if ((objc_opt_isKindOfClass(v12, v25) & 1) != 0)
    {
    }

    else
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v26);
    }

- (id)_accountToUse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFeatureToggler service](self, "service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceWithIdentifier:v4]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 appleIDAccountOnService:v5]);

  if (!v7
    || (v8 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryRegistration]),
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 registrationCert]),
        v9,
        v8,
        !v9))
  {

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 registeredAccountsOnService:v5]);

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v12 = v11;
    id v7 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primaryRegistration", (void)v19));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 registrationCert]);

          if (v17)
          {
            id v7 = v15;
            goto LABEL_13;
          }
        }

        id v7 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (void)retrieveFeatureToggleStateForOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (v6 && (v8 = (void *)objc_claimAutoreleasedReturnValue([v6 featureID]), v8, v8))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFeatureToggler _accountToUse](self, "_accountToUse"));
      if (!v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFeatureToggleRetrievalResult resultWithError:]( &OBJC_CLASS___IDSFeatureToggleRetrievalResult,  "resultWithError:",  4LL));
        v7[2](v7, v10);
      }

      [v9 retrieveFeatureToggleStateForOptions:v6 completionBlock:v7];
    }

    else
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog FeatureToggler](&OBJC_CLASS___IDSFoundationLog, "FeatureToggler"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10069CFBC();
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFeatureToggleRetrievalResult resultWithError:]( &OBJC_CLASS___IDSFeatureToggleRetrievalResult,  "resultWithError:",  1LL));
      v7[2](v7, v9);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog FeatureToggler](&OBJC_CLASS___IDSFoundationLog, "FeatureToggler"));
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      sub_10069CF90();
    }
  }
}

- (void)updateFeatureToggleStateWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (v6 && (v8 = (void *)objc_claimAutoreleasedReturnValue([v6 featureID]), v8, v8))
    {
      if ([v6 state] == (id)1 || objc_msgSend(v6, "state") == (id)2)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFeatureToggler _accountToUse](self, "_accountToUse"));
        if (!v9)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFeatureToggleUpdateResult resultWithError:]( &OBJC_CLASS___IDSFeatureToggleUpdateResult,  "resultWithError:",  4LL));
          v7[2](v7, v10);
        }

        [v9 updateFeatureToggleStateWithOptions:v6 completionBlock:v7];
        goto LABEL_14;
      }

      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog FeatureToggler](&OBJC_CLASS___IDSFoundationLog, "FeatureToggler"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10069D040(v6, v11);
      }
    }

    else
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog FeatureToggler](&OBJC_CLASS___IDSFoundationLog, "FeatureToggler"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10069D014();
      }
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFeatureToggleUpdateResult resultWithError:]( &OBJC_CLASS___IDSFeatureToggleUpdateResult,  "resultWithError:",  1LL));
    v7[2](v7, v9);
    goto LABEL_14;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog FeatureToggler](&OBJC_CLASS___IDSFoundationLog, "FeatureToggler"));
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
    sub_10069CFE8();
  }
LABEL_14:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
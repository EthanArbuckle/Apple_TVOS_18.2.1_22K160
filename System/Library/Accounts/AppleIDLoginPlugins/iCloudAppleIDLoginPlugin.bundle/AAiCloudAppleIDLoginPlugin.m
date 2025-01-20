@interface AAiCloudAppleIDLoginPlugin
- (id)_accountStore;
- (id)_descriptionFromEmailAddress:(id)a3;
- (id)parametersForIdentityEstablishmentRequest;
- (id)parametersForLoginRequest;
- (id)serviceIdentifier;
- (void)_addAccountWithServerResponse:(id)a3 password:(id)a4 emailAddress:(id)a5;
- (void)_updateAccount:(id)a3 withProvisioningResponse:(id)a4 emailAddress:(id)a5;
- (void)handleLoginResponse:(id)a3 completion:(id)a4;
@end

@implementation AAiCloudAppleIDLoginPlugin

- (id)serviceIdentifier
{
  return kAAProtocolMobileMeDataKey;
}

- (id)parametersForLoginRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](&OBJC_CLASS___FMDFMIPManager, "sharedInstance"));
  else {
    v3 = (_UNKNOWN **)&__NSDictionary0__struct;
  }

  return v3;
}

- (id)parametersForIdentityEstablishmentRequest
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AAiCloudAppleIDLoginPlugin _accountStore](self, "_accountStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_primaryAppleAccount"));

  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"account-exists");
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"appleId");
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"dsid");
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_password"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_password"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"password");
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"account-exists");
  }

  return v3;
}

- (void)handleLoginResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    kdebug_trace(728563716LL, 0LL, 0LL, 0LL, 0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"password"]);
    uint64_t v36 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"appleIDEnteredByUser"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"status"]);
    unsigned int v10 = [v9 intValue];

    v35 = self;
    if (v10)
    {
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"status-message"]);
      id v12 = 0LL;
      id v37 = 0LL;
      v13 = 0LL;
      int v14 = 0;
      int v15 = 0;
    }

    else
    {
      id v19 = [[AAProvisioningResponse alloc] initWithDictionary:v6];
      if (v19)
      {
        id v37 = v19;
        v13 = (void *)objc_claimAutoreleasedReturnValue([v19 personID]);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[AAiCloudAppleIDLoginPlugin _accountStore](self, "_accountStore"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "aa_appleAccounts"));

        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v22 = v21;
        v11 = (__CFString *)[v22 countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v11)
        {
          v34 = v8;
          uint64_t v23 = *(void *)v41;
          while (2)
          {
            for (i = 0LL; i != v11; i = (__CFString *)((char *)i + 1))
            {
              if (*(void *)v41 != v23) {
                objc_enumerationMutation(v22);
              }
              v25 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aa_personID"));
              unsigned int v27 = [v26 isEqualToString:v13];

              if (v27)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[AAiCloudAppleIDLoginPlugin _accountStore](v35, "_accountStore"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "aa_primaryAppleAccount"));

                if (!v29) {
                  objc_msgSend(v25, "aa_setPrimaryAccount:", 1);
                }
                id v12 = v25;
                int v15 = 0;
                int v14 = 1;
                v11 = @"The account already exists.";
                goto LABEL_22;
              }
            }

            v11 = (__CFString *)[v22 countByEnumeratingWithState:&v40 objects:v47 count:16];
            if (v11) {
              continue;
            }
            break;
          }

          id v12 = 0LL;
          int v14 = 0;
          int v15 = 1;
LABEL_22:
          v8 = v34;
        }

        else
        {
          id v12 = 0LL;
          int v14 = 0;
          int v15 = 1;
        }

        v16 = (void *)v36;

LABEL_26:
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_2760;
        v38[3] = &unk_41A8;
        id v39 = v7;
        v30 = objc_retainBlock(v38);
        if (v15)
        {
          v31 = v37;
          -[AAiCloudAppleIDLoginPlugin _addAccountWithServerResponse:password:emailAddress:]( v35,  "_addAccountWithServerResponse:password:emailAddress:",  v37,  v8,  v16);
        }

        else
        {
          if (!v14)
          {
            NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
            v46 = v11;
            v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  0LL,  v32));
            ((void (*)(void *, void, void *))v30[2])(v30, 0LL, v33);

            v31 = v37;
            goto LABEL_32;
          }

          objc_msgSend(v12, "aa_setPassword:", v8);
          v31 = v37;
          -[AAiCloudAppleIDLoginPlugin _updateAccount:withProvisioningResponse:emailAddress:]( v35,  "_updateAccount:withProvisioningResponse:emailAddress:",  v12,  v37,  v16);
        }

        ((void (*)(void *, uint64_t, void))v30[2])(v30, 1LL, 0LL);
LABEL_32:

        goto LABEL_33;
      }

      id v12 = 0LL;
      id v37 = 0LL;
      v13 = 0LL;
      int v14 = 0;
      int v15 = 0;
      v11 = @"Communications error with setup server.";
    }

    v16 = (void *)v36;
    goto LABEL_26;
  }

  uint64_t v17 = _AALogSystem();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "ERROR: The server response parameters being passed in is empty - will not run iCloud account setup",  buf,  2u);
  }

  (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
LABEL_33:
}

- (void)_addAccountWithServerResponse:(id)a3 password:(id)a4 emailAddress:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 appleID]);
  uint64_t v10 = _AALogSystem();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Adding account with server response", buf, 2u);
  }

  if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[AAiCloudAppleIDLoginPlugin _descriptionFromEmailAddress:]( self,  "_descriptionFromEmailAddress:",  v9));
    v13 = objc_alloc(&OBJC_CLASS___ACAccount);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[AAiCloudAppleIDLoginPlugin _accountStore](self, "_accountStore"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aa_appleAccountType"));
    v16 = -[ACAccount initWithAccountType:](v13, "initWithAccountType:", v15);

    -[ACAccount setUsername:](v16, "setUsername:", v9);
    -[ACAccount aa_setPassword:](v16, "aa_setPassword:", v8);
    -[ACAccount setAccountDescription:](v16, "setAccountDescription:", v12);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudAuthToken]);
    -[ACAccount aa_setAuthToken:](v16, "aa_setAuthToken:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AAiCloudAppleIDLoginPlugin _accountStore](self, "_accountStore"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "aa_primaryAppleAccount"));

    if (!v19) {
      -[ACAccount aa_setPrimaryAccount:](v16, "aa_setPrimaryAccount:", 1LL);
    }
    -[ACAccount aa_updateWithProvisioningResponse:](v16, "aa_updateWithProvisioningResponse:", v7);
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
    uint64_t v21 = _AALogSystem();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Saving account: %@", buf, 0xCu);
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[AAiCloudAppleIDLoginPlugin _accountStore](self, "_accountStore"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_2A5C;
    v25[3] = &unk_41D0;
    dispatch_semaphore_t v26 = v20;
    v24 = v20;
    [v23 saveAccount:v16 withCompletionHandler:v25];

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_updateAccount:(id)a3 withProvisioningResponse:(id)a4 emailAddress:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _AALogSystem();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Updating account with server response", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 provisionedDataclasses]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 provisionedDataclasses]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v11));
  [v13 minusSet:v12];
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v8 fmipLostModeToken]);
  if (v14)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](&OBJC_CLASS___FMDFMIPManager, "sharedInstance"));
    unsigned int v16 = [v15 needsLostModeExitAuth];

    if (v16)
    {
      uint64_t v17 = _AALogSystem();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Sending lost mode token to FMIP", buf, 2u);
      }

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      dispatch_semaphore_t v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_2DF0;
      block[3] = &unk_41F8;
      id v29 = v14;
      dispatch_async(v20, block);
    }
  }

  objc_msgSend(v7, "aa_updateWithProvisioningResponse:", v8);
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
  uint64_t v22 = _AALogSystem();
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v7;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Updating existing account: %@", buf, 0xCu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AAiCloudAppleIDLoginPlugin _accountStore](self, "_accountStore"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_2E34;
  v26[3] = &unk_41D0;
  dispatch_semaphore_t v27 = v21;
  v25 = v21;
  [v24 saveAccount:v7 withCompletionHandler:v26];

  dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)_descriptionFromEmailAddress:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AAiCloudAppleIDLoginPlugin _accountStore](self, "_accountStore"));
  id v6 = @"iCloud";
  unsigned int v7 = [v5 hasAccountWithDescription:@"iCloud"];

  if (v7) {
    id v6 = (__CFString *)v4;
  }

  return v6;
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (void).cxx_destruct
{
}

@end
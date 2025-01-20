LABEL_25:
        v12 = v39;
        v11 = v40;
        self = v38;
      }

      if (!v28) {
        goto LABEL_5;
      }
    }

    -[AppleAccountAuthenticationDelegate _updateAccount:accountStore:withProvisioningResponse:]( self,  "_updateAccount:accountStore:withProvisioningResponse:",  v28,  v11,  v10);
    v13[2](v13);

    goto LABEL_28;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"status-message"]);
  v17 = _AALogSystem();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v16;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "AppleAccountAuthenticationDelegate: Auth ERROR: %@", buf, 0xCu);
  }

  v19 = 0LL;
LABEL_5:
  v20 = _AALogSystem();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "AppleAccountAuthenticationDelegate: Couldn't find an matching AppleAccount",  buf,  2u);
  }

  v13[2](v13);
LABEL_28:
}

void sub_3620(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](&OBJC_CLASS___FMDFMIPManager, "sharedInstance"));
  [v2 didReceiveLostModeExitAuthToken:*(void *)(a1 + 32)];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}
jc_claimAutoreleasedReturnValue([v12 accountType]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
    v24 = ACAccountTypeIdentifierAppleAccount;
    v25 = [v23 isEqualToString:ACAccountTypeIdentifierAppleAccount];

    if (v25)
    {
      v26 = _AALogSystem();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "The account that initiated the auth is an AppleAccount, set the tokens on it",  buf,  2u);
      }

      v28 = v12;
      if (!v28) {
        goto LABEL_5;
      }
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v11 accountsWithAccountTypeIdentifier:v24]);
      v30 = _AALogSystem();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v19;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "AppleAccountAuthenticationDelegate: Looking for account with personID: %@",  buf,  0xCu);
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v32 = v29;
      v28 = [v32 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v28)
      {
        v38 = self;
        v39 = v12;
        v40 = v11;
        v33 = *(void *)v42;
        while (2)
        {
          for (i = 0LL; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v42 != v33) {
              objc_enumerationMutation(v32);
            }
            v35 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "aa_personID"));
            v37 = [v36 isEqualToString:v19];

            if (v37)
            {
              v28 = v35;
              goto LABEL_25;
            }
          }

          v28 = [v32 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v28) {
            continue;
          }
          break;
        }

- (void)_updateAccount:(id)a3 accountStore:(id)a4 withProvisioningResponse:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _AALogSystem();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "AppleAccountAuthenticationDelegate: Updating Account tokens",  buf,  2u);
  }

  id v12 = [[AAProvisioningResponse alloc] initWithDictionary:v9];
  if (objc_msgSend(v7, "aa_updateTokensWithProvisioningResponse:", v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectID]);

    if (v13)
    {
      uint64_t v28 = 0LL;
      if (([v8 saveVerifiedAccount:v7 error:&v28] & 1) == 0)
      {
        uint64_t v14 = _AALogSystem();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "AAAuthenticationDelegate - Account save failed", buf, 2u);
        }
      }
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"tokens"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kAAProtocolFMIPLostModeTokenKey]);

  if (v17)
  {
    uint64_t v18 = _AALogSystem();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "AppleAccountAuthenticationDelegate received FMIP lost-mode token.",  buf,  2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](&OBJC_CLASS___FMDFMIPManager, "sharedInstance"));
    unsigned int v21 = [v20 needsLostModeExitAuth];

    if (v21)
    {
      uint64_t v22 = _AALogSystem();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "Sending lost-mode token to FMDFMIPManager didReceiveLostModeExitAuthToken...",  buf,  2u);
      }

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_3620;
      v26[3] = &unk_4130;
      id v27 = v17;
      dispatch_async(v25, v26);
    }
  }
}

@end
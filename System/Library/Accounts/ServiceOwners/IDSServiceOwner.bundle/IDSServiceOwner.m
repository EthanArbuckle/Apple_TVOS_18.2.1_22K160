void sub_F1C(id a1)
{
  os_log_t v1;
  void *v2;
  v1 = os_log_create("com.apple.Registration", "IDSServiceOwner");
  v2 = (void *)qword_88F0;
  qword_88F0 = (uint64_t)v1;
}

void sub_F8C(id a1)
{
  uint64_t v1 = getpid();
  byte_8900 = sandbox_check(v1, "mach-lookup", SANDBOX_CHECK_NO_REPORT | 2u) == 0;
}

BOOL sub_15B4(id a1, IDSAccount *a2, BOOL *a3)
{
  v3 = a2;
  if ((-[IDSAccount isActive](v3, "isActive") & 1) == 0)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v3;
      v6 = "IDSAccount (%@) is not currently active!";
LABEL_8:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }

LABEL_9:
    BOOL v4 = 0;
    goto LABEL_10;
  }

  if (-[IDSAccount accountType](v3, "accountType") != 1)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v3;
      v6 = "IDSAccount (%@) is not signed in to Apple ID!";
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  BOOL v4 = 1;
LABEL_10:

  return v4;
}

BOOL sub_1738(id a1, IDSAccount *a2, BOOL *a3)
{
  v3 = a2;
  unsigned int v4 = -[IDSAccount accountType](v3, "accountType");
  if (v4 != 1)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = v3;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "IDSAccount (%@) is not signed in to Apple ID!",  (uint8_t *)&v7,  0xCu);
    }
  }

  return v4 == 1;
}

LABEL_8:
      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
      goto LABEL_34;
    }

    v16 = *(id *)IMWeakLinkSymbol("AKAuthenticationUsernameKey", @"AuthKit");
    v17 = *(id *)IMWeakLinkSymbol("AKAuthenticationPasswordKey", @"AuthKit");
    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 authenticationResults]);
    v37 = v16;
    v38 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v16]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 authenticationResults]);
    v36 = v17;
    v20 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v17]);

    v21 = _os_feature_enabled_impl("IDS", "SyncReplySupport");
    v22 = _os_feature_enabled_impl("IDS", "RegisterDuringBuddy");
    v35 = (void *)v20;
    if ((v22 & 1) != 0)
    {
      v23 = 1;
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
      v23 = [v24 isSetup];
    }

    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = @"NO";
      *(_DWORD *)buf = 138544386;
      v47 = v8;
      if (v23) {
        v27 = @"YES";
      }
      else {
        v27 = @"NO";
      }
      v48 = 2114;
      v49 = v38;
      if (v21) {
        v28 = @"YES";
      }
      else {
        v28 = @"NO";
      }
      v50 = 2112;
      if (v22) {
        v26 = @"YES";
      }
      v51 = v27;
      v52 = 2112;
      v53 = v28;
      v54 = 2112;
      v55 = v26;
      _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "Attempting to sign in service %{public}@ for username: %{public}@ {waitUntilRegistered: %@, syncRegistrationCont rol: %@, registerDuringBuddy: %@}",  buf,  0x34u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceOwner _activeIDSAccountForService:](self, "_activeIDSAccountForService:", v8));
    if (v29)
    {
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Found active IDS account, aborting sign in!", buf, 2u);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
      v31 = v35;
    }

    else
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_200C;
      v40[3] = &unk_4308;
      v40[4] = self;
      v41 = v38;
      v31 = v35;
      v42 = v35;
      v44 = v12;
      v45 = v23;
      v43 = v10;
      v32 = objc_retainBlock(v40);
      if (v21)
      {
        v39 = 0LL;
        StateForRegistrationType = IDSRegistrationControlSyncGetStateForRegistrationType(0LL, &v39);
        v34 = v39;
        ((void (*)(void *, uint64_t, id))v32[2])(v32, StateForRegistrationType, v34);
      }

      else
      {
        IDSRegistrationControlGetStateForRegistrationType(0LL, v32, self->_queue);
      }
    }
  }

  else
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Process is not entitled to signin.", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSignInControllerErrorDomain,  -6000LL,  0LL));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
  }

LABEL_34:
}

void sub_200C(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = 1;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "User disabled Phone Registration -- ignoring service owner request {status: %d}",  buf,  8u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) signInController]);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_21B8;
    v11[3] = &unk_42C0;
    uint64_t v8 = *(void *)(a1 + 64);
    id v9 = *(id *)(a1 + 56);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    [v4 signInUsername:v5 withProvidedCredential:v6 onService:v8 waitUntilRegistered:v7 completion:v11];

    v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) signInController]);
    objc_msgSend(v10, "enableUserType:onService:completion:", 0);
  }
}

void sub_21B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:NSUnderlyingErrorKey]);
  if (v5)
  {

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    goto LABEL_6;
  }

  id v6 = [v3 code];

  if (v6 != (id)-1000LL) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void **)IMWeakLinkSymbol("AIDAErrorDomain", @"AppleIDSSOAuthentication");
  NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
  id v12 = v3;
  id v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  -1003LL,  v9));

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_6:
}

void sub_2314(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Finished enabling phone number account {signInType: %d, error: %@}",  (uint8_t *)v6,  0x12u);
  }
}

void sub_25B8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_25C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2630(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_0,  a2,  OS_LOG_TYPE_FAULT,  "Passed the wrong service type %@ for IDS to sign in with!",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_signInUsername_withProvidedCredential_onService_waitUntilRegistered_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signInUsername:withProvidedCredential:onService:waitUntilRegistered:completion:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}
ertyAltDSID", @"AppleIDSSOAuthentication"");
    NSErrorUserInfoKey v11 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByReplacingOccurrencesOfString:@"D:" withString:&stru_4448]);
    -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", v12, v9);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    -[ACAccount setAccountProperty:forKey:]( v7,  "setAccountProperty:forKey:",  v13,  @"_AAUIIdentityUniqueIdentifier");

    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aida_alternateDSID](v7, "aida_alternateDSID"));
    -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", v14, v10);
  }

  else
  {
    __int16 v7 = 0LL;
  }

  return v7;
}

- (id)altDSIDForAccount:(id)a3 service:(id)a4
{
  id v4 = a3;
  id v5 = objc_msgSend( v4,  "objectForKeyedSubscript:",  *(void *)IMWeakLinkSymbol("AIDAAccountPropertyAltDSID", @"AppleIDSSOAuthentication"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)DSIDForAccount:(id)a3 service:(id)a4
{
  id v4 = a3;
  id v5 = objc_msgSend( v4,  "objectForKeyedSubscript:",  *(void *)IMWeakLinkSymbol("AIDAAccountPropertyDSID", @"AppleIDSSOAuthentication"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)nameComponentsForAccount:(id)a3 service:(id)a4
{
  return 0LL;
}

- (void)signInService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class(self) convertToSignInControllerServiceTypeFromAIDAServiceType:v8];
  if (v11 == (id)-1LL)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_2630((uint64_t)v8, v13);
    }
    goto LABEL_8;
  }

  id v12 = v11;
  if ([(id)objc_opt_class(self) _isEntitledForService:v11])
  {
    if ([(id)objc_opt_class(self) _isDisabledServiceType:v12])
    {
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v47 = v12;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Disabled service -- stopping immediately {signInType: %lu}",  buf,  0xCu);
      }

- (void)signOutService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  __int16 v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = a3;
  id v9 = [(id)objc_opt_class(self) convertToSignInControllerServiceTypeFromAIDAServiceType:v8];

  if ([(id)objc_opt_class(self) _isEntitledForService:v9])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceOwner signInController](self, "signInController"));
    [v10 signOutService:v9 completion:&stru_4348];

    v7[2](v7, 1LL, 0LL);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSServiceOwner Logger](&OBJC_CLASS___IDSServiceOwner, "Logger"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Process is not entitled to signout.", (uint8_t *)v13, 2u);
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSignInControllerErrorDomain,  -6000LL,  0LL));
    v7[2](v7, 0LL, v12);

    __int16 v7 = (void (**)(id, uint64_t, void))v12;
  }
}

- (IDSSignInController)signInController
{
  return self->_signInController;
}

- (void)setSignInController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (NSDictionary)accountControllers
{
  return self->_accountControllers;
}

- (void)setAccountControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
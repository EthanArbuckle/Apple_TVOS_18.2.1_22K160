void sub_2F8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2FA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_2FB8(uint64_t a1)
{
}

void sub_2FC0(uint64_t a1, int a2, id obj)
{
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}
}

void sub_32D0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AASetupAssistantService urlConfiguration](&OBJC_CLASS___AASetupAssistantService, "urlConfiguration"));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_33B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40LL);
  id v3 = objc_alloc(&OBJC_CLASS___AASetupAssistantAuthenticateRequest);
  v4 = *(void **)(a1 + 32);
  if (v2)
  {
    id v5 = [v3 initWithAccount:v4[5]];
    id v6 = [[AADeviceProvisioningSession alloc] initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
    [v6 addProvisioningInfoToAARequest:v5];
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 appleID]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) password]);
    id v5 = [v3 initWithUsername:v6 password:v7];
  }

  [v5 setCookieStorage:*(void *)(*(void *)(a1 + 32) + 48)];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_34D4;
  v8[3] = &unk_14600;
  id v9 = *(id *)(a1 + 40);
  [v5 performRequestWithHandler:v8];
}

void sub_34D4(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_3568;
  v5[3] = &unk_145D8;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

void sub_3568(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 error]);
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_3650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))( result,  a2,  a3,  a4,  a6);
  }
  return result;
}

void sub_376C(id *a1)
{
  id v2 = [a1[4] mutableCopy];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] appleID]);
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[5] password]);
  [v2 setValue:v4 forKey:@"password"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo appleIDClientIdentifier](&OBJC_CLASS___AADeviceInfo, "appleIDClientIdentifier"));
  [v2 setValue:v5 forKey:@"client-id"];

  id v6 = objc_alloc(&OBJC_CLASS___AASetupAssistantCreateRequest);
  id v7 = a1[5];
  uint64_t v8 = v7[5];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 _signingSession]);
  id v10 = [v6 initWithAccount:v8 withAppleIDParameters:v2 signingSession:v9];

  v11 = (void *)*((void *)a1[5] + 5);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));

    if (v12)
    {
      id v13 = [[AADeviceProvisioningSession alloc] initWithAccount:*((void *)a1[5] + 5)];
      [v13 addProvisioningInfoToAARequest:v10];
    }
  }

  [v10 setCookieStorage:*((void *)a1[5] + 6)];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_3914;
  v14[3] = &unk_14600;
  id v15 = a1[6];
  [v10 performRequestWithHandler:v14];
}

void sub_3914(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 statusCode] != (char *)&stru_158.reloff + 1)
  {
    if (!v6)
    {
      id v9 = 0LL;
      id v10 = 0LL;
      int v11 = 0;
      uint64_t v8 = v7;
      goto LABEL_13;
    }

    id v12 = v6;
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 status]);
    if (v13
      && (v14 = (void *)v13,
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 status]),
          unsigned int v16 = [v15 intValue],
          v15,
          v14,
          !v16))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 personID]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 appleID]);
      int v11 = 1;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 statusMessage]);

      if (v10)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v12 statusMessage]);
        [v17 setObject:v18 forKey:NSLocalizedDescriptionKey];

        v19 = (void *)objc_claimAutoreleasedReturnValue([v12 status]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  (int)[v19 intValue],  v17));

        id v9 = 0LL;
        id v10 = 0LL;
        int v11 = 0;
        goto LABEL_12;
      }

      id v9 = 0LL;
      int v11 = 0;
    }

    uint64_t v8 = v7;
    goto LABEL_12;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  401LL,  0LL));
  id v9 = 0LL;
  id v10 = 0LL;
  int v11 = 0;
  id v12 = v7;
LABEL_12:

LABEL_13:
  uint64_t v20 = _AALogSystem();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67109378;
    v22[1] = v11;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "createAppleIDWithParameters calling handler with success %d error %@",  (uint8_t *)v22,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_3CAC(id *a1)
{
  id v2 = [a1[4] mutableCopy];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] appleID]);
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[5] password]);
  [v2 setValue:v4 forKey:@"password"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo appleIDClientIdentifier](&OBJC_CLASS___AADeviceInfo, "appleIDClientIdentifier"));
  [v2 setValue:v5 forKey:@"client-id"];

  id v6 = objc_alloc(&OBJC_CLASS___AASetupAssistantUpdateRequest);
  id v7 = a1[5];
  uint64_t v8 = v7[5];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 _signingSession]);
  id v10 = [v6 initWithAccount:v8 withAppleIDParameters:v2 signingSession:v9];

  int v11 = a1[5];
  if (v11[5])
  {
    id v12 = [[AADeviceProvisioningSession alloc] initWithAccount:*((void *)a1[5] + 5)];
    [v12 addProvisioningInfoToAARequest:v10];

    int v11 = a1[5];
  }

  [v10 setCookieStorage:v11[6]];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_3E40;
  v13[3] = &unk_14600;
  id v14 = a1[6];
  [v10 performRequestWithHandler:v13];
}

void sub_3E40(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    v21 = 0LL;
    unsigned int v16 = 0LL;
    int v22 = 0;
    uint64_t v20 = v9;
    goto LABEL_11;
  }

  id v11 = v8;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 status]);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 status]);
    unsigned int v15 = [v14 intValue];

    if (!v15)
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v11 personID]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v11 appleID]);
      int v22 = 1;
      goto LABEL_9;
    }
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v11 statusMessage]);

  if (!v16)
  {
    v21 = 0LL;
    int v22 = 0;
LABEL_9:
    uint64_t v20 = v10;
    goto LABEL_10;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 statusMessage]);
  [v17 setObject:v18 forKey:NSLocalizedDescriptionKey];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 status]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  (int)[v19 intValue],  v17));

  v21 = 0LL;
  unsigned int v16 = 0LL;
  int v22 = 0;
LABEL_10:

LABEL_11:
  uint64_t v23 = _AALogSystem();
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25[0] = 67109378;
    v25[1] = v22;
    __int16 v26 = 2112;
    v27 = v20;
    _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "updateAppleIDWithParameters calling handler with success %d error %@",  (uint8_t *)v25,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_41A4(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", *(void *)(a1 + 32), @"delegates");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appleID]);
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v3, @"apple-id");

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) password]);
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v4, @"password");

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) emailChoice]);
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v5, @"email-choice");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo appleIDClientIdentifier](&OBJC_CLASS___AADeviceInfo, "appleIDClientIdentifier"));
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v6, @"client-id");

  id v7 = objc_alloc(&OBJC_CLASS___AASetupAssistantSetupDelegatesRequest);
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = v8[5];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 _signingSession]);
  id v11 = [v7 initWithAccount:v9 withSetupParameters:v2 signingSession:v10];

  uint64_t v12 = *(void *)(a1 + 40);
  if (*(void *)(v12 + 40))
  {
    id v13 = [[AADeviceProvisioningSession alloc] initWithAccount:*(void *)(*(void *)(a1 + 40) + 40)];
    [v13 addProvisioningInfoToAARequest:v11];

    uint64_t v12 = *(void *)(a1 + 40);
  }

  [v11 setCookieStorage:*(void *)(v12 + 48)];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_4374;
  v14[3] = &unk_14600;
  id v15 = *(id *)(a1 + 48);
  [v11 performRequestWithHandler:v14];
}

void sub_4374(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    v21 = 0LL;
    uint64_t v20 = v9;
    goto LABEL_11;
  }

  id v11 = v8;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 status]);
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 status]);
    unsigned int v15 = [v14 intValue];

    if (!v15)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v11 responseParameters]);
      goto LABEL_9;
    }
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v11 statusMessage]);

  if (!v16)
  {
    v21 = 0LL;
LABEL_9:
    uint64_t v20 = v10;
    goto LABEL_10;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 statusMessage]);
  [v17 setObject:v18 forKey:NSLocalizedDescriptionKey];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 status]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  (int)[v19 intValue],  v17));

  v21 = 0LL;
LABEL_10:

LABEL_11:
  uint64_t v22 = _AALogSystem();
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    v25 = v20;
    _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "setupDelegateAccountsWithParameters calling handler with error %@",  (uint8_t *)&v24,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_4690(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", *(void *)(a1 + 32), @"delegates");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appleID]);
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v3, @"apple-id");

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) password]);
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v4, @"password");

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) emailChoice]);
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v5, @"email-choice");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo appleIDClientIdentifier](&OBJC_CLASS___AADeviceInfo, "appleIDClientIdentifier"));
  -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v6, @"client-id");

  id v7 = objc_alloc(&OBJC_CLASS___AALoginOrCreateDelegatesRequest);
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = v8[5];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 _signingSession]);
  id v11 = [v7 initWithAccount:v9 parameters:v2 signingSession:v10];

  uint64_t v12 = *(void *)(a1 + 40);
  if (*(void *)(v12 + 40))
  {
    id v13 = [[AADeviceProvisioningSession alloc] initWithAccount:*(void *)(*(void *)(a1 + 40) + 40)];
    [v13 addProvisioningInfoToAARequest:v11];

    uint64_t v12 = *(void *)(a1 + 40);
  }

  [v11 setCookieStorage:*(void *)(v12 + 48)];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_4860;
  v14[3] = &unk_14600;
  id v15 = *(id *)(a1 + 48);
  [v11 performRequestWithHandler:v14];
}

void sub_4860(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 status]);
    if (!v13
      || (id v14 = (void *)v13,
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 status]),
          unsigned int v16 = [v15 intValue],
          v15,
          v14,
          uint64_t v12 = v11,
          v16))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v10 statusMessage]);

      uint64_t v12 = v11;
      if (v17)
      {
        NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v10 statusMessage]);
        __int16 v26 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 status]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  (int)[v20 intValue],  v19));
      }
    }
  }

  uint64_t v21 = _AALogSystem();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    int v24 = v12;
    _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "loginDelegatesWithParameters calling completion handler with error %@",  (uint8_t *)&v23,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_4ADC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_4C38(uint64_t a1)
{
  id v2 = [[AASetupAssistantTermsFetchRequest alloc] initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
  if (*(void *)(*(void *)(a1 + 32) + 40LL))
  {
    id v3 = [[AADeviceProvisioningSession alloc] initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
    [v3 addProvisioningInfoToAARequest:v2];
  }

  if (*(void *)(a1 + 40)) {
    objc_msgSend(v2, "setCustomHeaders:");
  }
  [v2 setCookieStorage:*(void *)(*(void *)(a1 + 32) + 48)];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_4D24;
  v4[3] = &unk_14600;
  id v5 = *(id *)(a1 + 48);
  [v2 performRequestWithHandler:v4];
}

void sub_4D24(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 xmlUIData]);
    uint64_t v9 = _AALogSystem();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        LOWORD(v14) = 0;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "We got the new iCloud Terms from the server",  (uint8_t *)&v14,  2u);
      }
    }

    else if (v11)
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Fetching iCloud Terms failed with error: %@",  (uint8_t *)&v14,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v12 = _AALogSystem();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Fetching iCloud Terms failed with error: %@",  (uint8_t *)&v14,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_5088(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 upgradeStatus]);
    uint64_t v10 = _AALogSystem();
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        LOWORD(v16) = 0;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "We got the upgrade status from the server",  (uint8_t *)&v16,  2u);
      }

      (*(void (**)(void, id, id))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  [v9 BOOLValue],  v7);
    }

    else
    {
      if (v12)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 responseDictionary]);
        int v16 = 138412546;
        id v17 = v7;
        __int16 v18 = 2112;
        v19 = v15;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetching upgrade status failed with error: %@ response: %@",  (uint8_t *)&v16,  0x16u);
      }

      (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 1LL, v7);
    }
  }

  else
  {
    uint64_t v13 = _AALogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetching upgrade status got no response and error: %@",  (uint8_t *)&v16,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

uint64_t sub_5824(uint64_t a1)
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v1 = qword_19128;
  uint64_t v7 = qword_19128;
  if (!qword_19128)
  {
    v8[0] = *(_OWORD *)off_14698;
    v8[1] = *(_OWORD *)&off_146A8;
    uint64_t v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_19128 = v2;
    uint64_t v1 = v2;
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_58D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_58E8()
{
  id v3 = 0LL;
  uint64_t v0 = sub_5824((uint64_t)&v3);
  uint64_t v1 = v3;
  if (!v0)
  {
    uint64_t v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }

  if (v3) {
LABEL_5:
  }
    free(v1);
  return v0;
}

id sub_5940()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_19130;
  uint64_t v7 = qword_19130;
  if (!qword_19130)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_59F4;
    v3[3] = &unk_146C0;
    v3[4] = &v4;
    sub_59F4((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_59DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_59F4(uint64_t a1)
{
  Class result = objc_getClass("GKPlayerInternal");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_19130 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_C138();
    return (Class)sub_5A48();
  }

  return result;
}

id sub_5A48()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_19138;
  uint64_t v7 = qword_19138;
  if (!qword_19138)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_5AFC;
    v3[3] = &unk_146C0;
    v3[4] = &v4;
    sub_5AFC((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_5AE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

AAGKAuthenticationPlugin *sub_5AFC(uint64_t a1)
{
  Class result = (AAGKAuthenticationPlugin *)objc_getClass("GKPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_19138 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v3 = (AAGKAuthenticationPlugin *)sub_C15C();
    return -[AAGKAuthenticationPlugin init](v3, v4);
  }

  return result;
}

void sub_5ED8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_5EF8()
{
  if (qword_19158 != -1) {
    dispatch_once(&qword_19158, &stru_14B80);
  }
  return (id)qword_19150;
}

void sub_5F38(uint64_t a1)
{
  id v2 = sub_5EF8();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SEL v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "We timed out waiting on the server", v4, 2u);
  }

  [*(id *)(a1 + 32) cancelAllOperations];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_5FB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
  if (!v3)
  {
    id v8 = sub_5EF8();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_C1E4();
    }
    goto LABEL_7;
  }

  id v5 = sub_5EF8();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_C244();
    }
LABEL_7:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    goto LABEL_11;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Server auth was successful, not in Gray Mode anymore", buf, 2u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  objc_msgSend(*(id *)(a1 + 32), "aa_updateWithProvisioningResponse:", v3);
  objc_msgSend(*(id *)(a1 + 32), "aa_setNeedsToVerifyTerms:", 0);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_613C;
  v13[3] = &unk_14710;
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  id v14 = v11;
  uint64_t v15 = v12;
  [v9 saveVerifiedAccount:v10 withCompletionHandler:v13];

LABEL_11:
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

void sub_613C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = sub_5EF8();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_C2A4();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_6210(id a1)
{
  id v1 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", &off_15418);
  id v2 = (void *)qword_19140;
  qword_19140 = (uint64_t)v1;
}

uint64_t sub_6560(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_69C8(_Unwind_Exception *a1)
{
}

uint64_t sub_69E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_69F0(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

uint64_t sub_6A10(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void sub_6BB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_5EF8();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_C510();
    }

    [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
    if (v9)
    {
      id v10 = sub_5EF8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) username]);
        int v22 = 138412290;
        int v23 = v12;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Password-less auth succeeded! Time for login with Apple ID %@...",  (uint8_t *)&v22,  0xCu);
      }

      [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:v9 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationIDMSTokenKey]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);

      if ([*(id *)(a1 + 56) count]
        && [v14 count]
        && (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", *(void *)(a1 + 56))),
            int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14)),
            unsigned int v17 = [v15 isSubsetOfSet:v16],
            v16,
            v15,
            v17))
      {
        id v18 = sub_5EF8();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v22) = 0;
          _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "Password-less auth returned all the requested tokens!",  (uint8_t *)&v22,  2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      }

      else
      {
        id v20 = sub_5EF8();
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_C4E4();
        }

        [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
      }
    }
  }
}

void sub_7098(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:a2 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }

  else
  {
    id v6 = sub_5EF8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_C660();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_739C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_5EF8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_C6C0();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
    id v9 = sub_5EF8();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Password-based auth succeeded! Time for login with Apple ID %@...",  (uint8_t *)&v12,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

id sub_7754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2) {
    return [*(id *)(a1 + 32) _handleRenewFailure:a3 forAccount:*(void *)(a1 + 40) accountStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
}

void sub_7A38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_7AC0;
  v6[3] = &unk_14890;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _beginPETBasedLoginWithAccount:v4 PET:a2 store:v5 completion:v6];
}

uint64_t sub_7AC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_7AE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_5EF8();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_C7D8();
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:kACRenewCredentialsServicesKey]);
    id v7 = *(void **)(a1 + 40);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) username]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "aa_altDSID"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_7C20;
    v10[3] = &unk_148E0;
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    [v7 _convertPasswordToPETForAppleID:v8 altDSID:v9 password:v3 services:v6 completion:v10];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_7C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_5EF8();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin: Password from companion was successfully exchanged for PET. Logging in...",  v6,  2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_8148(_Unwind_Exception *a1)
{
}

void sub_8164(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 56))
  {
    id v9 = sub_5EF8();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_C984();
    }

    CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }

  id v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  id v12 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  [v12 removeObject:v13];

  if ((a2 & 1) == 0)
  {
    id v21 = sub_5EF8();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_C914();
    }
    goto LABEL_17;
  }

  if (!v7)
  {
    id v22 = sub_5EF8();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_C888();
    }
    goto LABEL_17;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v14);
  id v16 = sub_5EF8();
  unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_C8B4();
    }
LABEL_17:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    goto LABEL_18;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    int v23 = 138412290;
    uint64_t v24 = v19;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "ACRemoteDeviceProxy successfully provided us with a password for %@",  (uint8_t *)&v23,  0xCu);
  }

  id v20 = v7;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

LABEL_18:
  objc_sync_exit(v11);
}

void sub_8394(_Unwind_Exception *a1)
{
}

void sub_8644(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!v5 && !a2) {
    goto LABEL_21;
  }
  if (!a2) {
    goto LABEL_19;
  }
  if ([v5 code] != (char *)&stru_158.reloff + 1)
  {
    if ([v6 code] == (char *)&stru_158.flags + 1
      || [v6 code] == (char *)&stru_158.reloff + 3)
    {
      id v9 = sub_5EF8();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Got a 409/403, the account really is in Gray Mode", buf, 2u);
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _frontmostApplicationId]);
      unsigned int v12 = [v11 isEqualToString:@"com.apple.Preferences"];

      if (v12)
      {
        uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 72) + 16LL);
LABEL_20:
        v13();
        goto LABEL_21;
      }

      if (objc_msgSend(*(id *)(a1 + 40), "aa_needsToVerifyTerms")
        && (objc_msgSend(*(id *)(a1 + 40), "_aa_skipATVTermsPrompt") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "_aa_recordATVTermsPrompt");
        id v14 = sub_5EF8();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Present Grey Mode dialog", buf, 2u);
        }

        *(void *)buf = 0LL;
        id v20 = buf;
        uint64_t v21 = 0x3032000000LL;
        id v22 = sub_88AC;
        int v23 = sub_88BC;
        id v24 = (id)os_transaction_create("com.apple.appleaccount.terms.alert");
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = nullsub_1;
        v18[3] = &unk_146C0;
        v18[4] = buf;
        [v16 _presentGrayModeAlertForAccount:v17 completion:v18];
        _Block_object_dispose(buf, 8);
      }
    }

LABEL_19:
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 72) + 16LL);
    goto LABEL_20;
  }

  id v7 = sub_5EF8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Auth was bad, re-authenticate...", buf, 2u);
  }

  [*(id *)(a1 + 32) _authenticateAccount:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
LABEL_21:
}

void sub_8894( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_88AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_88BC(uint64_t a1)
{
}

uint64_t sub_8B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_8F64(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) username]);
  [v2 setUsername:v3];

  [v2 setIsUsernameEditable:0];
  [v2 setReason:*(void *)(a1 + 40)];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "aa_personID"));
  [v2 setDSID:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "aa_altDSID"));
  [v2 setAltDSID:v5];

  [v2 setAnticipateEscrowAttempt:1];
  [v2 setAuthenticationType:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword"));

  if (v6)
  {
    id v7 = sub_5EF8();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "AppleIDAuthenticationPlugin: will try auth with cached password first...",  buf,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword"));
    [v2 _setPassword:v9];

    [v2 setAuthenticationType:1];
  }

  [v2 _setProxyingForApp:1];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) client]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  [v2 _setProxiedAppName:v11];

  if (*(void *)(a1 + 56))
  {
    objc_msgSend(v2, "_setProxiedAppBundleID:");
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) client]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleID]);
    [v2 _setProxiedAppBundleID:v13];
  }

  if (*(void *)(a1 + 64))
  {
    objc_msgSend(v2, "setProxiedDevice:");
  }

  else if (*(_BYTE *)(a1 + 120))
  {
    [v2 setAuthenticationType:1];
  }

  uint64_t v14 = *(void *)(a1 + 32);
  v40[0] = @"account";
  v40[1] = @"accountStore";
  uint64_t v15 = *(void *)(a1 + 48);
  v41[0] = v14;
  v41[1] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));
  [v2 setClientInfo:v16];

  if (*(void *)(a1 + 112)) {
    objc_msgSend(v2, "setServiceType:");
  }
  if (*(void *)(a1 + 72))
  {
    id v17 = sub_5EF8();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_CA44((uint64_t *)(a1 + 72), v18, v19);
    }

    [v2 setServiceIdentifiers:*(void *)(a1 + 72)];
    [v2 setShouldUpdatePersistentServiceTokens:1];
  }

  id v20 = sub_5EF8();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_CA18();
  }
  BOOL v22 = v6 != 0LL;

  int v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 80) _authController]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_9368;
  v27[3] = &unk_149F8;
  BOOL v36 = v22;
  id v24 = *(id *)(a1 + 32);
  uint64_t v25 = *(void *)(a1 + 80);
  id v28 = v24;
  uint64_t v29 = v25;
  id v30 = *(id *)(a1 + 48);
  id v31 = *(id *)(a1 + 88);
  id v32 = *(id *)(a1 + 96);
  id v35 = *(id *)(a1 + 104);
  char v37 = *(_BYTE *)(a1 + 120);
  id v33 = *(id *)(a1 + 64);
  id v34 = v2;
  char v38 = *(_BYTE *)(a1 + 121);
  id v26 = v2;
  [v23 authenticateWithContext:v26 completion:v27];
}

void sub_9368(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && *(_BYTE *)(a1 + 96))
  {
    id v7 = sub_5EF8();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_CAB0();
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
    [*(id *)(a1 + 40) _authenticateAccount:*(void *)(a1 + 32) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 88)];
  }

  else
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_95DC;
    v24[3] = &unk_149A8;
    objc_copyWeak(&v32, &location);
    id v25 = *(id *)(a1 + 56);
    char v33 = *(_BYTE *)(a1 + 97);
    id v9 = v6;
    id v26 = v9;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    unsigned int v12 = *(void **)(a1 + 48);
    id v27 = v10;
    uint64_t v28 = v11;
    id v29 = v12;
    id v30 = *(id *)(a1 + 72);
    id v31 = *(id *)(a1 + 88);
    uint64_t v13 = objc_retainBlock(v24);
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 80);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_9744;
    v17[3] = &unk_149D0;
    v17[4] = v14;
    id v18 = v5;
    id v19 = v9;
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    char v23 = *(_BYTE *)(a1 + 98);
    id v16 = v13;
    id v22 = v16;
    [v14 _validateAuthenticationResults:v18 error:v19 forContext:v15 completion:v17];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void sub_95C0(_Unwind_Exception *a1)
{
}

void sub_95DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:kACRenewCredentialsShouldForceKey]);
  if (([v7 BOOLValue] & 1) != 0 || *(_BYTE *)(a1 + 96))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"AARenewShouldPostFollowUp"]);
    unsigned int v9 = [v8 BOOLValue];
  }

  else
  {
    unsigned int v9 = 1;
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "ak_isUnableToPromptError") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "ak_isUserCancelError") & 1) != 0)
  {
    unsigned int v10 = 1;
    if (!a2) {
      goto LABEL_15;
    }
  }

  else
  {
    unsigned int v10 = objc_msgSend(*(id *)(a1 + 40), "ak_isAuthenticationErrorWithCode:", -7014);
    if (!a2) {
      goto LABEL_15;
    }
  }

  if ((v10 & v9) != 0)
  {
    id v11 = sub_5EF8();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_CB10(a1, v12, v13, v14, v15, v16, v17, v18);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 56) _userInfoForRenewCredentialsFollowUpWithAccountStore:*(void *)(a1 + 64) proxiedDevice:*(void *)(a1 + 72)]);
    if (WeakRetained) {
      [WeakRetained[3] postFollowUpWithIdentifier:AAFollowUpIdentifierRenewCredentials forAccount:*(void *)(a1 + 48) userInfo:v19 completion:0];
    }
  }

LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
}

LABEL_16:
    v12[2](v12, a4 == 0LL);
    goto LABEL_17;
  }

  id v32 = self;
  char v23 = (void *)objc_claimAutoreleasedReturnValue([v11 proxiedDevice]);

  id v24 = sub_5EF8();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin: will not call loginDelegates, because this is a proxied device authentication.",  buf,  2u);
    }

    goto LABEL_16;
  }

  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin: will attempt loginDelegates...",  buf,  2u);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v15 credential]);
  if (v27)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v15 credential]);
    [v28 setPassword:v13];
  }

  else
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountCredential credentialWithPassword:]( &OBJC_CLASS___ACAccountCredential,  "credentialWithPassword:",  v13));
    [v15 setCredential:v28];
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:AKAuthenticationRawPasswordKey]);
  id v30 = sub_5EF8();
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v37 = v15;
    _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin: will set raw password for account %@ so that our plugins will be happy.",  buf,  0xCu);
  }

  if (v29) {
    objc_msgSend(v15, "_aa_setRawPassword:", v29);
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_9CB0;
  v33[3] = &unk_14A70;
  id v34 = v15;
  id v35 = v12;
  -[AAGKAuthenticationPlugin _fetchTokenForAccount:accountStore:withHandler:]( v32,  "_fetchTokenForAccount:accountStore:withHandler:",  v34,  v16,  v33);

LABEL_17:
}

id sub_9744(uint64_t a1, int a2)
{
  if (!a2) {
    return +[AAAuthenticationErrorHandler handleAuthenticationError:resetAuthenticatedOnAlertFailure:forAccount:inStore:completion:]( &OBJC_CLASS___AAAuthenticationErrorHandler,  "handleAuthenticationError:resetAuthenticatedOnAlertFailure:forAccount:inStore:completion:",  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 80),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72));
  }
  id v3 = sub_5EF8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAGKAuthenticationPlugin: Continue authenticating...", v6, 2u);
  }

  return [*(id *)(a1 + 32) _handleAuthenticationResults:*(void *)(a1 + 40) error:*(void *)(a1 + 48) forAccount:*(void *)(a1 + 56) inStore:*(void *)(a1 + 64) resetAuthenticatedOnAlertFailure:*(unsigned __int8 *)(a1 + 80) completion:*(void *)(a1 + 72)];
}

uint64_t sub_97E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_9CB0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_5EF8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin: loginDelegates succeeded!",  (uint8_t *)&v9,  2u);
    }
  }

  else
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin: loginDelegates failed with error: %@",  (uint8_t *)&v9,  0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_9F40(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AKAuthenticationPasswordKey]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) credential]);

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) credential]);
    [v3 setPassword:v4];
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountCredential credentialWithPassword:]( &OBJC_CLASS___ACAccountCredential,  "credentialWithPassword:",  v4));
    [*(id *)(a1 + 40) setCredential:v3];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_A268(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_5EF8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v16[0]) = a2;
    WORD2(v16[0]) = 2112;
    *(void *)((char *)v16 + 6) = v5;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin: saving raw password result was %d. Error: %@",  buf,  0x12u);
  }

  if (*(void *)(a1 + 32))
  {
    id v8 = sub_5EF8();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16[0] = v10;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin setting raw password for iCloud account %@",  buf,  0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_setRawPassword:", *(void *)(a1 + 40));
    uint64_t v11 = *(void *)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_A3F4;
    v13[3] = &unk_14890;
    unsigned int v12 = *(void **)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    [v12 saveVerifiedAccount:v11 withCompletionHandler:v13];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_A3F4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_5EF8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AAGKAuthenticationPlugin: saving raw password result was %d. Error: %@",  (uint8_t *)v8,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_A6D0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 status]);
  id v9 = [v8 integerValue];

  if (v6 || v9)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 statusMessage]);

    if (v15)
    {
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      id v25 = v15;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  v9,  v16));

      id v6 = (id)v17;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) credential]);
    [v18 setPassword:0];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 responseParameters]);

    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_A8C8;
    v19[3] = &unk_14AC0;
    id v20 = v13;
    id v21 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    id v22 = 0LL;
    id v23 = v14;
    [v10 _processAuthenticationResponseParameters:v11 accountStore:v12 account:v20 completion:v19];

    id v6 = v20;
  }
}

uint64_t sub_A8C8(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectID]);

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*v2 dirtyProperties]);
    id v5 = [v4 count];

    if (v5)
    {
      id v6 = sub_5EF8();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_CB78(v2, v7);
      }
    }

    [*(id *)(a1 + 32) refresh];
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ACDKeychainManager credentialForAccount:clientID:]( &OBJC_CLASS___ACDKeychainManager,  "credentialForAccount:clientID:",  *(void *)(a1 + 32),  0LL));
    [v8 setPassword:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setCredential:v8];
  }

  id v9 = sub_5EF8();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Completed storing tokens", v12, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

LABEL_7:
  id v20 = sub_5EF8();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_CC14();
  }

  v13[2](v13);
LABEL_10:
}

LABEL_69:
          global_queue = dispatch_get_global_queue(0LL, 0LL);
          v97 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          dispatch_group_notify(groupa, v97, v12);
        }

        else
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_DEFAULT,  "Existing Game Center account did not match the Apple ID",  buf,  2u);
          }

          v12[2](v12);
        }

        _Block_object_dispose(v143, 8);
        _Block_object_dispose(&v132, 8);
        _Block_object_dispose(&v136, 8);
      }

      else
      {
        v51 = sub_5EF8();
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v143 = 138413058;
          *(void *)&v143[4] = v111;
          *(_WORD *)&v143[12] = 2112;
          *(void *)&v143[14] = v110;
          *(_WORD *)&v143[22] = 2112;
          v144 = v107;
          LOWORD(v145) = 2112;
          *(void *)((char *)&v145 + 2) = v108;
          _os_log_error_impl( &dword_0,  v52,  OS_LOG_TYPE_ERROR,  "Did not receive the required parameters. Apple ID: %@ DSID: %@ playerID: %@ token: %@",  v143,  0x2Au);
        }

        v12[2](v12);
      }
    }

    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_CF60();
      }

      v12[2](v12);
    }
  }
}

void sub_B9DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_BA48(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
  unsigned int v9 = [v8 isEqualToString:a1[4]];

  if (v9)
  {
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
    objc_storeStrong((id *)(*(void *)(a1[8] + 8LL) + 40LL), a2);
    id v10 = sub_5EF8();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_D0FC(v7, v11);
    }

    *a4 = 1;
  }

  if (a1[5])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 accountPropertyForKey:@"altDSID"]);
    unsigned int v13 = [v12 isEqualToString:a1[5]];

    if (v13)
    {
      *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
      objc_storeStrong((id *)(*(void *)(a1[8] + 8LL) + 40LL), a2);
      id v14 = sub_5EF8();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_D074();
      }

      *a4 = 1;
    }
  }

  if (a1[6])
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 accountPropertyForKey:@"dsid"]);
    unsigned int v17 = [v16 isEqualToString:a1[6]];

    if (v17)
    {
      *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
      objc_storeStrong((id *)(*(void *)(a1[8] + 8LL) + 40LL), a2);
      id v18 = sub_5EF8();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_CFEC();
      }

      *a4 = 1;
    }
  }
}

void sub_BC20(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 credential]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 token]);

  if (v5)
  {
    if (([v5 isEqualToString:@"<gone>"] & 1) == 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a1[6]));
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKCredentialScope-%@",  v6));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 accountPropertyForKey:v7]);
      unsigned __int8 v9 = [v8 unsignedIntegerValue];

      if ((v9 & 4) != 0)
      {
        id v10 = sub_5EF8();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_D17C(v3, v11);
        }

        *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
        *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
      }
    }
  }
}

void sub_BD50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_5EF8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_D27C();
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_D1FC(a1, v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_BDD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_5EF8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_D27C();
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) shortDebugName]);
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "Saving the game center account %@ succeeded.",  (uint8_t *)&v9,  0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_BFF4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.appleaccount", "gamecenter");
  uint64_t v2 = (void *)qword_19150;
  qword_19150 = (uint64_t)v1;
}

void sub_C024( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_C034( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_C044(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_C064( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_C098(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_C0A4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t sub_C0C8(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_C138()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "GKPlayerInternal");
  return sub_C15C(v0);
}

uint64_t sub_C15C()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "GKPreferences");
  return sub_C180(v0);
}

void sub_C180()
{
}

void sub_C1E4()
{
}

void sub_C244()
{
}

void sub_C2A4()
{
}

void sub_C304()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 accountType]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountTypeDescription]);
  sub_C0B0();
  sub_C098(&dword_0, v0, v4, "Unable to get credential for %@ account! Error = %@", v5);

  sub_C088();
}

void sub_C398()
{
}

void sub_C3FC()
{
}

void sub_C428()
{
}

void sub_C454()
{
}

void sub_C480()
{
}

void sub_C4E4()
{
}

void sub_C510()
{
}

void sub_C570()
{
}

void sub_C5D0()
{
}

void sub_C634()
{
}

void sub_C660()
{
}

void sub_C6C0()
{
}

void sub_C720()
{
}

void sub_C74C()
{
}

void sub_C778()
{
}

void sub_C7D8()
{
}

void sub_C804()
{
}

void sub_C830()
{
}

void sub_C85C()
{
}

void sub_C888()
{
}

void sub_C8B4()
{
}

void sub_C914()
{
  uint64_t v3 = v0;
  sub_C098( &dword_0,  v1,  (uint64_t)v1,  "Failed to obtain a password from ACRemoteDeviceProxy for account %@! Error: %@",  v2);
  sub_C050();
}

void sub_C984()
{
}

void sub_C9B0()
{
}

void sub_CA18()
{
}

void sub_CA44(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_C044( &dword_0,  a2,  a3,  "AAGKAuthenticationPlugin: will request GS service tokens resulting from auth: %@.",  (uint8_t *)&v4);
  sub_C050();
}

void sub_CAB0()
{
}

void sub_CB10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CB78(id *a1, os_log_s *a2)
{
  id v3 = *a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*a1 dirtyProperties]);
  int v6 = 138412546;
  id v7 = v3;
  __int16 v8 = 2112;
  int v9 = v4;
  sub_C0A4( &dword_0,  a2,  v5,  "AAGKAuthenticationPlugin about to refresh to pick up changes made by auth delegates, but the account already has the following dirty properties, which might spell t-r-o-u-b-l-e: %@ %@",  (uint8_t *)&v6);

  sub_C088();
}

void sub_CC14()
{
}

void sub_CC40()
{
}

void sub_CCA4()
{
}

void sub_CD08(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_C044(&dword_0, a3, (uint64_t)a3, "All account properties: %@", (uint8_t *)a2);
}

void sub_CD54()
{
}

void sub_CD80(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_C044(&dword_0, a3, (uint64_t)a3, "Updating token for account %@", (uint8_t *)a2);
}

void sub_CDCC()
{
}

void sub_CDF8()
{
  uint64_t v3 = v0;
  sub_C0A4( &dword_0,  v1,  (uint64_t)v1,  "Looked at the existing account. We want to create a new GC account (%@), and existingPrimaryAccount is %@",  v2);
  sub_C050();
}

void sub_CE94()
{
}

void sub_CEF8()
{
}

void sub_CF60()
{
}

void sub_CF8C()
{
}

void sub_CFEC()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 username]);
  sub_C0F4();
  sub_C0A4(&dword_0, v0, v3, "Found a gamecenter ACAccount (%@) with same dsid than incoming account:%@", v4);

  sub_C088();
}

void sub_D074()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 username]);
  sub_C0F4();
  sub_C0A4(&dword_0, v0, v3, "Found a gamecenter ACAccount (%@) with same altDSID than incoming account:%@", v4);

  sub_C088();
}

void sub_D0FC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 username]);
  sub_C058();
  sub_C044(&dword_0, a2, v4, "Will populate existing account '%@' with production token", v5);

  sub_C0DC();
}

void sub_D17C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 username]);
  sub_C058();
  sub_C044(&dword_0, a2, v4, "Existing primary production account '%@'", v5);

  sub_C0DC();
}

void sub_D1FC(uint64_t a1, os_log_s *a2)
{
  id v3 = [(id)sub_C0C8(a1) shortDebugName];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_C058();
  sub_C044(&dword_0, a2, v5, "Saving the game center account %@ succeeded.", v6);

  sub_C0DC();
}

void sub_D27C()
{
  id v2 = [(id)sub_C0C8(v1) shortDebugName];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_C0B0();
  sub_C098(&dword_0, v0, v4, "Saving the game center account %@ failed. Error: %@", v5);

  sub_C088();
}

id objc_msgSend__handleAuthenticationResults_error_forAccount_inStore_resetAuthenticatedOnAlertFailure_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_handleAuthenticationResults:error:forAccount:inStore:resetAuthenticatedOnAlertFailure:completion:");
}

id objc_msgSend__processAuthenticationResponseParameters_accountStore_account_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processAuthenticationResponseParameters:accountStore:account:completion:");
}

id objc_msgSend__renewCredentialsForAccount_accountStore_options_errorMessage_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_renewCredentialsForAccount:accountStore:options:errorMessage:completion:");
}

id objc_msgSend__silentlyAuthenticateAppleID_altDSID_companionDevice_services_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_silentlyAuthenticateAppleID:altDSID:companionDevice:services:completion:");
}

id objc_msgSend_handleAuthenticationError_resetAuthenticatedOnAlertFailure_forAccount_inStore_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAuthenticationError:resetAuthenticatedOnAlertFailure:forAccount:inStore:completion:");
}

id objc_msgSend_showUserNotificationWithTitle_message_cancelButtonTitle_otherButtonTitle_withCompletionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:");
}

id objc_msgSend_xmlUIData(void *a1, const char *a2, ...)
{
  return [a1 xmlUIData];
}
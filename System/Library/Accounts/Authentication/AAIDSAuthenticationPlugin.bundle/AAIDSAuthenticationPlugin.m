void sub_3FE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_4008()
{
  if (qword_14DB8 != -1) {
    dispatch_once(&qword_14DB8, &stru_10A68);
  }
  return (id)qword_14DB0;
}

void sub_4048(uint64_t a1)
{
  id v2 = sub_4008();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "We timed out waiting on the server", v4, 2u);
  }

  [*(id *)(a1 + 32) cancelAllOperations];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_40C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
  if (!v3)
  {
    id v8 = sub_4008();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_A030();
    }
    goto LABEL_7;
  }

  id v5 = sub_4008();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_A090();
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
  v9 = *(void **)(a1 + 40);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_424C;
  v13[3] = &unk_10558;
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  id v14 = v11;
  uint64_t v15 = v12;
  [v9 saveVerifiedAccount:v10 withCompletionHandler:v13];

LABEL_11:
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

void sub_424C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = sub_4008();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_A0F0();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_4320(id a1)
{
  v1 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", &off_10EE0);
  id v2 = (void *)qword_14DA0;
  qword_14DA0 = (uint64_t)v1;
}

uint64_t sub_4670(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_4AF0(_Unwind_Exception *a1)
{
}

uint64_t sub_4B0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_4B18(uint64_t a1, int a2)
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

uint64_t sub_4B38(uint64_t a1, int a2)
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

void sub_4CE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_4008();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_A370();
    }

    [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
    if (v9)
    {
      id v10 = sub_4008();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) username]);
        int v22 = 138412290;
        v23 = v12;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Password-less auth succeeded! Time for login with Apple ID %@...",  (uint8_t *)&v22,  0xCu);
      }

      [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:v9 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationIDMSTokenKey]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);

      if ([*(id *)(a1 + 56) count]
        && [v14 count]
        && (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", *(void *)(a1 + 56))),
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14)),
            unsigned int v17 = [v15 isSubsetOfSet:v16],
            v16,
            v15,
            v17))
      {
        id v18 = sub_4008();
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
        id v20 = sub_4008();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_A344();
        }

        [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
      }
    }
  }
}

void sub_51C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:a2 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }

  else
  {
    id v6 = sub_4008();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_A4BC();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_54C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_4008();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_A51C();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
    id v9 = sub_4008();
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

id sub_587C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2) {
    return [*(id *)(a1 + 32) _handleRenewFailure:a3 forAccount:*(void *)(a1 + 40) accountStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
}

void sub_5B60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_5BE8;
  v6[3] = &unk_106D8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _beginPETBasedLoginWithAccount:v4 PET:a2 store:v5 completion:v6];
}

uint64_t sub_5BE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_5C08(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_4008();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_A634();
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:kACRenewCredentialsServicesKey]);
    id v7 = *(void **)(a1 + 40);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) username]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "aa_altDSID"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_5D48;
    v10[3] = &unk_10728;
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    [v7 _convertPasswordToPETForAppleID:v8 altDSID:v9 password:v3 services:v6 completion:v10];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_5D48(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_4008();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin: Password from companion was successfully exchanged for PET. Logging in...",  v6,  2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_6270(_Unwind_Exception *a1)
{
}

void sub_628C(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 56))
  {
    id v9 = sub_4008();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_A7E4();
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
    id v21 = sub_4008();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_A770((void *)(a1 + 40), (uint64_t)v8, v18);
    }
    goto LABEL_17;
  }

  if (!v7)
  {
    id v22 = sub_4008();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_A6E4();
    }
    goto LABEL_17;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v14);
  id v16 = sub_4008();
  unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_A710();
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

void sub_64BC(_Unwind_Exception *a1)
{
}

void sub_676C(uint64_t a1, int a2, void *a3)
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
      id v9 = sub_4008();
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
        id v14 = sub_4008();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Present Grey Mode dialog", buf, 2u);
        }

        *(void *)buf = 0LL;
        id v20 = buf;
        uint64_t v21 = 0x3032000000LL;
        id v22 = sub_69D4;
        int v23 = sub_69E4;
        id v24 = (id)os_transaction_create("com.apple.appleaccount.terms.alert");
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = nullsub_1;
        v18[3] = &unk_107A0;
        v18[4] = buf;
        [v16 _presentGrayModeAlertForAccount:v17 completion:v18];
        _Block_object_dispose(buf, 8);
      }
    }

LABEL_19:
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 72) + 16LL);
    goto LABEL_20;
  }

  id v7 = sub_4008();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Auth was bad, re-authenticate...", buf, 2u);
  }

  [*(id *)(a1 + 32) _authenticateAccount:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
LABEL_21:
}

void sub_69BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_69D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_69E4(uint64_t a1)
{
}

uint64_t sub_6C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}
}

void sub_708C(uint64_t a1)
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
    id v7 = sub_4008();
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
  v45[0] = @"account";
  v45[1] = @"accountStore";
  uint64_t v15 = *(void *)(a1 + 48);
  v46[0] = v14;
  v46[1] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));
  [v2 setClientInfo:v16];

  if (*(void *)(a1 + 112)) {
    objc_msgSend(v2, "setServiceType:");
  }
  if (*(void *)(a1 + 72))
  {
    id v17 = sub_4008();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_A89C(a1 + 72, v18, v19, v20, v21, v22, v23, v24);
    }

    [v2 setServiceIdentifiers:*(void *)(a1 + 72)];
    [v2 setShouldUpdatePersistentServiceTokens:1];
  }

  id v25 = sub_4008();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_A870();
  }
  BOOL v27 = v6 != 0LL;

  v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 80) _authController]);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_7490;
  v32[3] = &unk_10868;
  BOOL v41 = v27;
  id v29 = *(id *)(a1 + 32);
  uint64_t v30 = *(void *)(a1 + 80);
  id v33 = v29;
  uint64_t v34 = v30;
  id v35 = *(id *)(a1 + 48);
  id v36 = *(id *)(a1 + 88);
  id v37 = *(id *)(a1 + 96);
  id v40 = *(id *)(a1 + 104);
  char v42 = *(_BYTE *)(a1 + 120);
  id v38 = *(id *)(a1 + 64);
  id v39 = v2;
  char v43 = *(_BYTE *)(a1 + 121);
  id v31 = v2;
  [v28 authenticateWithContext:v31 completion:v32];
}

void sub_7490(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && *(_BYTE *)(a1 + 96))
  {
    id v7 = sub_4008();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_A904();
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
    [*(id *)(a1 + 40) _authenticateAccount:*(void *)(a1 + 32) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 88)];
  }

  else
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_7704;
    v24[3] = &unk_10818;
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
    v17[2] = sub_786C;
    v17[3] = &unk_10840;
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

void sub_76E8(_Unwind_Exception *a1)
{
}

void sub_7704(uint64_t a1, uint64_t a2, void *a3)
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
    id v11 = sub_4008();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_A964(a1, v12, v13, v14, v15, v16, v17, v18);
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

  uint64_t v24 = _AALogSystem();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin: will not call loginDelegates, because this is a proxied device authentication.",  buf,  2u);
    }

    goto LABEL_16;
  }

  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin: will attempt loginDelegates...",  buf,  2u);
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
  id v30 = _AALogSystem();
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v15;
    _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin: will set raw password for account %@ so that our plugins will be happy.",  buf,  0xCu);
  }

  if (v29) {
    objc_msgSend(v15, "_aa_setRawPassword:", v29);
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_7DD8;
  v33[3] = &unk_108E0;
  uint64_t v34 = v15;
  id v35 = v12;
  -[AAIDSAuthenticationPlugin _fetchTokenForAccount:accountStore:withHandler:]( v32,  "_fetchTokenForAccount:accountStore:withHandler:",  v34,  v16,  v33);

LABEL_17:
}

id sub_786C(uint64_t a1, int a2)
{
  if (!a2) {
    return +[AAAuthenticationErrorHandler handleAuthenticationError:resetAuthenticatedOnAlertFailure:forAccount:inStore:completion:]( &OBJC_CLASS___AAAuthenticationErrorHandler,  "handleAuthenticationError:resetAuthenticatedOnAlertFailure:forAccount:inStore:completion:",  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 80),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72));
  }
  uint64_t v3 = _AALogSystem();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAIDSAuthenticationPlugin: Continue authenticating...", v6, 2u);
  }

  return [*(id *)(a1 + 32) _handleAuthenticationResults:*(void *)(a1 + 40) error:*(void *)(a1 + 48) forAccount:*(void *)(a1 + 56) inStore:*(void *)(a1 + 64) resetAuthenticatedOnAlertFailure:*(unsigned __int8 *)(a1 + 80) completion:*(void *)(a1 + 72)];
}

uint64_t sub_7910(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_7DD8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin: loginDelegates succeeded!",  (uint8_t *)&v9,  2u);
    }
  }

  else
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin: loginDelegates failed with error: %@",  (uint8_t *)&v9,  0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_8068(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AKAuthenticationPasswordKey]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) credential]);

  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) credential]);
    [v3 setPassword:v4];
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountCredential credentialWithPassword:]( &OBJC_CLASS___ACAccountCredential,  "credentialWithPassword:",  v4));
    [*(id *)(a1 + 40) setCredential:v3];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_8390(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_4008();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v16[0]) = a2;
    WORD2(v16[0]) = 2112;
    *(void *)((char *)v16 + 6) = v5;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin: saving raw password result was %d. Error: %@",  buf,  0x12u);
  }

  if (*(void *)(a1 + 32))
  {
    id v8 = sub_4008();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16[0] = v10;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin setting raw password for iCloud account %@",  buf,  0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_setRawPassword:", *(void *)(a1 + 40));
    uint64_t v11 = *(void *)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_851C;
    v13[3] = &unk_106D8;
    unsigned int v12 = *(void **)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    [v12 saveVerifiedAccount:v11 withCompletionHandler:v13];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_851C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_4008();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AAIDSAuthenticationPlugin: saving raw password result was %d. Error: %@",  (uint8_t *)v8,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_87F4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 status]);
  id v10 = [v9 integerValue];

  if (v7 || v10)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v8 statusMessage]);
    uint64_t v18 = (void *)v17;
    if (v17)
    {
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      uint64_t v30 = v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  v10,  v19));

      id v7 = (id)v20;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) credential]);
    [v21 setPassword:0];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    uint64_t v11 = *(void **)(a1 + 40);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 responseParameters]);
    uint64_t v13 = *(void *)(a1 + 48);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_8A08;
    v22[3] = &unk_10958;
    id v23 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    id v24 = v14;
    uint64_t v25 = v15;
    id v26 = v8;
    id v16 = *(id *)(a1 + 64);
    id v27 = 0LL;
    id v28 = v16;
    [v11 _processAuthenticationResponseParameters:v12 accountStore:v13 completion:v22];

    id v7 = v23;
  }
}

void sub_8A08(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectID]);

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*v2 dirtyProperties]);
    id v5 = [v4 count];

    if (v5)
    {
      id v6 = sub_4008();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_A9CC(v2, v7);
      }
    }

    [*(id *)(a1 + 32) refresh];
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ACDKeychainManager credentialForAccount:clientID:]( &OBJC_CLASS___ACDKeychainManager,  "credentialForAccount:clientID:",  *(void *)(a1 + 32),  0LL));
    [v8 setPassword:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setCredential:v8];
  }

  if (+[AAIDSAuthenticationPlugin _doesRelyOnCompanionAccounts]( &OBJC_CLASS___AAIDSAuthenticationPlugin,  "_doesRelyOnCompanionAccounts")
    && (uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _parametersForIDSAlertFromLoginResponse:*(void *)(a1 + 56)])) != 0)
  {
    id v10 = (void *)v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  -6LL,  v9));
    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  }

  else
  {
    id v12 = sub_4008();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Completed storing tokens", v14, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  }

void sub_90B0(uint64_t a1)
{
}

id sub_90B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"uri"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _stripFZIDPrefix]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"status"]);
  unsigned int v7 = [v6 intValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"is-user-visible"]);
  if (v7 == 5051) {
    id v9 = v5;
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

uint64_t sub_9194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_9AF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_4008();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_debug_impl( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "Setting account property (%@) for key (%@) on account with identifier (%@).",  (uint8_t *)&v10,  0x20u);
  }

  [*(id *)(a1 + 32) setAccountProperty:v6 forKey:v5];
}

void sub_9C00(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  if (v5 && a2 && a3)
  {
    id v6 = a2;
    uint64_t v7 = IDSAccountKeyForServerKey(a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v8]);

    if (v9)
    {
      id v10 = sub_4008();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        int v13 = 138412802;
        __int16 v14 = v9;
        __int16 v15 = 2112;
        id v16 = v8;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_debug_impl( &dword_0,  v11,  OS_LOG_TYPE_DEBUG,  "Setting %@ for key %@ on account with identifier: %@",  (uint8_t *)&v13,  0x20u);
      }

      [v5 setAccountProperty:v9 forKey:v8];
    }
  }
}

void sub_9D44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_4008();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "Saved account (%@) with object ID (%@) and error (%@).",  (uint8_t *)&v10,  0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_9E28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_9EF0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.appleaccount", "ids");
  uint64_t v2 = (void *)qword_14DB0;
  qword_14DB0 = (uint64_t)v1;
}

void sub_9F20( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_9F30( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_9F48( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_9F78( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_9FA0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_9FAC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_9FD0()
{
}

void sub_A030()
{
}

void sub_A090()
{
}

void sub_A0F0()
{
}

void sub_A150(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 accountType]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountTypeDescription]);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "Unable to get credential for %@ account! Error = %@",  (uint8_t *)&v7,  0x16u);

  sub_9FC0();
}

void sub_A200()
{
}

void sub_A260()
{
}

void sub_A28C()
{
}

void sub_A2B8()
{
}

void sub_A2E4()
{
}

void sub_A344()
{
}

void sub_A370()
{
}

void sub_A3D0()
{
}

void sub_A430()
{
}

void sub_A490()
{
}

void sub_A4BC()
{
}

void sub_A51C()
{
}

void sub_A57C()
{
}

void sub_A5A8()
{
}

void sub_A5D4()
{
}

void sub_A634()
{
}

void sub_A660()
{
}

void sub_A68C()
{
}

void sub_A6B8()
{
}

void sub_A6E4()
{
}

void sub_A710()
{
}

void sub_A770(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_9FAC( &dword_0,  a2,  a3,  "Failed to obtain a password from ACRemoteDeviceProxy for account %@! Error: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_9F40();
}

void sub_A7E4()
{
}

void sub_A810()
{
}

void sub_A870()
{
}

void sub_A89C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A904()
{
}

void sub_A964( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A9CC(id *a1, os_log_s *a2)
{
  id v3 = *a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*a1 dirtyProperties]);
  int v6 = 138412546;
  id v7 = v3;
  __int16 v8 = 2112;
  __int16 v9 = v4;
  sub_9FA0( &dword_0,  a2,  v5,  "AAIDSAuthenticationPlugin about to refresh to pick up changes made by auth delegates, but the account already has th e following dirty properties, which might spell t-r-o-u-b-l-e: %@ %@",  (uint8_t *)&v6);

  sub_9FC0();
}

void sub_AA68()
{
}

void sub_AAC8()
{
}

void sub_AB28()
{
}

void sub_AB54()
{
}

void sub_ABB4()
{
}

void sub_AC1C()
{
}

id objc_msgSend__handleAuthenticationResults_error_forAccount_inStore_resetAuthenticatedOnAlertFailure_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_handleAuthenticationResults:error:forAccount:inStore:resetAuthenticatedOnAlertFailure:completion:");
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

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               char v33 = (void *)objc_claimAutoreleasedReturnValue([v31 accountProperties]);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"originalUsername"]);

          id v35 = (void *)objc_claimAutoreleasedReturnValue([v31 accountProperties]);
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v83]);

          if (([v32 isEqualToIgnoringCase:v17] & 1) != 0
            || ([v34 isEqualToIgnoringCase:v17] & 1) != 0
            || [v36 isEqualToIgnoringCase:v70])
          {
            id v37 = sub_4008();
            id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v101 = v31;
              _os_log_debug_impl(&dword_0, v38, OS_LOG_TYPE_DEBUG, "Found matching account (%@).", buf, 0xCu);
            }

            [v81 addObject:v31];
            id v39 = IDSAccountPropertiesFromAuthenticationDictionary(v82);
            id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
            v94[0] = _NSConcreteStackBlock;
            v94[1] = 3221225472LL;
            v94[2] = sub_9AF8;
            v94[3] = &unk_10A20;
            v94[4] = v31;
            [v40 enumerateKeysAndObjectsUsingBlock:v94];
            BOOL v41 = objc_alloc(&OBJC_CLASS___NSNumber);
            char v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            [v42 timeIntervalSince1970];
            char v43 = -[NSNumber initWithDouble:](v41, "initWithDouble:");

            [v31 setAccountProperty:v43 forKey:v79];
            sub_9C00(v31, v11, v78);
            sub_9C00(v31, v11, v77);
            sub_9C00(v31, v11, v76);
            v44 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKey:v75]);
            if (v44)
            {
              v45 = (ACAccountCredential *)objc_claimAutoreleasedReturnValue([v74 credentialForAccount:v31]);
              if (!v45) {
                v45 = objc_alloc_init(&OBJC_CLASS___ACAccountCredential);
              }
              -[ACAccountCredential setToken:](v45, "setToken:", v44);
              [v31 setCredential:v45];
              [v31 setAuthenticated:1];
              +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
              v47 = v46;
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
              [v31 setAccountProperty:v48 forKey:v72];

              v49 = sub_4008();
              v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                v53 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
                *(_DWORD *)buf = 138413058;
                v101 = v45;
                v102 = 2112;
                v103 = v53;
                v104 = 2048;
                v105 = v47;
                v106 = 2112;
                v107 = v44;
                _os_log_debug_impl( &dword_0,  v50,  OS_LOG_TYPE_DEBUG,  "Setting credential (%@) on account with identifier (%@). [receiptTime: %f, token: %@]",  buf,  0x2Au);
              }

              uint64_t v11 = v73;
            }

            else
            {
              v51 = sub_4008();
              v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v101 = v69;
                _os_log_error_impl(&dword_0, v52, OS_LOG_TYPE_ERROR, "No auth token for service type (%@).", buf, 0xCu);
              }

              [v31 setAuthenticated:0];
            }

            __int16 v17 = v80;
          }
        }

        v85 = [obj countByEnumeratingWithState:&v95 objects:v108 count:16];
      }

      while (v85);
    }

    v54 = dispatch_group_create();
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v55 = v81;
    v56 = [v55 countByEnumeratingWithState:&v90 objects:v99 count:16];
    uint64_t v10 = v74;
    if (v56)
    {
      v57 = v56;
      v58 = *(void *)v91;
      do
      {
        for (j = 0LL; j != v57; j = (char *)j + 1)
        {
          if (*(void *)v91 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = *(void *)(*((void *)&v90 + 1) + 8LL * (void)j);
          dispatch_group_enter(v54);
          v88[0] = _NSConcreteStackBlock;
          v88[1] = 3221225472LL;
          v88[2] = sub_9D44;
          v88[3] = &unk_10A48;
          v88[4] = v60;
          v89 = v54;
          [v74 saveAccount:v60 pid:0 verify:0 dataclassActions:0 completion:v88];
        }

        v57 = [v55 countByEnumeratingWithState:&v90 objects:v99 count:16];
      }

      while (v57);
    }

    global_queue = dispatch_get_global_queue(0LL, 0LL);
    v62 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_9E28;
    block[3] = &unk_109F8;
    __int16 v12 = v68;
    v87 = v68;
    dispatch_group_notify(v54, v62, block);

    __int16 v9 = v69;
    uint64_t v11 = v73;
    uint64_t v18 = v67;
  }

  else
  {
    v63 = sub_4008();
    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_AB54();
    }

    v12[2](v12);
  }
}

- (id)_parametersForIDSAlertFromLoginResponse:(id)a3
{
  return 0LL;
}

- (id)_authController
{
  authController = self->_authController;
  if (!authController)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
    uint64_t v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }

  return authController;
}

- (NSString)passwordlessToken
{
  return self->_passwordlessToken;
}

- (void)setPasswordlessToken:(id)a3
{
}

- (NSString)idmsDataToken
{
  return self->_idmsDataToken;
}

- (void)setIdmsDataToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
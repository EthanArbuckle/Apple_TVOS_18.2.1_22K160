}

uint64_t sub_1570(uint64_t a1)
{
  uint64_t v3 = 0LL;
  [*(id *)(a1 + 32) _verifyAccount:*(void *)(a1 + 40) error:&v3];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

id sub_1830(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 72))
  {
    if (*(_BYTE *)(a1 + 73))
    {
      [*(id *)(a1 + 32) setAuthenticated:1];
      uint64_t v3 = *(void *)(a1 + 32);
      v2 = *(void **)(a1 + 40);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_192C;
      v10[3] = &unk_41E0;
      v10[4] = *(void *)(a1 + 64);
      return [v2 saveAccount:v3 withHandler:v10];
    }

    else
    {
      return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
    }
  }

  else
  {
    v5 = *(void **)(a1 + 48);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1940;
    v6[3] = &unk_4230;
    v6[4] = v5;
    char v9 = *(_BYTE *)(a1 + 73);
    __int128 v8 = *(_OWORD *)(a1 + 56);
    __int128 v7 = *(_OWORD *)(a1 + 32);
    return [v5 _showPasswordPromptWithAccount:(void)v8 completionBlock:v6];
  }

uint64_t sub_192C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v11 = 0LL;
  if (a2 == 3)
  {
    [*(id *)(a1 + 32) _logWithAccount:*(void *)(a1 + 40) level:1 reason:@"credential renewal was aborted" message:0];
    if (*(_BYTE *)(a1 + 72))
    {
      [*(id *)(a1 + 40) setAuthenticated:1];
      uint64_t v5 = *(void *)(a1 + 40);
      v4 = *(void **)(a1 + 48);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1AE4;
      v10[3] = &unk_4208;
      v10[4] = *(void *)(a1 + 64);
      void v10[5] = 2LL;
      return [v4 saveAccount:v5 withHandler:v10];
    }
  }

  else if (a2 == 1)
  {
    [*(id *)(a1 + 32) _logWithAccount:*(void *)(a1 + 40) level:1 reason:@"user cancelled credential renewal" message:0];
  }

  else if (a3)
  {
    objc_msgSend(*(id *)(a1 + 56), "setPassword:");
    unsigned int v7 = [*(id *)(a1 + 56) fetchTokensIfNecessary:&v11];
    __int128 v8 = "failed";
    if (v7) {
      __int128 v8 = "succeeded";
    }
    char v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"renewing credentials %s",  v8);
    [*(id *)(a1 + 32) _logWithAccount:*(void *)(a1 + 40), 1, v9, @"%@", objc_msgSend(v11, "description") level reason message];
    +[ACDKeychainManager setCredentialForAccount:]( ACDKeychainManager,  "setCredentialForAccount:",  [*(id *)(a1 + 56) persistentAccount]);
  }

  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

uint64_t sub_1AE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t sub_1AF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id objc_msgSend_validationInvocation(void *a1, const char *a2, ...)
{
  return [a1 validationInvocation];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           objc_msgSend( v11,  "setObject:forKeyedSubscript:",  MFLookupLocalizedString(@"PASSWORD_OK", @"OK", @"Delayed"),  kCFUserNotificationDefaultButtonTitleKey);
  objc_msgSend( v11,  "setObject:forKeyedSubscript:",  MFLookupLocalizedString(@"PASSWORD_CANCEL", @"Cancel", @"Delayed"),  kCFUserNotificationAlternateButtonTitleKey);
  objc_msgSend( v11,  "setObject:forKeyedSubscript:",  MFLookupLocalizedString(@"PASSWORD_PLACEHOLDER", @"Password", @"Delayed"),  kCFUserNotificationTextFieldTitlesKey);
  [v11 setObject:v9 forKeyedSubscript:SBUserNotificationAllowedApplicationsKey];
  v12 = (void (**)(id, CFOptionFlags, id))[a4 copy];
  v23 = 3LL;
  v13 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0x10000uLL, &error, (CFDictionaryRef)v11);
  v14 = v13;
  if (v13 && !error)
  {
    error = CFUserNotificationReceiveResponse(v13, 0.0, &v23);
    if (error)
    {
      v15 = (os_log_s *)MFLogGeneral();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class(self);
        v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138412546;
        v26 = v17;
        v27 = 1024;
        v28 = error;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "#Warning %@: failed to receive password response (%d)",  buf,  0x12u);
      }

      v18 = 0LL;
    }

    else
    {
      if (v23) {
        ResponseValue = 0LL;
      }
      else {
        ResponseValue = (__CFString *)CFUserNotificationGetResponseValue( v14,  kCFUserNotificationTextFieldValuesKey,  0LL);
      }
      v18 = -[__CFString copy](ResponseValue, "copy", v23);
    }

    goto LABEL_21;
  }

  v19 = (os_log_s *)MFLogGeneral();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (objc_class *)objc_opt_class(self);
    v21 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138412546;
    v26 = v21;
    v27 = 1024;
    v28 = error;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "#Warning %@: failed to prompt user for password (%d)", buf, 0x12u);
  }

  v18 = 0LL;
  if (v14)
  {
LABEL_21:
    CFRelease(v14);
    if (!v12) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  if (v12) {
LABEL_15:
  }
    v12[2](v12, v23, v18);
LABEL_16:
}

- (id)_passwordPromptTitleWithCredential:(id)a3
{
  if ([a3 password])
  {
    uint64_t v3 = @"INVALID_PASSWORD_TITLE";
    v4 = @"Password Incorrect";
  }

  else
  {
    uint64_t v3 = @"PASSWORD_REQUIRED_TITLE";
    v4 = @"Password Required";
  }

  return (id)MFLookupLocalizedString(v3, v4, @"Delayed");
}

- (id)_passwordPromptMessageWithAccount:(id)a3
{
  uint64_t v4 = MFLookupLocalizedString( @"INVALID_PASSWORD_FORMAT",  @"Enter the password for the %@ account “%@”",  @"Delayed");
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  v4,  [(id)objc_opt_class(a3) displayedAccountTypeString],  objc_msgSend(a3, "displayName"));
}

- (id)_promptBundleIdentifierWhitelistWithAccount:(id)a3
{
  uint64_t v4 = +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"com.apple.Preferences",  0LL);
  unsigned int v5 = objc_msgSend( ACAccountTypeIdentifierSMTP,  "isEqualToString:",  objc_msgSend(objc_msgSend(objc_msgSend(a3, "persistentAccount"), "accountType"), "identifier"));
  if ([a3 isEnabledForDataclass:kAccountDataclassContacts])
  {
    -[NSMutableArray addObject:](v4, "addObject:", @"com.apple.MobileAddressBook");
    -[NSMutableArray addObject:](v4, "addObject:", @"com.apple.mobilephone");
  }

  return v4;
}

- (void)_logWithAccount:(id)a3 level:(unsigned __int8)a4 reason:(id)a5 message:(id)a6
{
  v10 = (objc_class *)objc_opt_class(self);
  id v11 = -[NSString mutableCopy]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:",  NSStringFromClass(v10)),  "mutableCopy");
  if ([a5 length]) {
    [v11 appendFormat:@" %@", a5];
  }
  if (a3) {
    [v11 appendFormat:@" for account %@ (%@) of type %@", objc_msgSend(a3, "accountDescription"), objc_msgSend(a3, "identifier"), objc_msgSend(objc_msgSend(a3, "accountType"), "identifier")];
  }
  id v12 = [a6 length];
  if (v12)
  {
    *(void *)buf = &v15;
    id v12 = objc_msgSend( v11,  "appendString:",   -[NSString initWithFormat:arguments:]( [NSString alloc],  "initWithFormat:arguments:",  a6,  &v15));
  }

  v13 = (os_log_s *)MFLogGeneral(v12);
  if (os_log_type_enabled(v13, (os_log_type_t)a4))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v11;
    _os_log_impl(&dword_0, v13, (os_log_type_t)a4, "%@", buf, 0xCu);
  }
}

- (BOOL)_clientIsEntitled:(id)a3
{
  return [a3 hasEntitlement:kACDAllAccountsAccessEntitlement];
}

@end
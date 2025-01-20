void sub_3330(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  BOOL v8;
  os_log_s *v9;
  void *v10;
  __CFDictionary *v11;
  id v12;
  id v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  void v18[5];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  v2 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyAppleID];
  v3 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyAuthToken];
  v4 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyRealmUserID];
  v5 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyProfileID];
  v6 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyStatus];
  v7 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyHandles];
  if ([v4 length]) {
    v5 = v4;
  }
  if (v2) {
    v8 = v5 == 0LL;
  }
  else {
    v8 = 1;
  }
  if (v8)
  {
    v9 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v20 = v2;
      v21 = 2048;
      v22 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Missing either the appleID [%p] or profileID[%p]", buf, 0x16u);
    }
  }

  else
  {
    v10 = (void *)IDSParseAuthDictionary(*(void *)(a1 + 32));
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v12 = [v10 objectForKey:IDSAuthenticationDictionaryKeyAppleID];
    if (v12) {
      CFDictionarySetValue(v11, kIDSServiceDefaultsAppleIDKey, v12);
    }
    CFDictionarySetValue(v11, kIDSServiceDefaultsAuthorizationIDKey, v5);
    v13 = objc_msgSend( objc_msgSend(v10, "objectForKey:", IDSAuthenticationDictionaryKeySelfHandle),  "objectForKey:",  @"uri");
    v14 = [v13 length];
    if (v13 && v14) {
      CFDictionarySetValue(v11, kIDSServiceDefaultsSelfHandleKey, v13);
    }
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_362C;
    v18[3] = &unk_4120;
    v18[4] = v15;
    v16 = objc_msgSend( objc_msgSend(v10, "objectForKey:", IDSAuthenticationDictionaryKeyHandles),  "__imArrayByApplyingBlock:",  v18);
    if (-[NSMutableArray count](v15, "count"))
    {
      v17 = -[NSMutableArray copy](v15, "copy");
      if (v17) {
        CFDictionarySetValue(v11, kIDSServiceDefaultsInvisibleAliasesKey, v17);
      }
    }

    if ([v16 count])
    {
      if (v16) {
        CFDictionarySetValue(v11, kIDSServiceDefaultsVettedAliasesKey, v16);
      }
    }

    IDSiCloudSignIn(v2, v3, 0LL, v11, v6, v7);
  }
}

id sub_362C(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"uri"), "_stripFZIDPrefix");
  unsigned int v5 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"status"), "intValue");
  id v6 = [a2 objectForKey:@"is-user-visible"];
  if (v5 == 5051) {
    return v4;
  }
  else {
    return 0LL;
  }
}

void sub_36B8(uint64_t a1)
{
  v2 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "... dispatching completion", buf, 2u);
  }

  if (*(_BYTE *)(*(void *)(a1 + 32) + 8LL))
  {
    v3 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "... not dispatching completion, cancelled", v4, 2u);
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

id objc_msgSend_registration(void *a1, const char *a2, ...)
{
  return [a1 registration];
}
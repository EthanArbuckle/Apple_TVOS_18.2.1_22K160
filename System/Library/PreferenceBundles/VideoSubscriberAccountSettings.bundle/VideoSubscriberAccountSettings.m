void sub_2480(id a1)
{
  TVSettingsVideoSubscriberFacade *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___TVSettingsVideoSubscriberFacade);
  v2 = (void *)qword_16438;
  qword_16438 = (uint64_t)v1;
}

void sub_2818( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_2854(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accountStoreDidChange];
}

void sub_2880(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _availabilityStatusDidChange];
}

void sub_3628(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_36A0;
  v6[3] = &unk_104F8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  VSPerformBlockOnMainThread(v6);
}

id sub_36A0(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_371C;
  v4[3] = &unk_104A8;
  v1 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_378C;
  v3[3] = &unk_104D0;
  v3[4] = v5;
  return [v1 unwrapObject:v4 error:v3];
}

void sub_371C(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a2 firstObject]);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (id)v3;
  if (v3)
  {
    [v4 _loadIdentityProviderInfoForAccount:v3];
  }

  else
  {
    [v4 setCurrentIdentityProvider:0];
    [*(id *)(a1 + 32) setCurrentIdentityProviderIsFullySupported:0];
  }

  [*(id *)(a1 + 32) setCurrentAccount:v5];
}

void sub_378C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_8F88();
  }

  [*(id *)(a1 + 32) setCurrentIdentityProvider:0];
  [*(id *)(a1 + 32) setCurrentAccount:0];
}

void sub_38E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = v5;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_3AB8;
    block[3] = &unk_104F8;
    block[4] = *(void *)(a1 + 32);
    id v24 = v8;
    dispatch_sync(&_dispatch_main_q, block);
    v9 = objc_alloc(&OBJC_CLASS___VSIdentityProviderFetchOperation);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 providerID]);
    v11 = -[VSIdentityProviderFetchOperation initWithIdentityProviderUniqueID:]( v9,  "initWithIdentityProviderUniqueID:",  v10);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_3AE8;
    v20[3] = &unk_104F8;
    uint64_t v12 = *(void *)(a1 + 32);
    v21 = v11;
    uint64_t v22 = v12;
    v13 = v11;
    uint64_t v14 = VSMainThreadOperationWithBlock(v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v15 addDependency:v13];
    v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) privateQueue]);
    [v16 addOperation:v13];

    VSEnqueueCompletionOperation(v15);
  }

  else
  {
    if (v6)
    {
      uint64_t v17 = VSErrorLogObject();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_8FE8();
      }
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_3CE0;
    v19[3] = &unk_10570;
    v19[4] = *(void *)(a1 + 32);
    dispatch_sync(&_dispatch_main_q, v19);
  }
}

id sub_3AB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHasSetTopBoxProfile:1];
}

void sub_3AE8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_3B94;
  v5[3] = &unk_10548;
  uint64_t v6 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_3C6C;
  v4[3] = &unk_104D0;
  void v4[4] = v6;
  [v3 unwrapObject:v5 error:v4];
}

void sub_3B94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Fetched set-top box identity provider %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) setStbIdentityProvider:v3];
  objc_msgSend(*(id *)(a1 + 32), "setSetTopBoxProviderAllowsOptOut:", objc_msgSend(v3, "isSTBOptOutAllowed"));
}

void sub_3C6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_9048();
  }

  [*(id *)(a1 + 32) setStbIdentityProvider:0];
  [*(id *)(a1 + 32) setSetTopBoxProviderAllowsOptOut:0];
}

id sub_3CE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHasSetTopBoxProfile:0];
}

void sub_3DFC(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityProviderFetchOperation]);
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) result]);
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 forceUnwrapObject]);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_3ED4;
    v6[3] = &unk_10548;
    void v6[4] = *(void *)(a1 + 32);
    [v5 unwrapObject:v6 error:&stru_105D8];
    [*(id *)(a1 + 32) setIdentityProviderFetchOperation:0];
  }
}

id sub_3ED4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setCurrentIdentityProvider:v4];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];

  return [v5 setCurrentIdentityProviderIsFullySupported:v6];
}

void sub_3F30(id a1, NSError *a2)
{
  v2 = a2;
  uint64_t v3 = VSErrorLogObject();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_90A8();
  }
}

void sub_41F4(id *a1)
{
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x3032000000LL;
  v37[3] = sub_4560;
  v37[4] = sub_4570;
  id v38 = 0LL;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_4560;
  v35 = sub_4570;
  id v36 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1[5] result]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_4578;
  v30[3] = &unk_10600;
  v30[4] = v37;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_4588;
  v29[3] = &unk_10628;
  v29[4] = &v31;
  [v3 unwrapObject:v30 error:v29];

  if (v32[5])
  {
    id v4 = a1[8];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VSFailable failableWithError:](&OBJC_CLASS___VSFailable, "failableWithError:"));
    (*((void (**)(id, void *, void, void))v4 + 2))(v4, v5, 0LL, 0LL);
  }

  else
  {
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x3032000000LL;
    v27[3] = sub_4560;
    v27[4] = sub_4570;
    id v28 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    id v24 = sub_4560;
    v25 = sub_4570;
    id v26 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a1[6] result]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 forceUnwrapObject]);
    v20[1] = 3221225472LL;
    v20[2] = sub_4598;
    v20[3] = &unk_10650;
    void v20[4] = v27;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_45A8;
    v19[3] = &unk_10628;
    v19[4] = &v21;
    v20[0] = _NSConcreteStackBlock;
    [v7 unwrapObject:v20 error:v19];

    if (v22[5])
    {
      id v8 = a1[8];
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[VSFailable failableWithError:](&OBJC_CLASS___VSFailable, "failableWithError:"));
      (*((void (**)(id, void *, void, void))v8 + 2))(v8, v9, 0LL, 0LL);
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([a1[7] result]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v10 forceUnwrapObject]);

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_45B8;
      v15[3] = &unk_10678;
      id v16 = a1[8];
      uint64_t v17 = v37;
      v18 = v27;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_46D8;
      v11[3] = &unk_106A0;
      id v12 = a1[8];
      v13 = v37;
      uint64_t v14 = v27;
      [v9 unwrapObject:v15 error:v11];
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v27, 8);
  }

  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(v37, 8);
}

void sub_4518( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

uint64_t sub_4560(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_4570(uint64_t a1)
{
}

void sub_4578(uint64_t a1, void *a2)
{
}

void sub_4588(uint64_t a1, void *a2)
{
}

void sub_4598(uint64_t a1, void *a2)
{
}

void sub_45A8(uint64_t a1, void *a2)
{
}

void sub_45B8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderFilter);
  [v4 setAllIdentityProviders:v3];

  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 filteredIdentityProviders]);
  if ([v10 count])
  {
    uint64_t v5 = a1[4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VSFailable failableWithObject:](&OBJC_CLASS___VSFailable, "failableWithObject:", v10));
    (*(void (**)(uint64_t, void *, void, void))(v5 + 16))( v5,  v6,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
  }

  else
  {
    uint64_t v7 = VSPrivateErrorWithRecoverySuggestion(-25LL, 0LL, 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v8 = a1[4];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[VSFailable failableWithError:](&OBJC_CLASS___VSFailable, "failableWithError:", v6));
    (*(void (**)(uint64_t, void *, void, void))(v8 + 16))( v8,  v9,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
  }
}

void sub_46D8(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[VSFailable failableWithError:](&OBJC_CLASS___VSFailable, "failableWithError:", a2));
  (*(void (**)(uint64_t, id, void, void))(v3 + 16))( v3,  v4,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
}

void sub_4B84(id a1)
{
  id v1 = sub_4BA8();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)qword_16448;
  qword_16448 = v2;
}

id sub_4BA8()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v0, "addObject:", @"currentAccount");
  id v1 = -[NSMutableSet copy](v0, "copy");

  return v1;
}

void sub_4C68(id a1)
{
  id v1 = sub_4C8C();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)qword_16458;
  qword_16458 = v2;
}

id sub_4C8C()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v0, "addObject:", @"currentIdentityProvider");
  -[NSMutableSet addObject:](v0, "addObject:", @"availabilityStatus");
  id v1 = -[NSMutableSet copy](v0, "copy");

  return v1;
}

void sub_4E04(id a1)
{
  id v1 = sub_4C8C();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)qword_16468;
  qword_16468 = v2;
}

void sub_4E90(id a1)
{
  id v1 = sub_4EB4();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)qword_16478;
  qword_16478 = v2;
}

id sub_4EB4()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v0, "addObject:", @"currentIdentityProvider");
  id v1 = -[NSMutableSet copy](v0, "copy");

  return v1;
}

char *sub_50D0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) type] == (char *)&dword_0 + 2)
  {
    uint64_t v2 = VSDefaultLogObject();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Did sign out gracefully.", buf, 2u);
    }

    return (char *)[*(id *)(a1 + 40) setSigningOut:0];
  }

  else
  {
    result = (char *)[*(id *)(a1 + 32) type];
    if (result == (_BYTE *)&dword_4 + 1)
    {
      uint64_t v5 = VSDefaultLogObject();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Did successfully opt out of set-top box.", v19, 2u);
      }

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stbProfile]);
      unsigned __int8 v8 = [v7 isDeveloper];

      if ((v8 & 1) != 0)
      {
        uint64_t v9 = VSDefaultLogObject();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Set-top box profile is developer added, will not mark profile as removed.",  v18,  2u);
        }
      }

      else
      {
        [*(id *)(a1 + 40) setHasSetTopBoxProfile:0];
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
        unsigned __int8 v12 = [v11 setIgnoreSetTopBoxProfile:1];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = VSErrorLogObject();
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_9108(v14);
          }
        }

        +[VSMetricsManagerObjC recordSTBOptOutEventWithError:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordSTBOptOutEventWithError:",  0LL);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) optOutCompletionHandler]);

      if (v15)
      {
        id v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) optOutCompletionHandler]);
        v16[2](v16, 0LL);

        [*(id *)(a1 + 40) setOptOutCompletionHandler:0];
      }

      [*(id *)(a1 + 40) setOptingOutOfSTB:0];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) optOutBackgroundTask]);
      [v17 end];

      return (char *)[*(id *)(a1 + 40) setOptOutBackgroundTask:0];
    }
  }

  return result;
}

void sub_52FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) type] == (char *)&dword_0 + 2)
  {
    uint64_t v4 = VSErrorLogObject();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_9148();
    }

    [*(id *)(a1 + 40) _forciblySignOut];
  }

  else if ([*(id *)(a1 + 32) type] == (char *)&dword_4 + 1)
  {
    uint64_t v6 = VSDefaultLogObject();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Error opting out of set-top box: %@", (uint8_t *)&v12, 0xCu);
    }

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) optOutCompletionHandler]);
    if (v8)
    {
      uint64_t v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) optOutCompletionHandler]);
      ((void (**)(void, id))v9)[2](v9, v3);

      [*(id *)(a1 + 40) setOptOutCompletionHandler:0];
    }

    [*(id *)(a1 + 40) setOptingOutOfSTB:0];
    uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) optOutBackgroundTask]);
    [(id)v10 end];

    [*(id *)(a1 + 40) setOptOutBackgroundTask:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stbProfile]);
    LOBYTE(v10) = [v11 isDeveloper];

    if ((v10 & 1) == 0) {
      +[VSMetricsManagerObjC recordSTBOptOutEventWithError:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordSTBOptOutEventWithError:",  v3);
    }
  }
}

void sub_5894( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_5928(void *a1)
{
  id v1 = a1;
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  uint64_t v2 = VSMainConcurrencyBindingOptions(v20);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend( v1,  "vs_bind:toObject:withKeyPath:options:",  @"externalValue",  v20,  @"currentIdentityProviderDisplayName",  v3);

  uint64_t v4 = objc_alloc(&OBJC_CLASS___VSRemoteNotifier);
  uint64_t v5 = -[VSRemoteNotifier initWithNotificationName:]( v4,  "initWithNotificationName:",  VSAccountStoreDidChangeNotification);
  id v6 = v1[3];
  v1[3] = v5;

  [v1[3] setDelegate:v1];
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___VSOnboardingInfoCenter);
  id v8 = v1[4];
  v1[4] = v7;

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VSViewControllerFactory sharedFactory](&OBJC_CLASS___VSViewControllerFactory, "sharedFactory"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 loadingViewController]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 forceUnwrapObject]);
  id v12 = v1[6];
  v1[6] = (id)v11;

  [v1[6] setOverrideLoadingIndicatorDelaySeconds:&off_11328];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"SIGN_IN_BUTTON_TITLE" value:0 table:0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:@"SIGN_IN_BUTTON_DESCRIPTION" value:0 table:0]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v14,  v16,  v20,  @"signInHash",  v1,  "_signIn:"));
  id v18 = v1[8];
  v1[8] = (id)v17;

  [v1 startObservingAppsViewModels];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v19 addObserver:v1 selector:"_appsDidChange" name:VSAppSettingsFacadeAppsDidChangeNotification object:0];
}

void sub_647C(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setLocalizedValue:0];
  objc_msgSend(v4, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isSignInHidden"));
  objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "isSignInEnabled"));
  else {
    uint64_t v3 = 0LL;
  }
  [v4 setAccessoryTypes:v3];
}

void sub_64F8(uint64_t a1, void *a2)
{
  id v11 = a2;
  unsigned int v3 = [*(id *)(a1 + 32) currentIdentityProviderIsFullySupported];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v5 = v4;
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"SIGN_OUT_BUTTON_TITLE" value:0 table:0]);
    [v11 setLocalizedTitle:v6];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentAccountUsername]);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"SIGN_OUT_BUTTON_NON_PARTICIPATING_TITLE" value:0 table:0]);
    [v11 setLocalizedTitle:v8];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentIdentityProviderDisplayName]);
  }

  uint64_t v9 = (void *)v7;
  [v11 setLocalizedValue:v7];

  objc_msgSend(v11, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isSignOutHidden"));
  objc_msgSend(v11, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "isSignOutEnabled"));
  else {
    uint64_t v10 = 0LL;
  }
  [v11 setAccessoryTypes:v10];
}

void sub_6630(uint64_t a1, void *a2)
{
  unsigned int v3 = *(void **)(a1 + 32);
  id v8 = a2;
  objc_msgSend(v8, "setEnabled:", objc_msgSend(v3, "isSTBOptOutEnabled"));
  objc_msgSend(v8, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isSTBOptOutHidden"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) setTopBoxIdentityProviderDisplayName]);
  [v8 setLocalizedValue:v4];

  unint64_t v5 = (unint64_t)[v8 accessoryTypes];
  unsigned int v6 = [*(id *)(a1 + 32) isOptingOutOfSTB];
  uint64_t v7 = 4LL;
  if (!v6) {
    uint64_t v7 = 0LL;
  }
  [v8 setAccessoryTypes:v7 | v5 & 0xFFFFFFFFFFFFFFFBLL];
}

void sub_68D4(id a1, TSKSettingItem *a2, id a3)
{
  id v20 = a2;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v20, "representedObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
  switch((unint64_t)[v3 installState])
  {
    case 2uLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      uint64_t v9 = v8;
      uint64_t v10 = @"ACCOUNT_ACCESS_ROW_VALUE_ACQUIRABLE";
      goto LABEL_8;
    case 3uLL:
    case 5uLL:
      unint64_t v5 = 0LL;
      unsigned int v6 = 0LL;
      uint64_t v7 = 4LL;
      goto LABEL_13;
    case 4uLL:
      id v11 = (char *)[v3 privacyState];
      if (v11 == (_BYTE *)&dword_0 + 2)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"ACCOUNT_ACCESS_GROUP_DESCRIPTION_DENY" value:0 table:0]);

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
        v15 = v14;
        id v16 = @"ACCOUNT_ACCESS_ROW_VALUE_DENY";
LABEL_12:
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:v16 value:0 table:0]);

        unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v4));
        uint64_t v7 = 0LL;
        goto LABEL_13;
      }

      if (v11 == (_BYTE *)&dword_0 + 1)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"ACCOUNT_ACCESS_GROUP_DESCRIPTION_ALLOW" value:0 table:0]);

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
        v15 = v14;
        id v16 = @"ACCOUNT_ACCESS_ROW_VALUE_ALLOW";
        goto LABEL_12;
      }

      if (v11)
      {
LABEL_9:
        uint64_t v7 = 0LL;
        unint64_t v5 = 0LL;
        unsigned int v6 = 0LL;
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
        uint64_t v9 = v8;
        uint64_t v10 = @"ACCOUNT_ACCESS_ROW_VALUE_INSTALLED";
LABEL_8:
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:0 table:0]);

        uint64_t v7 = 0LL;
        unint64_t v5 = 0LL;
      }

LABEL_13:
      -[TSKSettingItem setLocalizedDescription:](v20, "setLocalizedDescription:", v5);
      -[TSKSettingItem setLocalizedValue:](v20, "setLocalizedValue:", v6);
      BOOL v18 = [v3 installState] == &dword_4 || objc_msgSend(v3, "installState") == (char *)&dword_0 + 2;
      -[TSKSettingItem setEnabled:](v20, "setEnabled:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
      -[TSKSettingItem setLocalizedTitle:](v20, "setLocalizedTitle:", v19);

      -[TSKSettingItem setAccessoryTypes:](v20, "setAccessoryTypes:", v7);
      return;
    default:
      goto LABEL_9;
  }
}

id sub_6D10(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeBlur];
}

void sub_6F08(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_6F9C;
  v6[3] = &unk_10520;
  unsigned int v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_7150;
  v4[3] = &unk_10570;
  id v5 = v3;
  [a2 conditionallyUnwrapObject:v6 otherwise:v4];
}

id sub_6F9C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_7018;
  v4[3] = &unk_104A8;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_7090;
  v3[3] = &unk_104D0;
  v3[4] = v5;
  return [a2 unwrapObject:v4 error:v3];
}

id sub_7018(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject();
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Successfully saved unsupported provider.", v5, 2u);
  }

  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_7090(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Failed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _presentError:v3];
}

id sub_7150(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectSelectedProviderAnimated:1];
}

id sub_72A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeBlur];
}

id sub_7624(uint64_t a1)
{
  return [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
}

void sub_7654(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (v7 || !a2)
  {
    uint64_t v11 = VSErrorLogObject();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138413058;
      uint64_t v14 = v12;
      __int16 v15 = 1024;
      int v16 = a2;
      __int16 v17 = 1024;
      int v18 = a3;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_error_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "Failed to install app %@ - success: %d, headless: %d, error: %@",  (uint8_t *)&v13,  0x22u);
    }
  }

  else
  {
    uint64_t v8 = VSDefaultLogObject();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138412802;
      uint64_t v14 = v10;
      __int16 v15 = 1024;
      int v16 = 1;
      __int16 v17 = 1024;
      int v18 = a3;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully installed app %@ - success: %d, headless: %d",  (uint8_t *)&v13,  0x18u);
    }
  }
}

void sub_7858(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a2;
  [v9 reloadSettingsIfNeeded];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_794C;
  v14[3] = &unk_108A0;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v17 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_7BA0;
  v13[3] = &unk_104D0;
  v13[4] = v15;
  id v11 = v7;
  id v12 = v8;
  [v10 unwrapObject:v14 error:v13];
}

void sub_794C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSPreferences forceSingleProviderID](v4, "forceSingleProviderID"));
  if (![v5 length]) {
    goto LABEL_15;
  }
  id v20 = v4;
  id v21 = v3;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (!v7)
  {
LABEL_10:

    uint64_t v4 = v20;
    id v3 = v21;
LABEL_15:
    int v18 = (void *)objc_claimAutoreleasedReturnValue( +[VSViewControllerFactory sharedFactory]( &OBJC_CLASS___VSViewControllerFactory,  "sharedFactory",  v20,  v21));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identityProviderPickerViewControllerWithIdentityProviders:v3]);
    id v15 = (id)objc_claimAutoreleasedReturnValue([v19 forceUnwrapObject]);

    [v15 setDelegate:*(void *)(a1 + 32)];
    [v15 setAllStorefronts:*(void *)(a1 + 40)];
    [v15 setRequestedStorefrontCountryCode:*(void *)(a1 + 48) defaultToDeveloperProviders:1];
    [*(id *)(a1 + 32) _presentViewController:v15];
    goto LABEL_16;
  }

  id v8 = v7;
  uint64_t v9 = *(void *)v23;
LABEL_4:
  uint64_t v10 = 0LL;
  while (1)
  {
    if (*(void *)v23 != v9) {
      objc_enumerationMutation(v6);
    }
    id v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "providerID", v20, v21, (void)v22));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 forceUnwrapObject]);
    unsigned __int8 v14 = [v13 isEqual:v5];

    if ((v14 & 1) != 0) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  id v15 = v11;

  uint64_t v4 = v20;
  id v3 = v21;
  if (!v15) {
    goto LABEL_15;
  }
  uint64_t v16 = VSDefaultLogObject();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v15;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "Force single provider default set, loading provider: %@",  buf,  0xCu);
  }

  [*(id *)(a1 + 32) _startSignInWithIdentityProvider:v15 pickerViewController:0];
LABEL_16:
}

id sub_7BA0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentError:a2];
}

id sub_7CE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSigningOut];
}

void sub_807C(_Unwind_Exception *a1)
{
}

void sub_80C0(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Set-Top Box opt out cancelled.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_8144(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Set-Top Box opt out confirmed.", buf, 2u);
  }

  id v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_824C;
  v8[3] = &unk_10918;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  [v6 startOptingOutOfSetTopBoxWithCompletionHandler:v8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  objc_destroyWeak(&v9);
}

void sub_8234(_Unwind_Exception *a1)
{
}

void sub_824C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v7 = v6;
  if (v3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"STB_OPT_OUT_FAILED_ALERT_TITLE" value:0 table:0]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if (v11)
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSError);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        id v13 = v11;
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSError);
        char isKindOfClass = objc_opt_isKindOfClass(v13, v14);

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v16 = (objc_class *)objc_opt_class(v13);
          id v17 = NSStringFromClass(v16);
          int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Unexpectedly, VSForceUnwrapNullable(underlyingErrorOrNil) was %@, instead of NSError.",  v18);
        }

        id v11 = v13;
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
        id v20 = [v19 length];

        if (v20)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v11 localizedDescription]);

          id v9 = (void *)v21;
        }
      }
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"STB_OPT_OUT_SUCCEEDED_TITLE" value:0 table:0]);

    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"STB_OPT_OUT_SUCCEEDED_MESSAGE" value:0 table:0]);
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v9,  1LL));
  objc_initWeak(&location, v22);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_856C;
  v25[3] = &unk_108F0;
  objc_copyWeak(&v26, &location);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v5,  0LL,  v25));
  [v22 addAction:v23];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentViewController:v22 animated:1 completion:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void sub_854C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_856C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

id sub_87D0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_8828;
  v3[3] = &unk_10570;
  v3[4] = v1;
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void sub_8828(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
}

id sub_88B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeBlur];
}

void sub_88BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (VSErrorIsPublicError())
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
    id v5 = [v4 popToRootViewControllerAnimated:1];
  }

  else
  {
    id v6 = *(void **)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_8974;
    v7[3] = &unk_104F8;
    v7[4] = v6;
    id v8 = v3;
    [v6 dismissViewControllerAnimated:1 completion:v7];
  }
}

id sub_8974(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentError:*(void *)(a1 + 40)];
}

void sub_8F88()
{
}

void sub_8FE8()
{
}

void sub_9048()
{
}

void sub_90A8()
{
}

void sub_9108(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error setting ignore set-top box profile.", v1, 2u);
}

void sub_9148()
{
}

void sub_91A8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Will present error: %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "viewControllerForUnsupportedProvider:withRequestingAppDisplayName:storage:acknowledgementHandler:");
}

id objc_msgSend_viewControllerToConfirmAccountDeletionForAccount_preferredStyle_confirmationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerToConfirmAccountDeletionForAccount:preferredStyle:confirmationHandler:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}
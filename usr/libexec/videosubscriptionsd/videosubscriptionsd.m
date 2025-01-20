void sub_100003A2C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  os_log_s *v8;
  uint64_t v9;
  os_log_s *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[16];
  v6 = a2;
  if (v6)
  {
    v7 = VSErrorLogObject();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000C638();
    }
  }

  else
  {
    v9 = VSDefaultLogObject(0LL, v3, v4, v5);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Finished initial load, resetting timer.",  v14,  2u);
    }

    [*(id *)(a1 + 32) resetTimer];
  }

  v11 = objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(void *)(v12 + 64) = v11;

  [*(id *)(a1 + 32) _setupObservers];
}

void sub_100003BFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100003C20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = VSDefaultLogObject(WeakRetained, v2, v3, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TV app settings changed, removing any disconnected user accounts",  v7,  2u);
  }

  [WeakRetained _removeNonConnectedSignedOutUserAccounts];
}

void sub_100003D34(uint64_t a1)
{
  lock._uint32_t os_unfair_lock_opaque = [*(id *)(a1 + 32) loadingStoresLock];
  os_unfair_lock_lock(&lock);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10000403C;
  v32[3] = &unk_100014518;
  uint32_t os_unfair_lock_opaque = lock._os_unfair_lock_opaque;
  id v33 = *(id *)(a1 + 40);
  uint64_t v2 = objc_retainBlock(v32);
  if (![*(id *)(a1 + 32) storesLoaded])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v3 = objc_alloc_init(&OBJC_CLASS___VSSemaphore);
    uint64_t v25 = 0LL;
    v26 = &v25;
    uint64_t v27 = 0x3032000000LL;
    v28 = sub_100004088;
    v29 = sub_100004098;
    id v30 = 0LL;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) container]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000040A0;
    v21[3] = &unk_100014540;
    objc_copyWeak(&v24, &location);
    v23 = &v25;
    id v5 = v3;
    id v22 = v5;
    [v4 loadPersistentStoresWithCompletionHandler:v21];

    [v5 wait];
    if ([*(id *)(a1 + 32) storesLoaded])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preferences]);
      unsigned int v7 = [v6 performedSubcriptionToUserAccountMigration];

      if (!v7)
      {
        uint64_t v15 = VSDefaultLogObject(v8, v9, v10, v11);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Migration not performed, will fetch subscriptions for migration...",  buf,  2u);
        }

        v17 = *(void **)(a1 + 32);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_100004198;
        v18[3] = &unk_100014590;
        v18[4] = v17;
        v19 = v2;
        [v17 _subscriptionsForMigrationWithCompletion:v18];

        goto LABEL_13;
      }

      uint64_t v12 = VSDefaultLogObject(v8, v9, v10, v11);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Migration already performed, skipping.",  buf,  2u);
      }

      uint64_t v14 = 0LL;
    }

    else
    {
      uint64_t v14 = v26[5];
    }

    ((void (*)(void *, uint64_t))v2[2])(v2, v14);
LABEL_13:

    objc_destroyWeak(&v24);
    _Block_object_dispose(&v25, 8);

    objc_destroyWeak(&location);
    goto LABEL_14;
  }

  ((void (*)(void *, void))v2[2])(v2, 0LL);
LABEL_14:
}

void sub_100003FF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24)
{
}

void sub_10000403C(uint64_t a1, void *a2)
{
  id v4 = a2;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

uint64_t sub_100004088(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004098(uint64_t a1)
{
}

void sub_1000040A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v11 = VSErrorLogObject();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000C698();
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    }

    else
    {
      uint64_t v13 = VSDefaultLogObject(WeakRetained, v7, v8, v9);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Finished loading persistent stores successfully.",  v15,  2u);
      }

      [v10 setStoresLoaded:1];
    }
  }

  [*(id *)(a1 + 32) signal];
}

void sub_100004198(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = [v5 count];
  if (v6)
  {
    int v26 = a2;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  VSSubscriptionValueTransformerName));
    id v11 = objc_alloc_init(&OBJC_CLASS___VSWaitGroup);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v27 = v5;
    id obj = v5;
    id v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v10 transformedValue:v16]);

          if (!v17) {
            +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [subscriptionTransformer transformedValue:migrationSubscription] parameter must not be nil.");
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue([v10 transformedValue:v16]);
          [v11 enter];
          v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) createSaveContext]);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472LL;
          v30[2] = sub_100004458;
          v30[3] = &unk_100014568;
          uint64_t v20 = *(void *)(a1 + 32);
          id v31 = v19;
          uint64_t v32 = v20;
          id v33 = v18;
          id v34 = v11;
          id v21 = v18;
          id v22 = v19;
          [v22 performBlock:v30];
        }

        id v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v13);
    }

    [v11 wait];
    id v5 = v27;
    a2 = v26;
  }

  if (a2)
  {
    uint64_t v23 = VSDefaultLogObject(v6, v7, v8, v9);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Marking migration as completed.", buf, 2u);
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preferences]);
    [v25 setPerformedSubcriptionToUserAccountMigration];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100004458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = VSDefaultLogObject(a1, a2, a3, a4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "performing migration user account insertion...",  buf,  2u);
  }

  uint64_t v7 = -[VSPersistentUserAccount initWithContext:]( objc_alloc(&OBJC_CLASS___VSPersistentUserAccount),  "initWithContext:",  *(void *)(a1 + 32));
  id v8 = [*(id *)(a1 + 40) _populatePersistentUserAccount:v7 withUserAccount:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
  uint64_t v12 = VSDefaultLogObject(v8, v9, v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "saving migrated persistent account: %@",  buf,  0xCu);
  }

  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(a1 + 40);
  id v20 = 0LL;
  unsigned __int8 v16 = [v14 saveContext:v15 withError:&v20];
  id v17 = v20;
  if ((v16 & 1) == 0)
  {
    uint64_t v18 = VSErrorLogObject();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10000C6F8();
    }
  }

  [*(id *)(a1 + 56) leave];
}

void sub_1000045E4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v2 = objc_begin_catch(exception_object);
      uint64_t v3 = VSErrorLogObject();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_10000C758();
      }

      objc_end_catch();
      JUMPOUT(0x100004590LL);
    }

    objc_begin_catch(exception_object);
    JUMPOUT(0x100004594LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1000048C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000048F0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v9 = VSDefaultLogObject(v5, v6, v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Migration delegate block invoked with completion status %d subscriptions %@",  (uint8_t *)v14,  0x12u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  [*(id *)(a1 + 32) leave];
}

void sub_100004AB0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) prepareUserAccountsToVend:a2 withSecurityTask:*(void *)(a1 + 40)]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004B70;
  v10[3] = &unk_100014608;
  id v7 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = v7;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  VSPerformCompletionHandler(v10);
}

uint64_t sub_100004B70(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_100004D20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) prepareUserAccountsToVend:a2 withSecurityTask:*(void *)(a1 + 40)]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004DE0;
  v10[3] = &unk_100014608;
  id v7 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = v7;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  VSPerformCompletionHandler(v10);
}

uint64_t sub_100004DE0(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

uint64_t sub_10000526C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10000527C(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService] & 1) == 0)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) signingIdentifier]);
    id v3 = [[VSBundleRecord alloc] initWithBundleID:v2];
    id v4 = v3;
    if (v3)
    {
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleVersion]);
      [v5 setModifierIdentifier:v6];
    }

    [*(id *)(a1 + 40) setModifierType:VSMetricAccountUpdateValueModifierTypeApp];
  }

  id v10 = VSMetricAccountUpdateValueWriteTypeUpdate;
  if ([*(id *)(a1 + 40) isSignedOut])
  {
    id v7 = VSMetricAccountUpdateValueWriteTypeRemove;

    id v10 = v7;
  }

  id v8 = *(void **)(a1 + 40);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 modifierIdentifier]);
  +[VSMetricsManagerObjC recordAccountUpdateWithAccount:source:updateType:completion:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordAccountUpdateWithAccount:source:updateType:completion:",  v8,  v9,  v10,  0LL);
}

void sub_1000053B0(uint64_t a1, void *a2)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005494;
  v9[3] = &unk_1000146D0;
  id v10 = *(id *)(a1 + 32);
  char v14 = *(_BYTE *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005730;
  v7[3] = &unk_1000146F8;
  id v8 = *(id *)(a1 + 56);
  [a2 unwrapObject:v9 error:v7];
}

void sub_100005494(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 firstObject]);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identityProviderID]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 forceUnwrapObject]);
    unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)];

    if (v7)
    {
      if (*(_BYTE *)(a1 + 64))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyItemHash]);

        if (!v8) {
          +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [account legacyItemHash] parameter must not be nil.");
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyItemHash]);
        uint64_t v13 = VSDefaultLogObject(v9, v10, v11, v12);
        char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Associating user account with keychain hash %@",  buf,  0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "setKeychainItemHash:", objc_msgSend(v9, "unsignedIntegerValue"));
        [*(id *)(a1 + 48) insertUserAccount:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
        goto LABEL_13;
      }
    }
  }

  uint64_t v15 = VSErrorLogObject();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10000C8D0();
  }

  id v17 = *(void **)(a1 + 56);
  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000567C;
    v18[3] = &unk_1000146A8;
    id v19 = v17;
    VSPerformCompletionHandler(v18);
    id v9 = v19;
LABEL_13:
  }
}

void sub_10000567C(uint64_t a1)
{
  uint64_t v2 = VSPublicError(1LL, 6LL, 0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  if (v4
    && (+[VSLSApplicationRecord isAppStoreVendableForBundleIdentifier:]( &OBJC_CLASS___VSLSApplicationRecord,  "isAppStoreVendableForBundleIdentifier:",  v4) & 1) == 0)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"VSExceptionProviderMismatch",  @"Not currently signed in to a provider matching the one indicated by the user account");
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005730(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000C8FC();
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = VSPublicError(1LL, 3LL, v3);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100005810;
    v10[3] = &unk_100014658;
    id v8 = *(id *)(a1 + 32);
    id v11 = v7;
    id v12 = v8;
    id v9 = v7;
    VSPerformCompletionHandler(v10);
  }
}

uint64_t sub_100005810(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_100005820(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_1000059B0(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService] & 1) == 0)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) signingIdentifier]);
    id v3 = [[VSBundleRecord alloc] initWithBundleID:v2];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleVersion]);
      [v5 setModifierIdentifier:v6];
    }

    [*(id *)(a1 + 40) setModifierType:VSMetricAccountUpdateValueModifierTypeApp];
  }

  unsigned int v7 = *(void **)(a1 + 40);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 modifierIdentifier]);
  +[VSMetricsManagerObjC recordAccountUpdateWithAccount:source:updateType:completion:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordAccountUpdateWithAccount:source:updateType:completion:",  v7,  v8,  VSMetricAccountUpdateValueWriteTypeRemove,  0LL);
}

void sub_100005AA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = VSPublicError(1LL, 3LL, 0LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);
}

void sub_100005AF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = VSErrorLogObject();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000C95C();
    }

    id v7 = [v4 copy];
    uint64_t v8 = VSPublicError(1LL, 3LL, v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v9 = 0LL;
  }

  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100005BF0;
    v11[3] = &unk_100014658;
    id v13 = v10;
    id v12 = v9;
    VSPerformCompletionHandler(v11);
  }
}

uint64_t sub_100005BF0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100005DA4(_Unwind_Exception *a1)
{
}

void sub_100005DC8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCurrentUpdateSessionIsForced:1];
    [v3 _update];
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005E5C;
  v4[3] = &unk_1000146A8;
  id v5 = *(id *)(a1 + 32);
  VSPerformCompletionHandler(v4);
}

uint64_t sub_100005E5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100005E68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000601C(_Unwind_Exception *a1)
{
}

void sub_100006040(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCurrentUpdateSessionIsForced:1];
    [v3 _forceRefreshAccount:*(void *)(a1 + 32)];
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000060D8;
  v4[3] = &unk_1000146A8;
  id v5 = *(id *)(a1 + 40);
  VSPerformCompletionHandler(v4);
}

uint64_t sub_1000060D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000060E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000061A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006230;
  v6[3] = &unk_100014658;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  VSPerformCompletionHandler(v6);
}

uint64_t sub_100006230(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void sub_1000062CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = VSErrorLogObject();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000CA14();
    }

    id v7 = [v4 copy];
    uint64_t v8 = VSPublicError(1LL, 3LL, v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v9 = 0LL;
  }

  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000063C4;
    v11[3] = &unk_100014658;
    id v13 = v10;
    id v12 = v9;
    VSPerformCompletionHandler(v11);
  }
}

uint64_t sub_1000063C4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_1000064E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v47 = a1;
    id v48 = v6;
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v54 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v51 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v69 objects:v77 count:16];
    v53 = v8;
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v70;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v70 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 subscriptionBillingCycleEndDate]);
          if (v15)
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 subscriptionBillingCycleEndDate]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            unsigned int v18 = objc_msgSend(v16, "vs_isAfter:", v17);

            uint64_t v8 = v53;
          }

          else
          {
            unsigned int v18 = 1;
          }

          if (([v14 isSignedOut] & 1) == 0
            && v18
            && [v14 sourceType] != (id)2)
          {
            id v19 = [v14 sourceType];
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 sourceIdentifier]);
            id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld%@",  v19,  v20));

            -[NSMutableArray addObject:](v51, "addObject:", v21);
            if ([v14 isFromCurrentDevice])
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v54, "setObject:forKeyedSubscript:", v14, v21);
              uint64_t v8 = v53;
            }

            else
            {
              uint64_t v8 = v53;
              id v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v53,  "objectForKeyedSubscript:",  v21));
              if (!v22) {
                id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
              -[NSMutableArray addObject:](v22, "addObject:", v14);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v22, v21);
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v69 objects:v77 count:16];
      }

      while (v11);
    }

    id v49 = v5;

    uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id obj = v51;
    id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v65,  v76,  16LL);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v66;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v66 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)j);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v28));
          id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v54, "objectForKeyedSubscript:", v28));
          if (v30)
          {
            -[NSMutableArray addObject:](v23, "addObject:", v30);
          }

          else if ([v29 count])
          {
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);

            if (!v31) {
              +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [nonLocalAccounts firstObject] parameter must not be nil.");
            }
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);
            -[NSMutableArray addObject:](v23, "addObject:", v32);

            uint64_t v8 = v53;
          }
        }

        id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v65,  v76,  16LL);
      }

      while (v25);
    }

    v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v33 = v23;
    id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v61,  v75,  16LL);
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v62;
      uint64_t v37 = VSSubscriptionValueTransformerName;
      do
      {
        for (k = 0LL; k != v35; k = (char *)k + 1)
        {
          if (*(void *)v62 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v39 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)k);
          v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  v37));
          v41 = (void *)objc_claimAutoreleasedReturnValue([v40 reverseTransformedValue:v39]);
          if (v41)
          {
            -[NSMutableArray addObject:](v52, "addObject:", v41);
          }

          else
          {
            uint64_t v42 = VSErrorLogObject();
            v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v74 = v39;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_FAULT,  "Error transforming user account to subscription: %@",  buf,  0xCu);
            }
          }
        }

        id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v61,  v75,  16LL);
      }

      while (v35);
    }

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_100006AE4;
    v58[3] = &unk_100014658;
    id v44 = *(id *)(v47 + 32);
    v59 = v52;
    id v60 = v44;
    v45 = v52;
    VSPerformCompletionHandler(v58);

    id v7 = v48;
    id v5 = v49;
    v46 = v53;
  }

  else
  {
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100006AF8;
    v55[3] = &unk_100014658;
    v57 = (NSMutableDictionary *)*(id *)(a1 + 32);
    id v56 = v7;
    VSPerformCompletionHandler(v55);

    v46 = v57;
  }
}

uint64_t sub_100006AE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

uint64_t sub_100006AF8(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Legacy API - Found no active subscriptions.",  v5,  2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000719C(uint64_t a1)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _updateRequestForAccount:*(void *)(a1 + 40)]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);

    if (v6)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);

      if (!v11) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [self timer] parameter must not be nil.");
      }
      uint64_t v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
      dispatch_source_cancel(v12);
    }

    uint64_t v13 = VSDefaultLogObject(v7, v8, v9, v10);
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "1 update request will be enqueued.", v19, 2u);
    }

    uint64_t v15 = *(void **)(a1 + 32);
    id v20 = v5;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    [v15 _setUpdateRequestManagerWithRequests:v16];
  }

  else
  {
    uint64_t v17 = VSDefaultLogObject(0LL, v2, v3, v4);
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "User account did not qualify for force refresh.",  v19,  2u);
    }

    [*(id *)(a1 + 32) setCurrentUpdateSessionIsForced:0];
  }
}

void sub_1000073B0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);

  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);

    if (!v3) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [self timer] parameter must not be nil.");
    }
    uint64_t v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
    dispatch_source_cancel(v4);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v5 setLastUpdateTime:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _predicateForUserAccountWithNonnullUpdateURL]);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 createSaveContext]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000074E0;
  v10[3] = &unk_1000147E8;
  void v10[4] = *(void *)(a1 + 32);
  [v8 _queryUserAccountsWithPredicate:v7 context:v9 completion:v10];
}

void sub_1000074E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  char v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_10000765C;
  uint64_t v17 = &unk_1000147C0;
  uint64_t v18 = *(void *)(a1 + 32);
  id v5 = v4;
  id v19 = v5;
  [v3 enumerateObjectsUsingBlock:&v14];

  id v6 = -[NSMutableArray count](v5, "count", v14, v15, v16, v17, v18);
  uint64_t v10 = VSDefaultLogObject(v6, v7, v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v12)
    {
      id v13 = -[NSMutableArray count](v5, "count");
      *(_DWORD *)buf = 134217984;
      id v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%lu update requests will be enqueued.",  buf,  0xCu);
    }

    [*(id *)(a1 + 32) _setUpdateRequestManagerWithRequests:v5];
  }

  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No user accounts qualified for update, will not enqueue any update requests.",  buf,  2u);
    }

    [*(id *)(a1 + 32) resetTimer];
  }
}

void sub_10000765C(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _updateRequestForAccount:a2]);
  if (v3)
  {
    uint64_t v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    id v3 = v4;
  }
}

void sub_1000076FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = VSErrorLogObject();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000CA74();
    }

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 43200.0));
  }

  [v5 doubleValue];
  uint64_t v10 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) privateQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000077F8;
  v12[3] = &unk_100014888;
  v12[4] = *(void *)(a1 + 32);
  v12[5] = v10;
  [v11 addOperationWithBlock:v12];
}

void sub_1000077F8(uint64_t a1)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100004088;
  uint64_t v18 = sub_100004098;
  id v19 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
  uint64_t v2 = (dispatch_source_s *)v15[5];
  if (v2) {
    dispatch_source_cancel(v2);
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _predicateForIsSignedOut:0]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _predicateForUserAccountWithNonnullUpdateURL]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _predicateForUserAccountWithNonnullBillingCycleEndDate]);
  v21[0] = v3;
  v21[1] = v4;
  v21[2] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v6));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _sortForUserAccountBillingCycleEndDateASC:1]);
  uint64_t v9 = *(void **)(a1 + 32);
  id v20 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) createSaveContext]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100007A38;
  v13[3] = &unk_100014860;
  uint64_t v12 = *(void *)(a1 + 32);
  v13[6] = *(void *)(a1 + 40);
  v13[4] = v12;
  v13[5] = &v14;
  [v9 _queryUserAccountsWithPredicate:v7 sorts:v10 fetchLimit:&off_100014FD0 context:v11 completion:v13];

  _Block_object_dispose(&v14, 8);
}

void sub_100007A04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_100007A38(uint64_t a1, void *a2, void *a3)
{
  id v39 = a2;
  id v40 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v39 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subscriptionBillingCycleEndDate]);

  uint64_t v11 = VSDefaultLogObject(v7, v8, v9, v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      double v44 = *(double *)&v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Soonest expiring account is: %@", buf, 0xCu);
    }

    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastUpdateTime]);
    if (!v12) {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s dateByAddingTimeInterval:](v12, "dateByAddingTimeInterval:", *(double *)(a1 + 48)));
    id v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vs_dateIncrementedByMinutes:", 1));
    id v16 = objc_msgSend(v14, "vs_isAfter:", v15);
    id v20 = v15;
    if ((_DWORD)v16)
    {
      uint64_t v21 = VSDefaultLogObject(v16, v17, v18, v19);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v44 = *(double *)&v14;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Next refresh time is within update frequency limit, using frequency limit time: %@",  buf,  0xCu);
      }

      id v20 = v14;
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v20 timeIntervalSinceDate:v23];
    double v25 = v24;

    uint64_t v30 = VSDefaultLogObject(v26, v27, v28, v29);
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v44 = v25;
      __int16 v45 = 2112;
      id v46 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "refresh expiry timer will fire in %f seconds (%@)",  buf,  0x16u);
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) privateQueue]);
    id v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v32 underlyingQueue]);
    dispatch_source_t v34 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v33);
    uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    dispatch_time_t v37 = dispatch_time(0LL, 1000000000 * (unint64_t)v25);
    dispatch_source_set_timer( *(dispatch_source_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  v37,  0xFFFFFFFFFFFFFFFFLL,  0LL);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    __int128 v38 = *(dispatch_source_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100007E20;
    handler[3] = &unk_100014838;
    objc_copyWeak(&v42, (id *)buf);
    dispatch_source_set_event_handler(v38, handler);
    [*(id *)(a1 + 32) setTimer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    dispatch_activate(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);
  }

  else if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No subscriptions that qualify for expiration. Not setting up schedule.",  buf,  2u);
  }
}

void sub_100007DFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100007E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = VSDefaultLogObject(a1, a2, a3, a4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Schedule timer fired.", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _update];
  }
}

uint64_t sub_100007F58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007FD4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[WLKChannelManager defaultChannelManager](&OBJC_CLASS___WLKChannelManager, "defaultChannelManager"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000804C;
  v3[3] = &unk_100014928;
  v3[4] = *(void *)(a1 + 32);
  [v2 vppaConsentedBundleIDsWithCompletion:v3];
}

void sub_10000804C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v10 = v5;
    uint64_t v14 = VSDefaultLogObject(v10, v11, v12, v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Consented Bundle IDs: %@", buf, 0xCu);
    }

    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _predicateForIsSignedOut:1]);
    uint64_t v17 = *(void **)(a1 + 32);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 createSaveContext]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100008214;
    v22[3] = &unk_100014900;
    uint64_t v19 = *(void *)(a1 + 32);
    id v23 = v10;
    uint64_t v24 = v19;
    id v20 = v10;
    [v17 _queryUserAccountsWithPredicate:v16 context:v18 completion:v22];
  }

  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v21 = VSDefaultLogObject(0LL, v7, v8, v9);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Could not fetch VPPA-Consented and Connected bundleIDs: %@",  buf,  0xCu);
    }
  }

LABEL_6:
}

void sub_100008214(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v23;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v20 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceIdentifier", v20));
        id v11 = [*(id *)(a1 + 32) containsObject:v10];
        if ((v11 & 1) == 0)
        {
          uint64_t v15 = VSDefaultLogObject(v11, v12, v13, v14);
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 sourceIdentifier]);
            *(_DWORD *)buf = v20;
            uint64_t v27 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Removing Signed Out User Account that is Not Connected: %@",  buf,  0xCu);
          }

          uint64_t v18 = *(void **)(a1 + 40);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 createSaveContext]);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_1000083FC;
          void v21[3] = &unk_1000144C8;
          void v21[4] = v9;
          [v18 _deleteUserAccount:v9 context:v19 completion:v21];
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v6);
  }
}

void sub_1000083FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = VSErrorLogObject();
    __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000CAD4(a1, (uint64_t)v3, v5);
    }
  }
}

void sub_1000086B8(_Unwind_Exception *a1)
{
}

void sub_1000086D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v6;
  if (v6)
  {
    uint64_t v11 = VSDefaultLogObject(v6, v7, v8, v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v25 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Error checking for Existing Persistent User Account: %@",  buf,  0xCu);
    }
  }

  if ([v5 count])
  {
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000887C;
    void v21[3] = &unk_100014950;
    uint64_t v23 = *(void *)(a1 + 64);
    id v22 = *(id *)(a1 + 48);
    [v13 _deduplicatePersistentUserAccounts:v5 context:v14 completion:v21];
  }

  else if (![v5 count])
  {
    uint64_t v18 = VSDefaultLogObject(0LL, v15, v16, v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v20 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      __int128 v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "New User Account to Insert: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 48) leave];
  }
}

void sub_10000887C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v6;
  if (v6)
  {
    uint64_t v11 = VSDefaultLogObject(v6, v7, v8, v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      uint64_t v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Error deduplicating Existing Persistent User Account: %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  uint64_t v13 = VSDefaultLogObject(v6, v7, v8, v9);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v1_Block_object_dispose((const void *)(v1 - 144), 8) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found matching existing persistent user account to update.",  (uint8_t *)&v18,  2u);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v5;
  id v17 = v5;

  [*(id *)(a1 + 32) leave];
}

void sub_1000089AC(uint64_t a1)
{
  uint64_t v2 = (VSPersistentUserAccount *)*(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v2)
  {
    id v6 = v2;
    uint64_t v7 = VSDefaultLogObject(v2, v3, v4, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Found matching existing persistent user account to update.",  buf,  2u);
    }
  }

  else
  {
    id v6 = -[VSPersistentUserAccount initWithContext:]( objc_alloc(&OBJC_CLASS___VSPersistentUserAccount),  "initWithContext:",  *(void *)(a1 + 32));
  }

  [*(id *)(a1 + 40) _populatePersistentUserAccount:v6 withUserAccount:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (!v9 || [v9 signedOut])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[VSPersistentUserAccount setCreated:](v6, "setCreated:", v10);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) signingIdentifier]);
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
    if ((+[VSLSApplicationRecord isAppStoreVendableForBundleIdentifier:]( VSLSApplicationRecord,  "isAppStoreVendableForBundleIdentifier:",  v13) & 1) == 0 && (+[VSLSApplicationRecord isDeletableForBundleIdentifier:]( VSLSApplicationRecord,  "isDeletableForBundleIdentifier:",  v13) & 1) != 0 || [*(id *)(a1 + 48) isDeveloperCreated])
    {
      -[VSPersistentUserAccount setDeveloper:](v6, "setDeveloper:", 1LL);
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 name]);
  -[VSPersistentUserAccount setDeviceName:](v6, "setDeviceName:", v15);

  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(a1 + 40);
  id v22 = 0LL;
  LOBYTE(v15) = [v16 saveContext:v17 withError:&v22];
  id v18 = v22;
  if ((v15 & 1) != 0)
  {
    [*(id *)(a1 + 40) resetTimer];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) remoteNotifier]);
    [v19 postNotification];

    if (([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) signedOut] & 1) == 0
      && [*(id *)(a1 + 48) isSignedOut])
    {
      [*(id *)(a1 + 40) _removeNonConnectedSignedOutUserAccounts];
    }
  }

  else
  {
    uint64_t v20 = VSErrorLogObject();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10000CC10();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_100008C00(void *exc_buf, int a2)
{
  if (a2 == 2)
  {
    id v3 = objc_begin_catch(exc_buf);
    uint64_t v4 = VSErrorLogObject();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10000CBB0();
    }

    uint64_t v6 = VSPublicError(1LL, 3LL, 0LL);
    objc_claimAutoreleasedReturnValue(v6);

    objc_end_catch();
  }

  else
  {
    objc_begin_catch(exc_buf);
  }

  JUMPOUT(0x100008BB0LL);
}

void sub_100008DFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = VSErrorLogObject();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000CC70();
    }

    id v9 = v6;
  }

  else if ([v5 count])
  {
    id v10 = v5;
    goto LABEL_8;
  }

  id v10 = 0LL;
LABEL_8:
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100008F14;
  v15[3] = &unk_100014608;
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v12;
  id v16 = v10;
  id v13 = v6;
  id v14 = v10;
  [v11 performBlock:v15];
}

uint64_t sub_100008F14(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_100009248(_Unwind_Exception *a1)
{
}

void sub_100009274(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    uint64_t v5 = VSDefaultLogObject();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Failed to delete duplicate persistent user account: %@",  (uint8_t *)&v8,  0xCu);
    }
  }
}

void sub_100009488(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = VSErrorLogObject();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000CD78();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else if (v5)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      uint64_t v9 = VSErrorLogObject();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_10000CCFC(v5, v10);
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    if (v11)
    {
      [*(id *)(a1 + 32) _deletePersistentUserAccount:v11 withContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }

    else
    {
      uint64_t v12 = VSErrorLogObject();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10000CCD0();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }
}

void sub_10000967C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = VSDefaultLogObject(a1, a2, a3, a4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sourceIdentifier]);
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Going to delete account: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) deleteObject:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(a1 + 40);
  int v8 = *(void **)(a1 + 48);
  id v24 = 0LL;
  unsigned __int8 v10 = [v8 saveContext:v9 withError:&v24];
  id v11 = v24;
  uint64_t v15 = v11;
  if ((v10 & 1) != 0)
  {
    uint64_t v16 = VSDefaultLogObject(v11, v12, v13, v14);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Success Delete: Posting Notification",  buf,  2u);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) remoteNotifier]);
    [v18 postNotification];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    uint64_t v19 = VSErrorLogObject();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000CDD8();
    }

    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v22 = VSPublicError(1LL, 3LL, v15);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v23);
  }
}

void sub_100009914(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "_userAccountForPersistentUserAccount:context:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)v11),  *(void *)(a1 + 40),  (void)v13));
          -[NSMutableArray addObject:](v6, "addObject:", v12);

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_100009BAC(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100009C98;
  v6[3] = &unk_100014A68;
  id v7 = v3;
  id v12 = a1[8];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v11 = a1[4];
  id v5 = v3;
  [v4 performBlock:v6];
}

void sub_100009C98(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = VSPublicError(1LL, 3LL, v2);
    id v32 = (id)objc_claimAutoreleasedReturnValue(v3);
    (*(void (**)(void))(a1[9] + 16LL))();
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VSPersistentUserAccount fetchRequest](&OBJC_CLASS___VSPersistentUserAccount, "fetchRequest"));
    [v4 setIncludesPendingChanges:0];
    [v4 setPredicate:a1[5]];
    [v4 setSortDescriptors:a1[6]];
    id v8 = (id)a1[7];
    if (v8) {
      id v8 = objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v8, "unsignedIntegerValue"));
    }
    uint64_t v9 = VSDefaultLogObject(v8, v5, v6, v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 predicate]);
      *(_DWORD *)buf = 138412290;
      id v40 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Using predicate for fetch request: %@",  buf,  0xCu);
    }

    id v12 = (void *)a1[8];
    id v37 = 0LL;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 executeFetchRequest:v4 error:&v37]);
    id v14 = v37;
    id v18 = v14;
    if (v13)
    {
      uint64_t v19 = VSDefaultLogObject(v14, v15, v16, v17);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v13 count];
        *(_DWORD *)buf = 134218242;
        id v40 = v21;
        __int16 v41 = 2112;
        id v42 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Retrieved %lu persistent user accounts: %@",  buf,  0x16u);
      }

      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v23 = v13;
      id v24 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v34;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v23);
            }
            -[NSMutableArray addObject:](v22, "addObject:", *(void *)(*((void *)&v33 + 1) + 8LL * (void)i));
          }

          id v25 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }

        while (v25);
      }

      uint64_t v28 = *(void (**)(void))(a1[9] + 16LL);
    }

    else
    {
      uint64_t v29 = VSErrorLogObject();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10000CE38();
      }

      uint64_t v31 = VSPublicError(1LL, 3LL, v18);
      uint64_t v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v31);
      uint64_t v28 = *(void (**)(void))(a1[9] + 16LL);
    }

    v28();
  }
}

void sub_10000A0B0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updateURL]);
  [v2 setUpdateURL:v3];

  objc_msgSend(*(id *)(a1 + 32), "setRequiresSystemTrust:", objc_msgSend(*(id *)(a1 + 40), "requiresSystemTrust"));
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) accountProviderIdentifier]);
  [v4 setProviderID:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  [v6 setAccountIdentifier:v7];

  objc_msgSend(*(id *)(a1 + 32), "setAccountType:", objc_msgSend(*(id *)(a1 + 40), "accountType"));
  objc_msgSend(*(id *)(a1 + 32), "setSignedOut:", objc_msgSend(*(id *)(a1 + 40), "isSignedOut"));
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) subscriptionBillingCycleEndDate]);
  [v8 setBillingCycleEndDate:v9];

  id v10 = *(void **)(a1 + 32);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) tierIdentifiers]);
  [v10 setTierIdentifiers:v11];

  id v12 = *(void **)(a1 + 32);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) billingIdentifier]);
  [v12 setBillingIdentifier:v13];

  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) authenticationData]);
  [v14 setAuthenticationData:v15];

  [*(id *)(a1 + 32) setDeviceType:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "setSourceType:", objc_msgSend(*(id *)(a1 + 40), "sourceType"));
  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sourceIdentifier]);
  [v16 setSourceIdentifier:v17];

  id v18 = *(void **)(a1 + 32);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceIdentifier]);
  [v18 setDeviceIdentifier:v19];

  objc_msgSend(*(id *)(a1 + 32), "setKeychainItemHash:", objc_msgSend(*(id *)(a1 + 40), "keychainItemHash"));
  uint64_t v20 = *(void **)(a1 + 32);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v20 setModified:v21];

  objc_msgSend(*(id *)(a1 + 32), "setDeveloper:", objc_msgSend(*(id *)(a1 + 40), "isDeveloperCreated"));
  uint64_t v22 = *(void **)(a1 + 32);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) created]);
  [v22 setCreated:v23];

  id v24 = *(void **)(a1 + 32);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceName]);
  [v24 setDeviceName:v25];

  uint64_t v26 = *(void **)(a1 + 32);
  id v27 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appleSubscription]);
  [v26 setAppleSubscription:v27];
}

void sub_10000A794(id *a1, void *a2)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v8 sourceType] == (id)2)
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sourceIdentifier]);
          unsigned int v10 = [v9 isEqualToString:a1[4]];

          if (v10)
          {
            id v12 = a1[5];
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 billingCycleEndDate]);
            [v12 setSubscriptionBillingCycleEndDate:v13];

            [a1[6] signal];
            goto LABEL_12;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[VSAccountStore sharedAccountStore](&OBJC_CLASS___VSAccountStore, "sharedAccountStore"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_10000A984;
  v14[3] = &unk_100014B98;
  id v15 = a1[4];
  id v16 = a1[5];
  id v17 = a1[6];
  [v11 fetchAccountsWithCompletionHandler:v14];

LABEL_12:
}

void sub_10000A984(id *a1, void *a2)
{
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  uint64_t v6 = sub_10000AA18;
  uint64_t v7 = &unk_100014B30;
  id v8 = a1[4];
  id v9 = a1[5];
  [a2 unwrapObject:&v4 error:&stru_100014B70];
  objc_msgSend(a1[6], "signal", v4, v5, v6, v7);
}

void sub_10000AA18(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 firstObject]);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identityProviderID]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000AAE8;
    v8[3] = &unk_100014B08;
    id v9 = *(id *)(a1 + 32);
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    id v7 = v5;
    [v6 conditionallyUnwrapObject:v8];
  }
}

void sub_10000AAE8(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:*(void *)(a1 + 32)])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) legacyItemHash]);
    id v4 = [v3 unsignedIntegerValue];
    id v5 = [*(id *)(a1 + 48) keychainItemHash];

    if (v4 == v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) authenticationToken]);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10000ABB4;
      v7[3] = &unk_100014AE0;
      id v8 = *(id *)(a1 + 48);
      [v6 conditionallyUnwrapObject:v7];
    }
  }

void sub_10000ABB4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 expirationDate]);
  [v2 setSubscriptionBillingCycleEndDate:v3];
}

void sub_10000ABF8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = VSDefaultLogObject();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Could not get account for expiration: %@",  (uint8_t *)&v5,  0xCu);
  }
}

LABEL_30:
    uint64_t v6 = 0;
LABEL_31:

    goto LABEL_32;
  }

  if (v8 != (id)1)
  {
    id v9 = VSErrorLogObject();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000CE98(v4, v10);
    }
    goto LABEL_30;
  }

LABEL_2:
  uint64_t v6 = 1;
LABEL_32:

  return v6;
}

void sub_10000BAE4(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v7 = VSErrorLogObject();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000D190();
    }
  }

  else
  {
    uint64_t v9 = VSDefaultLogObject(0LL, v3, v4, v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully inserted updated account from JS refresh: %@",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void sub_10000BDCC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000BDDC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_10000BDFC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000BE0C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000BE30(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_10000BE48( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Entering main() for videosubscriptionsd.",  buf,  2u);
  }

  xpc_set_event_stream_handler("com.apple.distnoted.matching", &_dispatch_main_q, &stru_100014C00);
  uint64_t v1 = VSLoadBundleAtPath(@"System/Library/Frameworks/VideoSubscriberAccount.framework");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  objc_autoreleasePoolPop(v0);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Will load VideoSubscriberAccount framework.",  buf,  2u);
    }

    uint64_t v4 = objc_autoreleasePoolPush();
    id v11 = 0LL;
    unsigned int v5 = [v2 loadAndReturnError:&v11];
    id v6 = v11;
    objc_autoreleasePoolPop(v4);
    if (v5)
    {
      uint64_t v7 = objc_autoreleasePoolPush();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Did load VideoSubscriberAccount framework.",  buf,  2u);
      }

      id v8 = objc_alloc_init(NSClassFromString(@"VSUserAccountService"));
      uint64_t v9 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.VideoSubscriberAccount.videosubscriptionsd");
      -[NSXPCListener setDelegate:](v9, "setDelegate:", v8);
      -[NSXPCListener resume](v9, "resume");
      objc_autoreleasePoolPop(v7);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      [v10 run];

LABEL_12:
      exit(1);
    }

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    uint64_t v3 = "Error loading framework: %@";
  }

  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v13 = 0LL;
    uint64_t v3 = "Unable to find framework using path: %@";
  }

  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v3, buf, 0xCu);
  goto LABEL_12;
}

void sub_10000C0C0(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000D1F0();
  }
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    uint64_t v4 = string;
    if (!strcmp(string, "Application Installed") || !strcmp(v4, "Application Uninstalled"))
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v5 postNotificationName:@"VSInstalledApplicationsDidChange" object:0];
    }
  }
}

void sub_10000C46C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = VSErrorLogObject();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000D234((uint64_t)v4, v6);
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v7();
}

void sub_10000C638()
{
}

void sub_10000C698()
{
}

void sub_10000C6F8()
{
}

void sub_10000C758()
{
}

void sub_10000C7B8()
{
}

void sub_10000C7E4()
{
}

void sub_10000C810()
{
}

void sub_10000C870()
{
}

void sub_10000C8D0()
{
}

void sub_10000C8FC()
{
}

void sub_10000C95C()
{
}

void sub_10000C9BC()
{
}

void sub_10000C9E8()
{
}

void sub_10000CA14()
{
}

void sub_10000CA74()
{
}

void sub_10000CAD4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10000BE30( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to delete signed out non-connected user account: %@ - error: %@",  (uint8_t *)&v4);
  sub_10000BDF4();
}

void sub_10000CB50()
{
}

void sub_10000CBB0()
{
}

void sub_10000CC10()
{
}

void sub_10000CC70()
{
}

void sub_10000CCD0()
{
}

void sub_10000CCFC(void *a1, os_log_s *a2)
{
}

void sub_10000CD78()
{
}

void sub_10000CDD8()
{
}

void sub_10000CE38()
{
}

void sub_10000CE98(void *a1, os_log_s *a2)
{
}

void sub_10000CF0C()
{
}

void sub_10000CF38()
{
}

void sub_10000CF64(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 sourceIdentifier]);
  sub_10000BDE8();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  sub_10000BE30( (void *)&_mh_execute_header,  a3,  v6,  "Invalid Update Query - Incorrect Source Identifier: %@ Does Not Match %@",  v7);

  sub_10000BE58();
}

void sub_10000CFF8(void *a1, os_log_s *a2)
{
}

void sub_10000D06C()
{
}

void sub_10000D098()
{
}

void sub_10000D0F8(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 updateError]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  sub_10000BE30((void *)&_mh_execute_header, a2, v5, "Error updating request %@: %@", (uint8_t *)&v6);

  sub_10000BE58();
}

void sub_10000D190()
{
}

void sub_10000D1F0()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Received distnoted matching event.",  v0,  2u);
}

void sub_10000D234(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error fetching subscriptions for migration: %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend__predicateForUserAccountWithDeviceIdentifier_sourceIdentifier_sourceType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:");
}

id objc_msgSend__queryPersistentUserAccountsWithPredicate_sorts_fetchLimit_context_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queryPersistentUserAccountsWithPredicate:sorts:fetchLimit:context:completion:");
}

id objc_msgSend_waitWithMilliseconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitWithMilliseconds:");
}
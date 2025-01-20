void sub_4A7C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue([a2 userToken]);
  v5 = [v4 copy];
  [v3 setProfileUserToken:v5];

  v6 = [*(id *)(a1 + 40) setTopBoxUseDeviceProfile];
  v7 = *(void **)(a1 + 32);
  if ((v6 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) profileUserToken]);

    if (!v8) {
      return;
    }
    v9 = *(void **)(a1 + 32);
    v11 = (id)objc_claimAutoreleasedReturnValue([v9 profileUserToken]);
    v10 = [v11 copy];
    [v9 setSetTopBoxUserTokenDisplayValue:v10];
  }

  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) setTopBoxUserToken]);
    objc_msgSend(v7, "setSetTopBoxUserTokenDisplayValue:");
  }
}

void sub_4C9C(id a1)
{
  id v1 = sub_4CC0();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_1A0F0;
  qword_1A0F0 = v2;
}

id sub_4CC0()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v0, "addObject:", @"setTopBoxBundleIdentifier");
  -[NSMutableSet addObject:](v0, "addObject:", @"currentSubscription");
  id v1 = -[NSMutableSet copy](v0, "copy");

  return v1;
}

void sub_5018(id a1)
{
  id v1 = sub_503C();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_1A100;
  qword_1A100 = v2;
}

NSMutableSet *sub_503C()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v0, "addObject:", @"authURL");
  -[NSMutableSet addObject:](v0, "addObject:", @"testingSystemTrust");
  return v0;
}

void sub_519C(void *a1)
{
  id v17 = a1;
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[VSDeveloperSettingsFacade sharedFacade](&OBJC_CLASS___VSDeveloperSettingsFacade, "sharedFacade"));
  uint64_t v2 = (void *)*((void *)v17 + 1);
  *((void *)v17 + 1) = v1;

  v3 = objc_alloc(&OBJC_CLASS___VSDeveloperSettingsSetTopBoxViewModel);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v17 + 1) settings]);
  v5 = -[VSDeveloperSettingsSetTopBoxViewModel initWithSettings:](v3, "initWithSettings:", v4);
  v6 = (void *)*((void *)v17 + 2);
  *((void *)v17 + 2) = v5;

  v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  v8 = (void *)*((void *)v17 + 3);
  *((void *)v17 + 3) = v7;

  v9 = (void *)*((void *)v17 + 3);
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v9 setName:v12];

  v13 = objc_alloc_init(&OBJC_CLASS___VSDevice);
  v14 = (void *)*((void *)v17 + 4);
  *((void *)v17 + 4) = v13;

  objc_msgSend(*((id *)v17 + 4), "registerObserver:");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v15 addObserver:v17 selector:"settingsFacadeSettingsDidChangeNotification:" name:@"VSDeveloperSettingsFacadeSettingsDidUpdateNotification" object:0];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v16 addObserver:v17 selector:"subscriptionsDidChangeNotification:" name:VSActiveSubscriptionsDidChangeNotification object:0];

  [v17 _startObservingViewModel:*((void *)v17 + 2)];
}

LABEL_13:
}

id sub_59EC(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5A70;
  v5[3] = &unk_143F0;
  uint64_t v6 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_5A78;
  v3[3] = &unk_14418;
  v3[4] = v6;
  char v4 = *(_BYTE *)(a1 + 40);
  return [a2 unwrapObject:v5 error:v3];
}

id sub_5A70(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSettingsIfNeeded];
}

void sub_5A78(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 viewModel]);
  [v5 setSetTopBoxModeEnabled:*(unsigned __int8 *)(a1 + 40)];

  uint64_t v6 = VSAlertForError(v4, 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

void sub_5C10(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_5CA8;
  v6[3] = &unk_143F0;
  v3 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_5CB0;
  v4[3] = &unk_14468;
  v4[4] = v7;
  id v5 = v3;
  [a2 unwrapObject:v6 error:v4];
}

id sub_5CA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSubscription];
}

void sub_5CB0(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 viewModel]);
  [v5 setSetTopBoxBundleIdentifier:*(void *)(a1 + 40)];

  uint64_t v6 = VSAlertForError(v4, 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

void sub_5E58(uint64_t a1, void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_5F1C;
  v7[3] = &unk_144B8;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5F70;
  v5[3] = &unk_14468;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [a2 unwrapObject:v7 error:v5];
}

id sub_5F1C(uint64_t a1, void *a2)
{
  id result = [a2 setTopBoxUseDeviceProfile];
  if ((result & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewModel]);
    [v4 setSetTopBoxUserTokenDisplayValue:*(void *)(a1 + 40)];

    return [*(id *)(a1 + 32) reloadSettingsIfNeeded];
  }

  return result;
}

void sub_5F70(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 viewModel]);
  [v5 setSetTopBoxUserToken:*(void *)(a1 + 40)];

  uint64_t v6 = VSAlertForError(v4, 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

id sub_60CC(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_6138;
  v3[3] = &unk_14418;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(_BYTE *)(a1 + 40);
  return [a2 unwrapObject:&stru_14520 error:v3];
}

void sub_6138(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 viewModel]);
  [v5 setSetTopBoxSupportsOptOut:*(unsigned __int8 *)(a1 + 40)];

  uint64_t v6 = VSAlertForError(v4, 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

void sub_62FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAdditionalProvidersMode:4];
  [v3 setRequestedStorefrontCountryCode:0];
  [v3 setDelegate:*(void *)(a1 + 32)];
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  [v4 presentViewController:v3 animated:1 completion:0];
}

void sub_6370(id a1)
{
  uint64_t v1 = VSErrorLogObject(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_D530(v2);
  }
}

void sub_6770(uint64_t a1, void *a2)
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_6830;
  v13[3] = &unk_144B8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v14 = v4;
  uint64_t v15 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_689C;
  v9[3] = &unk_14590;
  id v7 = v6;
  char v12 = *(_BYTE *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [a2 unwrapObject:v13 error:v9];
}

void sub_6830(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 setTopBoxUseDeviceProfile];
  id v4 = *(void **)(a1 + 32);
  if (v3) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 profileUserToken]);
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 setTopBoxUserToken]);
  }
  id v6 = (id)v5;
  [*(id *)(a1 + 32) setSetTopBoxUserTokenDisplayValue:v5];
  [*(id *)(a1 + 40) reloadSettingsIfNeeded];
}

void sub_689C(uint64_t a1, void *a2)
{
  unsigned int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  id v5 = a2;
  [v3 setSetTopBoxUseProfileToken:v4];
  uint64_t v6 = VSAlertForError(v5, 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  [*(id *)(a1 + 40) presentViewController:v7 animated:1 completion:0];
}

void sub_6A00(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] errors]);
  id v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = VSErrorLogObject(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_D5D4((uint64_t)v2, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_9:

    v25 = objc_alloc_init(&OBJC_CLASS___UIAlertController);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 localizedStringForKey:@"DEVELOPER_ERROR_LAUNCHING_OOB_TITLE" value:0 table:0]);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 localizedStringForKey:@"ERROR_RECOVERY_SUGGESTION_SERVICE_TEMPORARILY_UNAVAILABLE" value:0 table:0]);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0]);

    -[UIAlertController setTitle:](v25, "setTitle:", v27);
    -[UIAlertController setMessage:](v25, "setMessage:", v29);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_6C84;
    v34[3] = &unk_145E0;
    v35 = v25;
    v32 = v25;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v31,  0LL,  v34));
    -[UIAlertController addAction:](v32, "addAction:", v33);

    [a1[5] presentViewController:v32 animated:1 completion:0];
    goto LABEL_10;
  }

  uint64_t v12 = VSDefaultLogObject();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Successfully finished test setup reparation. Will launch Setup.",  buf,  2u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v15 = VSBuddyBundleID;
  unsigned __int8 v16 = [v14 openApplicationWithBundleID:VSBuddyBundleID];

  if ((v16 & 1) == 0)
  {
    uint64_t v18 = VSErrorLogObject(v17);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_D570(v15, v5, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_9;
  }

LABEL_10:
  [a1[6] setPreparingForSetupTesting:0];
}

id sub_6C84(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_6D8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = VSErrorLogObject(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_D638(a1, (uint64_t)v7, v9);
    }
LABEL_4:

    [*(id *)(a1 + 40) setCurrentSubscription:0];
    goto LABEL_11;
  }

  uint64_t v10 = ((uint64_t (*)(void))VSDefaultLogObject)();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v18 = 138412546;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetched active subscriptions for developer set-top box bundle identifier %@: %@",  (uint8_t *)&v18,  0x16u);
  }

  if (!v5)
  {
    uint64_t v17 = ((uint64_t (*)(void))VSDefaultLogObject)();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "No subscription, cleared developer app subscription.",  (uint8_t *)&v18,  2u);
    }

    goto LABEL_4;
  }

  id v13 = v5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  uint64_t v15 = VSDefaultLogObject([*(id *)(a1 + 40) setCurrentSubscription:v14]);
  unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Updated developer app subscription.", (uint8_t *)&v18, 2u);
  }

LABEL_11:
}

void sub_7998( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13)
{
}

void sub_7AC0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained facade]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 settings]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v5, "isInSetTopBoxMode") ^ 1);
}

void sub_7B38(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    else {
      uint64_t v4 = [*(id *)(a1 + 32) setTopBoxUseProfileToken] ^ 1;
    }
    [v5 setEnabled:v4];
  }
}

void sub_7BA4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained facade]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 settings]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v5, "isInSetTopBoxMode") ^ 1);
}

void sub_7C1C(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained facade]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 setTopBoxProviderDisplayName]);
    BOOL v7 = [v6 length] != 0;

    [v8 setEnabled:v7];
  }
}

void sub_7CA4(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained viewModel]);
    if ([v5 setTopBoxModeEnabled])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 viewModel]);
      uint64_t v7 = [v6 preparingForSetupTesting] ^ 1;
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    [v11 setEnabled:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 viewModel]);
    unsigned int v9 = [v8 preparingForSetupTesting];

    if (v9) {
      uint64_t v10 = 4LL;
    }
    else {
      uint64_t v10 = 0LL;
    }
    [v11 setAccessoryTypes:v10];
    [v11 setLocalizedValue:0];
  }
}

void sub_7D78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "view subscription setting item update block invoked.", v8, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSubscription]);
  [v3 setEnabled:v6 != 0];
  if (v6) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 40);
  }
  [v3 setLocalizedValue:v7];
}

void sub_7E34(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "clear subscription setting item update block invoked.", v8, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSubscription]);
  BOOL v7 = v6 != 0LL;

  [v3 setEnabled:v7];
  [v3 setLocalizedValue:0];
}

void sub_809C(uint64_t a1, void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_8170;
  v7[3] = &unk_14718;
  v7[4] = *(void *)(a1 + 32);
  uint64_t v3 = VSDefaultLogObject([a2 unwrapObject:&stru_146F0 error:v7]);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Will pop picker view controller due to provider selection.",  v6,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  [v5 dismissViewControllerAnimated:1 completion:0];
}

void sub_8170(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_D6BC((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = VSAlertForError(v3, 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [*(id *)(a1 + 32) presentViewController:v13 animated:1 completion:0];
}

void sub_8694(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 viewModel]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userToken]);

  id v5 = [v4 copy];
  [v6 setProfileUserToken:v5];
}

void sub_8800( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_8914(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___VSDeveloperSettingsFacade);
  uint64_t v2 = (void *)qword_1A110;
  qword_1A110 = (uint64_t)v1;
}

void sub_8BBC(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] result]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_8CD0;
  v8[3] = &unk_147C8;
  id v9 = a1[5];
  [v5 unwrapObject:v8 error:&stru_14808];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1[6] result]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 forceUnwrapObject]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_8D78;
  v6[3] = &unk_143F0;
  id v7 = a1[5];
  [v4 unwrapObject:v6 error:&stru_14828];
}

void sub_8CD0(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"VSDeveloperSettingsFacadeProvidersDidUpdateNotification" object:*(void *)(a1 + 32)];
}

void sub_8D28(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = VSErrorLogObject(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_D720();
  }
}

void sub_8D78(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"VSDeveloperSettingsFacadeSettingsDidUpdateNotification" object:*(void *)(a1 + 32)];
}

void sub_8DD8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = VSErrorLogObject(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_D780();
  }
}

id sub_8E28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setHasRealSetTopBoxProfile:a2 != 0];
}

void sub_9194(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_9268;
  v7[3] = &unk_14850;
  uint64_t v3 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_92C4;
  v5[3] = &unk_14878;
  id v6 = *(id *)(a1 + 48);
  [v4 unwrapObject:v7 error:v5];
}

uint64_t sub_9268(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"VSDeveloperSettingsFacadeProvidersDidUpdateNotification" object:*(void *)(a1 + 32)];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_92C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_93AC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_94FC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_9BCC(_Unwind_Exception *a1)
{
}

void sub_9C04(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_9C90;
    v7[3] = &unk_144B8;
    uint64_t v5 = *(void *)(a1 + 32);
    v7[4] = WeakRetained;
    void v7[5] = v5;
    [v6 unwrapObject:v7 error:&stru_148E8];
  }
}

void sub_9C90(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"VSDeveloperSettingsFacadeSettingsDidUpdateNotification" object:*(void *)(a1 + 40)];
}

void sub_9CF0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = VSErrorLogObject(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_D7E0();
  }
}

void sub_9D40(id *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] result]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_9E40;
  v6[3] = &unk_14938;
  v1 += 5;
  objc_copyWeak(&v7, v1);
  [v3 unwrapObject:v6 error:&stru_14958];
  id WeakRetained = objc_loadWeakRetained(v1);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:@"VSDeveloperSettingsFacadeProvidersDidUpdateNotification" object:WeakRetained];

  objc_destroyWeak(&v7);
}

void sub_9E28(_Unwind_Exception *a1)
{
}

void sub_9E40(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setProviders:v3];
}

void sub_9E88(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = VSErrorLogObject(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_D840();
  }
}

id sub_9ED8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setHasRealSetTopBoxProfile:a2 != 0];
}

void sub_A8A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = VSErrorLogObject(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_D8A0((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v13 = VSAlertForError(v4, 0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [*(id *)(a1 + 32) presentViewController:v14 animated:1 completion:0];
  }
}

id sub_AAA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}
}

void sub_ACF4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlOrError]);
  uint64_t v3 = VSDefaultLogObject(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Test validation: %@", buf, 0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trustInfo]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_AED4;
  v18[3] = &unk_149A8;
  v18[4] = *(void *)(a1 + 40);
  id v19 = v7;
  id v20 = v6;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_B000;
  id v14 = &unk_149D0;
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v19;
  id v17 = v20;
  id v8 = v20;
  id v9 = v19;
  [v2 unwrapObject:v18 error:&v11];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "viewModel", v11, v12, v13, v14, v15));
  [v10 setTestingSystemTrust:0];
}

void sub_AED4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v9 = (id)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"TEST_SYSTEM_TRUST_RESULT_ALERT_TITLE" value:0 table:0]);

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"TEST_SYSTEM_TRUST_SUCCESS_ALERT_MESSAGE" value:0 table:0]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) facade]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 buildSystemTrustTestAlertMessageWithStatusMessage:v4 andTrustInfo:*(void *)(a1 + 40)]);

  id v7 = [[TVSUITextAlertButton alloc] initWithType:0];
  [v7 setTitle:*(void *)(a1 + 48)];
  id v8 = [[TVSUITextAlertController alloc] initWithTitle:v9 text:v6];
  [v8 addButton:v7];
  [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
}

void sub_B000(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v10 = (id)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"TEST_SYSTEM_TRUST_RESULT_ALERT_ERROR_TITLE" value:0 table:0]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) facade]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 buildSystemTrustTestAlertMessageWithStatusMessage:v6 andTrustInfo:*(void *)(a1 + 40)]);
  id v8 = [[TVSUITextAlertButton alloc] initWithType:0];
  [v8 setTitle:*(void *)(a1 + 48)];
  id v9 = [[TVSUITextAlertController alloc] initWithTitle:v10 text:v7];
  [v9 addButton:v8];
  [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
}

void sub_B228(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = VSErrorLogObject(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_D908((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v13 = VSAlertForError(v4, 0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [*(id *)(a1 + 32) presentViewController:v14 animated:1 completion:0];
  }
}

void sub_BBAC(uint64_t a1, void *a2)
{
  id v7 = a2;
  unsigned int v3 = [*(id *)(a1 + 32) testingSystemTrust];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authURL]);
  id v5 = [v4 length];

  if (v3) {
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = 0LL;
  }
  [v7 setAccessoryTypes:v6];
  [v7 setEnabled:(v5 != 0) & ~v3];
  [v7 setLocalizedValue:0];
}

void sub_BC40(uint64_t a1, void *a2)
{
  unsigned int v3 = *(void **)(a1 + 32);
  id v8 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) displayName]);
    if ([v5 length])
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authURL]);
      BOOL v7 = [v6 length] != 0;
    }

    else
    {
      BOOL v7 = 0LL;
    }
  }

  else
  {
    BOOL v7 = 0LL;
  }

  [v8 setEnabled:v7];
}

void sub_BE30(void *a1)
{
  id v1 = a1;
  VSRequireMainThread();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[VSDeveloperSettingsFacade sharedFacade](&OBJC_CLASS___VSDeveloperSettingsFacade, "sharedFacade"));
  unsigned int v3 = (void *)*((void *)v1 + 1);
  *((void *)v1 + 1) = v2;

  id v4 = objc_alloc(&OBJC_CLASS___VSDeveloperSettingsViewModel);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v1 + 1) settings]);
  uint64_t v6 = -[VSDeveloperSettingsViewModel initWithSettings:](v4, "initWithSettings:", v5);
  BOOL v7 = (void *)*((void *)v1 + 2);
  *((void *)v1 + 2) = v6;

  [v1 _startObservingViewModel:*((void *)v1 + 2)];
  id v8 = (void *)*((void *)v1 + 1);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_D474;
  v11[3] = &unk_14740;
  id v12 = v1;
  id v9 = v1;
  [v8 fetchDeveloperSettingsWithCompletionHandler:v11];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 addObserver:v9 selector:"settingsFacadeSettingsDidChangeNotification:" name:@"VSDeveloperSettingsFacadeSettingsDidUpdateNotification" object:0];
}

void sub_C428( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_C44C(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_C4E0;
    v6[3] = &unk_14418;
    void v6[4] = WeakRetained;
    char v7 = *(_BYTE *)(a1 + 40);
    [v5 unwrapObject:&stru_14A18 error:v6];
  }
}

void sub_C4E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_D970((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewModel]);
  [v12 setCacheBusterEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_C660( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_C684(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_C718;
    v6[3] = &unk_14418;
    void v6[4] = WeakRetained;
    char v7 = *(_BYTE *)(a1 + 40);
    [v5 unwrapObject:&stru_14A60 error:v6];
  }
}

void sub_C718(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_D9D4((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewModel]);
  [v12 setRequestTimeoutsDisabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_C898( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_C8BC(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_C950;
    v6[3] = &unk_14418;
    void v6[4] = WeakRetained;
    char v7 = *(_BYTE *)(a1 + 40);
    [v5 unwrapObject:&stru_14A80 error:v6];
  }
}

void sub_C950(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_DA38((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewModel]);
  [v12 setSimulateExpiredToken:*(unsigned __int8 *)(a1 + 40)];
}

void sub_CFF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
}

TSKSettingItem *__cdecl sub_D044(id a1, TSKListSettingGroup *a2, VSIdentityProvider *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_D0EC;
  v6[3] = &unk_14AE8;
  uint64_t v7 = a3;
  id v3 = v7;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  0LL,  0LL,  v3,  @"displayName",  v6));
  [v4 setUpdateBlock:&stru_14B28];

  return (TSKSettingItem *)v4;
}

VSDeveloperSettingsProviderViewController *sub_D0EC(uint64_t a1)
{
  uint64_t v2 = -[VSDeveloperSettingsProviderViewController initWithIdentityProvider:]( objc_alloc(&OBJC_CLASS___VSDeveloperSettingsProviderViewController),  "initWithIdentityProvider:",  *(void *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) displayName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 forceUnwrapObject]);
  -[VSDeveloperSettingsProviderViewController setTitle:](v2, "setTitle:", v4);

  return v2;
}

void sub_D15C(id a1, TSKSettingItem *a2, VSOptional *a3)
{
  id v5 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSOptional forceUnwrapObject](a3, "forceUnwrapObject"));
  -[TSKSettingItem setLocalizedTitle:](v5, "setLocalizedTitle:", v4);

  -[TSKSettingItem setLocalizedValue:](v5, "setLocalizedValue:", 0LL);
}

VSDeveloperSettingsProviderViewController *sub_D1B8(uint64_t a1)
{
  uint64_t v2 = -[VSDeveloperSettingsProviderViewController initWithIdentityProvider:]( objc_alloc(&OBJC_CLASS___VSDeveloperSettingsProviderViewController),  "initWithIdentityProvider:",  0LL);
  -[VSDeveloperSettingsProviderViewController setTitle:](v2, "setTitle:", *(void *)(a1 + 32));
  return v2;
}

void sub_D1F8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained facade]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 providers]);
  BOOL v6 = [v5 count] != 0;

  [v7 setEnabled:v6];
}

void sub_D474(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Did fetch initial developer settings %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) reloadSettings];
}

void sub_D530(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to get picker view controller", v1, 2u);
}

void sub_D570( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D5D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D638(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Error fetching subscription for developer set-top box bundle identifier %@: %@",  (uint8_t *)&v4,  0x16u);
  sub_8810();
}

void sub_D6BC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D720()
{
}

void sub_D780()
{
}

void sub_D7E0()
{
}

void sub_D840()
{
}

void sub_D8A0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D908( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D970( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D9D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_DA38( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:");
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerClass_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:");
}

id objc_msgSend_toggleItemWithTitle_description_representedObject_keyPath_onTitle_offTitle_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:");
}

id objc_msgSend_vs_frameworkBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vs_frameworkBundle");
}
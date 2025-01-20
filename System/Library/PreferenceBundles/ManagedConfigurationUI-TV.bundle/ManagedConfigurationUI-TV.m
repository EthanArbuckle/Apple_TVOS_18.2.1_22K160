void sub_2DD0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_2E14()
{
}

void sub_2E1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _appSignersDidChange];
    id WeakRetained = v2;
  }
}

void sub_2E4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentTrustFailedAlert];
    id WeakRetained = v2;
  }
}

void sub_2E7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentNetworkRequiredAlert];
    id WeakRetained = v2;
  }
}

void sub_2F98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadSettingsIfNeeded];
    id WeakRetained = v2;
  }
}

void sub_335C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
}

void sub_33E0(uint64_t a1, void *a2)
{
  id v16 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applications]);
    id v5 = [v4 count];

    if ([*(id *)(a1 + 32) isTrusted])
    {
      else {
        v6 = @"DELETE_APP_PLURAL";
      }
      id v7 = MCUILocalizedString(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      [v16 setLocalizedTitle:v8];
      v9 = &selRef_removeApps_;
    }

    else
    {
      id v10 = MCUILocalizedString(@"TRUST_APP_DEVELOPER_NAME_%@");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) displayName]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v11));
      [v16 setLocalizedTitle:v12];

      v9 = &selRef_trustProfile_;
    }

    [v16 setAction:*v9];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _signerMessageString]);
    [v16 setLocalizedDescription:v13];

    else {
      uint64_t v14 = [WeakRetained isRemovingApps] ^ 1;
    }
    [v16 setEnabled:v14];
    if ([WeakRetained isTrustingApps])
    {
      uint64_t v15 = 4LL;
    }

    else if ([WeakRetained isRemovingApps])
    {
      uint64_t v15 = 4LL;
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    [v16 setAccessoryTypes:v15];
  }
}

void sub_3578(uint64_t a1, void *a2)
{
  id v15 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    else {
      v4 = @"APP_SIGNER_PLURAL_APPS_NOT_VERIFIED_DESCRIPTION_%@";
    }
    id v5 = MCUILocalizedStringByDevice(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v7));
    [v15 setLocalizedDescription:v8];

    else {
      v9 = @"VERIFY_APP_SINGULAR";
    }
    id v10 = MCUILocalizedString(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v15 setLocalizedTitle:v11];

    if ([*(id *)(a1 + 32) isTrusted]
      && (uint64_t)[*(id *)(a1 + 32) untrustedAppCount] >= 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applications]);
      BOOL v13 = [v12 count] == 0;
    }

    else
    {
      BOOL v13 = 1LL;
    }

    [v15 setHidden:v13];
    objc_msgSend(v15, "setEnabled:", objc_msgSend(WeakRetained, "isVerifyingApps") ^ 1);
    else {
      uint64_t v14 = 0LL;
    }
    [v15 setAccessoryTypes:v14];
  }
}

id sub_3700(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v4));
    id v7 = [[DMCApplicationProxy alloc] initWithLSApplicationProxy:v6 dataSource:0];
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v8,  0LL,  v7,  @"misStateString",  WeakRetained,  "verifyApps:"));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_3838;
    v11[3] = &unk_28660;
    id v12 = *(id *)(a1 + 32);
    [v9 setUpdateBlock:v11];
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

void sub_3838(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [v6 setLocalizedValue:a3];
  else {
    id v5 = [*(id *)(a1 + 32) isTrusted];
  }
  [v6 setEditable:v5];
}

void sub_3A24(id a1)
{
  dispatch_group_t v1 = dispatch_group_create();
  id v2 = (void *)qword_311C8;
  qword_311C8 = (uint64_t)v1;
}

void sub_3CEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_3D14(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3D8C;
  block[3] = &unk_28610;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_3D8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _verify];
    id WeakRetained = v2;
  }
}

void sub_4064( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_4090(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4108;
  block[3] = &unk_28610;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_4108(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeAppSignerApps];
}

void sub_4524( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_454C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setIsRemovingApps:0];
    [v4 _appSignersDidChange];
    id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 navigationController]);
    id v3 = [v2 popViewControllerAnimated:1];

    id WeakRetained = v4;
  }
}
}

void sub_4714( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_4738(uint64_t a1)
{
  dispatch_group_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileTrust]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appSigner]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 provisioningProfiles]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 appSigner]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_4854;
    v9[3] = &unk_28740;
    objc_copyWeak(&v10, v1);
    [v4 uiTrustAndVerifyProvisioningProfiles:v6 developer:v8 completion:v9];

    objc_destroyWeak(&v10);
  }
}

void sub_4840(_Unwind_Exception *a1)
{
}

void sub_4854(uint64_t a1, void *a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_48D0;
  v2[3] = &unk_28718;
  v3[1] = a2;
  objc_copyWeak(v3, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, v2);
  objc_destroyWeak(v3);
}

void sub_48D0(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v2 reboot];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _appSignersDidChange];
    [v4 setIsTrustingApps:0];
    id WeakRetained = v4;
  }
}

void sub_49FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_4A20(uint64_t a1)
{
  dispatch_group_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained appSigner]);
    id obj = (id)objc_claimAutoreleasedReturnValue([v4 provisioningProfiles]);

    id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "profileTrust", obj));
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472LL;
          v12[2] = sub_4BEC;
          v12[3] = &unk_28740;
          objc_copyWeak(&v13, v1);
          [v9 uiVerifyProvisioningProfileUUID:v10 completion:v12];

          objc_destroyWeak(&v13);
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v5);
    }
  }
}

void sub_4BD0(_Unwind_Exception *a1)
{
}

void sub_4BEC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4C64;
  block[3] = &unk_28610;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_4C64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _appSignersDidChange];
    [v2 setIsVerifyingApps:0];
    id WeakRetained = v2;
  }
}

TSKSettingItem *__cdecl sub_538C(id a1, TSKListSettingGroup *a2, MCKeyValue *a3)
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCKeyValue key](v3, "key"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v4,  0LL,  v3,  @"value"));

  [v5 setUpdateBlock:&stru_287C0];
  return (TSKSettingItem *)v5;
}

void sub_5408(id a1, TSKSettingItem *a2, id a3)
{
  v11 = a2;
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@"\n"]);
LABEL_5:
    v8 = (void *)v6;
    -[TSKSettingItem setLocalizedValue:](v11, "setLocalizedValue:", v6);
    goto LABEL_6;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 DMCProfileHexString]);
    goto LABEL_5;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0) {
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[MCTVCertificateDetailsViewController _dateFormatter]( &OBJC_CLASS___MCTVCertificateDetailsViewController,  "_dateFormatter"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForObjectValue:v4]);
  -[TSKSettingItem setLocalizedValue:](v11, "setLocalizedValue:", v10);

LABEL_6:
LABEL_7:
}

void sub_6084( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_60B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained traitCollection]);
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6 && v7 != v6)
  {
    [WeakRetained _configureTitleView];
    [WeakRetained _configureSubmitButton];
  }
}

void sub_6CB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
}

void sub_6CE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _retryPayload];
}

void sub_6D10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _skipPayload];
}

void sub_6D3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelPayload];
}

void sub_7970( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_79B0(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v5 = [WeakRetained _installInProgress];
    unsigned int v6 = [v4 _installComplete];
    BOOL v7 = v6 == 0;
    if (v6) {
      v8 = @"DONE";
    }
    else {
      v8 = @"INSTALL";
    }
    if (v7) {
      uint64_t v9 = &selRef__installProfile;
    }
    else {
      uint64_t v9 = &selRef__takeMeBack;
    }
    id v10 = MCUILocalizedString(v8);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v13 setLocalizedTitle:v11];

    [v13 setAction:*v9];
    [v13 setEnabled:v5 ^ 1];
    if (v5) {
      uint64_t v12 = 4LL;
    }
    else {
      uint64_t v12 = 0LL;
    }
    [v13 setAccessoryTypes:v12];
    objc_msgSend(v13, "setHidden:", objc_msgSend(v4, "mode") != 1);
  }
}

void sub_7D28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  dispatch_async(&_dispatch_main_q, &stru_28830);
}

void sub_7D58(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v1 reboot];
}

uint64_t sub_7D8C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_7F48(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unsigned int v6 = @"Warnings";
    id v3 = [v2 copy];
    id v7 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    id v4 = 0LL;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stateMachine]);
  [v5 postEvent:@"Show Warnings" withContext:0 userInfo:v4];
}

void sub_8094(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unsigned int v6 = @"UserInput";
    id v3 = [v2 copy];
    id v7 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    id v4 = 0LL;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stateMachine]);
  [v5 postEvent:@"Request Input" withContext:0 userInfo:v4];
}

void sub_81E0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unsigned int v6 = @"Error";
    id v3 = [v2 copy];
    id v7 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    id v4 = 0LL;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stateMachine]);
  [v5 postEvent:@"Preflight Complete" withContext:0 userInfo:v4];
}

void sub_832C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unsigned int v6 = @"Error";
    id v3 = [v2 copy];
    id v7 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    id v4 = 0LL;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stateMachine]);
  [v5 postEvent:@"Install Complete" withContext:0 userInfo:v4];
}

void sub_8490(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    unsigned int v5 = @"Profile";
    uint64_t v6 = v1;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stateMachine]);
    [v4 postEvent:@"Secondary Profile Received" withContext:0 userInfo:v3];
  }

void sub_871C(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  id v2 = [v3 popToViewController:*(void *)(a1 + 32) animated:0];
}

void sub_8E24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19)
{
}

void sub_8FB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadSettingsIfNeeded];
    id WeakRetained = v2;
  }
}

CFStringRef sub_8FE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileData]);
    [v2 installProfileData:v3 interactionDelegate:WeakRetained];
  }

  return @"Started Install";
}

CFStringRef sub_905C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ProfileData"]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](&OBJC_CLASS___MCProfile, "profileWithData:outError:", v8, 0LL));
    [WeakRetained setProfile:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v10 installProfileData:v8 interactionDelegate:WeakRetained];
  }

  return @"Started Install";
}

CFStringRef sub_911C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profile]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    [v2 updateProfileWithIdentifier:v4 interactionDelegate:WeakRetained];
  }

  return @"Waiting For Questions";
}

CFStringRef sub_91A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Warnings"]);
    uint64_t v9 = objc_alloc(&OBJC_CLASS___MCTVInstallProfileWarningsViewController);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileViewModel]);
    uint64_t v11 = -[MCTVInstallProfileWarningsViewController initWithProfileViewModel:warnings:]( v9,  "initWithProfileViewModel:warnings:",  v10,  v8);

    -[MCTVInstallProfileWarningsViewController setDelegate:](v11, "setDelegate:", WeakRetained);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
    [v12 presentViewController:v11 animated:1 completion:0];
  }

  return @"Showing Other Warnings";
}

CFStringRef sub_9280(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _continueInstallAfterPresentingWarnings];
  }

  return @"Waiting For Questions";
}

CFStringRef sub_92BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _cancelInstallAfterPresentingWarnings];
  }

  return @"Idle";
}

CFStringRef sub_92F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"UserInput"]);
    [WeakRetained _promptUserWithUserInput:v8];
  }

  return @"Showing Questions";
}

CFStringRef sub_936C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKey:@"UserInput"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v7 submitUserInputResponses:v6];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _waitForMoreInput];
  }

  return @"Showing Questions";
}

CFStringRef sub_93F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _cancelWaitForMoreInput];
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 navigationController]);
    id v4 = [v3 popToViewController:v2 animated:1];
  }

  return @"Waiting For Questions";
}

CFStringRef sub_9454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Error"]);
    [WeakRetained _respondWithPreflightResponse:v8];
  }

  return @"Showing Questions";
}

CFStringRef sub_94C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _cancelWaitForMoreInput];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v3 cancelUserInputResponses];
  }

  return @"Idle";
}

CFStringRef sub_9520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Profile"]);
    [WeakRetained setProfile:v8];
    [WeakRetained _cancelWaitForMoreInput];
  }

  return @"Started Install";
}

CFStringRef sub_959C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:@"Error"]);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _presentErrorDialog:v6];
    }

    uint64_t v9 = @"Idle";
  }

  else
  {
    uint64_t v9 = @"Install Complete";
  }

  return v9;
}

CFStringRef sub_9610(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _cancelWaitForMoreInput];
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 profile]);
    if ([v3 needsReboot])
    {
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 originalProfile]);
      unsigned int v5 = [v4 needsReboot];

      if (!v5)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 navigationController]);
        id v7 = [v6 popToViewController:v2 animated:1];

        goto LABEL_7;
      }
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_9708;
    v9[3] = &unk_288C8;
    void v9[4] = v2;
    [v2 _showRebootAlert:v9];
  }

LABEL_7:
  return @"Install Complete";
}

void sub_9708(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  id v2 = [v3 popToViewController:*(void *)(a1 + 32) animated:1];
}

CFStringRef sub_9754(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _takeMeBack];
  }

  return @"Install Complete";
}

void sub_99E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_9A00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
    [v2 postEvent:@"Timeout Expired"];

    id WeakRetained = v3;
  }
}

void sub_9FD4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 warningViewController:*(void *)(a1 + 32) didAcceptWarnings:*(unsigned __int8 *)(a1 + 40)];
}

LABEL_8:
      id v10 = (id)objc_claimAutoreleasedReturnValue( -[MCTVInstallProfileWarningsViewController _confirmationViewController]( self,  "_confirmationViewController"));
      -[MCTVInstallProfileWarningsViewController _updateWithNextViewController:animated:]( self,  "_updateWithNextViewController:animated:",  v10,  v3);
      uint64_t v9 = 3LL;
      goto LABEL_9;
    case 0uLL:
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileWarningsViewController profileViewModel](self, "profileViewModel"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedConsentText]);

      if (v8)
      {
        id v10 = (id)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileWarningsViewController _consentViewController](self, "_consentViewController"));
        -[MCTVInstallProfileWarningsViewController _updateWithNextViewController:animated:]( self,  "_updateWithNextViewController:animated:",  v10,  v3);
        uint64_t v9 = 1LL;
LABEL_9:
        self->_currentWarningState = v9;

        return;
      }

      goto LABEL_6;
  }

  -[MCTVInstallProfileWarningsViewController _completeWithResult:](self, "_completeWithResult:", 1LL);
}

void sub_A3BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_A3F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showNextWarning:1];
    id WeakRetained = v2;
  }
}

void sub_A428(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _completeWithResult:0];
    id WeakRetained = v2;
  }
}

void sub_A674( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

id sub_A6AC(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedTitle]);
  [v5 appendString:v7];

  [*(id *)(a1 + 32) appendString:@"\n"];
  v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedBody]);

  [v8 appendString:v9];
  id result = [*(id *)(*(void *)(a1 + 40) + 16) count];
  return result;
}

void sub_A77C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showNextWarning:1];
    id WeakRetained = v2;
  }
}

void sub_A7B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _completeWithResult:0];
    id WeakRetained = v2;
  }
}

void sub_AA94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_AAC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showNextWarning:1];
    id WeakRetained = v2;
  }
}

void sub_AAF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _completeWithResult:0];
    id WeakRetained = v2;
  }
}

void sub_AD0C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 setHidden:0];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) view]);
  [v3 setHidden:1];
}

id sub_AD68(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  return [*(id *)(a1 + 40) setNeedsFocusUpdate];
}

void sub_B208(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    if (!*(_BYTE *)(a1 + 40))
    {
      [WeakRetained reloadSettings];
      goto LABEL_6;
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileViewModel]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 managedAppProxy]);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    unsigned __int8 v6 = [v3 managesAppID:v5];

    id WeakRetained = v9;
    if ((v6 & 1) == 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 navigationController]);
      id v8 = [v7 popViewControllerAnimated:1];

LABEL_6:
      id WeakRetained = v9;
    }
  }
}

void sub_C068(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  id v2 = (void *)qword_311E0;
  qword_311E0 = v1;
}

TSKSettingItem *__cdecl sub_C53C(id a1, TSKListSettingGroup *a2, MCKeyValue *a3)
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCKeyValue key](v3, "key"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v4,  0LL,  v3,  @"value"));

  return (TSKSettingItem *)v5;
}

void sub_CB00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
    id v3 = [v2 popViewControllerAnimated:1];

    id WeakRetained = v4;
  }
}

id sub_CD64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 48) == 1LL)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _appSettingItemForModelObj:v6 profileViewModel:*(void *)(a1 + 40)]);
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___DMCPayloadViewModel);
    char isKindOfClass = objc_opt_isKindOfClass(v6, v8);
    id v10 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0) {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v10 _payloadSettingItemForModelObj:v6]);
    }
    else {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v10 _certificateSettingItemForModelObj:v6]);
    }
  }

  uint64_t v11 = (void *)v7;

  return v11;
}

MCTVManagedAppDetailsViewController *sub_CF20(uint64_t a1)
{
  return  -[MCTVManagedAppDetailsViewController initWithProfileViewModel:managedAppID:]( objc_alloc(&OBJC_CLASS___MCTVManagedAppDetailsViewController),  "initWithProfileViewModel:managedAppID:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

id sub_D020(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (!v4) {
    goto LABEL_9;
  }
  if (![v4 isCertificate]
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) certificateProperties]),
        v5,
        !v5))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7 && [v7 hasDetails])
    {
      id v6 = &off_28130;
      goto LABEL_8;
    }

LABEL_9:
    id v8 = 0LL;
    goto LABEL_10;
  }

  id v6 = off_28128;
LABEL_8:
  id v8 = [objc_alloc(*v6) initWithPayloadViewModel:*(void *)(a1 + 32)];
LABEL_10:

  return v8;
}

MCTVCertificateDetailsViewController *sub_D128(uint64_t a1)
{
  return  -[MCTVCertificateDetailsViewController initWithCertificate:]( objc_alloc(&OBJC_CLASS___MCTVCertificateDetailsViewController),  "initWithCertificate:",  *(void *)(a1 + 32));
}

void sub_DD20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

id sub_DD7C(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  id v3 = MCUILocalizedString(@"ADD_PROFILE_HEADER_TITLE");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 setHeaderText:v4];

  id v5 = MCUILocalizedString(@"ADD_PROFILE_DESCRIPTION_TEXT");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v2 setMessageText:v6];

  [v2 setEditingDelegate:*(void *)(a1 + 32)];
  [v2 setKeyboardType:3];
  [v2 setRecentsCategory:@"com.apple.TVSettingsProfileURLS"];
  return v2;
}

void sub_DE24(uint64_t a1, void *a2)
{
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileLoadTask]);
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 profileLoadTask]);
      BOOL v7 = [v6 state] == 0;
    }

    else
    {
      BOOL v7 = 0;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned int v9 = [v8 effectiveBoolValueForSetting:MCFeatureUIConfigurationProfileInstallationAllowed];

    BOOL v10 = v9 != 2 && !v7;
    [v12 setEnabled:v10];
    if (v7) {
      uint64_t v11 = 4LL;
    }
    else {
      uint64_t v11 = 0LL;
    }
    [v12 setAccessoryTypes:v11];
  }
}

TSKSettingItem *__cdecl sub_DF04(id a1, TSKListSettingGroup *a2, id a3)
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v4,  0LL,  v3,  0LL));

  return (TSKSettingItem *)v5;
}

void sub_DF6C(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a2;
  else {
    id v5 = @"BLOCKED_APP_PLURAL";
  }
  id v6 = MCUILocalizedString(v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[TSKSettingItem setLocalizedTitle:](v4, "setLocalizedTitle:", v7);
}

MCTVRemoveProfileViewController *sub_DFD8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mdmProfileInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 installedProfileWithIdentifier:v4]);

  id v6 = -[MCTVRemoveProfileViewController initWithProfile:]( objc_alloc(&OBJC_CLASS___MCTVRemoveProfileViewController),  "initWithProfile:",  v5);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    -[MCTVInstallProfileViewController setDelegate:](v6, "setDelegate:", WeakRetained);
  }

  return v6;
}

void sub_E094(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a3;
  id v7 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 friendlyName]);
  -[TSKSettingItem setLocalizedTitle:](v7, "setLocalizedTitle:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 organization]);
  -[TSKSettingItem setLocalizedValue:](v7, "setLocalizedValue:", v6);

  -[TSKSettingItem setHidden:](v7, "setHidden:", v4 == 0LL);
}

TSKSettingItem *__cdecl sub_E120(id a1, TSKListSettingGroup *a2, id a3)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_E210;
  v9[3] = &unk_28A70;
  id v3 = a3;
  id v10 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  0LL,  0LL,  v3,  @"isTrusted",  v9));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_E240;
  v7[3] = &unk_28660;
  id v8 = v3;
  id v5 = v3;
  [v4 setUpdateBlock:v7];

  return (TSKSettingItem *)v4;
}

MCTVAppSignerViewController *sub_E210(uint64_t a1)
{
  return  -[MCTVAppSignerViewController initWithAppSigner:]( objc_alloc(&OBJC_CLASS___MCTVAppSignerViewController),  "initWithAppSigner:",  *(void *)(a1 + 32));
}

void sub_E240(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) displayName]);
  [v8 setLocalizedTitle:v3];

  if ([*(id *)(a1 + 32) isTrusted])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applications]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 count]));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumberFormatter localizedStringFromNumber:numberStyle:]( &OBJC_CLASS___NSNumberFormatter,  "localizedStringFromNumber:numberStyle:",  v5,  0LL));
    [v8 setLocalizedValue:v6];
  }

  else
  {
    id v7 = MCUILocalizedString(@"NOT_TRUSTED_PROFILE");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v8 setLocalizedValue:v4];
  }
}

void sub_E330(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a2;
  else {
    id v5 = @"ENTERPRISE_APP_PLURAL";
  }
  id v6 = MCUILocalizedString(v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[TSKSettingItem setLocalizedTitle:](v4, "setLocalizedTitle:", v7);
}

TSKSettingItem *__cdecl sub_E39C(id a1, TSKListSettingGroup *a2, id a3)
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_E4A0;
  v11[3] = &unk_28A70;
  id v5 = v3;
  id v12 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  0LL,  v5,  @"isTrusted",  v11));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_E4D0;
  v9[3] = &unk_28660;
  id v10 = v5;
  id v7 = v5;
  [v6 setUpdateBlock:v9];

  return (TSKSettingItem *)v6;
}

MCTVAppSignerViewController *sub_E4A0(uint64_t a1)
{
  return  -[MCTVAppSignerViewController initWithAppSigner:]( objc_alloc(&OBJC_CLASS___MCTVAppSignerViewController),  "initWithAppSigner:",  *(void *)(a1 + 32));
}

void sub_E4D0(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) displayName]);
  [v8 setLocalizedTitle:v3];

  if ([*(id *)(a1 + 32) isTrusted])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applications]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 count]));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumberFormatter localizedStringFromNumber:numberStyle:]( &OBJC_CLASS___NSNumberFormatter,  "localizedStringFromNumber:numberStyle:",  v5,  0LL));
    [v8 setLocalizedValue:v6];
  }

  else
  {
    id v7 = MCUILocalizedString(@"NOT_TRUSTED_PROFILE");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v8 setLocalizedValue:v4];
  }
}

void sub_E5C0(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a2;
  else {
    id v5 = @"DEVELOPER_APP_PLURAL";
  }
  id v6 = MCUILocalizedString(v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[TSKSettingItem setLocalizedTitle:](v4, "setLocalizedTitle:", v7);
}

void sub_E6FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_E71C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_E85C;
  v12[3] = &unk_28B18;
  id v6 = a3;
  id v13 = v6;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  0LL,  0LL,  v6,  @"organization",  v12));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_E91C;
  v10[3] = &unk_28660;
  id v8 = v6;
  id v11 = v8;
  [v7 setUpdateBlock:v10];

  objc_destroyWeak(&v14);
  return v7;
}

void sub_E844(_Unwind_Exception *a1)
{
}

MCTVRemoveProfileViewController *sub_E85C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 installedProfileWithIdentifier:v4]);
  id v6 = -[MCTVRemoveProfileViewController initWithProfile:]( objc_alloc(&OBJC_CLASS___MCTVRemoveProfileViewController),  "initWithProfile:",  v5);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    -[MCTVInstallProfileViewController setDelegate:](v6, "setDelegate:", WeakRetained);
  }

  return v6;
}

void sub_E91C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 friendlyName]);
  [v5 setLocalizedTitle:v4];

  objc_msgSend(v5, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isInstalledByDeclarativeManagement"));
}

void sub_E984(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a2;
  else {
    id v5 = @"CONFIGURATION_PROFILE_PLURAL";
  }
  id v6 = MCUILocalizedString(v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[TSKSettingItem setLocalizedTitle:](v4, "setLocalizedTitle:", v7);
}

void sub_EDBC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 popProfileDataFromHeadOfInstallationQueue]);

  if (v6)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) installProfileViewController]);

    if (v3)
    {
      id v4 = (MCTVInstallProfileViewController *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) installProfileViewController]);
      -[MCTVInstallProfileViewController queueNextProfileData:](v4, "queueNextProfileData:", v6);
    }

    else
    {
      id v4 = -[MCTVInstallProfileViewController initWithProfileData:]( objc_alloc(&OBJC_CLASS___MCTVInstallProfileViewController),  "initWithProfileData:",  v6);
      -[MCTVInstallProfileViewController setDelegate:](v4, "setDelegate:", *(void *)(a1 + 32));
      [*(id *)(a1 + 32) setInstallProfileViewController:v4];
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
      [v5 pushViewController:v4 animated:0];
    }
  }
}

void sub_EF9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_EFBC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_F084;
  block[3] = &unk_28C28;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v12);
}

void sub_F084(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    uint64_t v4 = *(void *)(a1 + 40);
    id v18 = v2;
    id v5 = [v3 queueFileDataForAcceptance:v4 originalFileName:0 outError:&v18];
    id v6 = v18;

    id v2 = v6;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v2)
    {
      id v8 = MCUILocalizedString(@"LOAD_PROFILE_ERROR_FORMAT_%d");
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  v9,  [*(id *)(a1 + 32) code]));

      id v11 = MCUILocalizedString(@"LOAD_PROFILE_ERROR_TITLE");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v12,  v10,  1LL));

      id v14 = MCUILocalizedString(@"OK");
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  0LL));

      [v13 addAction:v16];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
      [v17 presentViewController:v13 animated:1 completion:0];
    }

    [WeakRetained setProfileLoadTask:0];
  }
}

void sub_F7BC(uint64_t a1)
{
  id v2 =  objc_msgSend( *(id *)(a1 + 32),  "appendBool:withName:",  objc_msgSend(*(id *)(a1 + 40), "isDeviceManagementHidden"),  @"isDeviceManagementHidden");
  id v3 =  objc_msgSend( *(id *)(a1 + 32),  "appendBool:withName:",  objc_msgSend(*(id *)(a1 + 40), "isProfileSectionEmpty"),  @"isProfileSectionEmpty");
  id v4 =  objc_msgSend( *(id *)(a1 + 32),  "appendUnsignedInteger:withName:",  objc_msgSend(*(id *)(a1 + 40), "itemCount"),  @"itemCount");
  id v5 =  objc_msgSend( *(id *)(a1 + 32),  "appendUnsignedInteger:withName:",  objc_msgSend(*(id *)(a1 + 40), "appSignerCount"),  @"appSignerCount");
  id v6 =  objc_msgSend( *(id *)(a1 + 32),  "appendUnsignedInteger:withName:",  objc_msgSend(*(id *)(a1 + 40), "installedProfileCount"),  @"installedProfileCount");
  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mdmProfileInfo]);
  id v9 = [v7 appendObject:v8 withName:@"mdmProfileInfo" skipIfNil:1];

  id v10 = *(void **)(a1 + 32);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) configurationProfilesInfo]);
  id v12 =  objc_msgSend( v10,  "appendUnsignedInteger:withName:",  objc_msgSend(v11, "count"),  @"configurationProfiles");

  id v13 = *(void **)(a1 + 32);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uninstalledProfilesInfo]);
  id v15 = objc_msgSend(v13, "appendUnsignedInteger:withName:", objc_msgSend(v14, "count"), @"uninstalledProfiles");

  __int128 v16 = *(void **)(a1 + 32);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) freeDeveloperAppSigners]);
  id v18 =  objc_msgSend( v16,  "appendUnsignedInteger:withName:",  objc_msgSend(v17, "count"),  @"freeDeveloperAppSigners");

  v19 = *(void **)(a1 + 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) enterpriseAppSigners]);
  id v21 =  objc_msgSend( v19,  "appendUnsignedInteger:withName:",  objc_msgSend(v20, "count"),  @"enterpriseAppSigners");

  v22 = *(void **)(a1 + 32);
  id v24 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) blockedApplications]);
  id v23 = objc_msgSend(v22, "appendUnsignedInteger:withName:", objc_msgSend(v24, "count"), @"blockedApplications");
}

MCTVProfileDetailViewController *sub_FFF8(uint64_t a1)
{
  return  -[MCTVProfileDetailViewController initWithProfileViewModel:mode:]( objc_alloc(&OBJC_CLASS___MCTVProfileDetailViewController),  "initWithProfileViewModel:mode:",  *(void *)(a1 + 32),  0LL);
}

void sub_1002C(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a2;
  -[TSKSettingItem setHidden:](v4, "setHidden:", [a3 count] == 0);
  -[TSKSettingItem setLocalizedValue:](v4, "setLocalizedValue:", 0LL);
}

id sub_10080(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (int *)[a3 integerValue];
  uint64_t v5 = 1LL;
  if (v4 == (int *)((char *)&dword_0 + 2))
  {
    id v6 = @"numberOfManagedApps";
    id v7 = @"APPS";
  }

  else
  {
    if (v4 != &dword_4)
    {
      id v9 = 0LL;
      id v6 = 0LL;
      goto LABEL_7;
    }

    id v6 = @"numberOfRestrictions";
    uint64_t v5 = 2LL;
    id v7 = @"RESTRICTIONS";
  }

  id v8 = MCUILocalizedString(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
LABEL_7:
  id v10 = *(void **)(a1 + 32);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_10190;
  __int128 v16 = &unk_28C98;
  id v17 = v10;
  uint64_t v18 = v5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  v17,  v6,  &v13));
  objc_msgSend(v11, "setUpdateBlock:", &stru_28CB8, v13, v14, v15, v16);

  return v11;
}

MCTVProfileDetailViewController *sub_10190(uint64_t a1)
{
  return  -[MCTVProfileDetailViewController initWithProfileViewModel:mode:]( objc_alloc(&OBJC_CLASS___MCTVProfileDetailViewController),  "initWithProfileViewModel:mode:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

void sub_101C0(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSNumberFormatter localizedStringFromNumber:numberStyle:]( &OBJC_CLASS___NSNumberFormatter,  "localizedStringFromNumber:numberStyle:",  a3,  0LL));
  -[TSKSettingItem setLocalizedValue:](v4, "setLocalizedValue:", v5);
}

void sub_103C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

MCTVRMConfigurationsViewController *sub_103F0(uint64_t a1)
{
  return  -[MCTVRMConfigurationsViewController initWithConfigurationInterface:]( objc_alloc(&OBJC_CLASS___MCTVRMConfigurationsViewController),  "initWithConfigurationInterface:",  *(void *)(a1 + 32));
}

void sub_10420(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(v5, "setHidden:", objc_msgSend(WeakRetained, "_hasRMConfigurations") ^ 1);
  }
}

LABEL_2:
  id v3 = self->_rmuiConfigInterface;
  self->_rmuiConfigInterface = 0LL;
LABEL_11:
}

void sub_116A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_116E4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) expiryDate]);
  if (v3
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
        id v5 = [v3 compare:v4],
        v4,
        v5 == (id)-1LL))
  {
    uint64_t v6 = [*(id *)(a1 + 32) isManagedByProfileService] ^ 1;
  }

  else
  {
    uint64_t v6 = 1LL;
  }

  [v7 setHidden:v6];
}

void sub_11780(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(v5, "setHidden:", objc_msgSend(WeakRetained, "isUnremovableProfile:", *(void *)(a1 + 32)));
  }
}

void sub_11AA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_11ACC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setActiveAlertController:0];
    id WeakRetained = v2;
  }
}

void sub_11E28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_11E70(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profile]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 removalPasscode]);

    if (v5
      && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 passwordField]),
          id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 text]),
          unsigned int v8 = [v5 isEqualToString:v7],
          v7,
          v6,
          !v8))
    {
      id v9 = (id *)&v14;
      id v13 = _NSConcreteStackBlock;
      id v10 = sub_11FE4;
      id v11 = &v13;
    }

    else
    {
      id v9 = (id *)&v16;
      id v15 = _NSConcreteStackBlock;
      id v10 = sub_11FB4;
      id v11 = &v15;
    }

    v11[1] = (void **)3221225472LL;
    v11[2] = (void **)v10;
    v11[3] = (void **)&unk_28610;
    objc_copyWeak(v9, v1);
    uint64_t v12 = objc_retainBlock(v11);
    objc_destroyWeak(v9);
    dispatch_async(&_dispatch_main_q, v12);
    [v3 setActiveAlertController:0];
  }
}

void sub_11FB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained performRemoveAfterFinalVerification];
    id WeakRetained = v2;
  }
}

void sub_11FE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showWrongRemovalPasswordAlert];
    id WeakRetained = v2;
  }
}

void sub_12014(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setActiveAlertController:0];
    id WeakRetained = v2;
  }
}

void sub_12048(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v4 setPlaceholder:*(void *)(a1 + 32)];
    [v4 setSecureTextEntry:1];
    [WeakRetained setPasswordField:v4];
  }
}

void sub_122C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_12304(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setActiveAlertController:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_123A8;
    block[3] = &unk_28610;
    objc_copyWeak(&v5, v1);
    dispatch_async(&_dispatch_main_q, block);
    objc_destroyWeak(&v5);
  }
}

void sub_123A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _leaveRemoteManagementAndErase];
    id WeakRetained = v2;
  }
}

void sub_123D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setActiveAlertController:0];
    id WeakRetained = v2;
  }
}

void sub_124AC(_Unwind_Exception *a1)
{
}

void sub_124D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_LEAVING_REMOTE_MANAGEMENT_FAILED_ALERT_TITLE");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      id v8 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_LEAVING_REMOTE_MANAGEMENT_FAILED_ALERT_BODY");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v9,  1LL));
      [WeakRetained setActiveAlertController:v10];

      id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained activeAlertController]);
      id v12 = MCUILocalizedString(@"OK");
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_126F4;
      v19[3] = &unk_286F0;
      objc_copyWeak(&v20, v4);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  1LL,  v19));
      [v11 addAction:v14];

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_12728;
      v17[3] = &unk_28610;
      objc_copyWeak(&v18, v4);
      dispatch_async(&_dispatch_main_q, v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
    }

    else
    {
      id v15 = MCTVLoggingFacility();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "MCTVRemoveProfileViewController: Unenroll is successfull. Erasing the device…",  buf,  2u);
      }

      [WeakRetained _resetDevice];
    }
  }
}

void sub_126E0(_Unwind_Exception *a1)
{
}

void sub_126F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setActiveAlertController:0];
    id WeakRetained = v2;
  }
}

void sub_12728(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained activeAlertController]);
    [v3 presentViewController:v2 animated:1 completion:0];

    id WeakRetained = v3;
  }
}

void sub_127D8(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = MCTVLoggingFacility();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description"));
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "######## Erasing Apple TV failed. Error: %{public}@",  (uint8_t *)&v7,  0xCu);
    }
  }

  else if (v5)
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "######## Apple TV is erase successfully.", (uint8_t *)&v7, 2u);
  }
}

void sub_12A90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_12AB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setActiveAlertController:0];
    id WeakRetained = v2;
  }
}

void sub_12BD4(_Unwind_Exception *a1)
{
}

void sub_12BF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
    id v3 = [v2 popViewControllerAnimated:1];

    id WeakRetained = v4;
  }
}

void sub_12D70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_12D94(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_12E0C;
  block[3] = &unk_28610;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_12E0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _profileRemovalDidFinish];
    id WeakRetained = v2;
  }
}

id sub_13564(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_13674;
  v13[3] = &unk_28A48;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  0LL,  v6,  0LL,  v13));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_13710;
  v11[3] = &unk_28660;
  id v12 = v6;
  id v9 = v6;
  [v8 setUpdateBlock:v11];

  return v8;
}

MCTVRMInteractiveLegacyProfilesViewController *sub_13674(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInteractiveProfile])
  {
    id v2 = objc_alloc(&OBJC_CLASS___MCTVRMInteractiveLegacyProfilesViewController);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) rmuiConfigInterface]);
    id v4 = -[MCTVRMInteractiveLegacyProfilesViewController initWithRMUIConfigurationInterface:profileViewModel:]( v2,  "initWithRMUIConfigurationInterface:profileViewModel:",  v3,  *(void *)(a1 + 32));
  }

  else
  {
    BOOL v5 = objc_alloc(&OBJC_CLASS___MCTVProfileViewController);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) profileIdentifier]);
    id v4 = -[MCTVProfileViewController initWithProfileIdentifier:](v5, "initWithProfileIdentifier:", v3);
  }

  id v6 = v4;

  return v6;
}

void sub_13710(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 value]);
  [v3 setLocalizedValue:v4];
}

id sub_13808(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_138CC;
  v9[3] = &unk_28A48;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  0LL,  v6,  0LL,  v9));

  return v7;
}

MCTVRMKeyValueViewController *sub_138CC(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___MCTVRMKeyValueViewController);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rmuiConfigInterface]);
  id v4 = -[MCTVRMKeyValueViewController initWithRMUIConfigurationInterface:pluginViewModel:]( v2,  "initWithRMUIConfigurationInterface:pluginViewModel:",  v3,  *(void *)(a1 + 40));

  return v4;
}

void sub_13E28(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 viewState]);
  if ([v5 isConfigEnabled])
  {
    id v8 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rmuiProfileViewModel]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 footerViewModel]);
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 title]);
  }

  [v4 setLocalizedDescription:v8];
}

MCTVProfileViewController *sub_13EC8(uint64_t a1)
{
  return  -[MCTVProfileViewController initWithProfileIdentifier:]( objc_alloc(&OBJC_CLASS___MCTVProfileViewController),  "initWithProfileIdentifier:",  *(void *)(a1 + 32));
}

void sub_13EF8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 viewState]);
  objc_msgSend(v3, "setHidden:", objc_msgSend(v4, "isConfigEnabled") ^ 1);
}

void sub_14014( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_14038(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained viewState]);
    [v6 updateState];

    if (v7) {
      [v5 _presentAlertForErrorModel:v7];
    }
    [v5 reloadSettings];
  }
}

LABEL_57:
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v91);
  v87 = (NSArray *)-[NSMutableArray copy](v91, "copy");
  constraints = self->_constraints;
  self->_constraints = v87;
}

void sub_153F0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  id v2 = (void *)qword_311F0;
  qword_311F0 = v1;
}

void sub_15468(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  id v2 = (void *)qword_31200;
  qword_31200 = v1;
}

void sub_154E0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  id v2 = (void *)qword_31210;
  qword_31210 = v1;
}

LABEL_16:
  self->_untrustedAppCount = v8;
  self->_almostUntrustedAppCount = v7;
}

void sub_15A78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained applications]);
    id v4 = [v3 mutableCopy];

    [v4 removeObject:*(void *)(a1 + 32)];
    id v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v5;

    id WeakRetained = v8;
  }
}

LABEL_33:
              uint64_t v6 = v51;
              id v5 = v52;
              id v7 = v50;
            }
          }

          else
          {
            NSLog(@"MCUIAppSigner: Ignoring potential app signer for app %@: App not installed", v13);
          }
        }

        else
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
          NSLog(@"MCUIAppSigner: Ignoring potential app signer for app %@: No signer identity", v14);
        }

        objc_autoreleasePoolPop(v10);
        id v8 = (char *)v8 + 1;
      }

      while (v8 != v57);
      v36 = [v6 countByEnumeratingWithState:&v69 objects:v76 count:16];
      v57 = v36;
    }

    while (v36);
  }

  v56 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v37 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v38 = v3;
  v58 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v61,  v74,  16LL);
  if (v58)
  {
    v54 = *(void *)v62;
    do
    {
      for (j = 0LL; j != v58; j = (char *)j + 1)
      {
        if (*(void *)v62 != v54) {
          objc_enumerationMutation(v38);
        }
        v40 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v38, "objectForKey:", v40));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKey:v40]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKey:v40]);
        v44 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        v45 = v44;
        if (v42) {
          -[NSMutableArray addObjectsFromArray:](v44, "addObjectsFromArray:", v42);
        }
        if (v43) {
          -[NSMutableArray addObjectsFromArray:](v45, "addObjectsFromArray:", v43);
        }
        v46 = -[MCUIAppSigner initWithIdentity:applications:provisioningProfiles:hasUPP:hasFreePP:]( [MCUIAppSigner alloc],  "initWithIdentity:applications:provisioningProfiles:hasUPP:hasFreePP:",  v40,  v41,  v45,  [v42 count] != 0,  objc_msgSend(v43, "count") != 0);
        if ([v42 count]) {
          v47 = v56;
        }
        else {
          v47 = v37;
        }
        -[NSMutableArray addObject:](v47, "addObject:", v46);
      }

      v58 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v61,  v74,  16LL);
    }

    while (v58);
  }

  if (a3) {
    *a3 = v37;
  }

  return v56;
}

void sub_1658C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 isUniversalPP]) {
    +[MCUIAppSigner _addProfile:toSignerIdentity:inDictionary:]( &OBJC_CLASS___MCUIAppSigner,  "_addProfile:toSignerIdentity:inDictionary:",  v6,  v5,  *(void *)(a1 + 32));
  }
  if ([v6 isFreePP]) {
    +[MCUIAppSigner _addProfile:toSignerIdentity:inDictionary:]( &OBJC_CLASS___MCUIAppSigner,  "_addProfile:toSignerIdentity:inDictionary:",  v6,  v5,  *(void *)(a1 + 40));
  }
}

void sub_168C8(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_16960;
  block[3] = &unk_28E70;
  id v2 = *(dispatch_group_s **)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  dispatch_group_notify(v2, &_dispatch_main_q, block);
}

uint64_t sub_16960(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_16A54(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) _provisioningProfileUUIDsForAppSigner:*(void *)(a1 + 32)]);
  NSLog( @"MCUIAppSignerUninstallerUtilities async uninstalling %lu provisioning profiles...",  [v2 count]);
  if ([v2 count])
  {
    unint64_t v3 = 0LL;
    do
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      ++v3;
    }

    while ((unint64_t)[v2 count] > v3);
  }

  id v4 = [v2 count];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_16B70;
  block[3] = &unk_28EC0;
  id v9 = *(id *)(a1 + 48);
  id v10 = v2;
  id v11 = *(id *)(a1 + 40);
  id v7 = v2;
  dispatch_apply((size_t)v4, v6, block);
}

void sub_16B70(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:a2]);
  [v3 uninstallProvisioningProfileWithUUID:v4];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_16C98(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applications]);
  NSLog(@"MCUIAppSignerUninstallerUtilities async uninstalling %lu apps...", [v2 count]);
  if ([v2 count])
  {
    unint64_t v3 = 0LL;
    do
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      ++v3;
    }

    while ((unint64_t)[v2 count] > v3);
  }

  id v4 = [v2 count];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_16DC4;
  block[3] = &unk_28F10;
  id v9 = *(id *)(a1 + 48);
  id v10 = v2;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v7 = v2;
  dispatch_apply((size_t)v4, v6, block);
}

void sub_16DC4(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:a2]);
  [v4 uninstallApplicationWithBundleID:v5];

  id v6 = *(void **)(a1 + 48);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:a2]);
  objc_msgSend(v6, "main_removeMCUIReferenceForBundleID:", v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_16FE8(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MCUIDataManager);
  id v2 = (void *)qword_31220;
  qword_31220 = (uint64_t)v1;
}

void sub_17304( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_17338(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:0];
}

void sub_17368(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:0];
}

void sub_1767C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

unint64_t sub_17694(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  id v4 = (char *)[*(id *)(v2 + 32) count];
  if (v3) {
    id v5 = v4 + 1;
  }
  else {
    id v5 = v4;
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  id v7 = &v5[(unint64_t)[*(id *)(*(void *)(a1 + 32) + 56) count] + (void)v6];
  id v8 = (char *)[*(id *)(*(void *)(a1 + 32) + 64) count];
  unint64_t result = (unint64_t)[*(id *)(*(void *)(a1 + 32) + 40) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = &v8[result + (void)v7];
  return result;
}

void sub_177C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_177DC(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(*(void *)(a1 + 32) + 48) count];
  id result = [*(id *)(*(void *)(a1 + 32) + 56) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = &v2[(void)result];
  return result;
}

void sub_178C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

char *sub_178E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  id result = (char *)[*(id *)(v2 + 32) count];
  if (v3) {
    id v5 = result + 1;
  }
  else {
    id v5 = result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
  return result;
}

void sub_179E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_179FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_17A0C(uint64_t a1)
{
}

void sub_17A14(uint64_t a1)
{
}

void sub_17AF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_17B08(uint64_t a1)
{
}

void sub_17BE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_17BFC(uint64_t a1)
{
}

void sub_17CD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_17CF0(uint64_t a1)
{
}

void sub_17DCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_17DE4(uint64_t a1)
{
}

void sub_17EC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_17ED8(uint64_t a1)
{
}

void sub_18124( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36)
{
}

void sub_18178(void *a1)
{
}

id sub_182F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadQueueReloadDataInBackgroundIncludingProfiles:*(unsigned __int8 *)(a1 + 48) appSigners:*(unsigned __int8 *)(a1 + 49) blockedApplications:*(unsigned __int8 *)(a1 + 50) completion:*(void *)(a1 + 40)];
}

void sub_1866C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 88))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24LL), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32LL), *(id *)(a1 + 48));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40LL), *(id *)(a1 + 56));
  }

  if (*(_BYTE *)(a1 + 89))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), *(id *)(a1 + 64));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), *(id *)(a1 + 72));
  }

  if (*(_BYTE *)(a1 + 90)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64LL), *(id *)(a1 + 80));
  }
}

void sub_18704(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void, void, void, void))(v2 + 16))( v2,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72));
  }
  if (*(_BYTE *)(a1 + 88))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 postNotificationName:@"kMCUIProfilesUpdatedNotification" object:0 userInfo:0];
  }

  if (*(_BYTE *)(a1 + 89))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 postNotificationName:@"kMCUIAppSignersUpdatedNotification" object:0 userInfo:0];
  }

  if (*(_BYTE *)(a1 + 88) || *(_BYTE *)(a1 + 89) || *(_BYTE *)(a1 + 90))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v9[0] = @"kMCUIProfilesUpdatedNotification";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 88)));
    v9[1] = @"kMCUIAppSignersUpdatedNotification";
    v10[0] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 89)));
    v10[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
    [v5 postNotificationName:@"kMCUIUpdatedNotification" object:0 userInfo:v8];
  }

uint64_t sub_18940(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_189F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a5, a6, a7);
  }
  return result;
}

uint64_t MCUIIsiPhone()
{
  return 0LL;
}

uint64_t MCUIIsiPad()
{
  return 0LL;
}

uint64_t MCUIIsInternalDevice()
{
  return os_variant_has_internal_diagnostics("com.apple.ManagedConfigurationUI");
}

uint64_t MCUIForPairedDevice()
{
  return 0LL;
}

id MCUIPreferAlert()
{
  return +[DMCMobileGestalt isVisionDevice](&OBJC_CLASS___DMCMobileGestalt, "isVisionDevice");
}

id MCUILocalizedString(void *a1)
{
  uint64_t v1 = qword_31248;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_31248, &stru_290C8);
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_31240 localizedStringForKey:v2 value:&stru_29488 table:@"ManagedConfigurationUI"]);

  return v3;
}

id MCUILocalizedStringByDevice(void *a1)
{
  id v1 = a1;
  id v2 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  id v3 = MCUILocalizedStringForDevice(v1, v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

id MCUILocalizedStringForDevice(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 uppercaseString]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v4, v5));

    id v7 = MCUILocalizedString(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ([v8 isEqualToString:v6])
    {
      id v9 = MCUILocalizedString(v4);
      id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    }

    else
    {
      id v10 = v8;
    }

    id v12 = v10;
  }

  else
  {
    id v11 = MCUILocalizedString(v3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v12;
}

id MCTVLoggingFacility()
{
  if (qword_31238 != -1) {
    dispatch_once(&qword_31238, &stru_290A8);
  }
  return (id)qword_31230;
}

void sub_18D94(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mcui-tv", "log");
  id v2 = (void *)qword_31230;
  qword_31230 = (uint64_t)v1;
}

void sub_18DC4(id a1)
{
  os_log_t v1 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS____MCUIBundleClass));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_31240;
  qword_31240 = v2;
}

id objc_msgSend__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_asyncUninstallProvisioningProfilesForAppSigner:withUninstaller:dispatchGroup:");
}

id objc_msgSend_allDeviceManagementOutMDMProfileInfo_outConfigurationProfilesInfo_outUninstalledProfilesInfo_outEnterpriseAppSigners_outFreeDevAppSigners_outBlockedApplications_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "allDeviceManagementOutMDMProfileInfo:outConfigurationProfilesInfo:outUninstalledProfilesInfo:outEnterpriseApp Signers:outFreeDevAppSigners:outBlockedApplications:");
}

id objc_msgSend_allProfilesOutMDMProfileInfo_outConfigurationProfilesInfo_outUninstalledProfilesInfo_forDeviceType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "allProfilesOutMDMProfileInfo:outConfigurationProfilesInfo:outUninstalledProfilesInfo:forDeviceType:");
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:");
}

id objc_msgSend_reloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:");
}

id objc_msgSend_toggleItemWithTitle_description_representedObject_keyPath_onTitle_offTitle_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}
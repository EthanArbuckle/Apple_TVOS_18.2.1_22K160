void sub_3D3C(void *a1)
{
  VSRemoteNotifier *v1;
  VSRemoteNotifier *v2;
  id v3;
  id *v4;
  v4 = a1;
  v1 = objc_alloc(&OBJC_CLASS___VSRemoteNotifier);
  v2 = -[VSRemoteNotifier initWithNotificationName:]( v1,  "initWithNotificationName:",  VSUserAccountsDidChangeNotification);
  v3 = v4[3];
  v4[3] = v2;

  objc_msgSend(v4[3], "setDelegate:");
}

VSTVAppDeveloperSettingsAccountViewController_tvOS *sub_41D8(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___VSTVAppDeveloperSettingsAccountViewController_tvOS);
  -[VSTVAppDeveloperSettingsAccountViewController_tvOS setAccount:](v2, "setAccount:", *(void *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) displayName]);
  -[VSTVAppDeveloperSettingsAccountViewController_tvOS setTitle:](v2, "setTitle:", v3);

  return v2;
}

void sub_42E0(_Unwind_Exception *a1)
{
}

void sub_4304(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setLoading:0];
    [v5 setGroupedDeveloperAccounts:v3];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_4398;
    v6[3] = &unk_81F8;
    v6[4] = v5;
    VSPerformBlockOnMainThread(v6);
  }
}

id sub_4398(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSettings];
}

void sub_44C4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && [v7 count]) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) groupedDeveloperAccounts:v7]);
  }
  else {
    v6 = 0LL;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_5118(void *a1)
{
  v4 = a1;
  v1 = objc_alloc(&OBJC_CLASS___VSRemoteNotifier);
  uint64_t v2 = -[VSRemoteNotifier initWithNotificationName:]( v1,  "initWithNotificationName:",  VSUserAccountsDidChangeNotification);
  id v3 = v4[2];
  v4[2] = v2;

  objc_msgSend(v4[2], "setDelegate:");
}

id sub_5B24(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updateURLString]);
  id v5 = [v2 initWithTitle:v3 text:v4];

  return v5;
}

id sub_5B84(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) authenticationDataString]);
  id v5 = [v2 initWithTitle:v3 text:v4];

  return v5;
}

VSTVAppDeveloperSettingsListViewController_tvOS *sub_5BE4(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___VSTVAppDeveloperSettingsListViewController_tvOS);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tierIdentifiers]);
  -[VSTVAppDeveloperSettingsListViewController_tvOS setListItems:](v2, "setListItems:", v3);

  -[VSTVAppDeveloperSettingsListViewController_tvOS setTitle:](v2, "setTitle:", *(void *)(a1 + 40));
  return v2;
}

void sub_5D70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_5D98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained setAccount:v3];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_5E24;
      v6[3] = &unk_81F8;
      v6[4] = v5;
      VSPerformBlockOnMainThread(v6);
    }
  }
}

id sub_5E24(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSettings];
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:");
}

id objc_msgSend_fetchUserAccountWithSourceIdentifier_sourceType_deviceIdentifier_withCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchUserAccountWithSourceIdentifier:sourceType:deviceIdentifier:withCompletion:");
}

id objc_msgSend_vs_localizedStringFromBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vs_localizedStringFromBool:");
}
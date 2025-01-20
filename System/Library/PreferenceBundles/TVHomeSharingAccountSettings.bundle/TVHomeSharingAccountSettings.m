}

void sub_4960( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_497C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4A40;
  block[3] = &unk_C2A8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_4A40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v9 = WeakRetained;
    if (v3)
    {
      id v4 = [v3 code];
      [v9 setAuthenticationInProgress:0];
      if (v4 == (id)-7003LL)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
        id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));

        if (v6) {
          [v9 _showShouldUseAccountDialog:v6];
        }
        else {
          [v9 _notifyDidCancel];
        }
      }

      else
      {
        [v9 _presentError];
      }
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:AKAuthenticationUsernameKey]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:AKAuthenticationPasswordKey]);
      [v9 _enableHomeSharingWithAccountName:v7 password:v8];
    }

    id WeakRetained = v9;
  }
}

void sub_4EC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
}

void sub_4F18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showLoginWithAccount:*(void *)(a1 + 32)];
}

void sub_4F54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showLoginWithAccount:0];
}

void sub_4F84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDidCancel];
}

void sub_5098(_Unwind_Exception *a1)
{
}

void sub_50BC(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_515C;
  block[3] = &unk_C348;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v6);
}

void sub_515C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setAuthenticationInProgress:0];
    if (*(_BYTE *)(a1 + 48)) {
      [v3 _notifyDidSucceedWithAccountName:*(void *)(a1 + 32)];
    }
    else {
      [v3 _presentError];
    }
    id WeakRetained = v3;
  }
}

void sub_5398( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_53C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDidCancel];
}

void sub_5820( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_5880(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateEnableItem:v3];
}

void sub_58C8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateDisableItem:v3];
}

void sub_60E8(id a1, UIAlertAction *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  [v2 setMediaServerDiscoveryConfigurationWithMode:0 homeSharingAccountName:0 homeSharingPassword:0 completionHandler:0];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v3 resetAccountRelatedSettings];
}

LABEL_20:
  return v14;
}

CFStringRef sub_69FC(uint64_t a1)
{
  else {
    return *(&off_C4B8 + a1 - 1);
  }
}

void sub_6A98(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) _init];
  uint64_t v2 = (void *)qword_112D0;
  qword_112D0 = (uint64_t)v1;
}

void sub_70A4(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaServerByIdentifier]);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaServerIdentifier]);
  [v4 setObject:v2 forKey:v3];
}

void sub_71D4(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaServerByIdentifier]);
  [v1 removeAllObjects];
}

uint64_t sub_77E8(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t sub_7800(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_7814(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_7828(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_783C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_7850(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_7864(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_7878(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_788C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_78A0(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 80LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_78B4(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88LL) = *(void *)(result + 40);
  return result;
}

id sub_78C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMediaServerByIdentifier:*(void *)(a1 + 40)];
}

id sub_7F54()
{
  if (qword_112E8 != -1) {
    dispatch_once(&qword_112E8, &stru_C508);
  }
  return (id)qword_112E0;
}

void sub_7F94(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ApplicationDelegate");
  uint64_t v2 = (void *)qword_112E0;
  qword_112E0 = (uint64_t)v1;
}

id sub_7FC4()
{
  if (qword_112F8 != -1) {
    dispatch_once(&qword_112F8, &stru_C528);
  }
  return (id)qword_112F0;
}

void sub_8004(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ChangeSetDataSource");
  uint64_t v2 = (void *)qword_112F0;
  qword_112F0 = (uint64_t)v1;
}

id sub_8034()
{
  if (qword_11308 != -1) {
    dispatch_once(&qword_11308, &stru_C548);
  }
  return (id)qword_11300;
}

void sub_8074(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "DiffableDataSource");
  uint64_t v2 = (void *)qword_11300;
  qword_11300 = (uint64_t)v1;
}

id sub_80A4()
{
  if (qword_11318 != -1) {
    dispatch_once(&qword_11318, &stru_C568);
  }
  return (id)qword_11310;
}

void sub_80E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ImageProxyQueueLoader");
  uint64_t v2 = (void *)qword_11310;
  qword_11310 = (uint64_t)v1;
}

id sub_8114()
{
  if (qword_11328 != -1) {
    dispatch_once(&qword_11328, &stru_C588);
  }
  return (id)qword_11320;
}

void sub_8154(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "MainSceneDelegate");
  uint64_t v2 = (void *)qword_11320;
  qword_11320 = (uint64_t)v1;
}

id sub_8184()
{
  if (qword_11338 != -1) {
    dispatch_once(&qword_11338, &stru_C5A8);
  }
  return (id)qword_11330;
}

void sub_81C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "MediaEntityFetching");
  uint64_t v2 = (void *)qword_11330;
  qword_11330 = (uint64_t)v1;
}

id sub_81F4()
{
  if (qword_11348 != -1) {
    dispatch_once(&qword_11348, &stru_C5C8);
  }
  return (id)qword_11340;
}

void sub_8234(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Playback");
  uint64_t v2 = (void *)qword_11340;
  qword_11340 = (uint64_t)v1;
}

id sub_8264()
{
  if (qword_11358 != -1) {
    dispatch_once(&qword_11358, &stru_C5E8);
  }
  return (id)qword_11350;
}

void sub_82A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Playlist");
  uint64_t v2 = (void *)qword_11350;
  qword_11350 = (uint64_t)v1;
}

id sub_82D4()
{
  if (qword_11368 != -1) {
    dispatch_once(&qword_11368, &stru_C608);
  }
  return (id)qword_11360;
}

void sub_8314(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "PPT");
  uint64_t v2 = (void *)qword_11360;
  qword_11360 = (uint64_t)v1;
}

id sub_8344()
{
  if (qword_11378 != -1) {
    dispatch_once(&qword_11378, &stru_C628);
  }
  return (id)qword_11370;
}

void sub_8384(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "RootViewController");
  uint64_t v2 = (void *)qword_11370;
  qword_11370 = (uint64_t)v1;
}

id sub_83B4()
{
  if (qword_11388 != -1) {
    dispatch_once(&qword_11388, &stru_C648);
  }
  return (id)qword_11380;
}

void sub_83F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ScreenSaver");
  uint64_t v2 = (void *)qword_11380;
  qword_11380 = (uint64_t)v1;
}

id sub_8424()
{
  if (qword_11398 != -1) {
    dispatch_once(&qword_11398, &stru_C668);
  }
  return (id)qword_11390;
}

void sub_8464(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Search");
  uint64_t v2 = (void *)qword_11390;
  qword_11390 = (uint64_t)v1;
}

id sub_8494()
{
  if (qword_113A8 != -1) {
    dispatch_once(&qword_113A8, &stru_C688);
  }
  return (id)qword_113A0;
}

void sub_84D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Settings");
  uint64_t v2 = (void *)qword_113A0;
  qword_113A0 = (uint64_t)v1;
}

id sub_8504()
{
  if (qword_113B8 != -1) {
    dispatch_once(&qword_113B8, &stru_C6A8);
  }
  return (id)qword_113B0;
}

void sub_8544(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "URLHandler");
  uint64_t v2 = (void *)qword_113B0;
  qword_113B0 = (uint64_t)v1;
}

id sub_8574()
{
  if (qword_113C8 != -1) {
    dispatch_once(&qword_113C8, &stru_C6C8);
  }
  return (id)qword_113C0;
}

void sub_85B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "UserInterface");
  uint64_t v2 = (void *)qword_113C0;
  qword_113C0 = (uint64_t)v1;
}

uint64_t sub_85E4(unint64_t a1)
{
  if (a1 > 2) {
    return 0LL;
  }
  else {
    return (uint64_t)*(&off_C6E8 + a1);
  }
}

void sub_8604(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "No media server identifier representation found in dictionary: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_8678(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Unable to convert media server identifier representation into object",  v1,  2u);
}

id objc_msgSend_setMediaServerDiscoveryConfigurationWithMode_homeSharingAccountName_homeSharingPassword_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setMediaServerDiscoveryConfigurationWithMode:homeSharingAccountName:homeSharingPassword:completionHandler:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}
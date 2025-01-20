void sub_44E8(id *a1, void *a2, char *a3, void *a4)
{
  TVSMPeoplePickerPersonModule *v4;
  id v5;
  BOOL v6;
  id v7;
  id v10;
  NSString *v11;
  id v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22[4];
  id location[2];
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v22[3] = a3;
  v22[2] = a4;
  v22[1] = a1;
  v4 = objc_alloc(&OBJC_CLASS___TVSMPeoplePickerPersonModule);
  v22[0] = -[TVSMPeoplePickerPersonModule initWithUser:](v4, "initWithUser:", location[0]);
  v10 = [a1[4] delegate];
  objc_msgSend(v22[0], "setDelegate:");

  v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"user%lu", a3 + 1);
  objc_msgSend(v22[0], "setAnalyticsIdentifier:");

  objc_initWeak(&v21, a1[4]);
  v13 = v22[0];
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_4790;
  v18 = &unk_C1B0;
  objc_copyWeak(&v20, &v21);
  v19 = location[0];
  [v13 setActionHandler:&v14];
  v7 = location[0];
  v5 = [*((id *)a1[4] + 2) currentUser];
  v6 = v7 == v5;

  [v22[0] setSelected:v6];
  [a1[5] addObject:v22[0]];
  objc_storeStrong(&v19, 0LL);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v21);
  objc_storeStrong(v22, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_4744(uint64_t a1, int a2)
{
  *(void *)(v2 - 128) = a1;
  *(_DWORD *)(v2 - 132) = a2;
  objc_destroyWeak((id *)(v2 - 80));
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 128));
}

void sub_4790(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3[0]) {
    [*((id *)v3[0] + 2) setCurrentUser:*(void *)(a1 + 32)];
  }
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_4828(id a1, TVPeoplePickerSuggestedUser *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v6[1] = a1;
  uint64_t v2 = objc_alloc(&OBJC_CLASS___TVSMPeoplePickerSuggestedUserModule);
  v6[0] = -[TVSMPeoplePickerSuggestedUserModule initWithSuggestedUser:](v2, "initWithSuggestedUser:", location[0]);
  id v5 = v6[0];
  objc_storeStrong(v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}
}

void sub_50C4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [a1[4] setImage:location[0]];
  objc_storeStrong(location, 0LL);
}

void sub_64F0(id a1, BOOL a2, NSError *a3)
{
  id v14 = a1;
  BOOL v13 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  oslog[1] = (os_log_t)a1;
  if (!v13)
  {
    oslog[0] = (os_log_t)(id)people_picker_log();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      log = oslog[0];
      os_log_type_t v6 = type;
      id v7 = [location domain];
      id v4 = v7;
      id v9 = v4;
      id v3 = [location code];
      sub_665C((uint64_t)v15, (uint64_t)v4, (uint64_t)v3, (uint64_t)location);
      _os_log_error_impl( &dword_0,  log,  v6,  "Failed to selecte a new user. {errorDomain=%{public}@, errorCode=%ld, error=%@}",  v15,  0x20u);

      objc_storeStrong(&v9, 0LL);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  objc_storeStrong(&location, 0LL);
}

uint64_t sub_665C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_67D4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

_BYTE *sub_68E0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t sub_6D64(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

id sub_6D9C(id *a1)
{
  id v11 = a1[4];
  v12 = NSStringFromSelector("currentUser");
  objc_msgSend(v11, "willChangeValueForKey:");

  id v13 = a1[4];
  id v14 = NSStringFromSelector("users");
  objc_msgSend(v13, "willChangeValueForKey:");

  id v15 = a1[4];
  v16 = NSStringFromSelector("canShowAddNewUserOption");
  objc_msgSend(v15, "willChangeValueForKey:");

  objc_storeStrong((id *)a1[4] + 4, a1[5]);
  id v1 = [a1[6] copy];
  uint64_t v2 = a1[4];
  id v3 = (void *)v2[2];
  v2[2] = v1;

  unsigned __int8 v18 = 1;
  *((_BYTE *)a1[4] + 8) = v18 & 1;
  id v5 = a1[4];
  os_log_type_t v6 = NSStringFromSelector("currentUser");
  objc_msgSend(v5, "didChangeValueForKey:");

  id v7 = a1[4];
  v8 = NSStringFromSelector("users");
  objc_msgSend(v7, "didChangeValueForKey:");

  id v9 = a1[4];
  v10 = NSStringFromSelector("canShowAddNewUserOption");
  objc_msgSend(v9, "didChangeValueForKey:");

  return [a1[4] _fetchProfilePhotosForSingedInUsers];
}

id sub_71D4(id a1, PBSSuggestedUserProfile *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v2 = objc_alloc(&OBJC_CLASS___TVPeoplePickerSuggestedUser);
  id v4 = -[TVPeoplePickerSuggestedUser initWithSuggestedUserProfile:](v2, "initWithSuggestedUserProfile:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

id sub_7244(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = NSStringFromSelector("suggestedUsers");
  objc_msgSend(v2, "willChangeValueForKey:");

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24LL), *(id *)(a1 + 40));
  id v4 = *(void **)(a1 + 32);
  id v5 = NSStringFromSelector("suggestedUsers");
  objc_msgSend(v4, "didChangeValueForKey:");

  return [*(id *)(a1 + 32) _fetchProfilePhotosForSuggestedUsers];
}

void sub_75F4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [a1[4] setProfilePhoto:location[0]];
  objc_storeStrong(location, 0LL);
}

void sub_793C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [a1[4] setProfileImage:location[0]];
  objc_storeStrong(location, 0LL);
}

void sub_84DC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponentsFormatter);
  uint64_t v2 = (void *)qword_12DA8;
  qword_12DA8 = (uint64_t)v1;

  [(id)qword_12DA8 setStyle:1];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}
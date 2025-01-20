id sub_100004678()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;
  predicate = (dispatch_once_t *)&unk_100011EE8;
  block = 0LL;
  objc_storeStrong(&block, &stru_10000C1D8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100011EE0;
}

void sub_1000046F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVUserProfileService", "GroupRecommendationsPicker");
  v2 = (void *)qword_100011EE0;
  qword_100011EE0 = (uint64_t)v1;
}

id sub_10000473C()
{
  predicate = (dispatch_once_t *)&unk_100011EF8;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_10000C1F8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100011EF0;
}

void sub_1000047B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVUserProfileService", "GroupRecommendationsConsent");
  v2 = (void *)qword_100011EF0;
  qword_100011EF0 = (uint64_t)v1;
}

void sub_100004A38( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, id *location)
{
  *(void *)(v13 - 48) = a1;
  *(_DWORD *)(v13 - 52) = a2;
  objc_destroyWeak((id *)(v13 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v13 - 48));
}

void sub_100004ABC(id *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  v4[0] = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=NEW_USER");
  id v1 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v4[0]);

  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _dismiss];

  objc_storeStrong(v4, 0LL);
}

void sub_100004B6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismiss];
}

uint64_t sub_100004C98(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_100005228(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  return result;
}

uint64_t sub_1000054D0(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_1000056CC(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_10000592C(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v37 = 0LL;
  objc_storeStrong(&v37, a3);
  v36[1] = (id)a1;
  if (location[0])
  {
    v36[0] = sub_10000473C();
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v36[0], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v36[0];
      os_log_type_t type = v35;
      id v14 = [location[0] identifier];
      id v34 = v14;
      sub_100005D08((uint64_t)v40, (uint64_t)v34, (uint64_t)[location[0] groupRecommendationsConsent]);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Group recommendations consent updated. {identifier=%{public}@, consent=%ld}",  v40,  0x16u);

      objc_storeStrong(&v34, 0LL);
    }

    objc_storeStrong(v36, 0LL);
    queue = &_dispatch_main_q;
    v27 = _NSConcreteStackBlock;
    int v28 = -1073741824;
    int v29 = 0;
    v30 = sub_100005D58;
    v31 = &unk_10000C4F0;
    id v32 = *(id *)(a1 + 32);
    char v33 = *(_BYTE *)(a1 + 40) & 1;
    dispatch_async(queue, &v27);

    objc_storeStrong(&v32, 0LL);
  }

  else
  {
    id v26 = sub_10000473C();
    char v25 = 16;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      v7 = (os_log_s *)v26;
      os_log_type_t v8 = v25;
      id v10 = [location[0] identifier];
      id v5 = v10;
      id v24 = v5;
      id v9 = [v37 domain];
      id v6 = v9;
      id v23 = v6;
      id v3 = [v37 code];
      sub_100005D94((uint64_t)v39, (uint64_t)v5, (uint64_t)v6, (uint64_t)v3, (uint64_t)v37);
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  v8,  "Failed to update group recommendations consent. {identifier=%{public}@, errorDomain=%{public}@, errorCode=%ld, error=%@}",  v39,  0x2Au);

      objc_storeStrong(&v23, 0LL);
      objc_storeStrong(&v24, 0LL);
    }

    objc_storeStrong(&v26, 0LL);
    v4 = &_dispatch_main_q;
    v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    v20 = sub_100005E14;
    v21 = &unk_10000C518;
    id v22 = *(id *)(a1 + 32);
    dispatch_async(v4, &v17);

    objc_storeStrong(&v22, 0LL);
  }

  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100005D08(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id sub_100005D58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dimissWithConsentGiven:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

uint64_t sub_100005D94(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

id sub_100005E14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dimissWithConsentGiven:", 0, a1, a1);
}

uint64_t start(int a1, char **a2)
{
  unsigned int v10 = 0;
  int v9 = a1;
  os_log_type_t v8 = a2;
  id v7 = 0LL;
  context = objc_autoreleasePoolPush();
  v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  id v3 = NSStringFromClass(v2);
  id v4 = v7;
  id v7 = v3;

  objc_autoreleasePoolPop(context);
  unsigned int v10 = UIApplicationMain(v9, v8, 0LL, (NSString *)v7);
  objc_storeStrong(&v7, 0LL);
  return v10;
}

void sub_100006640( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  *(void *)(v13 - 136) = a1;
  *(_DWORD *)(v13 - 140) = a2;
  objc_destroyWeak((id *)(v13 - 88));
  objc_destroyWeak((id *)(v13 - 80));
  _Unwind_Resume(*(_Unwind_Exception **)(v13 - 136));
}

void sub_1000066B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained dataSource];
  [v2 addUserToSelectionWithIdentifier:*(void *)(a1 + 32)];
}

void sub_100006724(uint64_t a1)
{
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    oslog[0] = (os_log_t)sub_100004678();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_1000054D0((uint64_t)v4, *(void *)(a1 + 32));
      _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Selected user declined consent, dismissing. {identifier=%{public}@}",  v4,  0xCu);
    }

    objc_storeStrong((id *)oslog, 0LL);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _dismiss];
  }
}

uint64_t sub_100006E2C(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

void sub_1000075D8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  v14[1] = a1;
  if (v15)
  {
    os_log_t oslog = (os_log_t)sub_100004678();
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v5 = oslog;
      os_log_type_t v6 = v11;
      id v7 = [v15 domain];
      id v4 = v7;
      id v10 = v4;
      id v3 = [v15 code];
      sub_10000782C((uint64_t)v17, (uint64_t)v4, (uint64_t)v3, (uint64_t)v15);
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  v6,  "Failed to update group recommendations session. {errorDomain=%{public}@, errorCode=%ld, error=%@}",  v17,  0x20u);

      objc_storeStrong(&v10, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    v14[0] = sub_100004678();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_1000077EC((uint64_t)v18, (uint64_t)location[0]);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14[0],  v13,  "Group recommendations session updated. {session=%@}",  v18,  0xCu);
    }

    objc_storeStrong(v14, 0LL);
  }

  [a1[4] _dismiss];
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000077EC(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_10000782C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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

id objc_msgSend_updateGroupRecommendationsConsent_forUserProfileWithIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateGroupRecommendationsConsent:forUserProfileWithIdentifier:completionHandler:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}
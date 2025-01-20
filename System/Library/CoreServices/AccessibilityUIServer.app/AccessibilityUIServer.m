void sub_1000034DC(_Unwind_Exception *a1)
{
  uint64_t v1;
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000034F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003508(uint64_t a1)
{
}

void sub_100003510(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([UIApp _accessibilityAllWindowsOnlyVisibleWindows:1]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100003554(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:]( &OBJC_CLASS___UIWindow,  "allWindowsIncludingInternalWindows:onlyVisibleWindows:",  1LL,  1LL));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100003598(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _accessibilityIsIsolatedWindow]
    && ([v3 accessibilityElementsHidden] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_100003A8C(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXLogUI();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000049C4((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  if (v3 && (uint64_t)[a1[4] preferredSceneAttemptCount] <= 4)
  {
    objc_msgSend(a1[4], "setPreferredSceneAttemptCount:", (char *)objc_msgSend(a1[4], "preferredSceneAttemptCount") + 1);
    objc_initWeak(&location, a1[4]);
    dispatch_time_t v12 = dispatch_time(0LL, 500000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003BD0;
    block[3] = &unk_1000082C8;
    objc_copyWeak(v16, &location);
    id v14 = a1[5];
    v16[1] = a1[7];
    id v15 = a1[6];
    dispatch_after(v12, &_dispatch_main_q, block);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void sub_100003BD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained requestSceneForSceneClientIdentifier:*(void *)(a1 + 32) scenePreferredLevel:*(void *)(a1 + 40) spatialConfiguration:*(double *)(a1 + 56)];
}

void sub_100003C10(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXLogUI();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100004A28((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  if (v3 && (uint64_t)[a1[4] defaultSceneAttemptCount] <= 4)
  {
    objc_msgSend(a1[4], "setDefaultSceneAttemptCount:", (char *)objc_msgSend(a1[4], "defaultSceneAttemptCount") + 1);
    objc_initWeak(&location, a1[4]);
    dispatch_time_t v12 = dispatch_time(0LL, 500000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003D54;
    block[3] = &unk_1000082C8;
    objc_copyWeak(v16, &location);
    id v14 = a1[5];
    v16[1] = a1[7];
    id v15 = a1[6];
    dispatch_after(v12, &_dispatch_main_q, block);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void sub_100003D54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained requestSceneForSceneClientIdentifier:*(void *)(a1 + 32) scenePreferredLevel:*(void *)(a1 + 40) spatialConfiguration:*(double *)(a1 + 56)];
}

void sub_100003F14(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = AXLogUI();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100004ACC((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_100003FA4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t start(int a1, char **a2)
{
  if (_set_user_dir_suffix("com.apple.AccessibilityUIServer"))
  {
    id v4 = NSTemporaryDirectory();
  }

  else
  {
    uint64_t v5 = AXLogUI();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100004B30(v6);
    }
  }

  uint64_t v7 = objc_autoreleasePoolPush();
  uint64_t v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  objc_autoreleasePoolPop(v7);
  uint64_t v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___AXUIServerApplication);
  dispatch_time_t v12 = NSStringFromClass(v11);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = UIApplicationMain(a1, a2, v13, v10);

  return v14;
}

void sub_1000044BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXLogUI();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 32)));
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting sceneLevel: %@", (uint8_t *)&v7, 0xCu);
  }

  [v3 setPreferredLevel:*(double *)(a1 + 32)];
}

LABEL_13:
}

uint64_t sub_100004994()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC21AccessibilityUIServerP33_3D64C987BF40592B492280CB3720C73A19ResourceBundleClass);
}

void sub_1000049C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004A28( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004A8C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Destroying scene pointer is nil", v1, 2u);
}

void sub_100004ACC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004B30(os_log_s *a1)
{
  int v2 = *__error();
  id v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  int v7 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "Failed to set temporary directory for AccessibilityUIServer (%d): %s",  (uint8_t *)v5,  0x12u);
}

void sub_100004BD4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_requestSceneForSceneClientIdentifier_scenePreferredLevel_spatialConfiguration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneForSceneClientIdentifier:scenePreferredLevel:spatialConfiguration:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}
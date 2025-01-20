void sub_10000248C(id a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 bundleIdentifier]);
  v3 = objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v2));
  v4 = (void *)qword_10000DC00;
  qword_10000DC00 = v3;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  v6 = objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v5,  0LL));
  v7 = (void *)qword_10000DC08;
  qword_10000DC08 = v6;
}

void sub_1000027C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000027E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100002884;
  v5[3] = &unk_100008310;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_100002884(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _loadWithBootURL:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void sub_1000030C4(uint64_t a1, void *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"App"]);
}

void sub_100003470(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8LL))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned int v3 = [v2 isSupervised];

    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device is supervised. Do not show What's New.",  buf,  2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    else
    {
      *(void *)buf = 0LL;
      v13 = buf;
      uint64_t v14 = 0x3032000000LL;
      v15 = sub_100003658;
      v16 = sub_100003668;
      id v17 = 0LL;
      v5 = *(void **)(a1 + 40);
      id v6 = *(void **)(*(void *)(a1 + 32) + 8LL);
      v10 = buf;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100003670;
      v11[3] = &unk_1000083C8;
      v11[4] = buf;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1000036D8;
      v8[3] = &unk_1000083F0;
      id v9 = v5;
      [v6 evaluateInJavaScriptContext:v11 completion:v8];

      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVWNErrorDomain",  1LL,  0LL));
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, &__kCFBooleanFalse, v7);
  }
}

void sub_100003640(_Unwind_Exception *a1)
{
}

uint64_t sub_100003658(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003668(uint64_t a1)
{
}

void sub_100003670(uint64_t a1, void *a2)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"App"]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v6 invokeMethod:@"shouldShow" withArguments:0]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000036D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 toBool]));
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v3, 0LL);
  }

  else
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVWNErrorDomain",  1LL,  0LL));
    (*(void (**)(uint64_t, void *, id))(v1 + 16))(v1, &__kCFBooleanFalse, v3);
  }
}

void sub_100003D88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100003DAC(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained appContext]);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100003E64;
  v4[3] = &unk_100008448;
  objc_copyWeak(&v5, v1);
  [v3 evaluate:v4 completionBlock:0];

  objc_destroyWeak(&v5);
}

void sub_100003E50(_Unwind_Exception *a1)
{
}

void sub_100003E64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setImagePreloadingInProgress:0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Preloading complete",  v6,  2u);
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 jsValueForProperty:@"preloadCompletion"]);
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = [v3 callWithArguments:0];
      [v2 setJSValue:0 forProperty:@"preloadCompletion"];
    }
  }
}

void sub_100004270(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
  if (![*(id *)(a1 + 32) count]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  objc_sync_exit(v6);
}

void sub_1000042F4(_Unwind_Exception *a1)
{
}

uint64_t sub_100004308(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "WNLog: What's New app started",  v10,  2u);
  }

  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVWhatsNewAppDelegate);
  id v6 = NSStringFromClass(v5);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_10000465C(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to start TVWhatsNew: %{public}@",  (uint8_t *)&v1,  0xCu);
}

void sub_1000046D8()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to load with empty boot url",  v0,  2u);
}

id objc_msgSend_wallpaperViewForVariant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallpaperViewForVariant:");
}
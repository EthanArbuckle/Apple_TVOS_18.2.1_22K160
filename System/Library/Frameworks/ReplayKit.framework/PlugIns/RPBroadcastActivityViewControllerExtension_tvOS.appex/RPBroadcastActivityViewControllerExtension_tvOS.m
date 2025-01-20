void sub_1000034D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  void v7[4];
  id v8;
  uint64_t v9;
  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003554;
  v7[3] = &unk_10000C360;
  v5 = *(void *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(&_dispatch_main_q, v7);
}

void sub_100003554(uint64_t a1)
{
  v2 = (id)kUTTypeData;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = sub_100003874;
  v24[4] = sub_100003884;
  id v25 = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3032000000LL;
  v22[3] = sub_100003874;
  v22[4] = sub_100003884;
  id v23 = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x3032000000LL;
  v20[3] = sub_100003874;
  v20[4] = sub_100003884;
  v21 = objc_alloc_init(&OBJC_CLASS___RPBroadcastConfiguration);
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_100003874;
  v18[4] = sub_100003884;
  id v19 = 0LL;
  id v3 = [*(id *)(a1 + 32) count];
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 attachments]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);

        if ([v10 hasItemConformingToTypeIdentifier:v2])
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472LL;
          v12[2] = sub_10000388C;
          v12[3] = &unk_10000C338;
          v12[6] = v24;
          v12[7] = v22;
          v12[8] = v20;
          v12[9] = v18;
          v12[10] = v17;
          v12[11] = v3;
          uint64_t v11 = *(void *)(a1 + 40);
          v12[4] = v8;
          v12[5] = v11;
          [v10 loadItemForTypeIdentifier:v2 options:0 completionHandler:v12];
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v26 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
}

void sub_100003808( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

uint64_t sub_100003874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003884(uint64_t a1)
{
}

void sub_10000388C(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    NSLog(@"Error loading input item for type");
    goto LABEL_14;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 string]);
  unsigned int v9 = [v8 isEqualToString:@"RPBroadcastExtensionKeyExtensionBundleIdentifier"];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 48);
LABEL_11:
    objc_storeStrong((id *)(*(void *)(v10 + 8) + 40LL), a2);
    goto LABEL_12;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 string]);
  unsigned int v13 = [v12 isEqualToString:@"RPBroadcastExtensionKeyExtensionUserInfo"];

  if (v13)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    goto LABEL_11;
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 string]);
  unsigned int v16 = [v15 isEqualToString:@"RPBroadcastExtensionKeyBroadcastConfiguration"];

  if (v16)
  {
    id v17 = v6;
    id v27 = 0LL;
    v18 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v17,  &v27);
    id v19 = v27;
    id v20 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v18,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___RPBroadcastConfiguration),  NSKeyedArchiveRootObjectKey);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    goto LABEL_12;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 string]);
  unsigned int v26 = [v25 isEqualToString:@"kRPBroadcastExtensionKeyExtensionServiceURL"];

  if (v26)
  {
    uint64_t v10 = *(void *)(a1 + 72);
    goto LABEL_11;
  }

LABEL_12:
  if (*(void *)(a1 + 88) == ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 40LL) + 16LL))();
  }
LABEL_14:
}

uint64_t sub_100003ADC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40LL) + 16LL))();
}

void sub_100003B08(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), a3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003BB0;
  v7[3] = &unk_10000C360;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(&_dispatch_main_q, v7);
}

id sub_100003BB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:&stru_10000C3F0];
}

void sub_100004128(uint64_t a1)
{
  id v3 = -[RPBroadcastActivityFocusWorkaroundView initWithFrame:]( objc_alloc(&OBJC_CLASS___RPBroadcastActivityFocusWorkaroundView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 addSubview:v3];

  -[RPBroadcastActivityFocusWorkaroundView becomeFirstResponder](v3, "becomeFirstResponder");
}

void sub_100004320( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100004344(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = *(void **)(a1 + 32);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000044B8;
  v26[3] = &unk_10000C508;
  id v20 = v16;
  uint64_t v21 = *(void *)(a1 + 32);
  id v27 = v20;
  uint64_t v28 = v21;
  id v22 = v13;
  id v29 = v22;
  id v23 = v14;
  id v30 = v23;
  id v24 = v17;
  id v31 = v24;
  id v25 = v18;
  id v32 = v25;
  objc_copyWeak(&v33, (id *)(a1 + 40));
  [v19 loadStreamingActivitiesWithHandler:v26];
  objc_destroyWeak(&v33);
}

void sub_1000044A4(_Unwind_Exception *a1)
{
}

void sub_1000044B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 count] && !*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) showNotInstalledAlert:*(void *)(a1 + 48) appName:*(void *)(a1 + 56) broadcastActivitiesNotInstalledAlertTitle:*(void *)(a1 + 64) broadcastActivitiesNotInstalledAlertMessage:*(void *)(a1 + 72)];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004598;
  v6[3] = &unk_10000C4E0;
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 80));
  id v5 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = v5;
  dispatch_async(&_dispatch_main_q, v6);

  objc_destroyWeak(&v10);
}

void sub_100004598(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___RPActivityViewController);
  -[RPActivityViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 3LL);
  -[RPActivityViewController setActivities:](v2, "setActivities:", *(void *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004664;
  v7[3] = &unk_10000C4B8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  uint64_t v8 = v2;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v2;
  [WeakRetained presentViewController:v6 animated:1 completion:v7];
}

void sub_100004664(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 becomeFirstResponder];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000046F4;
  v4[3] = &unk_10000C490;
  id v3 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v3 setCompletionHandler:v4];
}

void sub_1000046F4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, int a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  if (a6)
  {
    [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:0 extensionBundleID:0 cancelled:1];
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:",  a4));
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      id v22 = "-[RPBroadcastActivityExtensionViewController viewDidAppear:]_block_invoke_5";
      __int16 v23 = 1024;
      int v24 = 124;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p setupBroadcastWithHostBundleID",  buf,  0x1Cu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemonProxy daemonProxy](&OBJC_CLASS___RPDaemonProxy, "daemonProxy"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000048DC;
    v18[3] = &unk_10000C468;
    uint64_t v17 = *(void *)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v12;
    id v20 = v11;
    [v16 setupBroadcastWithHostBundleID:v17 broadcastExtensionBundleID:v20 broadcastConfigurationData:v14 userInfo:v13 handler:v18];
  }
}

void sub_1000048DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000068C8(v3);
  }
  [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:*(void *)(a1 + 40) extensionBundleID:*(void *)(a1 + 48) cancelled:0];
}

void sub_100004A8C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_BUTTON_FIND"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004BF4;
  v8[3] = &unk_10000C558;
  v8[4] = *(void *)(a1 + 48);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v3,  0LL,  v8));
  [v2 addAction:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_BUTTON_CANCEL"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004C50;
  v7[3] = &unk_10000C558;
  void v7[4] = *(void *)(a1 + 48);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v5,  1LL,  v7));
  [v2 addAction:v6];

  [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
}

void sub_100004BF4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"com.apple.TVAppStore://"));
  [v1 extensionDidFinishWithLaunchURL:v2 broadcastURL:0 extensionBundleID:0 cancelled:1];
}

id sub_100004C50(uint64_t a1)
{
  return [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:0 extensionBundleID:0 cancelled:1];
}

void sub_100004FD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
}

uint64_t sub_100005044(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005054(uint64_t a1)
{
}

void sub_10000505C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136446466;
      id v22 = "-[RPBroadcastActivityExtensionViewController loadItems:withHandler:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 454;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Error loading input item for type",  (uint8_t *)&v21,  0x12u);
    }

    goto LABEL_16;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 string]);
  unsigned int v10 = [v9 isEqualToString:@"RPBroadcastExtensionKeyExtensionBundleIdentifier"];

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 48);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 string]);
    unsigned int v14 = [v13 isEqualToString:@"RPBroadcastExtensionKeyExtensionUserInfo"];

    if (v14)
    {
      uint64_t v11 = *(void *)(a1 + 56);
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 string]);
      unsigned int v17 = [v16 isEqualToString:@"RPBroadcastExtensionKeyBroadcastConfiguration"];

      if (v17)
      {
        uint64_t v11 = *(void *)(a1 + 64);
      }

      else
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 string]);
        unsigned int v20 = [v19 isEqualToString:@"kRPBroadcastExtensionKeyExtensionServiceURL"];

        if (!v20) {
          goto LABEL_14;
        }
        uint64_t v11 = *(void *)(a1 + 72);
      }
    }
  }

  objc_storeStrong((id *)(*(void *)(v11 + 8) + 40LL), a2);
LABEL_14:
  if (++*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) == *(void *)(a1 + 88)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
LABEL_16:
}

void sub_1000053FC(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 setBackgroundColor:v3];
}

void sub_1000056AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1000056D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attachments]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);

  id v6 = (id)kUTTypeData;
  if ([v5 hasItemConformingToTypeIdentifier:v6])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000057DC;
    v11[3] = &unk_10000C5A8;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 48);
    id v12 = v7;
    uint64_t v14 = v8;
    __int128 v10 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v10;
    __int128 v13 = v10;
    [v5 loadItemForTypeIdentifier:v6 options:0 completionHandler:v11];
  }
}

void sub_1000057DC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136446466;
      id v19 = "-[RPBroadcastActivityExtensionViewController loadHostAppInfo:]_block_invoke_2";
      __int16 v20 = 1024;
      int v21 = 517;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Error loading input item for type",  (uint8_t *)&v18,  0x12u);
    }
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 string]);
    unsigned int v10 = [v9 isEqualToString:@"RPBroadcastExtensionKeyExtensionHostInfo"];

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0LL;

      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppIcon"]);
      if (v13)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppIcon"]);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v14));
        uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8LL);
        unsigned int v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000059C4(void *a1)
{
  uint64_t v1 = a1[4];
  if (v1)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBundleID"]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppName"]);
    uint64_t v4 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoPreferredExtension"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBroadcastActivitiesNotInstalledAlertTitle"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBroadcastActivitiesNotInstalledAlertMessage"]);
    (*(void (**)(uint64_t, id, void *, uint64_t, void *, void *, void *))(v1 + 16))(v1, v8, v3, v4, v5, v6, v7);
  }
}

void sub_100005DD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006944(v6);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100005ECC;
  v10[3] = &unk_10000C620;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v8;
  id v9 = v5;
  +[NSExtension extensionsWithMatchingPointName:activationRule:completion:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingPointName:activationRule:completion:",  @"com.apple.broadcast-services",  @"NSExtensionActivationSupportsReplayKitStreaming",  v10);
}

void sub_100005ECC(uint64_t a1, void *a2, void *a3)
{
  id obj = a2;
  id v5 = a3;
  if (v5 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000069C0(v5);
  }
  id v31 = v5;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  uint64_t v7 = a1;
  id v8 = *(id *)(a1 + 32);
  id v9 = [v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        [*(id *)(v7 + 40) _autoOptInExtensionIfNeverOptedIn:v13];
        uint64_t v14 = -[RPStreamingActivity initWithApplicationExtension:]( objc_alloc(&OBJC_CLASS___RPStreamingActivity),  "initWithApplicationExtension:",  v13);
        [v34 addObject:v14];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 _extensionBundle]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle baseIdentifier:](&OBJC_CLASS___NSBundle, "baseIdentifier:", v16));

        [v6 addObject:v17];
      }

      id v10 = [v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }

    while (v10);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obja = obj;
  id v18 = [obja countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(obja);
        }
        id v22 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)j);
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 _extensionBundle]);
        int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleIdentifier]);
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle baseIdentifier:](&OBJC_CLASS___NSBundle, "baseIdentifier:", v24));

        if (([v6 containsObject:v25] & 1) == 0)
        {
          [*(id *)(v7 + 40) _autoOptInExtensionIfNeverOptedIn:v22];
          uint64_t v26 = -[RPStreamingActivity initWithApplicationExtension:]( objc_alloc(&OBJC_CLASS___RPStreamingActivity),  "initWithApplicationExtension:",  v22);
          [v34 addObject:v26];
        }
      }

      id v19 = [obja countByEnumeratingWithState:&v35 objects:v49 count:16];
    }

    while (v19);
  }

  [*(id *)(v7 + 40) setStreamingActivities:v34];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v7 + 40) streamingActivities]);
    unsigned int v28 = [v27 count];
    *(_DWORD *)buf = 136446722;
    v44 = "-[RPBroadcastActivityExtensionViewController loadStreamingActivitiesWithHandler:]_block_invoke";
    __int16 v45 = 1024;
    int v46 = 601;
    __int16 v47 = 1024;
    unsigned int v48 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Returning streaming activity count = %i",  buf,  0x18u);
  }

  uint64_t v29 = *(void *)(v7 + 48);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v7 + 40) streamingActivities]);
  (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);
}

void sub_10000659C(id a1, NSError *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006AD4(v2);
  }
}

void sub_1000065F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_100006624@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - _Block_object_dispose((const void *)(v15 - 144), 8) = a2;
  return [a1 code];
}

  ;
}

LABEL_11:
  return (char)v4;
}

void sub_1000068C8(void *a1)
{
}

void sub_100006944(void *a1)
{
}

void sub_1000069C0(void *a1)
{
}

void sub_100006A3C()
{
  *(_DWORD *)uint64_t v1 = 136446722;
  sub_100006604();
  *(_DWORD *)&v1[7] = 630;
  v1[9] = 2112;
  uint64_t v2 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d Error opting in extension %@",  (uint8_t *)v1,  0x1Cu);
}

void sub_100006AD4(void *a1)
{
}

id objc_msgSend_extensionDidFinishWithLaunchURL_broadcastURL_extensionBundleID_cancelled_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionDidFinishWithLaunchURL:broadcastURL:extensionBundleID:cancelled:");
}

id objc_msgSend_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:");
}

id objc_msgSend_showNotInstalledAlert_appName_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "showNotInstalledAlert:appName:broadcastActivitiesNotInstalledAlertTitle:broadcastActivitiesNotInstalledAlertMessage:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}
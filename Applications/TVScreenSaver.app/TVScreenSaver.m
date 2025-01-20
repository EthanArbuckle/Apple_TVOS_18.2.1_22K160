void sub_100002858(uint64_t a1)
{
  void *v2;
  void block[4];
  id v4;
  uint8_t buf[16];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVSS: building assets cache",  buf,  2u);
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAssetLibrary sharedInstance](&OBJC_CLASS___TVAssetLibrary, "sharedInstance"));
  [v2 updateAssetsInGroupOfType:2];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002934;
  block[3] = &unk_10000C488;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
}

void sub_100002934(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _assetsLibraryDidInitialize];
}
}

id sub_100002B88(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:1.0];
}

void sub_1000035EC(uint64_t a1, int a2)
{
  if (a2 == 1 || a2 == 2 && *(_BYTE *)(*(void *)(a1 + 32) + 81LL))
  {
    MRMediaRemoteSendCommand(2LL, 0LL);
  }

  else
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v2 deactivateScreenSaver];
  }

void sub_1000037D4(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    MRMediaRemoteSendCommand(*(unsigned int *)(a1 + 32), 0LL);
  }

  else if (*(_BYTE *)(a1 + 36))
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v2 deactivateScreenSaver];
  }

void sub_100003974( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100003990(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 2 && WeakRetained) {
    WeakRetained[81] = 1;
  }
}

void sub_100003D3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100003D54(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100003D68(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))( result,  *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  }
  return result;
}

void sub_100003F6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100006654(a1, v4, v5, v6, v7, v8, v9, v10);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004010;
  v12[3] = &unk_10000C5C0;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v3;
  id v11 = v3;
  dispatch_async(&_dispatch_main_q, v12);
}

void sub_100004010(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _preferences]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 screenSaverPhotoCollectionIdentifier]);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = @"Nature";
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  uint64_t v6 = v5;

  uint64_t v7 = *(void **)(a1 + 40);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100004194;
  v20[3] = &unk_10000C598;
  v19 = v6;
  v21 = v19;
  id v8 = [v7 indexOfObjectPassingTest:v20];
  uint64_t v9 = *(void **)(a1 + 40);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  }
  else {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:"));
  }
  id v11 = v10;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24LL), v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _photoAssetsFromImageCache]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_randomizedArray"));
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = v13;

  id v16 = [*(id *)(*(void *)(a1 + 32) + 72) count];
  uint64_t v17 = *(void *)(a1 + 32);
  if (v16)
  {
    [(id)v17 _startScreenSaverWithPhotoAssets:*(void *)(v17 + 72)];
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v17 + 40) superview]);

    if (!v18) {
      [*(id *)(a1 + 32) _displayAssetsLoadingView];
    }
  }
}

id sub_100004194(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 collectionIdentifier]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100004404( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100004428(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v19 = WeakRetained;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _preferences]);
    [v3 synchronize];
    [*(id *)(*(void *)(a1 + 32) + 48) timePerSlide];
    double v5 = v4;
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 stringForKey:TVScreenSaverStyleKey]);
    uint64_t v7 = (void *)v6;
    id v8 = (void *)TVScreenSaverStyleKenBurns;
    if (v6) {
      id v8 = (void *)v6;
    }
    id v9 = v8;

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v19[4] document]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 styleID]);
    unsigned __int8 v12 = [v11 isEqualToString:v9];

    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 48);
    if ((v12 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v19[4] document]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 authoringOptionForKey:kMPAuthoringMinimumEffectDuration]);
      [v16 doubleValue];
      double v18 = v17;

      if (v18 == v5) {
        goto LABEL_10;
      }
    }

    else
    {
      [v14 updateMarimbaView:*(void *)(v13 + 32) currentTheme:0 currentTransition:0];
    }

    [*(id *)(*(void *)(a1 + 32) + 48) updateTransitionTimingForMarimbaView:*(void *)(*(void *)(a1 + 32) + 32)];
LABEL_10:

    id WeakRetained = v19;
  }
}

void sub_1000046FC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) object]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0
    && ([*(id *)(a1 + 40) _didScreenSaverPhotoCollectionChange] & 1) == 0)
  {
    if (!*(void *)(*(void *)(a1 + 40) + 72LL))
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSArray);
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 72);
      *(void *)(v7 + 72) = v6;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      v24 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Adding to cached photo assets: %{public}@",  (uint8_t *)&v23,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _photoAssetFromFilePath:v2]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 72) arrayByAddingObject:v9]);
    uint64_t v11 = *(void *)(a1 + 40);
    unsigned __int8 v12 = *(void **)(v11 + 72);
    *(void *)(v11 + 72) = v10;

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) superview]);
    uint64_t v14 = *(void *)(a1 + 40);
    if (v13)
    {
      [*(id *)(v14 + 40) removeFromSuperview];
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = 0LL;

      [*(id *)(a1 + 40) _startScreenSaverWithPhotoAssets:*(void *)(*(void *)(a1 + 40) + 72)];
    }

    else
    {
      double v17 = *(void **)(v14 + 48);
      double v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v14 + 32) marimbaLayer]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 document]);
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 updateMarimbaDocument:v19 photoAssets:*(void *)(*(void *)(a1 + 40) + 72)]);
      uint64_t v21 = *(void *)(a1 + 40);
      v22 = *(void **)(v21 + 8);
      *(void *)(v21 + _Block_object_dispose(va, 8) = v20;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 72LL);
    int v23 = 138543618;
    v24 = v2;
    __int16 v25 = 2114;
    uint64_t v26 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Got a file write notification, but path=%{public}@, cached assets=%{public}@",  (uint8_t *)&v23,  0x16u);
  }
}

id sub_100004A9C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _photoAssetFromFilePath:a2];
}

LABEL_11:
  return v7;
}

void sub_100004CD8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_24:
  if ([v23 length])
  {
    v58 = v23;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v58, 1LL));
    [v24 setObject:v27 forKey:kMPAuthoringTransitionList];
  }

  else
  {
    [v24 removeObjectForKey:kMPAuthoringTransitionList];
  }

  [v11 setDocumentAttribute:v24 forKey:kMPDocumentAuthoringOptions];
  if (v23)
  {
    v38 = v13;
    v39 = v14;
    v41 = v10;
    v42 = v9;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v40 = v11;
    obj = (id)objc_claimAutoreleasedReturnValue([v11 layers]);
    v47 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v47)
    {
      v46 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v53 != v46) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v30 = (void *)objc_claimAutoreleasedReturnValue([v29 effectContainers]);
          v31 = [v30 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v31)
          {
            v32 = v31;
            v33 = *(void *)v49;
            do
            {
              for (j = 0LL; j != v32; j = (char *)j + 1)
              {
                if (*(void *)v49 != v33) {
                  objc_enumerationMutation(v30);
                }
                v36 = (void *)objc_claimAutoreleasedReturnValue([v35 transitionID]);
                v37 = [v23 isEqualToString:v36];

                if ((v37 & 1) == 0)
                {
                  [v35 setTransitionID:v23];
                  [v35 setPresetID:@"Default"];
                }
              }

              v32 = [v30 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }

            while (v32);
          }
        }

        v47 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }

      while (v47);
    }

    uint64_t v10 = v41;
    id v9 = v42;
    uint64_t v14 = v39;
    uint64_t v11 = v40;
    uint64_t v13 = v38;
    v24 = (void *)v44;
  }
}

void sub_100005D98(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) detailTextLabel]);
  [v2 setText:*(void *)(a1 + 48)];
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  uint64_t v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSSApplication, v5);
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVScreenSaverAppDelegate, v9);
  uint64_t v11 = NSStringFromClass(v10);
  unsigned __int8 v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = UIApplicationMain(a1, a2, v8, v12);

  objc_autoreleasePoolPop(v4);
  return v13;
}

void sub_100006424( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006494(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 screenSaverPhotoSourceIdentifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 screenSaverPhotoCollectionIdentifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a2 + 24) collectionName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 screenSaverStyle]);
  int v8 = 138544130;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  uint64_t v13 = v6;
  __int16 v14 = 2114;
  uint64_t v15 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "TVSS: sending start event: {source: %{public}@, collection: %{public}@, name: %{public}@, style: %{public}@",  (uint8_t *)&v8,  0x2Au);
}

void sub_100006598()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "TVSS: sending end event",  v0,  2u);
}

void sub_1000065DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006654( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000066D0(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Current theme: %{public}@",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}
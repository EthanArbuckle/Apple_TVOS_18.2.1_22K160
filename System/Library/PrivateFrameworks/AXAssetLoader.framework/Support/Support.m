}

void sub_1000057E4(id a1, AXManagedAssetTask *a2)
{
}

id sub_100005C78(uint64_t a1, void *a2)
{
  return _[a2 _refreshCatalog:*(unsigned __int8 *)(a1 + 32)];
}

LABEL_51:
              v10 = (char *)v10 + 1;
            }

            while (v10 != v73);
            v48 = [v67 countByEnumeratingWithState:&v78 objects:v97 count:16];
            v73 = v48;
          }

          while (v48);
        }

        v8 = v64 + 1;
        v3 = v62;
      }

      while ((id)(v64 + 1) != v63);
      v63 = [obj countByEnumeratingWithState:&v82 objects:v98 count:16];
    }

    while (v63);
  }

  v49 = [v68 count];
  v50 = (void *)objc_claimAutoreleasedReturnValue([v6[76] sharedInstance]);
  v51 = v50;
  if (v49)
  {
    [v50 writeVoiceIdentifiersToMigrateToPreferences:v68];
  }

  else
  {
    [v50 writeIsMigrationCompleteToPreferences:&off_100021930];

    v53 = AXLogAssetDaemon(v52);
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Will invoke AXCleanupSiriVoiceSubscriptionsSimpleTask now",  buf,  2u);
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskBase taskIdentifier]( &OBJC_CLASS___AXCleanupSiriVoiceSubscriptionsSimpleTask,  "taskIdentifier"));
    [v51 invokeTaskById:v55 arguments:&__NSDictionary0__struct];
  }

  v57 = AXLogAssetDaemon(v56);
  v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "AXMigrateResTask: Task finished", buf, 2u);
  }

  -[AXMigrateResourcesSimpleTask _callCompletion:](self, "_callCompletion:", 1LL);
}

void sub_100006B04(_Unwind_Exception *a1)
{
}

void sub_100006B2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = AXLogAssetDaemon(WeakRetained);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000150D0((uint64_t)v6, v12);
      }

      else {
        uint64_t v13 = 60LL;
      }
      uint64_t v14 = AXLogAssetDaemon(objc_msgSend(v9, "setAttemptCount:", (char *)objc_msgSend(v9, "attemptCount") + 1));
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 attemptCount]));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
        *(_DWORD *)buf = 138412546;
        v31 = v16;
        __int16 v32 = 2112;
        v33 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Mobile asset daemon was not ready on attempt %@, will try again in %@ seconds.",  buf,  0x16u);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 timer]);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100006E58;
      v28[3] = &unk_100020770;
      objc_copyWeak(&v29, v7);
      [v18 afterDelay:v28 processBlock:(double)v13];

      objc_destroyWeak(&v29);
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Catalog found after force update. Will refresh cache for type: TTSAXResourceManagerTypeAccessibility",  buf,  2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      id v20 = [v19 refreshResourcesCacheForManagerType:1];

      uint64_t v22 = AXLogAssetDaemon(v21);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Will attempt to download samples if neccessary",  buf,  2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      [v24 downloadSamplesIfNecessary];

      uint64_t v26 = AXLogAssetDaemon(v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Will begin migration of Nashville to Maui",  buf,  2u);
      }

      [v9 _migrateNashvilleToMaui];
    }
  }
}

void sub_100006E3C(_Unwind_Exception *a1)
{
}

void sub_100006E58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _retryAndBackOff];
}

dispatch_source_s *sub_100006F5C()
{
  uint64_t v0 = AXLogAssetDaemon();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Installing SIGTERM handler.", v6, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v3);

  dispatch_source_set_event_handler(v4, &stru_1000207D8);
  dispatch_resume(v4);
  return v4;
}

void sub_10000701C(id a1)
{
  uint64_t v1 = AXLogAssetDaemon(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received SIGTERM. Terminating now.", v3, 2u);
  }

  exit(15);
}

uint64_t start(uint64_t a1)
{
  uint64_t v1 = AXLogAssetDaemon(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 environment]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"MallocStackLogging"]);
    *(_DWORD *)buf = 138412290;
    v50 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "axasstsd is starting up. MallocStackLogging=%@",  buf,  0xCu);
  }

  id v6 = sub_100006F5C();
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)qword_100027A30;
  qword_100027A30 = v7;

  v9 = objc_autoreleasePoolPush();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetsDaemon sharedInstance](&OBJC_CLASS___AXAssetsDaemon, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXImageCaptionModelAssetPolicy policy](&OBJC_CLASS___AXImageCaptionModelAssetPolicy, "policy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXManagedAsset assetWithPolicy:](&OBJC_CLASS___AXManagedAsset, "assetWithPolicy:", v11));
  v48[0] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXTTSResourceAssetPolicy policy](&OBJC_CLASS___AXTTSResourceAssetPolicy, "policy"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXManagedAsset assetWithPolicy:](&OBJC_CLASS___AXManagedAsset, "assetWithPolicy:", v13));
  v48[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXMagnifierAssetPolicy policy](&OBJC_CLASS___AXMagnifierAssetPolicy, "policy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXManagedAsset assetWithPolicy:](&OBJC_CLASS___AXManagedAsset, "assetWithPolicy:", v15));
  v48[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 3LL));
  [v10 registerManagedAssets:v17];

  id v18 = +[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v19, "registerTask:", objc_opt_class(AXUpdateResourcesSimpleTask, v20));

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v21, "registerTask:", objc_opt_class(AXMigrateResourcesSimpleTask, v22));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v23, "registerTask:", objc_opt_class(AXCompleteResourceMigrationSimpleTask, v24));

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v25, "registerTask:", objc_opt_class(AXComponentChangeSimpleTask, v26));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v27, "registerTask:", objc_opt_class(AXRefreshSSEVoicesForBundlePrefixSimpleTask, v28));

  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v29, "registerTask:", objc_opt_class(AXUpdateSiriResourcesSimpleTask, v30));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v31, "registerTask:", objc_opt_class(AXInformSiriVoiceSubscriptionsSimpleTask, v32));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v33, "registerTask:", objc_opt_class(AXCleanupSiriVoiceSubscriptionsSimpleTask, v34));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v35, "registerTask:", objc_opt_class(AXDeleteCompactResourceSimpleTask, v36));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v37, "registerTask:", objc_opt_class(AXUpdateCacheVersionSimpleTask, v38));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  objc_msgSend(v39, "registerTask:", objc_opt_class(AXDownloadTTSResourceTask, v40));

  id v41 = [[AXLaunchActivityPolicy alloc] initWithLaunchActivityIdentifier:@"com.apple.ax.TTSResource.cleanse.LaunchActivity"];
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[AXManagedAsset assetWithPolicy:](&OBJC_CLASS___AXManagedAsset, "assetWithPolicy:", v41));
  [v10 registerManagedAsset:v42];

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  [v43 start];

  objc_autoreleasePoolPop(v9);
  uint64_t v45 = AXLogAssetDaemon(v44);
  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "axassetsd will begin servicing requests",  buf,  2u);
  }

  [v10 run];
  return 0LL;
}

LABEL_13:
  }
}

void sub_100008258(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dequeueNextTask];
}

void sub_100008414( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100008438(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = -[AXAssetsXPCActivity initWithActivity:](objc_alloc(&OBJC_CLASS___AXAssetsXPCActivity), "initWithActivity:", v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = -[AXAssetsXPCActivity state](v4, "state");
  if (v6 == (id)2)
  {
    uint64_t v10 = AXLogAssetDaemon(2LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "XPC Activity handler called. %@. Asset:%@",  (uint8_t *)&v17,  0x16u);
    }

    -[AXAssetsXPCActivity updateState:](v4, "updateState:", 4LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXManagedAssetTaskContext contextWithActivity:]( &OBJC_CLASS___AXManagedAssetTaskContext,  "contextWithActivity:",  v4));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained policy]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 launchActivityIdentifier]);
    unsigned int v15 = [v14 isEqualToString:@"com.apple.ax.TTSResource.cleanse.LaunchActivity"];

    if (v15) {
      [WeakRetained enqueueCleanseUnusedCompactResourcesTaskWithContext:v8];
    }
    else {
      [WeakRetained enqueueAssetUpdateTaskWithContext:v8];
    }
  }

  else if (v6)
  {
    uint64_t v16 = AXLogAssetDaemon(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100015144((uint64_t)v4, a1, v8);
    }
  }

  else
  {
    uint64_t v7 = AXLogAssetDaemon(0LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "XPC Activity handler called. %@. Asset:%@",  (uint8_t *)&v17,  0x16u);
    }
  }
}

void sub_100008880(uint64_t a1)
{
  uint64_t v2 = AXLogAssetDaemon([*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policy]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(*(void *)(a1 + 32) + 24) count];
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[AXManagedAsset: %@]: enqeueing task: [%@]. Total queued: %lu",  (uint8_t *)&v9,  0x20u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 32)) {
    dispatch_source_merge_data(*(dispatch_source_t *)(v8 + 16), 1uLL);
  }
}

void sub_100008A68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100008A80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008A90(uint64_t a1)
{
}

void sub_100008A98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  if (v3)
  {
    objc_msgSend(v3, "removeObserver:forKeyPath:context:");
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0LL;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  id v6 = [*(id *)(v2 + 24) count];
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectAtIndex:0]);
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;

    [*(id *)(*(void *)(a1 + 32) + 32) addObserver:*(void *)(a1 + 32) forKeyPath:@"finished" options:1 context:off_100027788];
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:0];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), *(id *)(*(void *)(a1 + 32) + 32LL));
  }

  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  uint64_t v11 = AXLogAssetDaemon(v6);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policy]);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetType]);
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      id v18 = [*(id *)(v16 + 24) count];
      int v23 = 138412802;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      id v26 = v17;
      __int16 v27 = 2048;
      id v28 = v18;
      __int16 v19 = "[AXManagedAsset: %@]: dequeuing next task: [%@]. Total queued: %lu";
      uint64_t v20 = v12;
      uint32_t v21 = 32;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);
    }
  }

  else if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policy]);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetType]);
    id v22 = [*(id *)(*(void *)(a1 + 32) + 24) count];
    int v23 = 138412546;
    uint64_t v24 = v15;
    __int16 v25 = 2048;
    id v26 = v22;
    __int16 v19 = "[AXManagedAsset: %@]: Did finish dequeueing all queued tasks. (confirming queue count: %lu)";
    uint64_t v20 = v12;
    uint32_t v21 = 22;
    goto LABEL_10;
  }
}

void sub_100009B18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100009B40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009B50(uint64_t a1)
{
}

void sub_100009B58(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &stru_100020890));
    id v6 = [v5 mutableCopy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  uint64_t v9 = AXLogAssetDaemon(v3);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AXInformSiriSubsTask: Starting with voices: %@",  buf,  0xCu);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v12 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    id v13 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v43;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v43 != v15) {
            objc_enumerationMutation(v12);
          }
          int v17 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);

          if (!v18)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:v17];
            goto LABEL_29;
          }

          if ((AXSiriTTSSynthesisVoiceAssetsAreEqual(v17, *(void *)(a1 + 32)) & 1) != 0)
          {
            char v19 = 1;
            goto LABEL_31;
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
        char v19 = 0;
        if (v14) {
          continue;
        }
        break;
      }
    }

    else
    {
LABEL_29:
      char v19 = 0;
    }

LABEL_31:
    if ([*(id *)(a1 + 32) type] == (id)4 && (uint64_t v29 = TTSSupportsNeuralVoices(), (v29 & 1) == 0))
    {
      uint64_t v30 = AXLogAssetDaemon(v29);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1000151CC((uint64_t *)(a1 + 32), v31);
      }
    }

    else if ((v19 & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 32)];
    }
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v21 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    id v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v39;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v21);
          }
          if (AXSiriTTSSynthesisVoiceAssetsAreEqual( *(void *)(*((void *)&v38 + 1) + 8LL * (void)j),  *(void *)(a1 + 32))) {
            [v20 addObject:*(void *)(a1 + 32)];
          }
        }

        id v23 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }

      while (v23);
    }

    uint64_t v27 = AXLogAssetDaemon(v26);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "AXInformSiriSubsTask: Removing siri auto download voice: %@",  buf,  0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObjectsInArray:v20];
  }

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) enumerateObjectsUsingBlock:&stru_1000208D0];
  uint64_t v32 = *(void *)(a1 + 56);
  uint64_t v33 = *(void *)(*(void *)(v32 + 8) + 40LL);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10000A03C;
  v35[3] = &unk_1000208F8;
  uint64_t v37 = v32;
  uint64_t v34 = *(void **)(a1 + 40);
  id v36 = *(id *)(a1 + 48);
  [v34 subscribeWithVoices:v33 reply:v35];
}

id sub_100009F58(id a1, SiriTTSVoiceSubscription *a2)
{
  return -[SiriTTSVoiceSubscription voice](a2, "voice");
}

void sub_100009F60(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  uint64_t v6 = AXLogAssetDaemon(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "AXInformSiriSubsTask: Setting Siri auto-downloaded voice[%@]: %@",  (uint8_t *)&v9,  0x16u);
  }
}

void sub_10000A03C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXLogAssetDaemon(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      int v16 = 138412546;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AXInformSiriSubsTask: Unable to subscribe with voices %@. %@",  (uint8_t *)&v16,  0x16u);
    }

    uint64_t v8 = @"InformSiriVoiceSubscriptionsTaskFailure";
  }

  else
  {
    if (v6)
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      int v16 = 138412290;
      uint64_t v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AXInformSiriSubsTask: Subscribed with voices %@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v8 = @"InformSiriVoiceSubscriptionsTaskSuccessful";
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v10 setValue:v11 forKey:v8 forAssetType:kAXTTSResourceAssetType];

  uint64_t v13 = AXLogAssetDaemon(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "AXInformSiriSubsTask: Task finishing",  (uint8_t *)&v16,  2u);
  }

  if (v3) {
    uint64_t v15 = 2LL;
  }
  else {
    uint64_t v15 = 1LL;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v15);
}

void sub_10000AE84(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___AXSimpleAssetTaskManager);
  uint64_t v2 = (void *)qword_100027A38;
  qword_100027A38 = (uint64_t)v1;
}

void sub_10000B090( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000B0B0(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_dictionary_get_string(xdict, _xpc_event_key_name),  4LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = AXLogAssetDaemon(v4);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Recieved notification %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleNotification:v4];
}

void sub_10000B3CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000B414(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[AXAssetsXPCActivity initWithActivity:](objc_alloc(&OBJC_CLASS___AXAssetsXPCActivity), "initWithActivity:", v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = -[AXAssetsXPCActivity state](v4, "state");
  if (v6 == (id)2)
  {
    uint64_t v10 = AXLogAssetDaemon(2LL);
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "XPC Activity handler called. %@. Asset:%@",  (uint8_t *)&v14,  0x16u);
    }

    -[AXAssetsXPCActivity updateState:](v4, "updateState:", 4LL);
    int v8 = (os_log_s *)[*(id *)(a1 + 40) copy];
    [*(id *)(a1 + 40) setLaunchActivity:v4];
    [WeakRetained _handleXPCActivity:v8 taskClass:*(void *)(a1 + 56)];
  }

  else if (v6)
  {
    uint64_t v13 = AXLogAssetDaemon(v6);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100015144((uint64_t)v4, a1, v8);
    }
  }

  else
  {
    uint64_t v7 = AXLogAssetDaemon(0LL);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "XPC Activity handler called. %@. Asset:%@",  (uint8_t *)&v14,  0x16u);
    }
  }
}

void sub_10000B884(uint64_t a1)
{
}

void sub_10000BA88(uint64_t a1)
{
}

LABEL_17:
      }

      id v6 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v23);
  return v25;
}

void sub_10000BEE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_11:
  objc_sync_exit(v8);
  return v10;
}

  return v6;
}

    v18[(v12 >> 6) + 8] |= 1LL << v12;
    id v23 = (uint64_t *)(v18[6] + 16 * v12);
    void *v23 = a2;
    v23[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v24 = v18[2];
    __int16 v25 = __OFADD__(v24, 1LL);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }

    goto LABEL_14;
  }

  sub_100013AE8(v15, a4 & 1);
  id v21 = sub_1000137A8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    uint64_t v12 = v21;
    __int16 v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

void sub_10000C0B0(_Unwind_Exception *a1)
{
}

LABEL_16:
      }

      uint64_t v5 = obj;
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v6);
  }

  objc_sync_exit(v19);
  return v21;
}

void sub_10000C2F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000C434(uint64_t a1)
{
  uint64_t v2 = AXLogAssetDaemon(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::Dispatching: %@", buf, 0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) inflightTasks]);
  [v5 addObject:*(void *)(a1 + 32)];

  id v7 = objc_msgSend(*(id *)(a1 + 40), "_taskQueueForTask:", objc_opt_class(*(void *)(a1 + 32), v6));
  int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C574;
  block[3] = &unk_100020A48;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  __int16 v11 = *(void **)(a1 + 48);
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = v11;
  dispatch_async(v8, block);
}

void sub_10000C574(uint64_t a1)
{
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = sub_10000C838;
  v31[4] = sub_10000C848;
  dispatch_semaphore_t v32 = dispatch_semaphore_create(0LL);
  uint64_t v2 = AXLogAssetDaemon(v32);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::Running: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10000C850;
  v28[3] = &unk_100020A20;
  id v29 = v5;
  uint64_t v30 = v31;
  [v29 run:v28];
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  id v22 = sub_10000C928;
  id v23 = &unk_100020A70;
  uint64_t v27 = v31;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = *(void **)(a1 + 48);
  id v24 = v6;
  uint64_t v25 = v7;
  id v26 = v8;
  id v9 = objc_retainBlock(&v20);
  __int16 v11 = (void *)objc_opt_class(*(void *)(a1 + 32), v10);
  id v12 = objc_msgSend(v11, "synchronous", v20, v21, v22, v23);
  if ((_DWORD)v12)
  {
    uint64_t v13 = AXLogAssetDaemon(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SmpTskMgr::Executing synchronously and blocking group: %@",  buf,  0xCu);
    }

    ((void (*)(void ***))v9[2])(v9);
  }

  else
  {
    uint64_t v16 = AXLogAssetDaemon(v12);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "SmpTskMgr::Executing async and not blocking group: %@",  buf,  0xCu);
    }

    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskCompletionWaitingQueue]);
    dispatch_async(v19, v9);
  }

  _Block_object_dispose(v31, 8);
}

void sub_10000C808( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_10000C838(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000C848(uint64_t a1)
{
}

uint64_t sub_10000C850(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = AXLogAssetDaemon([*(id *)(a1 + 32) setCompletionStatus:a2]);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SmpTskMgr::Finishing: Status=%ld Task:%@",  (uint8_t *)&v8,  0x16u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_10000C928(uint64_t a1)
{
  uint64_t v2 = dispatch_semaphore_wait( *(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL),  0xFFFFFFFFFFFFFFFFLL);
  uint64_t v3 = AXLogAssetDaemon(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SmpTskMgr::Completed: %@, executing post-task action",  buf,  0xCu);
  }

  if ((objc_opt_respondsToSelector(*(void *)(a1 + 32), "didCompleteWithStatus:") & 1) != 0) {
    objc_msgSend(*(id *)(a1 + 32), "didCompleteWithStatus:", objc_msgSend(*(id *)(a1 + 32), "completionStatus"));
  }
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskDispatcherQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CA80;
  block[3] = &unk_100020A48;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  dispatch_sync(v6, block);
}

uint64_t sub_10000CA80(uint64_t a1)
{
  uint64_t v2 = AXLogAssetDaemon(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::CleanUp: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) inflightTasks]);
  [v5 removeObject:*(void *)(a1 + 32)];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetsDaemon sharedInstance](&OBJC_CLASS___AXAssetsDaemon, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activityTransactionManager]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
  [v7 simpleTaskFinished:v8];

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000CC44(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trigger]);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v2 launchActivity]);
  [v1 updateState:5];
}

LABEL_6:
  return v7;
}

void sub_10000E51C(_Unwind_Exception *a1)
{
}

void sub_10000E550(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = AXLogAssetDaemon(WeakRetained);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = [WeakRetained processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection interrupted from PID %d",  (uint8_t *)v4,  8u);
  }

  [WeakRetained invalidate];
}

void sub_10000E60C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = AXLogAssetDaemon(WeakRetained);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = [WeakRetained processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection invalidated from PID %d",  (uint8_t *)v4,  8u);
  }
}

void sub_10000E9D0(id a1)
{
  id v1 = -[AXAssetsDaemon _init](objc_alloc(&OBJC_CLASS___AXAssetsDaemon), "_init");
  uint64_t v2 = (void *)qword_100027A48;
  qword_100027A48 = (uint64_t)v1;

  id v3 = +[TTSTraceServer shared](&OBJC_CLASS____TtC9axassetsd14TTSTraceServer, "shared");
}

void sub_10000EBA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000EBD0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _refreshAssetCatalogForAssetType:v8 withOverrideTimeout:v7 forceCatalogRefresh:a4];
}

void sub_10000EC3C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateAssetForAssetType:v3];
}

uint64_t sub_10000F0D8(uint64_t a1)
{
  uint64_t v2 = AXLogAssetDaemon(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Resetting TTSAXResourceManager caches and asset catalogs",  buf,  2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  [v4 resetResourcesCache];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  [v5 resetInMemoryAssetCatalogs];

  +[TTSAXResourceManager freeSharedInstance](&OBJC_CLASS___TTSAXResourceManager, "freeSharedInstance");
  uint64_t v6 = AXLogAssetDaemon( +[TTSSynthesisProviderVoiceManager freeSharedInstance]( &OBJC_CLASS___TTSSynthesisProviderVoiceManager,  "freeSharedInstance"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Flushing CFPrefs caches", v9, 2u);
  }

  CFPreferencesFlushCaches();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000F88C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10000F8A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000F8B8(uint64_t a1)
{
}

void sub_10000F8C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &stru_100020B80));
    id v6 = [v5 mutableCopy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  uint64_t v9 = AXLogAssetDaemon(v3);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "AXCleanupSiriSubsTask: Starting cleanup with voices: %@",  buf,  0xCu);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v13 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        if ([v18 type] == (id)1
          || [v18 type] == (id)4 && (TTSSupportsNeuralVoices() & 1) == 0)
        {
          [v12 addObject:v18];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v15);
  }

  uint64_t v20 = AXLogAssetDaemon(v19);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "AXCleanupSiriSubsTask: Removing unused Siri auto download voices: %@",  buf,  0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeObjectsInArray:v12];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) enumerateObjectsUsingBlock:&stru_100020BA0];
  uint64_t v22 = *(void *)(a1 + 48);
  uint64_t v23 = *(void *)(*(void *)(v22 + 8) + 40LL);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000FC70;
  v25[3] = &unk_1000208F8;
  uint64_t v27 = v22;
  id v24 = *(void **)(a1 + 32);
  id v26 = *(id *)(a1 + 40);
  [v24 subscribeWithVoices:v23 reply:v25];
}

id sub_10000FB8C(id a1, SiriTTSVoiceSubscription *a2)
{
  return -[SiriTTSVoiceSubscription voice](a2, "voice");
}

void sub_10000FB94(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  uint64_t v6 = AXLogAssetDaemon(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    int v9 = 138412546;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "AXCleanupSiriSubsTask: Setting Siri auto-downloaded voice[%@]: %@",  (uint8_t *)&v9,  0x16u);
  }
}

void sub_10000FC70(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXLogAssetDaemon(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    int v20 = 138412546;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    id v23 = v3;
    id v8 = "AXCleanupSiriSubsTask: Unable to subscribe with voices %@. %@";
    int v9 = v5;
    uint32_t v10 = 22;
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    int v20 = 138412290;
    uint64_t v21 = v11;
    id v8 = "AXCleanupSiriSubsTask: Subscribed with voices %@";
    int v9 = v5;
    uint32_t v10 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v20, v10);
LABEL_7:

  uint64_t v13 = AXLogAssetDaemon(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "AXCleanupSiriSubsTask: Task finishing",  (uint8_t *)&v20,  2u);
  }

  uint64_t v15 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v16 = 2LL;
  }
  else {
    uint64_t v16 = 1LL;
  }
  if (v3) {
    uint64_t v17 = @"CleanupSiriVoiceSubscriptionsTaskFailed";
  }
  else {
    uint64_t v17 = @"CleanupSiriVoiceSubscriptionsTaskSuccess";
  }
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v18 setValue:v19 forKey:v17 forAssetType:kAXTTSResourceAssetType];
}

id sub_10000FF80(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_addActiveReason:", *(void *)(a1 + 40));
}

id sub_100010008(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_removeActiveReason:", *(void *)(a1 + 40));
}

LABEL_9:
}

id sub_100010364(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_handleInactiveTimerFired");
}

void sub_100010464( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100010488(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (dispatch_queue_s *)WeakRetained[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000104F4;
  block[3] = &unk_1000209B8;
  void block[4] = WeakRetained;
  dispatch_async(v2, block);
}

void sub_1000104F4(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 0;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  uint64_t v3 = AXLogAssetDaemon(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "AXATM: Delegate completed but active reason added while transitioning to idle. Keeping transaction alive",  v6,  2u);
    }
  }

  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "AXATM: Delegate completed and no new reason added. Will end os_transaction now",  buf,  2u);
    }

    [*(id *)(a1 + 32) setTransaction:0];
  }

void sub_100010648( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001070C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetType]);
  [v4 recordAssetRefreshEventForAssetType:v5];

  id v9 = v3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetType]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXUpdateAssetTaskRestorationState restoreOrCreateStateFromStore:assetType:]( &OBJC_CLASS___AXUpdateAssetTaskRestorationState,  "restoreOrCreateStateFromStore:assetType:",  v6,  v7));
  [v9 setRestorationState:v8];

  objc_msgSend(v9, "_housekeeping_op1_refreshAssets");
}

void sub_1000109EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100010A18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!v6)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 policy]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___AXTTSResourceAssetPolicy, v14);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 assetController]);
      if ([v16 isAssetCatalogInstalled])
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v27 properties]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kTTSResourceBuildKey]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
        int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 catalogBuildVersion]);
        unsigned int v26 = [v18 isEqualToString:v20];

        if (v26)
        {
          uint64_t v22 = AXLogAssetDaemon(v21);
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%@: Build versions matched, no need to update assets.",  buf,  0xCu);
          }

          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
          [v25 downloadSamplesIfNecessary];

          uint64_t v11 = v8;
          uint64_t v12 = 0LL;
          goto LABEL_5;
        }

LABEL_15:
        objc_msgSend(v8, "_housekeeping_op2_purgeAssets:", v5);
        goto LABEL_16;
      }
    }

    goto LABEL_15;
  }

  uint64_t v9 = AXLogAssetDaemon(WeakRetained);
  uint32_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100015440((uint64_t)v8, v6);
  }

  uint64_t v11 = v8;
  uint64_t v12 = 1LL;
LABEL_5:
  [v11 _completeWithResult:v12];
LABEL_16:
}

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void sub_1000110C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id location)
{
}

void sub_100011118(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (v4)
  {
    uint64_t v7 = AXLogAssetDaemon(WeakRetained);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000154C4((uint64_t)v6, v4);
    }

    [v6 _completeWithResult:1];
  }

  else if (([WeakRetained _deferIfNeeded] & 1) == 0)
  {
    objc_msgSend(v6, "_housekeeping_op3_downloadAssets:", *(void *)(a1 + 32));
  }
}

void sub_100011864(_Unwind_Exception *a1)
{
}

void sub_100011890(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = WeakRetained;
LABEL_7:
    uint64_t v9 = AXLogAssetDaemon(WeakRetained);
    uint32_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Finished all subtasks with success.",  (uint8_t *)&v11,  0xCu);
    }

    [v4 _completeWithResult:0];
    goto LABEL_10;
  }

  uint64_t Error = _AXAssetMakeError(1LL, @"generic.download.error");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(Error);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = AXLogAssetDaemon(WeakRetained);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100015588((uint64_t)v4, v6);
  }

  [v4 _completeWithResult:1];
LABEL_10:
}

void sub_100011D90( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_1000120DC()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for TTSTraceServer()) init];
  qword_100027A60 = (uint64_t)result;
  return result;
}

id static TTSTraceServer.shared.getter()
{
  if (qword_100027A58 != -1) {
    swift_once(&qword_100027A58, sub_1000120DC);
  }
  swift_beginAccess(&qword_100027A60, v1, 0LL, 0LL);
  return (id)qword_100027A60;
}

void static TTSTraceServer.shared.setter(uint64_t a1)
{
  if (qword_100027A58 != -1) {
    swift_once(&qword_100027A58, sub_1000120DC);
  }
  swift_beginAccess(&qword_100027A60, v3, 1LL, 0LL);
  uint64_t v2 = (void *)qword_100027A60;
  qword_100027A60 = a1;
}

void *static TTSTraceServer.shared.modify(uint64_t a1)
{
  if (qword_100027A58 != -1) {
    swift_once(&qword_100027A58, sub_1000120DC);
  }
  swift_beginAccess(&qword_100027A60, a1, 33LL, 0LL);
  return &j__swift_endAccess;
}

unint64_t sub_100012338(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    id v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10001323C(&qword_100027A00);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  id v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  swift_retain(v4);
  uint64_t v7 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v8 = *(v7 - 2);
    uint64_t v9 = *(v7 - 1);
    uint64_t v10 = *v7;
    swift_bridgeObjectRetain(v9);
    swift_retain(v10);
    unint64_t result = sub_1000137A8(v8, v9);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v5[6] + 16 * result);
    *uint64_t v13 = v8;
    v13[1] = v9;
    *(void *)(v5[7] + 8 * result) = v10;
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v5[2] = v16;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_100012450()
{
  id v1 = v0;
  uint64_t ObjectType = swift_getObjectType(v0);
  sub_10001323C(&qword_1000279A0);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = OBJC_IVAR____TtC9axassetsd14TTSTraceServer_clientTimeoutTasks;
  uint64_t v6 = v1;
  *(void *)&v1[v5] = sub_100012338((uint64_t)&_swiftEmptyArrayStorage, v7);

  uint64_t v8 = (objc_class *)type metadata accessor for TTSTraceServer();
  v14.receiver = v6;
  v14.super_class = v8;
  id v9 = objc_msgSendSuper2(&v14, "init");
  if (TTSIsInternalBuild())
  {
    uint64_t v10 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v4, 1LL, 1LL, v10);
    int v11 = (void *)swift_allocObject(&unk_100020D40, 40LL, 7LL);
    v11[2] = 0LL;
    v11[3] = 0LL;
    v11[4] = ObjectType;
    uint64_t v12 = sub_100012B70((uint64_t)v4, (uint64_t)&unk_1000279B0, (uint64_t)v11);
    swift_release(v12);
  }

  return v9;
}

uint64_t sub_100012578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = sub_10001323C(&qword_1000279A0);
  v4[8] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10001323C(&qword_1000279B8);
  v4[9] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[10] = v7;
  v4[11] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10001323C(&qword_1000279C0);
  v4[12] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v4[13] = v9;
  v4[14] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10001262C, 0LL, 0LL);
}

uint64_t sub_10001262C()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  type metadata accessor for TTSSettings(0LL);
  uint64_t v4 = static TTSSettings.shared.getter();
  uint64_t v5 = (void *)dispatch thunk of TTSSettings.$speechTraceClients.getter();
  uint64_t v6 = swift_release(v4);
  dispatch thunk of AXSetting.stream.getter(v6);

  AsyncStream.makeAsyncIterator()(v3);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  v0[15] = v7;
  void *v7 = v0;
  v7[1] = sub_100012708;
  return AsyncStream.Iterator.next(isolation:)(v0 + 6, 0LL, 0LL, v0[12]);
}

uint64_t sub_100012708()
{
  return swift_task_switch(sub_10001275C, 0LL, 0LL);
}

uint64_t sub_10001275C()
{
  uint64_t result = *(void *)(v0 + 48);
  if (!result)
  {
    uint64_t v35 = *(void *)(v0 + 112);
    uint64_t v36 = *(void *)(v0 + 88);
    uint64_t v37 = *(void *)(v0 + 64);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 104) + 8LL))(v35, *(void *)(v0 + 96));
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  int64_t v2 = 0LL;
  uint64_t v38 = result + 64;
  uint64_t v3 = -1LL;
  uint64_t v4 = -1LL << *(_BYTE *)(result + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1LL << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(result + 64);
  int64_t v39 = (unint64_t)(63 - v4) >> 6;
  uint64_t v40 = *(void *)(v0 + 48);
  while (1)
  {
    if (v5)
    {
      unint64_t v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      int64_t v41 = v2;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_27;
    }

    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1LL))
    {
      __break(1u);
      goto LABEL_37;
    }

    if (v10 >= v39) {
      goto LABEL_34;
    }
    unint64_t v11 = *(void *)(v38 + 8 * v10);
    int64_t v12 = v2 + 1;
    if (!v11)
    {
      int64_t v12 = v2 + 2;
      if (v2 + 2 >= v39) {
        goto LABEL_34;
      }
      unint64_t v11 = *(void *)(v38 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v2 + 3;
        if (v2 + 3 >= v39) {
          goto LABEL_34;
        }
        unint64_t v11 = *(void *)(v38 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v2 + 4;
          if (v2 + 4 >= v39) {
            goto LABEL_34;
          }
          unint64_t v11 = *(void *)(v38 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v2 + 5;
            if (v2 + 5 >= v39) {
              goto LABEL_34;
            }
            unint64_t v11 = *(void *)(v38 + 8 * v12);
            if (!v11) {
              break;
            }
          }
        }
      }
    }

LABEL_26:
    unint64_t v5 = (v11 - 1) & v11;
    int64_t v41 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_27:
    uint64_t v15 = *(void *)(v0 + 56);
    uint64_t v14 = *(void *)(v0 + 64);
    uint64_t v16 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = type metadata accessor for TaskPriority(0LL);
    uint64_t v20 = *(void *)(v19 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v14, 1LL, 1LL, v19);
    uint64_t v21 = (void *)swift_allocObject(&unk_100020D68, 56LL, 7LL);
    v21[2] = 0LL;
    uint64_t v22 = v21 + 2;
    v21[3] = 0LL;
    v21[4] = v18;
    v21[5] = v17;
    v21[6] = v15;
    LODWORD(v15) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v14, 1LL, v19);
    uint64_t v23 = swift_bridgeObjectRetain(v17);
    uint64_t v24 = *(void *)(v0 + 64);
    if ((_DWORD)v15 == 1)
    {
      sub_100014FDC(*(void *)(v0 + 64), &qword_1000279A0);
      uint64_t v25 = 0LL;
      uint64_t v26 = *v22;
      if (*v22) {
        goto LABEL_29;
      }
    }

    else
    {
      unsigned __int8 v32 = TaskPriority.rawValue.getter(v23);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v24, v19);
      uint64_t v25 = v32;
      uint64_t v26 = *v22;
      if (*v22)
      {
LABEL_29:
        uint64_t v27 = v21[3];
        uint64_t ObjectType = swift_getObjectType(v26);
        swift_unknownObjectRetain(v26);
        uint64_t v29 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v27);
        uint64_t v31 = v30;
        swift_unknownObjectRelease(v26);
        goto LABEL_32;
      }
    }

    uint64_t v29 = 0LL;
    uint64_t v31 = 0LL;
LABEL_32:
    uint64_t v33 = swift_allocObject(&unk_100020D90, 32LL, 7LL);
    *(void *)(v33 + 16) = &unk_1000279D0;
    *(void *)(v33 + 24) = v21;
    if (v31 | v29)
    {
      uint64_t v6 = v0 + 16;
      *(void *)(v0 + 16) = 0LL;
      *(void *)(v0 + 24) = 0LL;
      *(void *)(v0 + 32) = v29;
      *(void *)(v0 + 40) = v31;
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    uint64_t v7 = swift_task_create(v25 | 0x1C00, v6, (char *)&type metadata for () + 8, &unk_1000279E0, v33);
    swift_release(v7);
    uint64_t result = v40;
    int64_t v2 = v41;
  }

  uint64_t v13 = v2 + 6;
  if (v2 + 6 >= v39)
  {
LABEL_34:
    swift_release(result);
    *(void *)(v0 + 120) = v34;
    *uint64_t v34 = v0;
    v34[1] = sub_100012708;
    return AsyncStream.Iterator.next(isolation:)(v0 + 48, 0LL, 0LL, *(void *)(v0 + 96));
  }

  unint64_t v11 = *(void *)(v38 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v2 + 6;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      break;
    }
    if (v12 >= v39) {
      goto LABEL_34;
    }
    unint64_t v11 = *(void *)(v38 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_26;
    }
  }

LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100012B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return swift_task_switch(sub_100012B40, 0LL, 0LL);
}

uint64_t sub_100012B40()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100014FDC(a1, &qword_1000279A0);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (!v9)
    {
LABEL_6:
      uint64_t v15 = 0LL;
      return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (!v9) {
      goto LABEL_6;
    }
  }

  uint64_t v10 = *(void *)(a3 + 24);
  uint64_t ObjectType = swift_getObjectType(v9);
  swift_unknownObjectRetain(v9);
  uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  uint64_t v14 = v13;
  swift_unknownObjectRelease(v9);
  if (!(v14 | v12)) {
    goto LABEL_6;
  }
  v18[0] = 0LL;
  v18[1] = 0LL;
  uint64_t v15 = v18;
  v18[2] = v12;
  v18[3] = v14;
  return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_100012CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  uint64_t v7 = sub_10001323C(&qword_100027A08);
  v6[12] = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ContinuousClock(0LL);
  v6[13] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[14] = v9;
  v6[15] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100012D4C, 0LL, 0LL);
}

uint64_t sub_100012D4C()
{
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100027A10 + dword_100027A10);
  uint64_t v1 = (void *)swift_task_alloc(unk_100027A14);
  *(void *)(v0 + 12_Block_object_dispose(va, 8) = v1;
  void *v1 = v0;
  v1[1] = sub_100012DCC;
  return v3(0x40AAD21B3B700000LL, 3LL, 0LL, 0LL, 1);
}

uint64_t sub_100012DCC()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 120LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 128LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 104LL);
  uint64_t v5 = *(void *)(*(void *)v1 + 112LL);
  *(void *)(*(void *)v1 + 136LL) = v0;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  if (v0) {
    uint64_t v6 = sub_100012F88;
  }
  else {
    uint64_t v6 = sub_100012E4C;
  }
  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_100012E4C()
{
  uint64_t v11 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  type metadata accessor for TTSSettings(0LL);
  uint64_t v5 = static TTSSettings.shared.getter();
  uint64_t v6 = type metadata accessor for TTSSettings.SpeechTracingClient(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v1, 1LL, 1LL, v6);
  swift_bridgeObjectRetain(v3);
  uint64_t v7 = (void (*)(uint64_t, void))dispatch thunk of TTSSettings.speechTraceClients.modify(v0 + 16);
  sub_100012FC8(v1, v4, v3);
  v7(v0 + 16, 0LL);
  swift_release(v5);
  swift_beginAccess(v2 + OBJC_IVAR____TtC9axassetsd14TTSTraceServer_clientTimeoutTasks, v0 + 48, 33LL, 0LL);
  swift_bridgeObjectRetain(v3);
  uint64_t v8 = sub_1000138EC(v4, v3);
  swift_endAccess(v0 + 48);
  swift_bridgeObjectRelease(v3, v9);
  swift_release(v8);
  swift_task_dealloc(v11);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012F88()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_task_dealloc(*(void *)(v0 + 120));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_10001323C(&qword_100027A08);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for TTSSettings.SpeechTracingClient(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1LL, v10) == 1)
  {
    sub_100014FDC(a1, &qword_100027A08);
    sub_1000139B8(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease(a3, v14);
    return sub_100014FDC((uint64_t)v9, &qword_100027A08);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v21 = *v4;
    void *v4 = 0x8000000000000000LL;
    sub_100014690((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t v17 = *v4;
    void *v4 = v21;
    swift_bridgeObjectRelease(a3, v18);
    return swift_bridgeObjectRelease(v17, v19);
  }

void sub_10001313C(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v10 = v9;
    id v11 = a3;
    id v14 = a1;
    id v12 = a5;
    sub_100014C6C(v8, v10);
    swift_bridgeObjectRelease(v10, v13);
  }

id TTSTraceServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSTraceServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTSTraceServer()
{
  return objc_opt_self(&OBJC_CLASS____TtC9axassetsd14TTSTraceServer);
}

uint64_t method lookup function for TTSTraceServer(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for TTSTraceServer);
}

uint64_t sub_10001323C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10001327C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000132A0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc(dword_1000279AC);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100015058;
  return sub_100012578((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_1000132EC()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_100013318()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc(dword_1000279CC);
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_100013378;
  _DWORD v4[2] = v2;
  v4[3] = v3;
  return swift_task_switch(sub_100012B40, 0LL, 0LL);
}

uint64_t sub_100013378()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000133C0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100013424;
  return v6(a1);
}

uint64_t sub_100013424()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100013470()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100013494(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000279DC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100015058;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000279D8 + dword_1000279D8))(a1, v4);
}

uint64_t sub_100013504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = type metadata accessor for ContinuousClock.Instant(0LL);
  *(void *)(v6 + 64) = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  *(void *)(v6 + 72) = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v6 + 80) = swift_task_alloc(v14);
  *(void *)(v6 + 8_Block_object_dispose(va, 8) = swift_task_alloc(v14);
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 4_Block_object_dispose(va, 8) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch(sub_1000135A8, 0LL, 0LL);
}

uint64_t sub_1000135A8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = type metadata accessor for ContinuousClock(0LL);
  uint64_t v5 = sub_100015018( &qword_100027A20,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
  dispatch thunk of Clock.now.getter(v4, v5);
  uint64_t v6 = sub_100015018( &qword_100027A28,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)(v0 + 5, v2, v6);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v7;
  v7(v1, v2);
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
  v0[13] = v8;
  void *v8 = v0;
  v8[1] = sub_1000136C0;
  return dispatch thunk of Clock.sleep(until:tolerance:)(v0[11], v0 + 2, v4, v5);
}

uint64_t sub_1000136C0()
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v2 = *(void *)(*v1 + 104);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(void *)(*v1 + 64);
  uint64_t v6 = *v1;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc(v2);
  v3(v4, v5);
  if (v0) {
    return swift_task_switch(sub_10001376C, 0LL, 0LL);
  }
  uint64_t v8 = *(void *)(v6 + 80);
  swift_task_dealloc(*(void *)(v6 + 88));
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_10001376C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_task_dealloc(*(void *)(v0 + 88));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1000137A8(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10001380C(a1, a2, v5);
}

unint64_t sub_10001380C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_1000138EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_1000137A8(a1, a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease(v6, v8);
  if ((a2 & 1) == 0) {
    return 0LL;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v11 = *v3;
  uint64_t v16 = *v3;
  uint64_t *v3 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10001485C();
    uint64_t v11 = v16;
  }

  swift_bridgeObjectRelease(*(void *)(*(void *)(v11 + 48) + 16 * v7 + 8), v10);
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v7);
  sub_100014164(v7, v11);
  uint64_t v13 = *v3;
  uint64_t *v3 = v11;
  swift_bridgeObjectRelease(v13, v14);
  return v12;
}

uint64_t sub_1000139B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_1000137A8(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8, v10);
  if ((a2 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v13 = *v4;
    uint64_t v21 = *v4;
    uint64_t *v4 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100014A10();
      uint64_t v13 = v21;
    }

    swift_bridgeObjectRelease(*(void *)(*(void *)(v13 + 48) + 16 * v9 + 8), v12);
    uint64_t v14 = *(void *)(v13 + 56);
    uint64_t v15 = type metadata accessor for TTSSettings.SpeechTracingClient(0LL);
    uint64_t v16 = *(void *)(v15 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 32))(a3, v14 + *(void *)(v16 + 72) * v9, v15);
    sub_100014338(v9, v13);
    uint64_t v17 = *v4;
    uint64_t *v4 = v13;
    swift_bridgeObjectRelease(v17, v18);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(a3, 0LL, 1LL, v15);
  }

  else
  {
    uint64_t v20 = type metadata accessor for TTSSettings.SpeechTracingClient(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))( a3,  1LL,  1LL,  v20);
  }

Swift::Int sub_100013AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10001323C(&qword_100027A00);
  char v37 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v35) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v35) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

LABEL_33:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_retain(v33);
    }

    Hasher.init(_seed:)(v38, *(void *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    Swift::Int result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v1_Block_object_dispose(va, 8) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v23 = -1LL << v34;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

Swift::Int sub_100013DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v46 = type metadata accessor for TTSSettings.SpeechTracingClient(0LL);
  uint64_t v6 = *(void *)(v46 - 8);
  __chkstk_darwin();
  __int128 v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_10001323C(&qword_100027A18);
  int v44 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  int64_t v41 = v3;
  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  __int128 v43 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  int64_t v42 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  Swift::Int result = swift_retain(v8);
  int64_t v17 = 0LL;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }

    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v22 >= v42) {
      goto LABEL_36;
    }
    unint64_t v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v42) {
        goto LABEL_36;
      }
      unint64_t v23 = v43[v17];
      if (!v23) {
        break;
      }
    }

LABEL_23:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    uint64_t v25 = *(void *)(v8 + 56);
    uint64_t v26 = v8;
    unint64_t v27 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    uint64_t v30 = *(void *)(v6 + 72);
    uint64_t v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, v46);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, v46);
      swift_bridgeObjectRetain(v28);
    }

    Hasher.init(_seed:)(v47, *(void *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    Swift::Int result = Hasher._finalize()();
    uint64_t v32 = -1LL << *(_BYTE *)(v10 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0LL;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v15 + 8 * v34);
      }

      while (v38 == -1);
      unint64_t v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }

    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    uint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v28;
    Swift::Int result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v10 + 56) + v30 * v18,  v45,  v46);
    ++*(void *)(v10 + 16);
    uint64_t v8 = v26;
  }

  int64_t v24 = v22 + 2;
  if (v24 < v42)
  {
    unint64_t v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        int64_t v17 = v24 + 1;
        if (__OFADD__(v24, 1LL)) {
          goto LABEL_43;
        }
        if (v17 >= v42) {
          goto LABEL_36;
        }
        unint64_t v23 = v43[v17];
        ++v24;
        if (v23) {
          goto LABEL_23;
        }
      }
    }

    int64_t v17 = v24;
    goto LABEL_23;
  }

LABEL_36:
  swift_release(v8);
  uint64_t v3 = v41;
  if ((v44 & 1) != 0)
  {
    uint64_t v39 = 1LL << *(_BYTE *)(v8 + 32);
    if (v39 >= 64) {
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
    }
    else {
      void *v43 = -1LL << v39;
    }
    *(void *)(v8 + 16) = 0LL;
  }

LABEL_41:
  Swift::Int result = swift_release(v8);
  uint64_t *v3 = v10;
  return result;
}

unint64_t sub_100014164(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    Swift::Int result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        Hasher.init(_seed:)(v27, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v27, v10, v11);
        Swift::Int v12 = Hasher._finalize()();
        Swift::Int result = swift_bridgeObjectRelease(v11, v13);
        unint64_t v14 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v14 < v8) {
            goto LABEL_5;
          }
        }

        else if (v14 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v14)
        {
LABEL_11:
          uint64_t v15 = *(void *)(a2 + 48);
          unint64_t v16 = (_OWORD *)(v15 + 16 * v3);
          int64_t v17 = (_OWORD *)(v15 + 16 * v6);
          if (v3 != v6 || v16 >= v17 + 1) {
            _OWORD *v16 = *v17;
          }
          uint64_t v18 = *(void *)(a2 + 56);
          uint64_t v19 = (void *)(v18 + 8 * v3);
          unint64_t v20 = (void *)(v18 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
          {
            void *v19 = *v20;
            int64_t v3 = v6;
          }
        }

LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    unint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1LL << v3) - 1;
  }

  else
  {
    unint64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1LL << result) - 1;
  }

  *unint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1LL);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

unint64_t sub_100014338(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    Swift::Int result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        uint64_t v9 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        Hasher.init(_seed:)(v30, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v30, v10, v11);
        Swift::Int v12 = Hasher._finalize()();
        Swift::Int result = swift_bridgeObjectRelease(v11, v13);
        unint64_t v14 = v12 & v7;
        if (v14 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v15 = *(void *)(a2 + 48);
        unint64_t v16 = (_OWORD *)(v15 + 16 * v3);
        int64_t v17 = (_OWORD *)(v15 + 16 * v6);
        if (v3 != v6 || v16 >= v17 + 1) {
          _OWORD *v16 = *v17;
        }
        uint64_t v18 = *(void *)(a2 + 56);
        uint64_t v19 = *(void *)(*(void *)(type metadata accessor for TTSSettings.SpeechTracingClient(0LL) - 8) + 72LL);
        int64_t v20 = v19 * v3;
        Swift::Int result = v18 + v19 * v3;
        int64_t v21 = v19 * v6;
        unint64_t v22 = v18 + v19 * v6 + v19;
        if (v20 < v21 || result >= v22)
        {
          Swift::Int result = swift_arrayInitWithTakeFrontToBack();
        }

        else
        {
          int64_t v3 = v6;
          if (v20 == v21) {
            goto LABEL_6;
          }
          Swift::Int result = swift_arrayInitWithTakeBackToFront();
        }

        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }

      if (v14 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      goto LABEL_12;
    }

LABEL_21:
    uint64_t v24 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v25 = *v24;
    uint64_t v26 = (-1LL << v3) - 1;
  }

  else
  {
    uint64_t v24 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v26 = *v24;
    uint64_t v25 = (-1LL << result) - 1;
  }

  uint64_t *v24 = v26 & v25;
  uint64_t v27 = *(void *)(a2 + 16);
  BOOL v28 = __OFSUB__(v27, 1LL);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

uint64_t sub_100014534(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000137A8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10001485C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release(*(void *)(v19 + 8 * v12));
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }

uint64_t sub_100014690(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1000137A8(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      uint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = v18[7];
        uint64_t v20 = type metadata accessor for TTSSettings.SpeechTracingClient(0LL);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40LL))( v19 + *(void *)(*(void *)(v20 - 8) + 72LL) * v12,  a1,  v20);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100014A10();
      goto LABEL_7;
    }

    sub_100013DFC(v15, a4 & 1);
    unint64_t v22 = sub_1000137A8(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      uint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_1000147CC(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_1000147CC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for TTSSettings.SpeechTracingClient(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))( v9 + *(void *)(*(void *)(v10 - 8) + 72LL) * a1,  a4,  v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1LL);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_10001485C()
{
  uint64_t v1 = v0;
  sub_10001323C(&qword_100027A00);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    uint64_t result = (void *)swift_retain(v20);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

    unint64_t v14 = (v26 - 1) & v26;
    uint64_t v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v17);
    unint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    int64_t v22 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v22, v15);
    unint64_t v23 = v35;
    int64_t v24 = (void *)(*(void *)(v35 + 48) + v18);
    uint64_t *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v23 + 56) + v22, v3, v15);
    uint64_t result = (void *)swift_bridgeObjectRetain(v20);
  }

  uint64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v4);
    BOOL v28 = v31;
    uint64_t v29 = v35;
    goto LABEL_28;
  }

  uint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    uint64_t v11 = v27;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v11 = v27 + 1;
    if (__OFADD__(v27, 1LL)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_26;
    }
    uint64_t v26 = *(void *)(v32 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

void *sub_100014A10()
{
  uint64_t v34 = type metadata accessor for TTSSettings.SpeechTracingClient(0LL);
  uint64_t v1 = *(void *)(v34 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10001323C(&qword_100027A18);
  uint64_t v31 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v35 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release(v4);
    uint64_t v29 = v35;
    BOOL v28 = v31;
LABEL_28:
    *BOOL v28 = v29;
    return result;
  }

  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v35;
  }

  uint64_t v32 = v4 + 64;
  int64_t v11 = 0LL;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v4 + 64);
  int64_t v33 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v15 = v34;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v25 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v11);
      if (!v26) {
        break;
      }
    }

LABEL_30:
  __break(1u);
  return result;
}

void sub_100014C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = &v30[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (qword_100027A58 != -1) {
    swift_once(&qword_100027A58, sub_1000120DC);
  }
  swift_beginAccess(&qword_100027A60, v32, 0LL, 0LL);
  uint64_t v6 = (void *)qword_100027A60;
  uint64_t v7 = (void *)(qword_100027A60 + OBJC_IVAR____TtC9axassetsd14TTSTraceServer_clientTimeoutTasks);
  swift_beginAccess(qword_100027A60 + OBJC_IVAR____TtC9axassetsd14TTSTraceServer_clientTimeoutTasks, v31, 0LL, 0LL);
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(*v7 + 16LL);
  id v10 = v6;
  if (v9)
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(v8);
    unint64_t v11 = sub_1000137A8(a1, a2);
    if ((v12 & 1) != 0)
    {
      uint64_t v13 = *(void *)(*(void *)(v8 + 56) + 8 * v11);
      swift_retain(v13);
      swift_bridgeObjectRelease(v8, v14);
      swift_bridgeObjectRelease(a2, v15);
      sub_10001323C(&qword_1000279F8);
      Task.cancel()();
      swift_release(v13);
    }

    else
    {
      swift_bridgeObjectRelease(v8, v12);
      swift_bridgeObjectRelease(a2, v16);
    }
  }

  uint64_t v17 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v5, 1LL, 1LL, v17);
  uint64_t v18 = (void *)swift_allocObject(&unk_100020DB8, 56LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  void v18[4] = a1;
  v18[5] = a2;
  v18[6] = v10;
  swift_bridgeObjectRetain_n(a2, 2LL);
  id v19 = v10;
  uint64_t v20 = sub_100012B70((uint64_t)v5, (uint64_t)&unk_1000279F0, (uint64_t)v18);
  swift_beginAccess(v7, v30, 33LL, 0LL);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v7);
  uint64_t v29 = *v7;
  void *v7 = 0x8000000000000000LL;
  sub_100014534(v20, a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t v22 = *v7;
  void *v7 = v29;
  swift_bridgeObjectRelease(v22, v23);
  swift_bridgeObjectRelease(a2, v24);
  swift_endAccess(v30);
  int64_t v25 = CFNotificationCenterGetDarwinNotifyCenter();
  unint64_t v26 = (__CFString *)String._bridgeToObjectiveC()();
  CFNotificationCenterRemoveObserver(v25, 0LL, v26, 0LL);

  int64_t v27 = CFNotificationCenterGetDarwinNotifyCenter();
  BOOL v28 = (__CFString *)String._bridgeToObjectiveC()();
  CFNotificationCenterAddObserver( v27,  0LL,  (CFNotificationCallback)sub_10001313C,  v28,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t sub_100014F48()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_100014F7C()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc(dword_1000279EC);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100013378;
  return sub_100012CC4((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_100014FDC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001323C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100015018(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void sub_10001505C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "task [%@] being asked to complete, but is already fiinished!",  (uint8_t *)&v2,  0xCu);
}

void sub_1000150D0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "AXMigrateResTask: Error refreshing catalog during migration. %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100015144(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "XPC Activity handler called with unexpected state. %@. Asset:%@",  (uint8_t *)&v4,  0x16u);
}

void sub_1000151CC(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "AXInformSiriSubsTask: Error: attempted to add a neural voice on a device that does not support neural voices, %@",  (uint8_t *)&v3,  0xCu);
}

void sub_100015244(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Deallocating task %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000152D8(void *a1, uint64_t a2, os_log_s *a3)
{
  v5[0] = 67109378;
  v5[1] = [a1 processIdentifier];
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Rejecting connecting client with pid:(%d) appID:(%@). Missing required entitlement",  (uint8_t *)v5,  0x12u);
}

void sub_100015370( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000153D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015440(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_100011DA4();
  sub_100011D90((void *)&_mh_execute_header, v3, v4, "%@: Could not refresh assets: %@", v5, v6, v7, v8, v9);

  sub_100011DBC();
}

void sub_1000154C4(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_100011DA4();
  sub_100011D90((void *)&_mh_execute_header, v3, v4, "%@: Could not purge assets: %@", v5, v6, v7, v8, v9);

  sub_100011DBC();
}

void sub_100015548(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Kicking off downloads with refreshed assets:",  v1,  2u);
}

void sub_100015588(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_100011DA4();
  sub_100011D90((void *)&_mh_execute_header, v3, v4, "%@: Could not kick off asset downloads: %@", v5, v6, v7, v8, v9);

  sub_100011DBC();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__anonymousTaskForId_withArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_anonymousTaskForId:withArguments:");
}

id objc_msgSend__callCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callCompletion:");
}

id objc_msgSend__cleanupVoiceSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupVoiceSubscriptions];
}

id objc_msgSend__completeMigrationForLegacyResource_withDownloadedResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_completeMigrationForLegacyResource:withDownloadedResource:");
}

id objc_msgSend__completeWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_completeWithResult:");
}

id objc_msgSend__debugNameForXPCActivityState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugNameForXPCActivityState:");
}

id objc_msgSend__deferIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _deferIfNeeded];
}

id objc_msgSend__dequeueNextTask(void *a1, const char *a2, ...)
{
  return _[a1 _dequeueNextTask];
}

id objc_msgSend__dispatchTask_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchTask:completion:");
}

id objc_msgSend__enqueueTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueTask:");
}

id objc_msgSend__getBootTime(void *a1, const char *a2, ...)
{
  return _[a1 _getBootTime];
}

id objc_msgSend__handleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNotification:");
}

id objc_msgSend__handleXPCActivity_taskClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleXPCActivity:taskClass:");
}

id objc_msgSend__housekeeping_op1_refreshAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_housekeeping_op1_refreshAssets");
}

id objc_msgSend__housekeeping_op2_purgeAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_housekeeping_op2_purgeAssets:");
}

id objc_msgSend__housekeeping_op3_downloadAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_housekeeping_op3_downloadAssets:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initWithPhase_lastExitStatus_date_taskID_assetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithPhase:lastExitStatus:date:taskID:assetType:");
}

id objc_msgSend__managedAssetForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_managedAssetForAssetType:");
}

id objc_msgSend__migrateNashvilleToMaui(void *a1, const char *a2, ...)
{
  return _[a1 _migrateNashvilleToMaui];
}

id objc_msgSend__purgeLegacyResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purgeLegacyResource:");
}

id objc_msgSend__refreshAssetCatalogForAssetType_withOverrideTimeout_forceCatalogRefresh_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshAssetCatalogForAssetType:withOverrideTimeout:forceCatalogRefresh:");
}

id objc_msgSend__resourceInUseByOtherTechnologies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resourceInUseByOtherTechnologies:");
}

id objc_msgSend__restorationDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _restorationDictionary];
}

id objc_msgSend__restorationExitStatusForResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restorationExitStatusForResult:");
}

id objc_msgSend__restorationState(void *a1, const char *a2, ...)
{
  return _[a1 _restorationState];
}

id objc_msgSend__retryAndBackOff(void *a1, const char *a2, ...)
{
  return _[a1 _retryAndBackOff];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__taskQueueForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_taskQueueForTask:");
}

id objc_msgSend__tasksForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tasksForNotification:");
}

id objc_msgSend__tasksForTriggerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tasksForTriggerType:");
}

id objc_msgSend__updateAssetForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAssetForAssetType:");
}

id objc_msgSend__xpcQueue_acceptNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcQueue_acceptNewConnection:");
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityTransactionManager(void *a1, const char *a2, ...)
{
  return _[a1 activityTransactionManager];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_afterDelay_processBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afterDelay:processBlock:");
}

id objc_msgSend_afterDelay_processBlock_cancelBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afterDelay:processBlock:cancelBlock:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return _[a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetController(void *a1, const char *a2, ...)
{
  return _[a1 assetController];
}

id objc_msgSend_assetControllerWithPolicy_qosClass_shouldRefreshForAssetInstallNotifications_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetControllerWithPolicy:qosClass:shouldRefreshForAssetInstallNotifications:");
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return _[a1 assetType];
}

id objc_msgSend_assetTypeSuffix(void *a1, const char *a2, ...)
{
  return _[a1 assetTypeSuffix];
}

id objc_msgSend_assetWithPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetWithPolicy:");
}

id objc_msgSend_assetsToDownloadFromRefreshedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsToDownloadFromRefreshedAssets:");
}

id objc_msgSend_assetsToPurgeFromInstalledAssets_withRefreshedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsToPurgeFromInstalledAssets:withRefreshedAssets:");
}

id objc_msgSend_attemptCount(void *a1, const char *a2, ...)
{
  return _[a1 attemptCount];
}

id objc_msgSend_ax_flatMappedArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ax_flatMappedArrayUsingBlock:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_catalogBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 catalogBuildVersion];
}

id objc_msgSend_checkInAssetUpdateXPCActivity(void *a1, const char *a2, ...)
{
  return _[a1 checkInAssetUpdateXPCActivity];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_completionStatus(void *a1, const char *a2, ...)
{
  return _[a1 completionStatus];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithActivity:");
}

id objc_msgSend_contextWithXPCClient(void *a1, const char *a2, ...)
{
  return _[a1 contextWithXPCClient];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_daemonShouldDownloadInBackgroundIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 daemonShouldDownloadInBackgroundIfNeeded];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return _[a1 defaultCStringEncoding];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteResourceWithVoiceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteResourceWithVoiceId:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCompleteWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCompleteWithStatus:");
}

id objc_msgSend_downloadAssets_successStartBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAssets:successStartBlock:");
}

id objc_msgSend_downloadResourceWithVoiceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadResourceWithVoiceId:");
}

id objc_msgSend_downloadResourceWithVoiceId_userInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadResourceWithVoiceId:userInitiated:");
}

id objc_msgSend_downloadSamplesIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 downloadSamplesIfNecessary];
}

id objc_msgSend_enqueueAssetUpdateTaskWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueAssetUpdateTaskWithContext:");
}

id objc_msgSend_enqueueCatalogRefreshTaskWithOverrideTimeout_forceCatalogRefresh_context_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueCatalogRefreshTaskWithOverrideTimeout:forceCatalogRefresh:context:");
}

id objc_msgSend_enqueueCleanseUnusedCompactResourcesTaskWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueCleanseUnusedCompactResourcesTaskWithContext:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _[a1 finished];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_footprint(void *a1, const char *a2, ...)
{
  return _[a1 footprint];
}

id objc_msgSend_freeSharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 freeSharedInstance];
}

id objc_msgSend_handleFirstBoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFirstBoot:");
}

id objc_msgSend_handleFirstUnlock(void *a1, const char *a2, ...)
{
  return _[a1 handleFirstUnlock];
}

id objc_msgSend_hasCompletedPurgingAssets(void *a1, const char *a2, ...)
{
  return _[a1 hasCompletedPurgingAssets];
}

id objc_msgSend_hasCompletedRefreshingAssets(void *a1, const char *a2, ...)
{
  return _[a1 hasCompletedRefreshingAssets];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_idleStateWithTaskID_assetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idleStateWithTaskID:assetType:");
}

id objc_msgSend_inflightTasks(void *a1, const char *a2, ...)
{
  return _[a1 inflightTasks];
}

id objc_msgSend_initWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivity:");
}

id objc_msgSend_initWithLaunchActivityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLaunchActivityIdentifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_policy_context_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:policy:context:block:");
}

id objc_msgSend_initWithPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPolicy:");
}

id objc_msgSend_initWithPolicy_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPolicy:context:");
}

id objc_msgSend_initWithPolicy_forceCatalogRefresh_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPolicy:forceCatalogRefresh:context:");
}

id objc_msgSend_initWithTargetSerialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTargetSerialQueue:");
}

id objc_msgSend_initWithTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTrigger:");
}

id objc_msgSend_installedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedAssets:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invokeTaskById_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeTaskById:arguments:");
}

id objc_msgSend_invokeWithArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeWithArguments:");
}

id objc_msgSend_isAssetCatalogInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isAssetCatalogInstalled];
}

id objc_msgSend_isDownloadingAssets(void *a1, const char *a2, ...)
{
  return _[a1 isDownloadingAssets];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return _[a1 isIdle];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isInstalled];
}

id objc_msgSend_isMigrationComplete(void *a1, const char *a2, ...)
{
  return _[a1 isMigrationComplete];
}

id objc_msgSend_isPurgingAssets(void *a1, const char *a2, ...)
{
  return _[a1 isPurgingAssets];
}

id objc_msgSend_isRefreshingAssets(void *a1, const char *a2, ...)
{
  return _[a1 isRefreshingAssets];
}

id objc_msgSend_lastExitStatus(void *a1, const char *a2, ...)
{
  return _[a1 lastExitStatus];
}

id objc_msgSend_launchActivity(void *a1, const char *a2, ...)
{
  return _[a1 launchActivity];
}

id objc_msgSend_launchActivityId(void *a1, const char *a2, ...)
{
  return _[a1 launchActivityId];
}

id objc_msgSend_launchActivityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 launchActivityIdentifier];
}

id objc_msgSend_legacyIdentifierForUpdatedIdentifierDuringMigration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyIdentifierForUpdatedIdentifierDuringMigration:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_managedAssets(void *a1, const char *a2, ...)
{
  return _[a1 managedAssets];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_notificationName(void *a1, const char *a2, ...)
{
  return _[a1 notificationName];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_overrideTimeout(void *a1, const char *a2, ...)
{
  return _[a1 overrideTimeout];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return _[a1 phase];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return _[a1 policy];
}

id objc_msgSend_primaryLanguage(void *a1, const char *a2, ...)
{
  return _[a1 primaryLanguage];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_purgeAndReloadAllComponents(void *a1, const char *a2, ...)
{
  return _[a1 purgeAndReloadAllComponents];
}

id objc_msgSend_purgeAssets_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeAssets:completion:");
}

id objc_msgSend_readResourceCacheVersionFromPreferences(void *a1, const char *a2, ...)
{
  return _[a1 readResourceCacheVersionFromPreferences];
}

id objc_msgSend_reconcileCachedComponents(void *a1, const char *a2, ...)
{
  return _[a1 reconcileCachedComponents];
}

id objc_msgSend_recordAssetRefreshEventForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordAssetRefreshEventForAssetType:");
}

id objc_msgSend_refreshAssetCatalogForAssetTypeHandler(void *a1, const char *a2, ...)
{
  return _[a1 refreshAssetCatalogForAssetTypeHandler];
}

id objc_msgSend_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:");
}

id objc_msgSend_refreshResourcesCacheForManagerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshResourcesCacheForManagerType:");
}

id objc_msgSend_registerManagedAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerManagedAsset:");
}

id objc_msgSend_registerManagedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerManagedAssets:");
}

id objc_msgSend_registerTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerTask:");
}

id objc_msgSend_registeredTasks(void *a1, const char *a2, ...)
{
  return _[a1 registeredTasks];
}

id objc_msgSend_reloadVoicesForBundleIdentifierHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadVoicesForBundleIdentifierHash:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_resetInMemoryAssetCatalogs(void *a1, const char *a2, ...)
{
  return _[a1 resetInMemoryAssetCatalogs];
}

id objc_msgSend_resetResourcesCache(void *a1, const char *a2, ...)
{
  return _[a1 resetResourcesCache];
}

id objc_msgSend_resourceCompletedMigration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceCompletedMigration:");
}

id objc_msgSend_resourceNeedsMigration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceNeedsMigration:");
}

id objc_msgSend_resourceWithVoiceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceWithVoiceId:");
}

id objc_msgSend_restorationState(void *a1, const char *a2, ...)
{
  return _[a1 restorationState];
}

id objc_msgSend_restoreOrCreateStateFromStore_assetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreOrCreateStateFromStore:assetType:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_run_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run:");
}

id objc_msgSend_selectedSpeechVoiceIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 selectedSpeechVoiceIdentifiers];
}

id objc_msgSend_selectedSpeechVoiceIdentifiersForSourceKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedSpeechVoiceIdentifiersForSourceKey:");
}

id objc_msgSend_selectedSpeechVoiceIdentifiersWithLanguageSource(void *a1, const char *a2, ...)
{
  return _[a1 selectedSpeechVoiceIdentifiersWithLanguageSource];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivity:");
}

id objc_msgSend_setActivityTransactionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityTransactionManager:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setAssetController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetController:");
}

id objc_msgSend_setAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetType:");
}

id objc_msgSend_setAttemptCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttemptCount:");
}

id objc_msgSend_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setCompletionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionStatus:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvironment:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLastExitStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastExitStatus:");
}

id objc_msgSend_setLaunchActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchActivity:");
}

id objc_msgSend_setLaunchActivityId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchActivityId:");
}

id objc_msgSend_setManagedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagedAssets:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverrideTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideTimeout:");
}

id objc_msgSend_setPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhase:");
}

id objc_msgSend_setPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPolicy:");
}

id objc_msgSend_setRefreshAssetCatalogForAssetTypeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshAssetCatalogForAssetTypeHandler:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRestorationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestorationState:");
}

id objc_msgSend_setTaskBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskBlock:");
}

id objc_msgSend_setTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskID:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrigger:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUpdateAssetForAssetTypeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateAssetForAssetTypeHandler:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setValue_forKey_forAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:forAssetType:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setXpcServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcServer:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return _[a1 shouldDefer];
}

id objc_msgSend_simpleTaskFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simpleTaskFinished:");
}

id objc_msgSend_simpleTaskStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simpleTaskStarted:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return _[a1 startServer];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _[a1 store];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscribeWithVoices_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeWithVoices:reply:");
}

id objc_msgSend_subscribedVoicesWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribedVoicesWithReply:");
}

id objc_msgSend_synchronous(void *a1, const char *a2, ...)
{
  return _[a1 synchronous];
}

id objc_msgSend_taskBlock(void *a1, const char *a2, ...)
{
  return _[a1 taskBlock];
}

id objc_msgSend_taskCompletionWaitingQueue(void *a1, const char *a2, ...)
{
  return _[a1 taskCompletionWaitingQueue];
}

id objc_msgSend_taskDispatcherQueue(void *a1, const char *a2, ...)
{
  return _[a1 taskDispatcherQueue];
}

id objc_msgSend_taskGroupIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskGroupIdentifier];
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return _[a1 taskID];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskIdentifier];
}

id objc_msgSend_taskQueues(void *a1, const char *a2, ...)
{
  return _[a1 taskQueues];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _[a1 trigger];
}

id objc_msgSend_triggers(void *a1, const char *a2, ...)
{
  return _[a1 triggers];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_updateAssetForAssetTypeHandler(void *a1, const char *a2, ...)
{
  return _[a1 updateAssetForAssetTypeHandler];
}

id objc_msgSend_updateCatalogBuildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCatalogBuildVersion:");
}

id objc_msgSend_updatePhase_exitStatus_saveToStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePhase:exitStatus:saveToStore:");
}

id objc_msgSend_updatePhase_saveToStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePhase:saveToStore:");
}

id objc_msgSend_updateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateState:");
}

id objc_msgSend_updatedIdentifierForLegacyIdentifier_withLanguageCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedIdentifierForLegacyIdentifier:withLanguageCode:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_forAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:forAssetType:");
}

id objc_msgSend_voiceId(void *a1, const char *a2, ...)
{
  return _[a1 voiceId];
}

id objc_msgSend_voiceOverLanguageRotorItems(void *a1, const char *a2, ...)
{
  return _[a1 voiceOverLanguageRotorItems];
}

id objc_msgSend_willBecomeIdle_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willBecomeIdle:completion:");
}

id objc_msgSend_withAnonymousInvokation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withAnonymousInvokation:");
}

id objc_msgSend_withFirstBootType(void *a1, const char *a2, ...)
{
  return _[a1 withFirstBootType];
}

id objc_msgSend_withFirstUnlockType(void *a1, const char *a2, ...)
{
  return _[a1 withFirstUnlockType];
}

id objc_msgSend_withNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withNotificationName:");
}

id objc_msgSend_writeIsMigrationCompleteToPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeIsMigrationCompleteToPreferences:");
}

id objc_msgSend_writeVoiceIdentifiersToMigrateToPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeVoiceIdentifiersToMigrateToPreferences:");
}

id objc_msgSend_xpcServer(void *a1, const char *a2, ...)
{
  return _[a1 xpcServer];
}
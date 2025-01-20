@interface PBOSUpdateAssetManager
+ (id)sharedManager;
+ (int64_t)_compareOSVersion:(id)a3 andBuild:(id)a4 withOSVersion:(id)a5 andBuild:(id)a6;
- (BOOL)_asset:(id)a3 withReleaseDate:(id)a4 matchesUpdate:(id)a5;
- (BOOL)_isAsset:(id)a3 eligibleForAction:(unint64_t)a4 delayingUpdates:(BOOL)a5;
- (BOOL)processedAssetCatalogDownloadResponse;
- (BOOL)processingAssetRequest;
- (BOOL)processingSpaceRequest;
- (PBOSUpdateAssetManager)init;
- (id)_downloadOptionsForScanOptions:(id)a3;
- (id)_postedDateForQuery:(id)a3;
- (id)_queryForAssetDownload;
- (id)_queryForAssetPurge;
- (id)_queryForLocalAssetSearch;
- (id)descriptorForAsset:(id)a3 withReleaseDate:(id)a4;
- (int64_t)_compareAsset:(id)a3 withAsset:(id)a4;
- (int64_t)_performMetadataQuery:(id)a3;
- (int64_t)_purgeAsset:(id)a3;
- (int64_t)_purgeableSizeFor:(id)a3;
- (void)_configureForVPN;
- (void)_finishAssetForAction:(unint64_t)a3 options:(id)a4 withCompletion:(id)a5;
- (void)_finishInstalledAssetForUpdate:(id)a3 withCompletion:(id)a4;
- (void)_refreshAssetCatalogUsingOptions:(id)a3 withCompletion:(id)a4;
- (void)_reportAssetCatalogDownloadWithResult:(int64_t)a3 forAttempt:(int64_t)a4;
- (void)assetForAction:(unint64_t)a3 options:(id)a4 withCompletion:(id)a5;
- (void)dateAtWhichDelayedUpdatesExpireWithCompletion:(id)a3;
- (void)descriptorForCurrentlyInstalledAssetWithCompletion:(id)a3;
- (void)installedAssetForUpdate:(id)a3 withCompletion:(id)a4;
- (void)purgeLocalAssetsWithCompletion:(id)a3;
- (void)purgeableAssetSpaceWithCompletion:(id)a3;
- (void)setProcessedAssetCatalogDownloadResponse:(BOOL)a3;
- (void)setProcessingAssetRequest:(BOOL)a3;
- (void)setProcessingSpaceRequest:(BOOL)a3;
@end

@implementation PBOSUpdateAssetManager

+ (id)sharedManager
{
  if (qword_100470FA8 != -1) {
    dispatch_once(&qword_100470FA8, &stru_1003D8430);
  }
  return (id)qword_100470FA0;
}

- (PBOSUpdateAssetManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBOSUpdateAssetManager;
  v2 = -[PBOSUpdateAssetManager init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->processingSpaceRequest = 0;
    v2->processedAssetCatalogDownloadResponse = 0;
    -[PBOSUpdateAssetManager _configureForVPN](v2, "_configureForVPN");
  }

  return v3;
}

- (void)purgeableAssetSpaceWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (-[PBOSUpdateAssetManager processingSpaceRequest](v5, "processingSpaceRequest"))
  {
    objc_sync_exit(v5);

    id v6 = sub_1000836CC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring nested calls to get asset space. Returning zero.",  (uint8_t *)&buf,  2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011EE90;
    block[3] = &unk_1003D0110;
    id v19 = v4;
    id v8 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    -[PBOSUpdateAssetManager setProcessingSpaceRequest:](v5, "setProcessingSpaceRequest:", 1LL);
    objc_sync_exit(v5);

    id v9 = sub_1000836CC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Computing asset space...",  (uint8_t *)&buf,  2u);
    }

    objc_initWeak(&buf, v5);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10011EED8;
    v14[3] = &unk_1003D5B38;
    objc_copyWeak(&v16, &buf);
    v14[4] = v5;
    id v15 = v4;
    id v13 = v4;
    dispatch_async(v12, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&buf);
  }

- (void)purgeLocalAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (-[PBOSUpdateAssetManager processingAssetRequest](v5, "processingAssetRequest"))
  {
    objc_sync_exit(v5);

    id v6 = sub_1000836CC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring nested calls to purge assets. Returning zero bytes purged.",  (uint8_t *)&buf,  2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011F480;
    block[3] = &unk_1003D0110;
    id v17 = v4;
    id v8 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    -[PBOSUpdateAssetManager setProcessingAssetRequest:](v5, "setProcessingAssetRequest:", 1LL);
    objc_sync_exit(v5);

    objc_initWeak(&buf, v5);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10011F4C8;
    v12[3] = &unk_1003D5B38;
    objc_copyWeak(&v14, &buf);
    v12[4] = v5;
    id v13 = v4;
    id v11 = v4;
    dispatch_async(v10, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&buf);
  }

- (void)assetForAction:(unint64_t)a3 options:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011FB34;
  block[3] = &unk_1003D84A8;
  v17[1] = (id)a3;
  objc_copyWeak(v17, &location);
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)installedAssetForUpdate:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10011FFF4;
  v12[3] = &unk_1003D84D0;
  id v13 = v6;
  id v10 = v6;
  objc_copyWeak(&v15, &location);
  id v14 = v7;
  id v11 = v7;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)descriptorForAsset:(id)a3 withReleaseDate:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a4;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 attributes]);
    if (!v7
      || (id v8 = (void *)v7,
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]),
          id v10 = [v9 count],
          v9,
          v8,
          !v10))
    {
      __int128 v80 = 0u;
      memset(v81, 0, sizeof(v81));
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v73 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v11 = sub_1000836CC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) ? 3LL : 2LL;
      LOWORD(v65) = 0;
      _os_log_send_and_compose_impl( v13,  0LL,  &v67,  250LL,  &_mh_execute_header,  v12,  16LL,  "Asset missing all attributes when trying to create a descriptor.",  &v65,  2);
      id v15 = v14;

      id v16 = sub_1000836CC();
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      _os_log_message_persist_impl(v15, 16LL, v17);

      if (v15 != &v67) {
        free(v15);
      }
    }

    id v18 = objc_alloc_init(&OBJC_CLASS___PBSOSUpdateDescriptor);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_stringForKey:", @"OSVersion"));
    [v18 setProductVersion:v20];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_stringForKey:", @"Build"));
    [v18 setProductBuildVersion:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 systemName]);

    v61 = (void *)v23;
    [v18 setProductSystemName:v23];
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_stringForKey:", @"ReleaseType"));
    objc_msgSend(v18, "setReleaseType:");
    [v18 setReleaseDate:v6];

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_stringForKey:", @"SUPublisher"));
    objc_msgSend(v18, "setPublisher:");
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_numberForKey:", ASAttributeDownloadSize));
    objc_msgSend(v18, "setDownloadSize:", objc_msgSend(v58, "unsignedLongLongValue"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_numberForKey:", @"ActualMinimumSystemPartition"));
    if (!v24)
    {
      __int128 v80 = 0u;
      memset(v81, 0, sizeof(v81));
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v73 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v25 = sub_1000836CC();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        uint64_t v27 = 3LL;
      }
      else {
        uint64_t v27 = 2LL;
      }
      LOWORD(v65) = 0;
      LODWORD(v57) = 2;
      _os_log_send_and_compose_impl( v27,  0LL,  &v67,  250LL,  &_mh_execute_header,  v26,  16LL,  "Asset missing ActualMinimumSystemPartition when trying to create a descriptor. Trying MinimumSystemPartition.",  &v65,  v57);
      v29 = v28;

      id v30 = sub_1000836CC();
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      _os_log_message_persist_impl(v29, 16LL, v31);

      if (v29 != &v67) {
        free(v29);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_numberForKey:", @"MinimumSystemPartition"));
      if (!v24)
      {
        __int128 v80 = 0u;
        memset(v81, 0, sizeof(v81));
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v73 = 0u;
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        id v32 = sub_1000836CC();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          uint64_t v34 = 3LL;
        }
        else {
          uint64_t v34 = 2LL;
        }
        LOWORD(v65) = 0;
        LODWORD(v57) = 2;
        _os_log_send_and_compose_impl( v34,  0LL,  &v67,  250LL,  &_mh_execute_header,  v33,  16LL,  "Asset missing MinimumSystemPartition too when trying to create a descriptor. Update will fail.",  &v65,  v57);
        v36 = v35;

        id v37 = sub_1000836CC();
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        _os_log_message_persist_impl(v36, 16LL, v38);

        if (v36 != &v67) {
          free(v36);
        }
        v24 = 0LL;
      }
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_numberForKey:", @"Ramp"));
    objc_msgSend(v18, "setRampEnabled:", objc_msgSend(v39, "BOOLValue"));
    uint64_t v63 = 0LL;
    uint64_t v64 = 0LL;
    CFTypeRef cf = 0LL;
    if ((MSUAssetCalculateApplySize(v19, &v63, &cf) & 1) == 0)
    {
      __int128 v80 = 0u;
      memset(v81, 0, sizeof(v81));
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v73 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v40 = sub_1000836CC();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        uint64_t v42 = 3LL;
      }
      else {
        uint64_t v42 = 2LL;
      }
      int v65 = 138543362;
      CFTypeRef v66 = cf;
      LODWORD(v57) = 12;
      _os_log_send_and_compose_impl( v42,  0LL,  &v67,  250LL,  &_mh_execute_header,  v41,  16LL,  "Failed to determine apply size: %{public}@",  &v65,  v57);
      v44 = v43;

      id v45 = sub_1000836CC();
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      _os_log_message_persist_impl(v44, 16LL, v46);

      if (v44 != &v67) {
        free(v44);
      }
      if (cf) {
        CFRelease(cf);
      }
    }

    CFTypeRef cf = 0LL;
    if ((MSUAssetCalculatePrepareSize(v19, &v64, &cf) & 1) == 0)
    {
      __int128 v80 = 0u;
      memset(v81, 0, sizeof(v81));
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v73 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v47 = sub_1000836CC();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        uint64_t v49 = 3LL;
      }
      else {
        uint64_t v49 = 2LL;
      }
      int v65 = 138543362;
      CFTypeRef v66 = cf;
      LODWORD(v57) = 12;
      _os_log_send_and_compose_impl( v49,  0LL,  &v67,  250LL,  &_mh_execute_header,  v48,  16LL,  "Failed to determine prepare size: %{public}@",  &v65,  v57);
      v51 = v50;

      id v52 = sub_1000836CC();
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      _os_log_message_persist_impl(v51, 16LL, v53);

      if (v51 != &v67) {
        free(v51);
      }
      if (cf) {
        CFRelease(cf);
      }
    }

    [v18 setPreparationSize:v64];
    [v18 setInstallationSize:v63];
    unsigned int v54 = objc_msgSend(v19, "tvs_BOOLForKey:defaultValue:", @"PrerequisiteBuild", 0);
    else {
      uint64_t v55 = 2LL;
    }
    [v18 setUpdateType:v55];
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (void)descriptorForCurrentlyInstalledAssetWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100120918;
  block[3] = &unk_1003D0300;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)dateAtWhichDelayedUpdatesExpireWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100120D18;
  block[3] = &unk_1003D0300;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_configureForVPN
{
  if ((+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild") & 1) != 0
    || (v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSAppleConnectSettings sharedInstance]( PBSAppleConnectSettings,  "sharedInstance")),  unsigned int v3 = [v2 isCarryOrLiveOnUser],  v2,  v3))
  {
    xpc_object_t v4 = xpc_array_create(0LL, 0LL);
    xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "basejumper.apple.com");
    xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "basejumper-vip.sd.apple.com");
    xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "basejumper.sd.apple.com");
    xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "gdmf-staging-int.apple.com");
    xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "pr2-pallas-staging-int-prz.apple.com");
    xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "cheeserolling.apple.com");
    xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "livability-api.swe.apple.com");
    int v5 = NEHelperSettingsSetArray("CriticalDomains", v4);
    memset(v29, 0, 250);
    id v6 = sub_1000836CC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    int v13 = 136316930;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    id v14 = "basejumper.apple.com";
    __int16 v15 = 2080;
    id v16 = "basejumper-vip.sd.apple.com";
    __int16 v17 = 2080;
    id v18 = "basejumper.sd.apple.com";
    __int16 v19 = 2080;
    v20 = "gdmf-staging-int.apple.com";
    __int16 v21 = 2080;
    v22 = "pr2-pallas-staging-int-prz.apple.com";
    __int16 v23 = 2080;
    v24 = "cheeserolling.apple.com";
    __int16 v25 = 2080;
    v26 = "livability-api.swe.apple.com";
    __int16 v27 = 1024;
    int v28 = v5;
    _os_log_send_and_compose_impl( v8,  0LL,  v29,  250LL,  &_mh_execute_header,  v7,  0LL,  "Adding [%s %s %s %s %s %s %s] to CriticalDomains [result:%d]",  (const char *)&v13,  78);
    id v10 = v9;

    id v11 = sub_1000836CC();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _os_log_message_persist_impl(v10, 0LL, v12);

    if (v10 != v29) {
      free(v10);
    }
  }

- (void)_finishAssetForAction:(unint64_t)a3 options:(id)a4 withCompletion:(id)a5
{
  id v74 = a4;
  id v75 = a5;
  objc_initWeak(&location, self);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[PBOSUpdateAssetManager _queryForAssetDownload](self, "_queryForAssetDownload"));
  int64_t v9 = -[PBOSUpdateAssetManager _performMetadataQuery:](self, "_performMetadataQuery:", v8);
  id v10 = (void *)v8;
  int64_t v11 = v9;
  __int128 v76 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 results]);
  id v78 = [v12 copy];

  __int128 v77 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSUpdateAssetManager _postedDateForQuery:](self, "_postedDateForQuery:", v76));
  __int128 v119 = 0u;
  memset(v120, 0, sizeof(v120));
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v110 = 0u;
  memset(v109, 0, sizeof(v109));
  memset(buf, 0, sizeof(buf));
  id v13 = sub_1000836CC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  LODWORD(v12) = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  unsigned int v15 = [v78 count];
  int v100 = 67110146;
  if ((_DWORD)v12) {
    uint64_t v16 = 3LL;
  }
  else {
    uint64_t v16 = 2LL;
  }
  *(_DWORD *)v101 = v15;
  *(_WORD *)&v101[4] = 1024;
  if (v11) {
    int v17 = 13;
  }
  else {
    int v17 = 1;
  }
  *(_DWORD *)&v101[6] = v11;
  __int16 v102 = 1024;
  int v103 = v17;
  __int16 v104 = 2114;
  v105 = v77;
  __int16 v106 = 1024;
  int v107 = a3;
  _os_log_send_and_compose_impl( v16,  0LL,  buf,  250LL,  &_mh_execute_header,  v14,  0LL,  "Asset query returned %d candidates (result: %d/%d postedDate: %{public}@ action:%d).",  &v100,  36);
  __int16 v19 = v18;

  id v20 = sub_1000836CC();
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  _os_log_message_persist_impl(v19, 0LL, v21);

  if (v19 != buf) {
    free(v19);
  }
  if (v11)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100121E64;
    block[3] = &unk_1003D2560;
    id v96 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  13LL,  0LL));
    id v97 = v75;
    id v73 = v96;
    dispatch_async(&_dispatch_main_q, block);

    goto LABEL_44;
  }

  unsigned int v22 = [v74 MDMUseDelayPeriod];
  char v23 = v22 ^ 1;
  if (a3 - 6 > 2) {
    char v23 = 1;
  }
  if ((v23 & 1) == 0)
  {
    __int128 v119 = 0u;
    memset(v120, 0, sizeof(v120));
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    __int128 v110 = 0u;
    memset(v109, 0, sizeof(v109));
    memset(buf, 0, sizeof(buf));
    id v24 = sub_1000836CC();
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v26 = 3LL;
    }
    else {
      uint64_t v26 = 2LL;
    }
    LOWORD(v100) = 0;
    LODWORD(v72) = 2;
    _os_log_send_and_compose_impl( v26,  0LL,  buf,  250LL,  &_mh_execute_header,  v25,  0LL,  "Delaying updates but overriding because MDM asking for scan.",  &v100,  v72);
    int v28 = v27;

    id v29 = sub_1000836CC();
    id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    _os_log_message_persist_impl(v28, 0LL, v30);

    if (v28 != buf) {
      free(v28);
    }
    goto LABEL_21;
  }

  if (!v22)
  {
LABEL_21:
    BOOL v36 = 0;
    goto LABEL_22;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue([v74 delayPeriod]);
  id v32 = [v31 integerValue];

  v33 = (void *)objc_claimAutoreleasedReturnValue([v77 dateByAddingTimeInterval:(double)(uint64_t)v32 * 86400.0]);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v33 laterDate:v34]);
  BOOL v36 = v35 == v33;

LABEL_22:
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472LL;
  v92[2] = sub_100121E8C;
  v92[3] = &unk_1003D8588;
  objc_copyWeak(v93, &location);
  v93[1] = (id)a3;
  BOOL v94 = v36;
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v78 indexesOfObjectsPassingTest:v92]);
  id v38 = sub_1000836CC();
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v40 = [v37 count];
    *(_DWORD *)id buf = 67109120;
    *(_DWORD *)&buf[4] = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "After filtering, %d candidate assets remain.",  buf,  8u);
  }

  id v73 = v37;

  if ([v37 count])
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue([v78 objectsAtIndexes:v37]);
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472LL;
    v88[2] = sub_100121F10;
    v88[3] = &unk_1003D85B0;
    objc_copyWeak(&v89, &location);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 sortedArrayUsingComparator:v88]);

    id v43 = sub_1000836CC();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Candidate assets in order:\n", buf, 2u);
    }

    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    id obj = v42;
    id v45 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v85;
      do
      {
        for (i = 0LL; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v85 != v46) {
            objc_enumerationMutation(obj);
          }
          v48 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)i);
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 attributes]);
          v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKey:@"OSVersion"]);

          v51 = (void *)objc_claimAutoreleasedReturnValue([v48 attributes]);
          id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKey:@"Build"]);

          v53 = (void *)objc_claimAutoreleasedReturnValue([v48 attributes]);
          unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"ReleaseType"]);

          uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v48 attributes]);
          v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKey:@"PrerequisiteOSVersion"]);

          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v48 attributes]);
          v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKey:@"PrerequisiteBuild"]);

          id v59 = sub_1000836CC();
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id buf = 138544386;
            *(void *)&buf[4] = v56;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v58;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v50;
            LOWORD(v109[0]) = 2114;
            *(void *)((char *)v109 + 2) = v52;
            HIWORD(v109[2]) = 2114;
            *(void *)&v109[3] = v54;
            _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Update from: %{public}@/%{public}@ to: %{public}@/%{public}@/%{public}@",  buf,  0x34u);
          }
        }

        id v45 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
      }

      while (v45);
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue([obj firstObject]);
    [v61 refreshState];
    __int128 v119 = 0u;
    memset(v120, 0, sizeof(v120));
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    __int128 v110 = 0u;
    memset(v109, 0, sizeof(v109));
    memset(buf, 0, sizeof(buf));
    id v62 = sub_1000836CC();
    uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    BOOL v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    int v65 = (void *)objc_claimAutoreleasedReturnValue([v61 attributes]);
    if (v64) {
      uint64_t v66 = 3LL;
    }
    else {
      uint64_t v66 = 2LL;
    }
    int v100 = 138543362;
    *(void *)v101 = v65;
    LODWORD(v72) = 12;
    _os_log_send_and_compose_impl( v66,  0LL,  buf,  250LL,  &_mh_execute_header,  v63,  0LL,  "Selected Asset %{public}@",  &v100,  v72);
    __int128 v68 = v67;

    id v69 = sub_1000836CC();
    __int128 v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
    _os_log_message_persist_impl(v68, 0LL, v70);

    if (v68 != buf) {
      free(v68);
    }
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472LL;
    v80[2] = sub_100121F74;
    v80[3] = &unk_1003D85D8;
    id v83 = v75;
    id v81 = v61;
    id v82 = v77;
    id v71 = v61;
    dispatch_async(&_dispatch_main_q, v80);

    objc_destroyWeak(&v89);
  }

  else
  {
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_100121EE8;
    v90[3] = &unk_1003D0110;
    id v91 = v75;
    dispatch_async(&_dispatch_main_q, v90);
  }

  objc_destroyWeak(v93);
LABEL_44:

  objc_destroyWeak(&location);
}

- (void)_finishInstalledAssetForUpdate:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSUpdateAssetManager _queryForLocalAssetSearch](self, "_queryForLocalAssetSearch"));
  int64_t v9 = -[PBOSUpdateAssetManager _performMetadataQuery:](self, "_performMetadataQuery:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
  id v11 = [v10 copy];

  uint64_t v66 = self;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[PBOSUpdateAssetManager _postedDateForQuery:](self, "_postedDateForQuery:", v8));
  __int128 v99 = 0u;
  memset(v100, 0, sizeof(v100));
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v86 = 0u;
  id v13 = sub_1000836CC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v15 = 3LL;
  }
  else {
    uint64_t v15 = 2LL;
  }
  unsigned int v16 = [v11 count];
  int v81 = 67110146;
  if (v9) {
    int v17 = 13;
  }
  else {
    int v17 = 1;
  }
  *(_DWORD *)id v82 = v16;
  *(_WORD *)&v82[4] = 1024;
  *(_DWORD *)&v82[6] = v9;
  LOWORD(v83) = 1024;
  *(_DWORD *)((char *)&v83 + 2) = v17;
  HIWORD(v83) = 2114;
  __int128 v68 = (void *)v12;
  *(void *)__int128 v84 = v12;
  *(_WORD *)&v84[8] = 2114;
  id v85 = v6;
  _os_log_send_and_compose_impl( v15,  0LL,  &v86,  250LL,  &_mh_execute_header,  v14,  0LL,  "Installed asset query returned %d candidates (result: %d/%d postedDate: %{public}@ update:%{public}@).",  &v81,  40);
  __int16 v19 = v18;

  id v20 = sub_1000836CC();
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  _os_log_message_persist_impl(v19, 0LL, v21);

  if (v19 != &v86) {
    free(v19);
  }
  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100122698;
    block[3] = &unk_1003D2560;
    unsigned int v22 = &v79;
    char v23 = &v78;
    id v78 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  13LL,  0LL));
    id v79 = v7;
    id v24 = v78;
    id v25 = v7;
    dispatch_async(&_dispatch_main_q, block);
    uint64_t v26 = (void *)v12;
    goto LABEL_41;
  }

  id v64 = v7;
  int v65 = v8;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id v63 = v11;
  id obj = v11;
  id v27 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
  uint64_t v26 = (void *)v12;
  int v28 = v66;
  if (!v27)
  {
LABEL_26:

    id v7 = v64;
    uint64_t v8 = v65;
    goto LABEL_34;
  }

  id v29 = v27;
  uint64_t v30 = *(void *)v74;
LABEL_13:
  uint64_t v31 = 0LL;
  while (1)
  {
    if (*(void *)v74 != v30) {
      objc_enumerationMutation(obj);
    }
    id v32 = *(void **)(*((void *)&v73 + 1) + 8 * v31);
    if (!-[PBOSUpdateAssetManager _asset:withReleaseDate:matchesUpdate:]( v28,  "_asset:withReleaseDate:matchesUpdate:",  v32,  v26,  v6)) {
      goto LABEL_24;
    }
    if ([v32 state] == (id)2) {
      break;
    }
    id v33 = v6;
    __int128 v99 = 0u;
    memset(v100, 0, sizeof(v100));
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v86 = 0u;
    id v34 = sub_1000836CC();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v36 = 3LL;
    }
    else {
      uint64_t v36 = 2LL;
    }
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v32 attributes]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "tvs_stringForKey:", @"Build"));
    id v39 = [v32 state];
    int v81 = 138543874;
    *(void *)id v82 = v32;
    *(_WORD *)&v82[8] = 2114;
    id v83 = v38;
    *(_WORD *)__int128 v84 = 2048;
    *(void *)&v84[2] = v39;
    LODWORD(v62) = 32;
    _os_log_send_and_compose_impl( v36,  0LL,  &v86,  250LL,  &_mh_execute_header,  v35,  0LL,  "Found matching asset %{public}@ for %{public}@ but in wrong state %ld. Skipping.",  &v81,  v62);
    v41 = v40;

    id v42 = sub_1000836CC();
    id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    _os_log_message_persist_impl(v41, 0LL, v43);

    if (v41 != &v86) {
      free(v41);
    }
    id v6 = v33;
    uint64_t v26 = v68;
    int v28 = v66;
LABEL_24:
    if (v29 == (id)++v31)
    {
      id v29 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      if (v29) {
        goto LABEL_13;
      }
      goto LABEL_26;
    }
  }

  __int128 v99 = 0u;
  memset(v100, 0, sizeof(v100));
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v86 = 0u;
  id v44 = sub_1000836CC();
  id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v46 = 3LL;
  }
  else {
    uint64_t v46 = 2LL;
  }
  id v47 = (void *)objc_claimAutoreleasedReturnValue([v32 attributes]);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tvs_stringForKey:", @"Build"));
  int v81 = 138543618;
  *(void *)id v82 = v32;
  *(_WORD *)&v82[8] = 2114;
  id v83 = v48;
  LODWORD(v62) = 22;
  _os_log_send_and_compose_impl( v46,  0LL,  &v86,  250LL,  &_mh_execute_header,  v45,  0LL,  "Found matching installed asset %{public}@ for %{public}@.",  &v81,  v62);
  v50 = v49;

  id v51 = sub_1000836CC();
  id v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  _os_log_message_persist_impl(v50, 0LL, v52);

  if (v50 != &v86) {
    free(v50);
  }
  id v53 = v32;

  id v7 = v64;
  uint64_t v8 = v65;
  uint64_t v26 = v68;
  if (v53)
  {
    [v53 refreshState];
    goto LABEL_40;
  }

- (BOOL)_isAsset:(id)a3 eligibleForAction:(unint64_t)a4 delayingUpdates:(BOOL)a5
{
  BOOL v47 = a5;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemVersion](&OBJC_CLASS___TVSDevice, "systemVersion"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemBuildVersion](&OBJC_CLASS___TVSDevice, "systemBuildVersion"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemReleaseType](&OBJC_CLASS___TVSDevice, "systemReleaseType"));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"OSVersion"]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Build"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"ReleaseType"]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"PrerequisiteOSVersion"]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"PrerequisiteBuild"]);

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100122BC4;
  v51[3] = &unk_1003D8600;
  id v17 = v6;
  id v52 = v17;
  id v18 = v7;
  id v53 = v18;
  unint64_t v19 = v8;
  id v54 = (id)v19;
  id v20 = v14;
  id v55 = v20;
  id v21 = v16;
  id v56 = v21;
  id v22 = v48;
  id v57 = v22;
  id v23 = v46;
  id v58 = v23;
  unint64_t v24 = v12;
  id v59 = (id)v24;
  BOOL v60 = v47;
  id v25 = objc_retainBlock(v51);
  uint64_t v49 = v22;
  if (v19 | v24 && ([(id)v19 isEqualToString:v24] & 1) == 0)
  {
    v35 = (void (*)(void *, unint64_t, uint64_t, const __CFString *))v25[2];
    uint64_t v36 = @"different release types";
    id v37 = v25;
    unint64_t v38 = a4;
    goto LABEL_16;
  }

  int64_t v26 = +[PBOSUpdateAssetManager _compareOSVersion:andBuild:withOSVersion:andBuild:]( &OBJC_CLASS___PBOSUpdateAssetManager,  "_compareOSVersion:andBuild:withOSVersion:andBuild:",  v17,  v18,  v22,  v23);
  id v45 = v21;
  if (v26 == 1)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    unsigned int v28 = [v27 allowFlashRollbackVersion];

    id v29 = (void (*)(void *, unint64_t, uint64_t, const __CFString *))v25[2];
    if (!v28)
    {
      id v39 = @"attempted back-rev";
      unsigned int v40 = v25;
      unint64_t v41 = a4;
LABEL_28:
      v29(v40, v41, 0LL, v39);
      goto LABEL_29;
    }

    uint64_t v30 = @"back-rev OK - ROLLBACK ALLOWED VIA DEFAULT";
  }

  else
  {
    unint64_t v31 = a4;
    if (a4 == 9 || v26)
    {
      BOOL v34 = a4 == 9;
      if (a4 == 9 && v26 == -1 && v47)
      {
        id v29 = (void (*)(void *, unint64_t, uint64_t, const __CFString *))v25[2];
        id v39 = @"Restoring during delayed updates and version increase";
LABEL_27:
        unsigned int v40 = v25;
        unint64_t v41 = 9LL;
        goto LABEL_28;
      }

      goto LABEL_11;
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    unsigned int v33 = [v32 allowReflashSameVersion];

    id v29 = (void (*)(void *, unint64_t, uint64_t, const __CFString *))v25[2];
    if (!v33)
    {
      v29(v25, a4, 0LL, @"save-rev");
      goto LABEL_30;
    }

    uint64_t v30 = @"save-rev OK - REFLASH ALLOWED VIA DEFAULT";
  }

  v29(v25, a4, 1LL, v30);
  BOOL v34 = a4 == 9;
  unint64_t v31 = a4;
LABEL_11:
  if ((v34 || !v47) && !v20 && !v45)
  {
    LOBYTE(v33) = 1;
    ((void (*)(void *, unint64_t, uint64_t, const __CFString *))v25[2])( v25,  v31,  1LL,  @"no prereqs");
LABEL_30:
    id v21 = v45;
    goto LABEL_31;
  }

  if (v47)
  {
    ((void (*)(void *, unint64_t, void, const __CFString *))v25[2])( v25,  v31,  0LL,  @"delaying updates");
LABEL_29:
    LOBYTE(v33) = 0;
    goto LABEL_30;
  }

  int64_t v42 = +[PBOSUpdateAssetManager _compareOSVersion:andBuild:withOSVersion:andBuild:]( &OBJC_CLASS___PBOSUpdateAssetManager,  "_compareOSVersion:andBuild:withOSVersion:andBuild:",  v17,  v18,  v20,  v45);
  if (v34)
  {
    id v29 = (void (*)(void *, unint64_t, uint64_t, const __CFString *))v25[2];
    id v39 = @"prereqs found during Restore";
    goto LABEL_27;
  }

  int64_t v44 = v42;
  if (qword_100470FB8 != -1) {
    dispatch_once(&qword_100470FB8, &stru_1003D8620);
  }
  unint64_t v38 = a4;
  id v21 = v45;
  if (byte_100470FB0)
  {
    v35 = (void (*)(void *, unint64_t, uint64_t, const __CFString *))v25[2];
    uint64_t v36 = @"OS is writable";
  }

  else
  {
    v35 = (void (*)(void *, unint64_t, uint64_t, const __CFString *))v25[2];
    if (!v44)
    {
      LOBYTE(v33) = 1;
      v35(v25, a4, 1LL, @"prereqs met");
      goto LABEL_31;
    }

    uint64_t v36 = @"prereqs not met";
  }

  id v37 = v25;
LABEL_16:
  v35(v37, v38, 0LL, v36);
  LOBYTE(v33) = 0;
LABEL_31:

  return v33;
}

- (int64_t)_compareAsset:(id)a3 withAsset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"OSVersion"]);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Build"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"PrerequisiteOSVersion"]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"PrerequisiteBuild"]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"OSVersion"]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"Build"]);

  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"PrerequisiteOSVersion"]);

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"PrerequisiteBuild"]);

  int64_t v23 = +[PBOSUpdateAssetManager _compareOSVersion:andBuild:withOSVersion:andBuild:]( &OBJC_CLASS___PBOSUpdateAssetManager,  "_compareOSVersion:andBuild:withOSVersion:andBuild:",  v8,  v10,  v16,  v18);
  if (v23 == -1) {
    goto LABEL_8;
  }
  if (v23 == 1)
  {
LABEL_3:
    int64_t v24 = -1LL;
    goto LABEL_9;
  }

  if (!v12 && v20 || !v14 && v22)
  {
LABEL_8:
    int64_t v24 = 1LL;
    goto LABEL_9;
  }

  if (!v20 && v12 || !v22 && v14) {
    goto LABEL_3;
  }
  int64_t v26 = +[PBOSUpdateAssetManager _compareOSVersion:andBuild:withOSVersion:andBuild:]( &OBJC_CLASS___PBOSUpdateAssetManager,  "_compareOSVersion:andBuild:withOSVersion:andBuild:",  v12,  v14,  v20,  v22);
  if (v26 == 1) {
    uint64_t v27 = -1LL;
  }
  else {
    uint64_t v27 = v26;
  }
  if (v26 == -1) {
    int64_t v24 = 1LL;
  }
  else {
    int64_t v24 = v27;
  }
LABEL_9:

  return v24;
}

- (BOOL)_asset:(id)a3 withReleaseDate:(id)a4 matchesUpdate:(id)a5
{
  id v8 = a5;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBOSUpdateAssetManager descriptorForAsset:withReleaseDate:]( self,  "descriptorForAsset:withReleaseDate:",  a3,  a4));
  LOBYTE(a3) = [v9 isEqual:v8];

  return (char)a3;
}

- (id)_queryForAssetPurge
{
  id v2 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.SoftwareUpdate"];
  [v2 returnTypes:1];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice productType](&OBJC_CLASS___TVSDevice, "productType"));
  xpc_object_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v3));
  [v2 addKeyValueArray:@"SupportedDevices" with:v4];

  return v2;
}

- (id)_queryForAssetDownload
{
  id v2 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.SoftwareUpdate"];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice productType](&OBJC_CLASS___TVSDevice, "productType"));
  xpc_object_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v3));
  [v2 addKeyValueArray:@"SupportedDevices" with:v4];

  return v2;
}

- (id)_queryForLocalAssetSearch
{
  id v2 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.SoftwareUpdate"];
  [v2 returnTypes:1];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice productType](&OBJC_CLASS___TVSDevice, "productType"));
  xpc_object_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v3));
  [v2 addKeyValueArray:@"SupportedDevices" with:v4];

  return v2;
}

- (int64_t)_performMetadataQuery:(id)a3
{
  id v3 = a3;
  char v4 = 0;
  for (uint64_t i = 2LL; ; uint64_t i = 1LL)
  {
    __int128 v57 = 0u;
    memset(v58, 0, sizeof(v58));
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v44 = 0u;
    id v6 = sub_1000836CC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    int v40 = 134217984;
    unint64_t v41 = (char *)i;
    _os_log_send_and_compose_impl( v8,  0LL,  &v44,  250LL,  &_mh_execute_header,  v7,  0LL,  "Querying asset metadata. [count:%ld]",  &v40);
    id v10 = v9;

    id v11 = sub_1000836CC();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _os_log_message_persist_impl(v10, 0LL, v12);

    if (v10 != &v44) {
      free(v10);
    }
    id v13 = (char *)[v3 queryMetaDataSync];
    __int128 v57 = 0u;
    memset(v58, 0, sizeof(v58));
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v44 = 0u;
    id v14 = sub_1000836CC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    int v40 = 134218240;
    if (v16) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    unint64_t v41 = v13;
    __int16 v42 = 2048;
    uint64_t v43 = i;
    LODWORD(v39) = 22;
    _os_log_send_and_compose_impl( v17,  0LL,  &v44,  250LL,  &_mh_execute_header,  v15,  0LL,  "Query returned %ld [count:%ld]",  &v40,  v39);
    unint64_t v19 = v18;

    id v20 = sub_1000836CC();
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _os_log_message_persist_impl(v19, 0LL, v21);

    if (v19 != &v44) {
      free(v19);
    }
    if ((v4 & 1) != 0)
    {
      __int128 v57 = 0uLL;
      memset(v58, 0, sizeof(v58));
      __int128 v55 = 0uLL;
      __int128 v56 = 0uLL;
      __int128 v53 = 0uLL;
      __int128 v54 = 0uLL;
      __int128 v51 = 0uLL;
      __int128 v52 = 0uLL;
      __int128 v49 = 0uLL;
      __int128 v50 = 0uLL;
      __int128 v47 = 0uLL;
      __int128 v48 = 0uLL;
      __int128 v45 = 0uLL;
      __int128 v46 = 0uLL;
      __int128 v44 = 0uLL;
      id v29 = sub_1000836CC();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        uint64_t v31 = 3LL;
      }
      else {
        uint64_t v31 = 2LL;
      }
      int v40 = 67109120;
      LODWORD(v41) = (_DWORD)v13;
      _os_log_send_and_compose_impl( v31,  0LL,  &v44,  250LL,  &_mh_execute_header,  v30,  16LL,  "ERROR: Asset metadata query failed, even after retry [%d].",  &v40);
      goto LABEL_30;
    }

    __int128 v57 = 0uLL;
    memset(v58, 0, sizeof(v58));
    __int128 v55 = 0uLL;
    __int128 v56 = 0uLL;
    __int128 v53 = 0uLL;
    __int128 v54 = 0uLL;
    __int128 v51 = 0uLL;
    __int128 v52 = 0uLL;
    __int128 v49 = 0uLL;
    __int128 v50 = 0uLL;
    __int128 v47 = 0uLL;
    __int128 v48 = 0uLL;
    __int128 v45 = 0uLL;
    __int128 v46 = 0uLL;
    __int128 v44 = 0uLL;
    id v22 = sub_1000836CC();
    int64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      uint64_t v24 = 3LL;
    }
    else {
      uint64_t v24 = 2LL;
    }
    int v40 = 67109120;
    LODWORD(v41) = (_DWORD)v13;
    _os_log_send_and_compose_impl( v24,  0LL,  &v44,  250LL,  &_mh_execute_header,  v23,  16LL,  "WARNING: Asset metadata query failed [%d]. Retrying...",  &v40);
    int64_t v26 = v25;

    id v27 = sub_1000836CC();
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    _os_log_message_persist_impl(v26, 16LL, v28);

    if (v26 != &v44) {
      free(v26);
    }
    char v4 = 1;
  }

  if (!v13) {
    goto LABEL_32;
  }
  __int128 v57 = 0u;
  memset(v58, 0, sizeof(v58));
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v44 = 0u;
  id v33 = sub_1000836CC();
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    uint64_t v34 = 3LL;
  }
  else {
    uint64_t v34 = 2LL;
  }
  int v40 = 67109120;
  LODWORD(v41) = (_DWORD)v13;
  _os_log_send_and_compose_impl( v34,  0LL,  &v44,  250LL,  &_mh_execute_header,  v30,  16LL,  "ERROR: Unexpected result from asset metadata query [%d].",  &v40);
LABEL_30:
  v35 = v32;

  id v36 = sub_1000836CC();
  id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  _os_log_message_persist_impl(v35, 16LL, v37);

  if (v35 != &v44) {
    free(v35);
  }
LABEL_32:

  return (int64_t)v13;
}

- (id)_postedDateForQuery:(id)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a3 postedDate]);
  if (!v3) {
    goto LABEL_17;
  }
  char v4 = (void *)v3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v4, v15) & 1) != 0) {
      return v4;
    }
    __int128 v48 = 0u;
    memset(v49, 0, sizeof(v49));
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v35 = 0u;
    id v16 = sub_1000836CC();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      uint64_t v18 = 3LL;
    }
    else {
      uint64_t v18 = 2LL;
    }
    int v33 = 138543362;
    id v34 = (id)objc_opt_class(v4);
    id v19 = v34;
    _os_log_send_and_compose_impl( v18,  0LL,  &v35,  250LL,  &_mh_execute_header,  v17,  16LL,  "Query produced postedDate of wrong type (%{public}@).",  &v33,  12);
    id v21 = v20;

    id v22 = sub_1000836CC();
    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    _os_log_message_persist_impl(v21, 16LL, v23);

    if (v21 != &v35) {
      free(v21);
    }

    goto LABEL_17;
  }

  __int128 v48 = 0u;
  memset(v49, 0, sizeof(v49));
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v35 = 0u;
  id v6 = sub_1000836CC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    uint64_t v8 = 3LL;
  }
  else {
    uint64_t v8 = 2LL;
  }
  LOWORD(v33) = 0;
  _os_log_send_and_compose_impl( v8,  0LL,  &v35,  250LL,  &_mh_execute_header,  v7,  16LL,  "Query produced postedDate of incorrect type (string). Converting.",  &v33,  2);
  id v10 = v9;

  id v11 = sub_1000836CC();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  _os_log_message_persist_impl(v10, 16LL, v12);

  if (v10 != &v35) {
    free(v10);
  }
  id v13 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v13, "setDateFormat:", @"yyyy-MM-dd");
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v13, "dateFromString:", v4));

  char v4 = (void *)v14;
  if (!v14)
  {
LABEL_17:
    __int128 v48 = 0u;
    memset(v49, 0, sizeof(v49));
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v35 = 0u;
    id v24 = sub_1000836CC();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      uint64_t v26 = 3LL;
    }
    else {
      uint64_t v26 = 2LL;
    }
    LOWORD(v33) = 0;
    LODWORD(v32) = 2;
    _os_log_send_and_compose_impl( v26,  0LL,  &v35,  250LL,  &_mh_execute_header,  v25,  16LL,  "Query failed to provide postedDate. Using current date.",  &v33,  v32);
    unsigned int v28 = v27;

    id v29 = sub_1000836CC();
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    _os_log_message_persist_impl(v28, 16LL, v30);

    if (v28 != &v35) {
      free(v28);
    }
    char v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }

  return v4;
}

- (int64_t)_purgeableSizeFor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 getLocalFileUrl]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLTotalFileSizeKey,  NSURLIsDirectoryKey,  0LL));
  id v21 = v5;
  id v22 = (void *)v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 enumeratorAtURL:v4 includingPropertiesForKeys:v6 options:0 errorHandler:0]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    int64_t v11 = 0LL;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v24 = 0LL;
        [v14 getResourceValue:&v24 forKey:NSURLTotalFileSizeKey error:0];
        id v15 = v24;
        id v23 = 0LL;
        [v14 getResourceValue:&v23 forKey:NSURLIsDirectoryKey error:0];
        id v16 = v23;
      }

      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }

    while (v10);
  }

  else
  {
    int64_t v11 = 0LL;
  }

  id v17 = sub_1000836CC();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = [v3 state];
    *(_DWORD *)id buf = 134218498;
    int64_t v30 = v11;
    __int16 v31 = 2114;
    id v32 = v3;
    __int16 v33 = 1024;
    unsigned int v34 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Purgeable size %llu for asset %{public}@ in state %d.",  buf,  0x1Cu);
  }

  return v11;
}

- (id)_downloadOptionsForScanOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MAMsuDownloadOptions);
  [v4 setDiscretionary:0];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v6 = [v5 isSupervised];

  if (v6)
  {
    __int128 v69 = 0u;
    memset(v70, 0, sizeof(v70));
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v56 = 0u;
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    LOWORD(v54) = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  &v56,  250LL,  &_mh_execute_header,  v8,  0LL,  "Configuring catalog for supervised device.",  &v54,  2);
    int64_t v11 = v10;

    id v12 = sub_1000836CC();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != &v56) {
      free(v11);
    }
    [v4 setSupervised:1];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 requestedPMV]);
    if ([v14 length])
    {
      __int128 v69 = 0u;
      memset(v70, 0, sizeof(v70));
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v56 = 0u;
      id v15 = sub_1000836CC();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = 3LL;
      }
      else {
        uint64_t v17 = 2LL;
      }
      int v54 = 138543362;
      __int128 v55 = v14;
      LODWORD(v53) = 12;
      _os_log_send_and_compose_impl( v17,  0LL,  &v56,  250LL,  &_mh_execute_header,  v16,  0LL,  "Supervised: requesting PMV %{public}@.",  &v54,  v53);
      unsigned int v19 = v18;

      id v20 = sub_1000836CC();
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      _os_log_message_persist_impl(v19, 0LL, v21);

      if (v19 != &v56) {
        free(v19);
      }
      [v4 setRequestedProductVersion:v14];
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 delayPeriod]);
    id v23 = v22;
    if (v22 && (uint64_t)[v22 integerValue] >= 1 && (uint64_t)objc_msgSend(v23, "integerValue") <= 90)
    {
      __int128 v69 = 0u;
      memset(v70, 0, sizeof(v70));
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v56 = 0u;
      id v24 = sub_1000836CC();
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v26 = 3LL;
      }
      else {
        uint64_t v26 = 2LL;
      }
      int v54 = 138543362;
      __int128 v55 = v23;
      LODWORD(v53) = 12;
      _os_log_send_and_compose_impl( v26,  0LL,  &v56,  250LL,  &_mh_execute_header,  v25,  0LL,  "Supervised: delay period %{public}@ days.",  &v54,  v53);
      __int128 v28 = v27;

      id v29 = sub_1000836CC();
      int64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      _os_log_message_persist_impl(v28, 0LL, v30);

      if (v28 != &v56) {
        free(v28);
      }
      objc_msgSend(v4, "setDelayPeriod:", objc_msgSend(v23, "integerValue"));
    }
  }

  else
  {
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v3 requestedPMV]);
    id v32 = [v31 length];

    if (v32)
    {
      __int128 v69 = 0u;
      memset(v70, 0, sizeof(v70));
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v56 = 0u;
      id v33 = sub_1000836CC();
      unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      uint64_t v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR) ? 3LL : 2LL;
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v3 requestedPMV]);
      int v54 = 138543362;
      __int128 v55 = v36;
      _os_log_send_and_compose_impl( v35,  0LL,  &v56,  250LL,  &_mh_execute_header,  v34,  16LL,  "Ignoring PMV request of %{public}@ for unsupervised device.",  &v54,  12);
      __int128 v38 = v37;

      id v39 = sub_1000836CC();
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      _os_log_message_persist_impl(v38, 16LL, v40);

      if (v38 != &v56) {
        free(v38);
      }
    }

    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v3 delayPeriod]);
    id v42 = [v41 integerValue];

    if (v42)
    {
      __int128 v69 = 0u;
      memset(v70, 0, sizeof(v70));
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v56 = 0u;
      id v43 = sub_1000836CC();
      __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      uint64_t v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR) ? 3LL : 2LL;
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v3 delayPeriod]);
      int v54 = 138543362;
      __int128 v55 = v46;
      LODWORD(v52) = 12;
      _os_log_send_and_compose_impl( v45,  0LL,  &v56,  250LL,  &_mh_execute_header,  v44,  16LL,  "Ignoring delay period of %{public}@ for unsupervised device.",  &v54,  v52);
      __int128 v48 = v47;

      id v49 = sub_1000836CC();
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      _os_log_message_persist_impl(v48, 16LL, v50);

      if (v48 != &v56) {
        free(v48);
      }
    }
  }

  return v4;
}

- (void)_refreshAssetCatalogUsingOptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceReferenceDate];
  id v10 = v9;

  if (*(double *)&v10 <= *(double *)&qword_100470FC0 + 5.0)
  {
    __int128 v46 = 0u;
    memset(v47, 0, sizeof(v47));
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    *(_OWORD *)id location = 0u;
    id v21 = sub_1000836CC();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v23 = 3LL;
    }
    else {
      uint64_t v23 = 2LL;
    }
    v32[0] = 0;
    _os_log_send_and_compose_impl( v23,  0LL,  location,  250LL,  &_mh_execute_header,  v22,  0LL,  "Using cached asset catalog.",  v32,  2);
    __int128 v25 = v24;

    id v26 = sub_1000836CC();
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    _os_log_message_persist_impl(v25, 0LL, v27);

    if (v25 != location) {
      free(v25);
    }
    v7[2](v7, 14LL);
  }

  else
  {
    __int128 v46 = 0u;
    memset(v47, 0, sizeof(v47));
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    *(_OWORD *)id location = 0u;
    id v11 = sub_1000836CC();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = 3LL;
    }
    else {
      uint64_t v13 = 2LL;
    }
    v32[0] = 0;
    _os_log_send_and_compose_impl( v13,  0LL,  location,  250LL,  &_mh_execute_header,  v12,  0LL,  "Starting asset catalog download...",  v32,  2);
    id v15 = v14;

    id v16 = sub_1000836CC();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    _os_log_message_persist_impl(v15, 0LL, v17);

    if (v15 != location) {
      free(v15);
    }
    uint64_t v18 = self;
    objc_sync_enter(v18);
    v18->processedAssetCatalogDownloadResponse = 0;
    objc_sync_exit(v18);

    objc_initWeak(location, v18);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( -[PBOSUpdateAssetManager _downloadOptionsForScanOptions:]( v18,  "_downloadOptionsForScanOptions:",  v6));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100124700;
    v28[3] = &unk_1003D8670;
    objc_copyWeak(v31, location);
    int64_t v30 = v7;
    v28[4] = v18;
    v31[1] = v10;
    id v20 = v19;
    id v29 = v20;
    +[MAAsset startCatalogDownload:options:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:then:",  @"com.apple.MobileAsset.SoftwareUpdate",  v20,  v28);

    objc_destroyWeak(v31);
    objc_destroyWeak(location);
  }
}

- (void)_reportAssetCatalogDownloadWithResult:(int64_t)a3 forAttempt:(int64_t)a4
{
  int v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  unsigned int v7 = [v6 isCarryOrLiveOnUser];

  if ((unint64_t)a3 > 0x12)
  {
LABEL_24:
    __int128 v48 = 0u;
    memset(v49, 0, sizeof(v49));
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v35 = 0u;
    id v29 = sub_1000836CC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v30 = 3LL;
    }
    else {
      uint64_t v30 = 2LL;
    }
    _os_log_send_and_compose_impl( v30,  0LL,  &v35,  250LL,  &_mh_execute_header,  v9,  16LL,  "Unexpected result from asset catalog download on attempt %d [%d].",  COERCE_DOUBLE(67109376LL),  &v31);
LABEL_7:
    id v12 = v11;

    id v13 = sub_1000836CC();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    _os_log_message_persist_impl(v12, 16LL, v14);

    if (v12 == &v35)
    {
LABEL_9:
      uint64_t v15 = 1LL;
      goto LABEL_17;
    }

- (int64_t)_purgeAsset:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[PBOSUpdateAssetManager _purgeableSizeFor:](self, "_purgeableSizeFor:", v4);
  switch((unint64_t)[v4 state])
  {
    case 1uLL:
      id v14 = sub_1000836CC();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 assetId]);
      int v24 = 138543362;
      v25[0] = v15;
      id v16 = "Skipping un-downloaded asset: %{public}@.";
      goto LABEL_16;
    case 2uLL:
    case 3uLL:
      id v6 = [v4 purgeSync];
      if (v6 == (id)3)
      {
        id v19 = sub_1000836CC();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:
          int64_t v5 = 0LL;
          goto LABEL_19;
        }

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 assetId]);
        int v24 = 138543362;
        v25[0] = v15;
        id v16 = "ERROR: Couldn't purge asset because it doesn't exist (??): %{public}@.";
LABEL_16:
        id v20 = v9;
        uint32_t v21 = 12;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v21);

        goto LABEL_18;
      }

      int v7 = (int)v6;
      if (v6)
      {
        id v23 = sub_1000836CC();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 assetId]);
        int v24 = 67109378;
        LODWORD(v25[0]) = v7;
        WORD2(v25[0]) = 2114;
        *(void *)((char *)v25 + 6) = v15;
        id v16 = "ERROR: Failed to purge asset [%d]: %{public}@.";
        id v20 = v9;
        uint32_t v21 = 18;
        goto LABEL_17;
      }

      id v8 = sub_1000836CC();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 assetId]);
        int v24 = 138543362;
        v25[0] = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Purged asset: %{public}@.",  (uint8_t *)&v24,  0xCu);
      }

+ (int64_t)_compareOSVersion:(id)a3 andBuild:(id)a4 withOSVersion:(id)a5 andBuild:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unint64_t v11 = (unint64_t)objc_msgSend(a3, "tvs_threePartVersionCompare:", a5) - 2;
  if (v11 >= 6)
  {
    if (v9 && v10)
    {
      int64_t v12 = (int64_t)[v9 compare:v10 options:64];
    }

    else if (!v9 || v10)
    {
      if (v9) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v10 == 0LL;
      }
      uint64_t v14 = !v13;
      int64_t v12 = v14 << 63 >> 63;
    }

    else
    {
      int64_t v12 = 1LL;
    }
  }

  else
  {
    int64_t v12 = qword_1002EC740[v11];
  }

  return v12;
}

- (BOOL)processingSpaceRequest
{
  return self->processingSpaceRequest;
}

- (void)setProcessingSpaceRequest:(BOOL)a3
{
  self->processingSpaceRequest = a3;
}

- (BOOL)processingAssetRequest
{
  return self->processingAssetRequest;
}

- (void)setProcessingAssetRequest:(BOOL)a3
{
  self->processingAssetRequest = a3;
}

- (BOOL)processedAssetCatalogDownloadResponse
{
  return self->processedAssetCatalogDownloadResponse;
}

- (void)setProcessedAssetCatalogDownloadResponse:(BOOL)a3
{
  self->processedAssetCatalogDownloadResponse = a3;
}

@end
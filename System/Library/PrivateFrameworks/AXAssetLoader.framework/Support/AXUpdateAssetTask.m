@interface AXUpdateAssetTask
- (AXUpdateAssetTask)initWithPolicy:(id)a3 context:(id)a4;
- (void)_housekeeping_op1_refreshAssets;
- (void)_housekeeping_op2_purgeAssets:(id)a3;
- (void)_housekeeping_op3_downloadAssets:(id)a3;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
@end

@implementation AXUpdateAssetTask

- (AXUpdateAssetTask)initWithPolicy:(id)a3 context:(id)a4
{
  v10[1] = 3221225472LL;
  v10[2] = sub_10001070C;
  v10[3] = &unk_100020BF0;
  id v11 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AXUpdateAssetTask;
  v10[0] = _NSConcreteStackBlock;
  id v6 = v11;
  v7 = -[AXManagedAssetTask initWithName:policy:context:block:]( &v9,  "initWithName:policy:context:block:",  @"Update Assets",  v6,  a4,  v10);

  return v7;
}

- (void)_housekeeping_op1_refreshAssets
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXUpdateAssetTask _restorationState](self, "_restorationState"));
  unsigned int v4 = [v3 hasCompletedRefreshingAssets];

  uint64_t v6 = AXLogAssetDaemon(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Restoration state: 'hasCompletedRefreshingAssets'. Moving on to next step",  buf,  0xCu);
    }
  }

  else
  {
    if (v8)
    {
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask restorationState](self, "restorationState"));
      *(_DWORD *)buf = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: About to refresh assets. Restoration: %@",  buf,  0x16u);
    }

    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask restorationState](self, "restorationState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
    -[os_log_s updatePhase:saveToStore:](v7, "updatePhase:saveToStore:", @"Refreshing Assets", v10);
  }

  objc_initWeak((id *)buf, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask assetController](self, "assetController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100010A18;
  v12[3] = &unk_100020C18;
  objc_copyWeak(&v13, (id *)buf);
  v12[4] = self;
  [v11 refreshAssetsByForceUpdatingCatalog:v4 ^ 1 updatingCatalogIfNeeded:v4 ^ 1 catalogRefreshOverrideTimeout:&off_100021978 completion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_housekeeping_op2_purgeAssets:(id)a3
{
  id v32 = a3;
  val = self;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXUpdateAssetTask _restorationState](self, "_restorationState"));
  unsigned int v5 = [v4 hasCompletedPurgingAssets];

  if (v5)
  {
    uint64_t v7 = AXLogAssetDaemon(v6);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Restoration state: 'hasCompletedPurgingAssets'. Moving on to next step",  buf,  0xCu);
    }

    -[AXUpdateAssetTask _housekeeping_op3_downloadAssets:](self, "_housekeeping_op3_downloadAssets:", v32);
  }

  else
  {
    id inited = objc_initWeak(&location, self);
    uint64_t v10 = AXLogAssetDaemon(inited);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (AXUpdateAssetTask *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask restorationState](self, "restorationState"));
      *(_DWORD *)buf = 138412546;
      v44 = self;
      __int16 v45 = 2112;
      v46 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: About to purge installed assets. Restoration: %@",  buf,  0x16u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask restorationState](self, "restorationState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
    [v13 updatePhase:@"Purging Assets" saveToStore:v14];

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[AXAsset installedAssets:](&OBJC_CLASS___AXAsset, "installedAssets:", v32));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask policy](self, "policy"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v15 assetsToPurgeFromInstalledAssets:v30 withRefreshedAssets:v32]);

    id v16 = [v31 count];
    if (v16)
    {
      uint64_t v17 = AXLogAssetDaemon(v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Assets that will be purged", buf, 0xCu);
      }

      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v19 = v31;
      id v20 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
      id v21 = v20;
      if (v20)
      {
        uint64_t v22 = *(void *)v38;
        do
        {
          v23 = 0LL;
          do
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(AXUpdateAssetTask **)(*((void *)&v37 + 1) + 8LL * (void)v23);
            uint64_t v25 = AXLogAssetDaemon(v20);
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v44 = v24;
              __int16 v45 = 2112;
              v46 = val;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@:   %@", buf, 0x16u);
            }

            v23 = (char *)v23 + 1;
          }

          while (v21 != v23);
          id v20 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
          id v21 = v20;
        }

        while (v20);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask assetController](val, "assetController"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100011118;
      v34[3] = &unk_100020C18;
      objc_copyWeak(&v36, &location);
      id v35 = v32;
      [v27 purgeAssets:v19 completion:v34];

      objc_destroyWeak(&v36);
    }

    else
    {
      uint64_t v28 = AXLogAssetDaemon(0LL);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%@: No assets found that need to be purged",  buf,  0xCu);
      }

      -[AXUpdateAssetTask _housekeeping_op3_downloadAssets:](self, "_housekeeping_op3_downloadAssets:", v32);
    }

    objc_destroyWeak(&location);
  }
}

- (void)_housekeeping_op3_downloadAssets:(id)a3
{
  id v58 = a3;
  val = self;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask policy](self, "policy"));
  unsigned __int8 v5 = [v4 daemonShouldDownloadInBackgroundIfNeeded];

  uint64_t v7 = AXLogAssetDaemon(v6);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v9)
    {
      uint64_t v10 = (AXUpdateAssetTask *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask restorationState](self, "restorationState"));
      *(_DWORD *)buf = 138412546;
      v73 = self;
      __int16 v74 = 2112;
      v75 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: About to kick off downloadable assets. Restoration: %@",  buf,  0x16u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask restorationState](self, "restorationState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
    [v11 updatePhase:@"Downloading Assets" saveToStore:v12];

    uint64_t v14 = AXLogAssetDaemon(v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v12)
    {
      uint64_t v17 = AXLogAssetDaemon(v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100015548(v18);
      }

      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      id v19 = v58;
      id v20 = [v19 countByEnumeratingWithState:&v66 objects:v71 count:16];
      id v21 = v20;
      if (v20)
      {
        uint64_t v22 = *(void *)v67;
        do
        {
          v23 = 0LL;
          do
          {
            if (*(void *)v67 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(AXUpdateAssetTask **)(*((void *)&v66 + 1) + 8LL * (void)v23);
            uint64_t v25 = AXLogAssetDaemon(v20);
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v73 = v24;
              _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);
            }

            v23 = (char *)v23 + 1;
          }

          while (v21 != v23);
          id v20 = [v19 countByEnumeratingWithState:&v66 objects:v71 count:16];
          id v21 = v20;
        }

        while (v20);
      }
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask policy](val, "policy"));
    v57 = (void *)objc_claimAutoreleasedReturnValue([v27 assetsToDownloadFromRefreshedAssets:v58]);

    id v28 = [v57 count];
    if (v28)
    {
      uint64_t v29 = AXLogAssetDaemon(v28);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = val;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%@: Assets that will be downloaded",  buf,  0xCu);
      }

      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v31 = v57;
      id v32 = [v31 countByEnumeratingWithState:&v62 objects:v70 count:16];
      id v33 = v32;
      if (v32)
      {
        uint64_t v34 = *(void *)v63;
        do
        {
          id v35 = 0LL;
          do
          {
            if (*(void *)v63 != v34) {
              objc_enumerationMutation(v31);
            }
            id v36 = *(AXUpdateAssetTask **)(*((void *)&v62 + 1) + 8LL * (void)v35);
            uint64_t v37 = AXLogAssetDaemon(v32);
            __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v73 = v36;
              __int16 v74 = 2112;
              v75 = val;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@:   %@", buf, 0x16u);
            }

            id v35 = (char *)v35 + 1;
          }

          while (v33 != v35);
          id v32 = [v31 countByEnumeratingWithState:&v62 objects:v70 count:16];
          id v33 = v32;
        }

        while (v32);
      }

      objc_initWeak((id *)buf, val);
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask assetController](val, "assetController"));
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_100011890;
      v60[3] = &unk_100020C40;
      objc_copyWeak(&v61, (id *)buf);
      [v39 downloadAssets:v31 successStartBlock:v60];

      objc_destroyWeak(&v61);
      objc_destroyWeak((id *)buf);
LABEL_42:

      goto LABEL_43;
    }

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v58 firstObject]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 properties]);
    v42 = (AXUpdateAssetTask *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:kTTSResourceBuildKey]);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask policy](val, "policy"));
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___AXTTSResourceAssetPolicy, v44);
    if ((objc_opt_isKindOfClass(v43, v45) & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 catalogBuildVersion]);
      unsigned __int8 v48 = -[AXUpdateAssetTask isEqualToString:](v42, "isEqualToString:", v47);

      if ((v48 & 1) != 0)
      {
LABEL_39:
        uint64_t v55 = AXLogAssetDaemon(v49);
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v73 = val;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%@: No assets found that need to be downloaded",  buf,  0xCu);
        }

        -[AXManagedAssetTask _completeWithResult:](val, "_completeWithResult:", 0LL);
        goto LABEL_42;
      }

      uint64_t v50 = AXLogAssetDaemon(v49);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v73 = val;
        __int16 v74 = 2112;
        v75 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "%@: No new assets to download and build numbers didn't match, refreshing resource cache and updating build number %@",  buf,  0x16u);
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      [v52 updateCatalogBuildVersion:v42];

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      id v54 = [v53 refreshResourcesCacheForManagerType:1];

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      [v43 downloadSamplesIfNecessary];
    }

    goto LABEL_39;
  }

  if (v9)
  {
    *(_DWORD *)buf = 138412290;
    v73 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Honoring asset policy to not proceed with downloads",  buf,  0xCu);
  }

  -[AXManagedAssetTask _completeWithResult:](self, "_completeWithResult:", 0LL);
LABEL_43:
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v8 = a6;
  uint64_t v9 = AXLogAssetDaemon(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    v12 = self;
    __int16 v13 = 2048;
    BOOL v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: didFinishRefreshingAssets. success:%ld error:%@",  (uint8_t *)&v11,  0x20u);
  }
}

- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v8 = a6;
  uint64_t v9 = AXLogAssetDaemon(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    v12 = self;
    __int16 v13 = 2048;
    BOOL v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: didFinishPurgingAssets. success:%ld error:%@",  (uint8_t *)&v11,  0x20u);
  }
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  BOOL v8 = a7;
  id v12 = a4;
  uint64_t v13 = AXLogAssetDaemon(v12);
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138413314;
    id v16 = self;
    __int16 v17 = 2048;
    int64_t v18 = a5;
    __int16 v19 = 2048;
    int64_t v20 = a6;
    __int16 v21 = 2048;
    BOOL v22 = v8;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Asset D/L progress: %lld / %lld. stalled: %ld. asset: %@",  (uint8_t *)&v15,  0x34u);
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  BOOL v8 = a5;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = AXLogAssetDaemon(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v14)
    {
      int v18 = 138412546;
      __int16 v19 = self;
      __int16 v20 = 2112;
      id v21 = v10;
      int v15 = "%@: Asset download finished: %@";
      id v16 = v13;
      uint32_t v17 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v17);
    }
  }

  else if (v14)
  {
    int v18 = 138412802;
    __int16 v19 = self;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    int v15 = "%@: Asset download failed: %@ - %@";
    id v16 = v13;
    uint32_t v17 = 32;
    goto LABEL_6;
  }
}

@end
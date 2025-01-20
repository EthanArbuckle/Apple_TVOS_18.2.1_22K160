@interface VCPAssetMaintenanceTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (int)mainInternal;
- (void)updateStatsFlags:(unint64_t)a3 forPHAsset:(id)a4 withDatabase:(id)a5;
@end

@implementation VCPAssetMaintenanceTask

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v4];

  return v5;
}

- (void)updateStatsFlags:(unint64_t)a3 forPHAsset:(id)a4 withDatabase:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  if ([v10 isVideo])
  {
    unint64_t v8 = a3 | 4;
  }

  else if (objc_msgSend(v10, "vcp_isLivePhoto"))
  {
    unint64_t v8 = a3 | 2;
  }

  else
  {
    unint64_t v8 = [v10 isPhoto] | a3;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  [v7 storeStatsFlags:v8 forLocalIdentifier:v9];
}

- (int)mainInternal
{
  uint64_t v2 = VCPSignPostLog(self);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  uint64_t v5 = VCPSignPostLog(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPAssetMaintenanceTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 6)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Performing asset book-keeping...", buf, 2u);
    }
  }

  v15 = &OBJC_CLASS___VCPDatabaseManager;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  v124 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v16));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v113 = (void *)objc_claimAutoreleasedReturnValue([v17 dateByAddingTimeInterval:-MediaAnalysisBlacklistAgeOutInterval]);

  int v141 = 0;
  unsigned int v18 = [v124 ageOutBlacklistBefore:v113 count:&v141];
  int v19 = 0;
  int v125 = v18;
  if (v18 == -108 || v18 == -36)
  {
    v126 = 0LL;
    goto LABEL_146;
  }

  v126 = 0LL;
  if (v18 == -23) {
    goto LABEL_146;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  [v20 accumulateInt64Value:v141 forField:@"NumberOfAssetsOutFromBlacklist" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  v126 = (void *)objc_claimAutoreleasedReturnValue( +[VCPAnalyzedAssets assetsFromPhotoLibrary:]( &OBJC_CLASS___VCPAnalyzedAssets,  "assetsFromPhotoLibrary:",  v21));

  unint64_t v22 = 0LL;
  char v111 = 0;
  uint64_t v118 = 0LL;
  int v125 = 0;
  os_log_type_t type = VCPLogToOSLogType[4];
  os_log_type_t v121 = VCPLogToOSLogType[5];
  os_log_type_t v109 = VCPLogToOSLogType[3];
  while (1)
  {
    if (-[VCPTask isCancelled](self, "isCancelled"))
    {
      int v125 = -128;
      goto LABEL_152;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v23 pet];

    context = objc_autoreleasePoolPush();
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    int v25 = 0;
    unint64_t v26 = v22 + 1000;
    while (1)
    {
      id v27 = [v126 count];
      else {
        unint64_t v28 = (unint64_t)v27;
      }
      if (v22 >= v28)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v44,  1LL));

        v45 = (void *)objc_claimAutoreleasedReturnValue([v24 allKeys]);
        v115 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v45,  v32));

        if ([v122 count])
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v122 allObjects]);
          v47 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v46,  v32));

          v136[0] = _NSConcreteStackBlock;
          v136[1] = 3221225472LL;
          v136[2] = sub_100094420;
          v136[3] = &unk_1001BC3E0;
          v136[4] = self;
          id v137 = v24;
          id v48 = v124;
          id v138 = v48;
          id v139 = v122;
          [v47 enumerateObjectsUsingBlock:v136];
          [v48 commit];
        }

        id v49 = [v24 count];
        if (!((v49 != [v115 count]) | v25 & 1))
        {
          int v63 = 9;
          v94 = v115;
          goto LABEL_140;
        }

        __int128 v134 = 0u;
        __int128 v135 = 0u;
        __int128 v132 = 0u;
        __int128 v133 = 0u;
        id obj = v115;
        id v50 = [obj countByEnumeratingWithState:&v132 objects:v144 count:16];
        if (v50)
        {
          uint64_t v51 = *(void *)v133;
          do
          {
            v52 = 0LL;
            do
            {
              if (*(void *)v133 != v51) {
                objc_enumerationMutation(obj);
              }
              v54 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v53]);
              v55 = v54;
              if (!v54) {
                goto LABEL_62;
              }
              id v56 = [v54 isDeletePending];
              if (!(_DWORD)v56) {
                goto LABEL_61;
              }
              uint64_t v58 = MediaAnalysisLogLevel(v56, v57);
              if ((int)v58 >= 5)
              {
                uint64_t v60 = VCPLogInstance(v58, v59);
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                if (os_log_type_enabled(v61, v121))
                {
                  *(_DWORD *)buf = 138412290;
                  v146 = v53;
                  _os_log_impl( (void *)&_mh_execute_header,  v61,  v121,  "  [%@] Asset found; recovering analysis",
                    buf,
                    0xCu);
                }
              }

              unsigned int v62 = [v124 setDeletePendingFlag:0 localIdentifier:v53];
              int v63 = 6;
              if (v62 == -108 || v62 == -36)
              {
                int v64 = v62;
              }

              else
              {
                int v64 = v62;
                if (v62 != -23)
                {
                  int v63 = 0;
                  int v64 = v125;
                }
              }

              if (v62 == -108 || v62 == -36 || v62 == -23)
              {
                int v125 = v64;
              }

              else
              {
                if ((unint64_t)++v118 < 0x3E8)
                {
                  int v125 = v64;
LABEL_61:
                  [v24 removeObjectForKey:v53];
LABEL_62:

                  goto LABEL_63;
                }

                unsigned int v65 = [v124 commit];
                int v63 = 6;
                if (v65 == -108 || v65 == -36)
                {
                  int v125 = v65;
                }

                else
                {
                  int v125 = v65;
                  if (v65 != -23)
                  {
                    int v63 = 0;
                    int v125 = v64;
                  }
                }

                if (v65 != -108 && v65 != -36 && v65 != -23)
                {
                  uint64_t v118 = 0LL;
                  goto LABEL_61;
                }
              }

              if (v63)
              {
                v95 = obj;
                goto LABEL_139;
              }

@end
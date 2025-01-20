@interface MSDBundleProgressTracker
+ (BOOL)isBundleInstance:(id)a3 identicalWithNewBundle:(id)a4;
+ (void)migratePreferencesFromFactoryDevicesIfNeeded;
+ (void)migratePreferencesFromLegacyDevicesIfNeeded;
+ (void)removeBundleFromPreferences:(id)a3;
- (BOOL)checkIfAllCriticalComponentsTried;
- (BOOL)getComponentProgressStatus:(id)a3;
- (BOOL)preInstalledContent;
- (NSArray)criticalComponents;
- (NSMutableDictionary)bundleInfo;
- (NSMutableDictionary)bundleTimerInfo;
- (NSMutableDictionary)componentsFromBundle;
- (NSMutableDictionary)contentProgress;
- (NSMutableDictionary)downloadedContentSource;
- (NSMutableDictionary)installedComponentList;
- (NSString)contentIdentifierString;
- (NSString)lastBundleUpdateDate;
- (double)getBundleUpdateTime;
- (id)getLastBundleUpdateDate;
- (id)initializeTrackerForBundle:(id)a3 withContentType:(unsigned __int8)a4;
- (id)retrieveLegacyContentnIdentifier:(unsigned __int8)a3;
- (id)retrieveObjectFromPreferences:(unsigned __int8)a3;
- (int64_t)componentsSuccessful;
- (int64_t)getAllComponentsForUpdate;
- (int64_t)percentageProgress;
- (int64_t)totalComponents;
- (unsigned)bundleState;
- (unsigned)bundleType;
- (void)addToBundleUpdateTime:(double)a3;
- (void)flushRecordsToPreferences;
- (void)markBundleInProgressAsCompleted;
- (void)renameBundleInPrgressToBundleInstalled;
- (void)retrieveAndPopulateBundleInfo:(id)a3;
- (void)setBundleInfo:(id)a3;
- (void)setBundleState:(unsigned __int8)a3;
- (void)setBundleStateAs:(unsigned __int8)a3;
- (void)setBundleTimerInfo:(id)a3;
- (void)setBundleType:(unsigned __int8)a3;
- (void)setComponentsFromBundle:(id)a3;
- (void)setComponentsSuccessful:(int64_t)a3;
- (void)setContentIdentifierString:(id)a3;
- (void)setContentProgress:(id)a3;
- (void)setCriticalComponents:(id)a3;
- (void)setDownloadedContentSource:(id)a3;
- (void)setInstalledComponentList:(id)a3;
- (void)setLastBundleUpdateDate:(id)a3;
- (void)setPercentageProgress:(int64_t)a3;
- (void)setPreInstalledContent:(BOOL)a3;
- (void)setTotalComponents:(int64_t)a3;
- (void)startBundleUpdateTimer;
- (void)stopBundleUpdateTimer;
- (void)updateComponentProgress:(id)a3 withResult:(BOOL)a4 withAdditionalInfo:(id)a5;
- (void)updateDownloadedContent:(unint64_t)a3 fromSource:(id)a4;
@end

@implementation MSDBundleProgressTracker

- (id)initializeTrackerForBundle:(id)a3 withContentType:(unsigned __int8)a4
{
  unsigned int v45 = a4;
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v48 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 installationOrder]);
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MSDBundleProgressTracker setComponentsFromBundle:](v6, "setComponentsFromBundle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v48 criticalComponents]);
  -[MSDBundleProgressTracker setCriticalComponents:](v6, "setCriticalComponents:", v9);

  id v10 = sub_10003A95C();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](v6, "criticalComponents"));
    *(_DWORD *)buf = 134217984;
    *(void *)v56 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "criticalComponents count:%ld", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](v6, "criticalComponents"));
  BOOL v14 = v13 == 0LL;

  if (v14) {
    -[MSDBundleProgressTracker setCriticalComponents:](v6, "setCriticalComponents:", v7);
  }
  id v15 = sub_10003A95C();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](v6, "criticalComponents"));
    id v18 = [v17 count];
    *(_DWORD *)buf = 134217984;
    *(void *)v56 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "installation order items are:%ld", buf, 0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( -[MSDBundleProgressTracker retrieveLegacyContentnIdentifier:]( v6,  "retrieveLegacyContentnIdentifier:",  v45));
  -[MSDBundleProgressTracker setContentIdentifierString:](v6, "setContentIdentifierString:", v19);

  id v20 = sub_10003A95C();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v56 = v45;
    *(_WORD *)&v56[4] = 2114;
    *(void *)&v56[6] = v48;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "initializing tracker:%d %{public}@",  buf,  0x12u);
  }

  -[MSDBundleProgressTracker retrieveAndPopulateBundleInfo:](v6, "retrieveAndPopulateBundleInfo:", v48);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v6, "bundleInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"ManifestVersion"]);
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifest appsPrefixForManifestVersion:]( &OBJC_CLASS___MSDSignedManifest,  "appsPrefixForManifestVersion:",  v23));

  id v24 = sub_10003A95C();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v56 = "-[MSDBundleProgressTracker initializeTrackerForBundle:withContentType:]";
    *(_WORD *)&v56[8] = 2114;
    *(void *)&v56[10] = v49;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s - installationOrderAppsPrefix:  %{public}@",  buf,  0x16u);
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v7;
  v26 = 0LL;
  id v27 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v27)
  {
    uint64_t v47 = *(void *)v51;
    do
    {
      v28 = 0LL;
      v29 = v26;
      do
      {
        if (*(void *)v51 != v47) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(id *)(*((void *)&v50 + 1) + 8LL * (void)v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](v6, "criticalComponents"));
        id v32 = [v31 containsObject:v30];

        if ([v30 hasPrefix:v49])
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "substringFromIndex:", objc_msgSend(v49, "length")));

          uint64_t v34 = objc_claimAutoreleasedReturnValue([v48 getComponentVersion:v33]);
          goto LABEL_20;
        }

        if ([v48 isItemStandAlonePackage:v30])
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "substringFromIndex:", objc_msgSend(@"/Packages/", "length")));

          uint64_t v34 = objc_claimAutoreleasedReturnValue([v48 getStandAlonePackageVersion:v33]);
LABEL_20:
          v35 = (__CFString *)v34;
          if (v34) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }

        v33 = v30;
LABEL_23:
        v35 = @"1";
LABEL_24:
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v6, "bundleInfo"));
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"ManifestVersion"]);
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifest getComponentFromPath:forManifestVersion:]( &OBJC_CLASS___MSDSignedManifest,  "getComponentFromPath:forManifestVersion:",  v33,  v37));

        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v32));
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v35,  @"Version",  &__NSDictionary0__struct,  @"DebugInfo",  &off_100106318,  @"Status",  v38,  @"CriticalComponent",  0LL));

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v6, "componentsFromBundle"));
        [v40 setObject:v39 forKey:v26];

        v28 = (char *)v28 + 1;
        v29 = v26;
      }

      while (v27 != v28);
      id v27 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }

    while (v27);
  }

  -[MSDBundleProgressTracker setPercentageProgress:](v6, "setPercentageProgress:", 0LL);
  v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MSDBundleProgressTracker setDownloadedContentSource:](v6, "setDownloadedContentSource:", v41);

  -[MSDBundleProgressTracker setBundleState:](v6, "setBundleState:", 1LL);
  -[MSDBundleProgressTracker setBundleType:](v6, "setBundleType:", v45);
  -[MSDBundleProgressTracker addBundleSpecificCompoments:](v6, "addBundleSpecificCompoments:", v45);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v6, "componentsFromBundle"));
  -[MSDBundleProgressTracker setTotalComponents:](v6, "setTotalComponents:", [v42 count]);

  -[MSDBundleProgressTracker setComponentsSuccessful:](v6, "setComponentsSuccessful:", 0LL);
  -[MSDBundleProgressTracker setLastBundleUpdateDate:](v6, "setLastBundleUpdateDate:", @"<unknown>");
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  @"startTime",  &off_100106330,  @"totalTimeTaken",  0LL));
  -[MSDBundleProgressTracker setBundleTimerInfo:](v6, "setBundleTimerInfo:", v43);

  -[MSDBundleProgressTracker flushRecordsToPreferences](v6, "flushRecordsToPreferences");
  objc_sync_exit(v6);

  return v6;
}

- (id)retrieveObjectFromPreferences:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v33 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "loadFromPreferences called:%d", buf, 8u);
  }

  -[MSDBundleProgressTracker setPreInstalledContent:](v4, "setPreInstalledContent:", 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MSDBundleProgressTracker retrieveLegacyContentnIdentifier:]( v4,  "retrieveLegacyContentnIdentifier:",  v3));
  -[MSDBundleProgressTracker setContentIdentifierString:](v4, "setContentIdentifierString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](v4, "contentIdentifierString"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v9]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ContentStatus"]);
    -[MSDBundleProgressTracker setBundleState:]( v4,  "setBundleState:",  [v11 integerValue]);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ComponentInfo"]);
    -[MSDBundleProgressTracker setComponentsFromBundle:](v4, "setComponentsFromBundle:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"BundleInfo"]);
    -[MSDBundleProgressTracker setBundleInfo:](v4, "setBundleInfo:", v13);

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"BundleTimerInfo"]);
    if (v14) {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"BundleTimerInfo"]);
    }
    else {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  @"startTime",  &off_100106330,  @"totalTimeTaken",  0LL));
    }
    -[MSDBundleProgressTracker setBundleTimerInfo:](v4, "setBundleTimerInfo:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"PreInstalledContent"]);
    -[MSDBundleProgressTracker setPreInstalledContent:](v4, "setPreInstalledContent:", [v17 BOOLValue]);

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ContentSource"]);
    id v19 = [v18 mutableCopy];
    -[MSDBundleProgressTracker setDownloadedContentSource:](v4, "setDownloadedContentSource:", v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"TotalComponents"]);
    -[MSDBundleProgressTracker setTotalComponents:](v4, "setTotalComponents:", [v20 integerValue]);

    v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"SuccessfulComponents"]);
    -[MSDBundleProgressTracker setComponentsSuccessful:]( v4,  "setComponentsSuccessful:",  [v21 integerValue]);

    if (-[MSDBundleProgressTracker totalComponents](v4, "totalComponents"))
    {
      int64_t v22 = -[MSDBundleProgressTracker componentsSuccessful](v4, "componentsSuccessful");
      uint64_t v23 = 100 * v22 / -[MSDBundleProgressTracker totalComponents](v4, "totalComponents");
    }

    else
    {
      uint64_t v23 = 100LL;
    }

    -[MSDBundleProgressTracker setPercentageProgress:](v4, "setPercentageProgress:", v23);
    -[MSDBundleProgressTracker setBundleType:](v4, "setBundleType:", v3);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"LastBundleUpdateDate"]);
    -[MSDBundleProgressTracker setLastBundleUpdateDate:](v4, "setLastBundleUpdateDate:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker lastBundleUpdateDate](v4, "lastBundleUpdateDate"));
    LODWORD(v24) = v25 == 0LL;

    if ((_DWORD)v24) {
      -[MSDBundleProgressTracker setLastBundleUpdateDate:](v4, "setLastBundleUpdateDate:", @"<unknown>");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v4, "bundleInfo"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"PreInstalledContent"]);

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v4, "bundleInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"PreInstalledContent"]);
      -[MSDBundleProgressTracker setPreInstalledContent:](v4, "setPreInstalledContent:", [v29 BOOLValue]);

      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v4, "bundleInfo"));
      [v30 removeObjectForKey:@"PreInstalledContent"];

      -[MSDBundleProgressTracker flushRecordsToPreferences](v4, "flushRecordsToPreferences");
    }

    v16 = v4;
  }

  else
  {
    v16 = 0LL;
  }

  objc_sync_exit(v4);
  return v16;
}

- (void)updateComponentProgress:(id)a3 withResult:(BOOL)a4 withAdditionalInfo:(id)a5
{
  BOOL v6 = a4;
  id v54 = a3;
  id v55 = a5;
  v8 = self;
  objc_sync_enter(v8);
  v59 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v8, "bundleInfo"));

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v59, "bundleInfo"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ManifestVersion"]);

    __int128 v53 = (void *)v11;
    if (v11)
    {
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifest getComponentFromPath:forManifestVersion:]( &OBJC_CLASS___MSDSignedManifest,  "getComponentFromPath:forManifestVersion:",  v54,  v11));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v59, "componentsFromBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v56]);
      id v57 = [v13 mutableCopy];

      id v14 = sub_10003A95C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v66 = v56;
        __int16 v67 = 1026;
        BOOL v68 = v6;
        __int16 v69 = 2114;
        id v70 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updating component record:%{public}@ result:%{public, BOOL}d info:%{public}@",  buf,  0x1Cu);
      }

      if (v57)
      {
        if (v6) {
          uint64_t v16 = 2LL;
        }
        else {
          uint64_t v16 = 1LL;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v16));
        [v57 setObject:v17 forKey:@"Status"];

        [v57 setObject:v55 forKey:@"DebugInfo"];
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v59, "componentsFromBundle"));
        [v18 setObject:v57 forKey:v56];
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
      unsigned int v20 = [v19 criticalUpdatePrioritized];

      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v59, "componentsFromBundle"));
      uint64_t v22 = 0LL;
      uint64_t v23 = 0LL;
      id v24 = [v21 countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v61;
        id obj = v21;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v61 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)i);
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v59, "componentsFromBundle"));
            v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v27]);

            id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"Status"]);
            LODWORD(v28) = [v30 intValue];

            v31 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"CriticalComponent"]);
            unsigned int v32 = [v31 BOOLValue];

            if ((_DWORD)v28 == 2) {
              ++v23;
            }
            if (v32) {
              uint64_t v33 = v22 + 1;
            }
            else {
              uint64_t v33 = v22;
            }
            if (v20) {
              uint64_t v22 = v33;
            }
            else {
              ++v22;
            }
          }

          v21 = obj;
          id v24 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
        }

        while (v24);
      }

      -[MSDBundleProgressTracker setComponentsSuccessful:](v59, "setComponentsSuccessful:", v23);
      if (v22) {
        uint64_t v34 = 100 * -[MSDBundleProgressTracker componentsSuccessful](v59, "componentsSuccessful") / v22;
      }
      else {
        uint64_t v34 = 100LL;
      }
      -[MSDBundleProgressTracker setPercentageProgress:](v59, "setPercentageProgress:", v34);
      -[MSDBundleProgressTracker flushRecordsToPreferences](v59, "flushRecordsToPreferences");
    }

    else
    {
      id v44 = sub_10003A95C();
      unsigned int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      v56 = v45;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_100091AB8(v45, v46, v47, v48, v49, v50, v51, v52);
      }
    }
  }

  else
  {
    id v35 = sub_10003A95C();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    __int128 v53 = v36;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100091A44(v36, v37, v38, v39, v40, v41, v42, v43);
    }
  }

  objc_sync_exit(v59);
}

- (void)updateDownloadedContent:(unint64_t)a3 fromSource:(id)a4
{
  id v13 = a4;
  BOOL v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker downloadedContentSource](v6, "downloadedContentSource"));
  v8 = (char *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v13]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker downloadedContentSource](v6, "downloadedContentSource"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v13]);
    v8 = (char *)[v10 longLongValue];
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker downloadedContentSource](v6, "downloadedContentSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", &v8[a3]));
  [v11 setObject:v12 forKey:v13];

  -[MSDBundleProgressTracker flushRecordsToPreferences](v6, "flushRecordsToPreferences");
  objc_sync_exit(v6);
}

- (void)markBundleInProgressAsCompleted
{
  id obj = self;
  objc_sync_enter(obj);
  if (-[MSDBundleProgressTracker bundleState](obj, "bundleState") == 1)
  {
    id v2 = -[MSDBundleProgressTracker totalComponents](obj, "totalComponents");
    if (v2 == (id)-[MSDBundleProgressTracker componentsSuccessful](obj, "componentsSuccessful"))
    {
      unsigned __int8 v3 = 3;
    }

    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
      unsigned int v5 = [v4 criticalUpdatePrioritized];

      if (v5)
      {
        if (-[MSDBundleProgressTracker checkIfAllCriticalComponentsTried](obj, "checkIfAllCriticalComponentsTried")) {
          unsigned __int8 v3 = 5;
        }
        else {
          unsigned __int8 v3 = 6;
        }
      }

      else
      {
        unsigned __int8 v3 = 4;
      }
    }

    -[MSDBundleProgressTracker setBundleState:](obj, "setBundleState:", v3);
    BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v6, "setDateFormat:", @"yyyyMMdd");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v6, "stringFromDate:", v7));

    -[MSDBundleProgressTracker setLastBundleUpdateDate:](obj, "setLastBundleUpdateDate:", v8);
  }

  -[MSDBundleProgressTracker flushRecordsToPreferences](obj, "flushRecordsToPreferences");
  objc_sync_exit(obj);
}

- (void)renameBundleInPrgressToBundleInstalled
{
  id obj = self;
  objc_sync_enter(obj);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](obj, "contentIdentifierString"));
  unsigned int v3 = [v2 isEqualToString:@"Content.Installing"];

  if (v3)
  {
    -[MSDBundleProgressTracker setContentIdentifierString:]( obj,  "setContentIdentifierString:",  @"Content.Existing");
    -[MSDBundleProgressTracker setBundleType:](obj, "setBundleType:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v4 setCriticalUpdatePrioritized:0];

    -[MSDBundleProgressTracker flushRecordsToPreferences](obj, "flushRecordsToPreferences");
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v5 removeObjectForKey:@"Content.Installing"];
  }

  objc_sync_exit(obj);
}

- (void)setBundleStateAs:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  -[MSDBundleProgressTracker setBundleState:](obj, "setBundleState:", v3);
  -[MSDBundleProgressTracker flushRecordsToPreferences](obj, "flushRecordsToPreferences");
  objc_sync_exit(obj);
}

- (int64_t)getAllComponentsForUpdate
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  unsigned int v4 = [v3 criticalUpdatePrioritized];

  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](self, "criticalComponents"));
    id v6 = [v5 count];
  }

  else
  {
    id v6 = -[MSDBundleProgressTracker totalComponents](self, "totalComponents");
  }

  id v7 = sub_10003A95C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100091B2C(self, (uint64_t)v6, v8);
  }

  return (int64_t)v6;
}

- (id)getLastBundleUpdateDate
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker lastBundleUpdateDate](v2, "lastBundleUpdateDate"));
  objc_sync_exit(v2);

  return v3;
}

- (double)getBundleUpdateTime
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"startTime"]);
  [v4 doubleValue];
  double v6 = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"totalTimeTaken"]);
  [v8 doubleValue];
  double v10 = v9;

  if (v6 == 0.0)
  {
    double v14 = 0.0;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v12 timeIntervalSinceDate:v11];
    double v14 = v13;
  }

  objc_sync_exit(v2);

  return v10 + v14;
}

- (void)addToBundleUpdateTime:(double)a3
{
  id obj = self;
  objc_sync_enter(obj);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](obj, "bundleTimerInfo"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"totalTimeTaken"]);
  [v5 doubleValue];
  double v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](obj, "bundleTimerInfo"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7 + a3));
  [v8 setObject:v9 forKey:@"totalTimeTaken"];

  -[MSDBundleProgressTracker flushRecordsToPreferences](obj, "flushRecordsToPreferences");
  objc_sync_exit(obj);
}

- (BOOL)getComponentProgressStatus:(id)a3
{
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v5, "bundleInfo"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ManifestVersion"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifest getComponentFromPath:forManifestVersion:]( &OBJC_CLASS___MSDSignedManifest,  "getComponentFromPath:forManifestVersion:",  v4,  v7));

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v5, "componentsFromBundle"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Status"]);
  BOOL v12 = [v11 intValue] == 2;

  objc_sync_exit(v5);
  return v12;
}

- (NSMutableDictionary)installedComponentList
{
  id v2 = self;
  objc_sync_enter(v2);
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!-[MSDBundleProgressTracker preInstalledContent](v2, "preInstalledContent"))
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v2, "componentsFromBundle"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

    id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        double v7 = 0LL;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v7);
          double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v2, "componentsFromBundle"));
          double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Status"]);
          BOOL v12 = [v11 integerValue] == (id)2;

          if (v12)
          {
            double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v2, "componentsFromBundle"));
            double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v8]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"Version"]);
            -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v15, v8);
          }

          double v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v5);
    }
  }

  objc_sync_exit(v2);

  return v17;
}

- (NSMutableDictionary)contentProgress
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = -[MSDBundleProgressTracker bundleState](v2, "bundleState");
  if (v4 == 5)
  {
    uint64_t v5 = 3LL;
  }

  else if (v4 == 6)
  {
    uint64_t v5 = 4LL;
  }

  else
  {
    uint64_t v5 = -[MSDBundleProgressTracker bundleState](v2, "bundleState");
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](v2, "contentIdentifierString"));
  unsigned int v7 = [v6 isEqualToString:@"Content.Installing"];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[MSDBundleProgressTracker percentageProgress](v2, "percentageProgress")));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, @"InstalledComponentsPercent");

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", &off_100106330, @"InstalledSizePercent");
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v5));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"InstallState");
LABEL_10:

    goto LABEL_11;
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](v2, "contentIdentifierString"));
  unsigned int v11 = [v10 isEqualToString:@"Content.Downloading"];

  if (v11)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[MSDBundleProgressTracker percentageProgress](v2, "percentageProgress")));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, @"DownloadedComponentsPercent");

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", &off_100106330, @"DownloadedSizePercent");
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v5));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"DownloadState");
    goto LABEL_10;
  }

- (void)retrieveAndPopulateBundleInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getInfo]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[MSDBundleProgressTracker setBundleInfo:](self, "setBundleInfo:", v6);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"PartNumber"]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
    [v8 setObject:v7 forKey:@"PartNumber"];
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Revision"]);

  if (v9)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
    [v10 setObject:v9 forKey:@"Revision"];
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"BundleName"]);

  if (v11)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
    [v12 setObject:v11 forKey:@"BundleName"];
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[MSDFileDownloadCredentials sharedInstance](&OBJC_CLASS___MSDFileDownloadCredentials, "sharedInstance"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v19 manifestInfo]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"SigningKey"]);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
    [v15 setObject:v14 forKey:@"SigningKey"];
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
  id v17 = [v4 getVersion];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v17));
  [v16 setObject:v18 forKey:@"ManifestVersion"];
}

- (id)retrieveLegacyContentnIdentifier:(unsigned __int8)a3
{
  uint64_t v3 = @"Content.Downloading";
  if (a3 == 2) {
    uint64_t v3 = @"Content.Installing";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Content.Existing";
  }
}

- (void)flushRecordsToPreferences
{
  v15[0] = @"BundleInfo";
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
  v16[0] = v14;
  v15[1] = @"PreInstalledContent";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MSDBundleProgressTracker preInstalledContent](self, "preInstalledContent")));
  v16[1] = v3;
  v15[2] = @"ComponentInfo";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](self, "componentsFromBundle"));
  v16[2] = v4;
  v15[3] = @"ContentStatus";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[MSDBundleProgressTracker bundleState](self, "bundleState")));
  v16[3] = v5;
  v15[4] = @"ContentSource";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker downloadedContentSource](self, "downloadedContentSource"));
  v16[4] = v6;
  v15[5] = @"TotalComponents";
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[MSDBundleProgressTracker totalComponents](self, "totalComponents")));
  v16[5] = v7;
  v15[6] = @"SuccessfulComponents";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[MSDBundleProgressTracker componentsSuccessful](self, "componentsSuccessful")));
  v16[6] = v8;
  v15[7] = @"LastBundleUpdateDate";
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker lastBundleUpdateDate](self, "lastBundleUpdateDate"));
  v16[7] = v9;
  v15[8] = @"BundleTimerInfo";
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](self, "bundleTimerInfo"));
  v16[8] = v10;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  9LL));

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](self, "contentIdentifierString"));
  [v12 setObject:v11 forKey:v13];
}

- (BOOL)checkIfAllCriticalComponentsTried
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](self, "criticalComponents"));
  id v3 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
        double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ManifestVersion"]);
        double v10 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifest getComponentFromPath:forManifestVersion:]( &OBJC_CLASS___MSDSignedManifest,  "getComponentFromPath:forManifestVersion:",  v7,  v9));

        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](self, "componentsFromBundle"));
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

        if (v12)
        {
          double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"Status"]);
          unsigned int v14 = [v13 intValue];

          if (!v14)
          {

            BOOL v17 = 0;
            goto LABEL_15;
          }
        }

        else
        {
          id v15 = sub_10003A95C();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v27 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Couldn't get componentInfo for: %{public}@, skipping...",  buf,  0xCu);
          }
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v4);
  }

  BOOL v17 = 1;
LABEL_15:

  id v18 = sub_10003A95C();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Critical components tried:%d", buf, 8u);
  }

  return v17;
}

+ (void)removeBundleFromPreferences:(id)a3
{
  id v3 = a3;
  id v4 = sub_10003A95C();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "removing bundlepreferences:%{public}@",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v6 removeObjectForKey:v3];
}

+ (BOOL)isBundleInstance:(id)a3 identicalWithNewBundle:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a4 getInfo]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileDownloadCredentials sharedInstance]( &OBJC_CLASS___MSDFileDownloadCredentials,  "sharedInstance"));
  BOOL v8 = 0;
  if (v5 && a4)
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"PartNumber"]);
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleInfo]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PartNumber"]);

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleInfo]);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Revision"]);
    id v13 = [v12 integerValue];

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Revision"]);
    id v15 = [v14 integerValue];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleInfo]);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"SigningKey"]);

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 manifestInfo]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"SigningKey"]);

    if ([v24 isEqualToString:v10]
      && v13 == v15
      && [v19 isEqualToString:v17])
    {
      id v20 = sub_10003A95C();
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "It is the same old bundle.", buf, 2u);
      }

      BOOL v8 = 1;
    }

    else
    {
      id v22 = sub_10003A95C();
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "It is not the same old bundle.", v25, 2u);
      }

      BOOL v8 = 0;
    }
  }

  return v8;
}

+ (void)migratePreferencesFromLegacyDevicesIfNeeded
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ContentInstalled"]);

  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found the key contentInstalled...", buf, 2u);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    BOOL v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Content.Existing"]);

    if (v8)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"ContentInstalled"]);

      if (v10)
      {
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"DemoContent"]);
        if (v11)
        {
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Installed"]);
          uint64_t v13 = (int)[v12 intValue];

          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Total"]);
          uint64_t v15 = (int)[v14 intValue];
        }

        else
        {
          uint64_t v15 = 0LL;
          uint64_t v13 = 0LL;
        }
      }

      else
      {
        uint64_t v15 = 0LL;
        uint64_t v13 = 0LL;
      }

      if (v13 == v15) {
        unsigned __int8 v17 = 3;
      }
      else {
        unsigned __int8 v17 = 4;
      }
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"Content.Existing"]);

      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v19 = sub_10003A95C();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v49 = v15;
        __int16 v50 = 2048;
        uint64_t v51 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "totalComponents:%ld componentsSuccessful:%ld",  buf,  0x16u);
      }

      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v17));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  @"BundleInfo",  v16,  @"ComponentInfo",  v21,  @"ContentStatus",  v8,  @"ContentSource",  v22,  @"TotalComponents",  v23,  @"SuccessfulComponents",  @"<unknown>",  @"LastBundleUpdateDate",  0LL));

      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      [v25 setObject:v24 forKey:@"Content.Existing"];
    }

    else
    {
      uint64_t v16 = 0LL;
      id v5 = 0LL;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"Content.Downloading"]);

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"BackgroundDownloadedComponents"]);

      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"TotalDownloadedContent"]);
      signed int v32 = [v31 intValue];

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 objectForKey:@"Content.Downloading"]);

      id v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

      unint64_t v37 = 100 * (uint64_t)[v29 count] / (unint64_t)v32;
      id v38 = [v29 count];
      if (v32 == 100) {
        uint64_t v39 = 3LL;
      }
      else {
        uint64_t v39 = 4LL;
      }
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v39));
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v37));
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v38));
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v34,  @"BundleInfo",  v35,  @"ComponentInfo",  v40,  @"ContentStatus",  v36,  @"ContentSource",  v41,  @"TotalComponents",  v42,  @"SuccessfulComponents",  @"<unknown>",  @"LastBundleUpdateDate",  0LL));

      id v44 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      [v44 setObject:v43 forKey:@"Content.Existing"];

      BOOL v8 = v36;
      uint64_t v16 = v35;
      id v5 = (os_log_s *)v34;
    }

    unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v45 removeObjectForKey:@"ContentInstalled"];

    id v46 = sub_10003A95C();
    uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Migrating preferences from legacy device done.",  buf,  2u);
    }
  }

  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Nothing to migrate in preferences file for legacy device.",  buf,  2u);
  }
}

+ (void)migratePreferencesFromFactoryDevicesIfNeeded
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  if ([v2 fileExistsAtPath:@"/private/var/demo_backup/Metadata/Content.plist"])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 readPlistFile:@"/private/var/demo_backup/Metadata/Content.plist"]);
    if (v5 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    {
      [v3 addEntriesFromDictionary:v5];
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  @"BundleInfo",  &__kCFBooleanTrue,  @"PreInstalledContent",  &__NSDictionary0__struct,  @"ComponentInfo",  &off_100106348,  @"ContentStatus",  &__NSDictionary0__struct,  @"ContentSource",  &off_100106360,  @"TotalComponents",  &off_100106360,  @"SuccessfulComponents",  @"<unknown>",  @"LastBundleUpdateDate",  0LL));
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      [v8 setObject:v7 forKey:@"Content.Existing"];
    }

    else
    {
      id v10 = sub_10003A95C();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cannot parse Content.plist.", v15, 2u);
      }
    }

    [v2 removeFileAtPath:@"/private/var/demo_backup/Metadata/Content.plist"];
    id v11 = sub_10003A95C();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Migrating Content.plist for factory device done.",  v14,  2u);
    }
  }

  else
  {
    id v9 = sub_10003A95C();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_DEFAULT,  "No Content.plist to migrate for factory device.",  buf,  2u);
    }
  }
}

- (void)startBundleUpdateTimer
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"startTime"]);
  [v4 doubleValue];
  double v6 = v5;

  if (v6 == 0.0)
  {
    id v7 = sub_10003A95C();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting bundle update timer.", v14, 2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v9 timeIntervalSince1970];
    double v6 = v10;
  }

  else
  {
    id v11 = sub_10003A95C();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
      sub_100091BFC((os_log_t)v9);
    }
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  [v12 setObject:v13 forKey:@"startTime"];

  -[MSDBundleProgressTracker flushRecordsToPreferences](v2, "flushRecordsToPreferences");
  objc_sync_exit(v2);
}

- (void)stopBundleUpdateTimer
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"startTime"]);
  [v4 doubleValue];
  double v6 = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"totalTimeTaken"]);
  [v8 doubleValue];
  double v10 = v9;

  if (v6 != 0.0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v6));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v12 timeIntervalSinceDate:v11];
    double v14 = v13;

    id v15 = sub_10003A95C();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    double v17 = v10 + v14;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v18 timeIntervalSinceDate:v11];
      int v24 = 134218240;
      uint64_t v25 = v19;
      __int16 v26 = 2048;
      double v27 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Stopping bundle update timer. Time taken in this attempt: %lf, Total time taken: %lf",  (uint8_t *)&v24,  0x16u);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
    [v20 setObject:v21 forKey:@"startTime"];

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17));
    [v22 setObject:v23 forKey:@"totalTimeTaken"];

    -[MSDBundleProgressTracker flushRecordsToPreferences](v2, "flushRecordsToPreferences");
  }

  objc_sync_exit(v2);
}

- (unsigned)bundleType
{
  return self->_bundleType;
}

- (void)setBundleType:(unsigned __int8)a3
{
  self->_bundleType = a3;
}

- (unsigned)bundleState
{
  return self->_bundleState;
}

- (void)setBundleState:(unsigned __int8)a3
{
  self->_bundleState = a3;
}

- (NSMutableDictionary)bundleInfo
{
  return self->_bundleInfo;
}

- (void)setBundleInfo:(id)a3
{
}

- (void)setContentProgress:(id)a3
{
}

- (void)setInstalledComponentList:(id)a3
{
}

- (NSMutableDictionary)downloadedContentSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDownloadedContentSource:(id)a3
{
}

- (BOOL)preInstalledContent
{
  return self->_preInstalledContent;
}

- (void)setPreInstalledContent:(BOOL)a3
{
  self->_preInstalledContent = a3;
}

- (NSString)contentIdentifierString
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setContentIdentifierString:(id)a3
{
}

- (NSMutableDictionary)componentsFromBundle
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setComponentsFromBundle:(id)a3
{
}

- (int64_t)percentageProgress
{
  return self->_percentageProgress;
}

- (void)setPercentageProgress:(int64_t)a3
{
  self->_percentageProgress = a3;
}

- (int64_t)totalComponents
{
  return self->_totalComponents;
}

- (void)setTotalComponents:(int64_t)a3
{
  self->_totalComponents = a3;
}

- (int64_t)componentsSuccessful
{
  return self->_componentsSuccessful;
}

- (void)setComponentsSuccessful:(int64_t)a3
{
  self->_componentsSuccessful = a3;
}

- (NSArray)criticalComponents
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCriticalComponents:(id)a3
{
}

- (NSString)lastBundleUpdateDate
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLastBundleUpdateDate:(id)a3
{
}

- (NSMutableDictionary)bundleTimerInfo
{
  return self->_bundleTimerInfo;
}

- (void)setBundleTimerInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
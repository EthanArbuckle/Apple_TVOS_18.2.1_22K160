@interface MSDProgressUpdater
+ (id)sharedInstance;
- (MSDBundleProgressTracker)backgroundBundle;
- (MSDBundleProgressTracker)bundleInProgress;
- (MSDBundleProgressTracker)installedBundle;
- (MSDBundleProgressTracker)installingBundle;
- (MSDProgressUpdater)init;
- (id)getContentStatus;
- (id)getContentUpdateType;
- (int)currentStage;
- (int64_t)getInternalStatus;
- (void)demoUpdateCompleted:(id)a3;
- (void)demoUpdateFailed:(id)a3;
- (void)loadBundles;
- (void)markBundleInProgressAsBundleCompleted;
- (void)resetTrackerForBundleType:(int)a3;
- (void)setBackgroundBundle:(id)a3;
- (void)setBundleInProgress:(id)a3;
- (void)setCurrentStage:(int)a3;
- (void)setInstalledBundle:(id)a3;
- (void)setInstallingBundle:(id)a3;
- (void)startBundleUpdateMonitor:(id)a3 inMode:(int)a4;
- (void)updateStage:(int)a3;
@end

@implementation MSDProgressUpdater

+ (id)sharedInstance
{
  if (qword_100125588 != -1) {
    dispatch_once(&qword_100125588, &stru_1000FA9C0);
  }
  return (id)qword_100125580;
}

- (MSDProgressUpdater)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDProgressUpdater;
  v2 = -[MSDProgressUpdater init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MSDProgressUpdater updateStage:](v2, "updateStage:", 199LL);
  }
  return v3;
}

- (void)updateStage:(int)a3
{
}

- (void)resetTrackerForBundleType:(int)a3
{
  if (a3 == 1) {
    -[MSDProgressUpdater setBackgroundBundle:](self, "setBackgroundBundle:", 0LL);
  }
}

- (void)markBundleInProgressAsBundleCompleted
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[MSDProgressUpdater markBundleInProgressAsBundleCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s entered.", (uint8_t *)&v9, 0xCu);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
  [v5 markBundleInProgressAsCompleted];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
  [v6 reportBundleInstallCompleted];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
  [v7 renameBundleInPrgressToBundleInstalled];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
  -[MSDProgressUpdater setInstalledBundle:](self, "setInstalledBundle:", v8);

  -[MSDProgressUpdater setInstallingBundle:](self, "setInstallingBundle:", 0LL);
  -[MSDProgressUpdater setBundleInProgress:](self, "setBundleInProgress:", 0LL);
}

- (void)startBundleUpdateMonitor:(id)a3 inMode:(int)a4
{
  id v6 = a3;
  id v7 = sub_10003A95C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138543362;
    id v34 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "start content update monitor:%{public}@",  (uint8_t *)&v33,  0xCu);
  }

  id v9 = sub_10003A95C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v11)
    {
      LOWORD(v33) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Inside start content background",  (uint8_t *)&v33,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
    unsigned __int8 v13 = +[MSDBundleProgressTracker isBundleInstance:identicalWithNewBundle:]( &OBJC_CLASS___MSDBundleProgressTracker,  "isBundleInstance:identicalWithNewBundle:",  v12,  v6);

    if ((v13 & 1) == 0)
    {
      id v14 = sub_10003A95C();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "not the same background bundle...",  (uint8_t *)&v33,  2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
      [v16 cleanUpBackgroundState:1];

      v17 = objc_alloc(&OBJC_CLASS___MSDBundleProgressTracker);
      v18 = (void *)objc_claimAutoreleasedReturnValue( -[MSDBundleProgressTracker initializeTrackerForBundle:withContentType:]( v17,  "initializeTrackerForBundle:withContentType:",  v6,  1LL));
      -[MSDProgressUpdater setBackgroundBundle:](self, "setBackgroundBundle:", v18);
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
  }

  else
  {
    if (v11)
    {
      LOWORD(v33) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Inside start content foreground",  (uint8_t *)&v33,  2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
    unsigned __int8 v21 = +[MSDBundleProgressTracker isBundleInstance:identicalWithNewBundle:]( &OBJC_CLASS___MSDBundleProgressTracker,  "isBundleInstance:identicalWithNewBundle:",  v20,  v6);

    if ((v21 & 1) == 0)
    {
      id v22 = sub_10003A95C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "not the same foreground bundle...",  (uint8_t *)&v33,  2u);
      }

      v24 = objc_alloc(&OBJC_CLASS___MSDBundleProgressTracker);
      v25 = (void *)objc_claimAutoreleasedReturnValue( -[MSDBundleProgressTracker initializeTrackerForBundle:withContentType:]( v24,  "initializeTrackerForBundle:withContentType:",  v6,  2LL));
      -[MSDProgressUpdater setInstallingBundle:](self, "setInstallingBundle:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      LODWORD(v24) = +[MSDBundleProgressTracker isBundleInstance:identicalWithNewBundle:]( &OBJC_CLASS___MSDBundleProgressTracker,  "isBundleInstance:identicalWithNewBundle:",  v26,  v6);

      if ((_DWORD)v24)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
        [v28 getBundleUpdateTime];
        objc_msgSend(v27, "addToBundleUpdateTime:");
      }
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
  }

  v29 = (void *)v19;
  -[MSDProgressUpdater setBundleInProgress:](self, "setBundleInProgress:", v19);

  id v30 = sub_10003A95C();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
    int v33 = 138543362;
    id v34 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "bundleInProgress:%{public}@",  (uint8_t *)&v33,  0xCu);
  }
}

- (void)loadBundles
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v4 = objc_alloc(&OBJC_CLASS___MSDBundleProgressTracker);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker retrieveObjectFromPreferences:](v4, "retrieveObjectFromPreferences:", 0LL));
  -[MSDProgressUpdater setInstalledBundle:](self, "setInstalledBundle:", v5);

  id v6 = objc_alloc(&OBJC_CLASS___MSDBundleProgressTracker);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker retrieveObjectFromPreferences:](v6, "retrieveObjectFromPreferences:", 1LL));
  -[MSDProgressUpdater setBackgroundBundle:](self, "setBackgroundBundle:", v7);

  v8 = objc_alloc(&OBJC_CLASS___MSDBundleProgressTracker);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker retrieveObjectFromPreferences:](v8, "retrieveObjectFromPreferences:", 2LL));
  -[MSDProgressUpdater setInstallingBundle:](self, "setInstallingBundle:", v9);

  if ([v3 mode] < 2 || objc_msgSend(v3, "mode") > 4)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
    unsigned int v12 = [v11 bundleState];

    if (v12) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    }
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
  }

  unsigned __int8 v13 = (void *)v10;
  -[MSDProgressUpdater setBundleInProgress:](self, "setBundleInProgress:", v10);

  id v14 = sub_10003A95C();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
    int v19 = 138543874;
    v20 = v16;
    __int16 v21 = 2114;
    id v22 = v17;
    __int16 v23 = 2114;
    v24 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Bundles are: installedBundle:%{public}@ backgroundBundle:%{public}@ installingBundle:%{public}@",  (uint8_t *)&v19,  0x20u);
  }
}

- (id)getContentStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));

  v74 = v5;
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 hubSuppliedSettings]);
    v66 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Components"]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleInfo]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 installedComponentList]);
    id v15 = [v14 copy];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    unsigned __int8 v17 = [v16 bundleState];

    [v12 removeObjectForKey:@"ManifestVersion"];
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v12, @"ContentDetails");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v18 preInstalledContent]));
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v19, @"PreInstalledContent");

    else {
      v20 = (&off_1000FAA20)[(char)(v17 - 3)];
    }
    v75 = v6;
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v20, @"Status");
    objc_super v5 = v74;
    if (v66 && [v66 count])
    {
      v68 = v7;
      v70 = v4;
      v72 = v3;
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      id v24 = v66;
      id v25 = [v24 countByEnumeratingWithState:&v77 objects:v81 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v78;
        do
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v78 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v77 + 1) + 8LL * (void)i);
            id v30 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v29]);
            if (v30) {
              [v22 setObject:v30 forKey:v29];
            }
          }

          id v26 = [v24 countByEnumeratingWithState:&v77 objects:v81 count:16];
        }

        while (v26);
      }

      v4 = v70;
      id v3 = v72;
      id v7 = v68;
      objc_super v5 = v74;
    }

    else
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v15));
    }

    __int16 v23 = v75;
  }

  else
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &__NSDictionary0__struct,  @"ContentDetails",  0LL,  @"Status",  &__kCFBooleanFalse,  @"PreInstalledContent",  0LL));

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    __int16 v23 = (void *)v21;
  }

  v76 = v23;
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:");
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v22, @"MSDDemoComponentsInstalled");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
  unsigned int v32 = [v31 bundleType];

  if (v32)
  {
    int v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
    unsigned int v34 = [v33 bundleType];

    v71 = v4;
    v73 = v3;
    v69 = v7;
    if (v34 == 1)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 contentProgress]);
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v36, @"DownloadingProgress");

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 downloadedContentSource]);
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v38));

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 bundleInfo]);
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v41));
      v43 = 0LL;
      v67 = &off_100106588;
    }

    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
      unsigned int v45 = [v44 bundleType];

      if (v45 != 2)
      {
        v39 = 0LL;
        v43 = 0LL;
        v42 = 0LL;
        v67 = 0LL;
LABEL_30:
        v54 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"remote"]);
        v55 = (char *)[v54 integerValue];
        v56 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:@"remote"]);
        v57 = &v55[(void)[v56 integerValue]];

        v58 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"local"]);
        v59 = (char *)[v58 integerValue];
        v60 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:@"local"]);
        v61 = &v59[(void)[v60 integerValue]];

        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v57));
        v4 = v71;
        -[NSMutableDictionary setObject:forKey:](v71, "setObject:forKey:", v62, @"remote");

        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v61));
        -[NSMutableDictionary setObject:forKey:](v71, "setObject:forKey:", v63, @"local");

        objc_super v5 = v74;
        if (v42)
        {
          [v42 removeObjectForKey:@"ManifestVersion"];
          -[NSMutableDictionary setObject:forKey:](v74, "setObject:forKey:", v42, @"ContentDetails");
        }

        id v3 = v73;
        else {
          v64 = &off_1001065E8;
        }
        -[NSMutableDictionary setObject:forKey:](v74, "setObject:forKey:", v64, @"ComponentsType");
        -[NSMutableDictionary setObject:forKey:](v74, "setObject:forKey:", v67, @"Status");
        -[NSMutableDictionary setObject:forKey:](v74, "setObject:forKey:", v71, @"TotalBytesDownloaded");
        id v7 = v69;
        -[NSMutableDictionary setObject:forKey:](v69, "setObject:forKey:", v74, @"MSDDemoContentInProgress");

        goto LABEL_36;
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 contentProgress]);
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v47, @"InstallingProgress");

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 downloadedContentSource]);
      v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v49));

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      if (v50)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
        v52 = (void *)objc_claimAutoreleasedReturnValue([v51 downloadedContentSource]);
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v52));

        v53 = &off_1001065A0;
      }

      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"local",  &off_1001065E8,  @"remote",  0LL));
        v53 = &off_1001065B8;
      }

      v67 = v53;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 bundleInfo]);
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v41));
    }

    goto LABEL_30;
  }

- (int64_t)getInternalStatus
{
  return -[MSDProgressUpdater currentStage](self, "currentStage");
}

- (id)getContentUpdateType
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));

  if (!v3) {
    return @"ContentUpdateTypeFreshInstall";
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
  unsigned int v5 = [v4 preInstalledContent];

  if (v5) {
    return @"ContentUpdateTypeFreshInstallFactory";
  }
  else {
    return @"ContentUpdateTypeIncrementalUpdate";
  }
}

- (void)demoUpdateFailed:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  unsigned __int8 v5 = [v4 isOfflineMode];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MSDReportErrorRequest);
    -[MSDReportErrorRequest setError:](v6, "setError:", v3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handleRequestSync:v6]);

    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
      int v12 = 136315394;
      unsigned __int8 v13 = "-[MSDProgressUpdater demoUpdateFailed:]";
      __int16 v14 = 2114;
      id v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: sent error status to hub; error=%{public}@",
        (uint8_t *)&v12,
        0x16u);
    }
  }
}

- (void)demoUpdateCompleted:(id)a3
{
  id v7 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  if (([v3 isOfflineMode] & 1) == 0)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___MSDReportDoneRequest);
    -[MSDReportDoneRequest setRequestStr:](v4, "setRequestStr:", v7);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 getSavedError]);
    -[MSDReportDoneRequest setError:](v4, "setError:", v5);

    -[MSDServerRequest setCompletion:](v4, "setCompletion:", &stru_1000FAA00);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
    [v6 handleRequestAsync:v4];
  }
}

- (MSDBundleProgressTracker)backgroundBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBackgroundBundle:(id)a3
{
}

- (MSDBundleProgressTracker)installedBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInstalledBundle:(id)a3
{
}

- (MSDBundleProgressTracker)installingBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInstallingBundle:(id)a3
{
}

- (MSDBundleProgressTracker)bundleInProgress
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setBundleInProgress:(id)a3
{
}

- (int)currentStage
{
  return self->_currentStage;
}

- (void)setCurrentStage:(int)a3
{
  self->_currentStage = a3;
}

- (void).cxx_destruct
{
}

@end
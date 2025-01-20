@interface SAHelper
+ (BOOL)isSAFSupported;
+ (id)dynamicRegistrationLock;
+ (int64_t)runAppSizerWithActivity:(id)a3 completionHandler:(id)a4;
+ (unint64_t)getOVPFileAndVolumeSize;
- (BOOL)isValidMountPoint:(id)a3;
- (void)addAppSizerHandler:(id)a3 reply:(id)a4;
- (void)addURLSizerHandler:(id)a3 withURLs:(id)a4 reply:(id)a5;
- (void)clearLastTelemetryData:(id)a3;
- (void)computeSizeOfSystemVolume:(id)a3;
- (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)disableAppSizerResultsFilteringWithReply:(id)a3;
- (void)getAppPaths:(id)a3 options:(int)a4 reply:(id)a5;
- (void)getLastTelemetryData:(id)a3;
- (void)getPurgeableInfo:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)importFromPlist:(id)a3 reply:(id)a4;
- (void)pingWithReply:(id)a3;
- (void)registerPaths:(id)a3 reply:(id)a4;
- (void)removeAppSizerHandler:(id)a3;
- (void)removeURLSizerHandler:(id)a3;
- (void)runAppSizer:(id)a3;
- (void)runAppSizerWithHandler:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)runAppSizerWithScanOptions:(unint64_t)a3 reply:(id)a4;
- (void)runFullScan:(id)a3;
- (void)runURLSizerWithID:(id)a3 reply:(id)a4;
- (void)setAppSizerMaxRerunTimeout:(unsigned int)a3 reply:(id)a4;
- (void)setAppSizerResultsFilteringOptionsToDefaultWithReply:(id)a3;
- (void)setEnableTTR:(BOOL)a3 reply:(id)a4;
- (void)setForceTTR:(BOOL)a3 reply:(id)a4;
- (void)setForceTelemetry:(id)a3;
- (void)unregisterPaths:(id)a3 reply:(id)a4;
@end

@implementation SAHelper

+ (id)dynamicRegistrationLock
{
  if (qword_10005A9D8 != -1) {
    dispatch_once(&qword_10005A9D8, &stru_10004C630);
  }
  return (id)qword_10005A9D0;
}

- (void)pingWithReply:(id)a3
{
}

- (void)runFullScan:(id)a3
{
  v3 = (void (**)(id, id))a3;
  uint64_t v4 = SALog(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002E8A0(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = objc_opt_new(&OBJC_CLASS___SAVolumeScanner);
  -[SAVolumeScanner setScanOptions:](v13, "setScanOptions:", 3LL);
  v14 = objc_opt_new(&OBJC_CLASS___SAAppPathList);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList defaultList](v14, "defaultList"));

  v16 = objc_opt_new(&OBJC_CLASS___SAPathList);
  -[SAPathList updateWithAppPathList:](v16, "updateWithAppPathList:", v15);
  v17 = sub_1000121C8();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v30 = 0LL;
  -[SAVolumeScanner fullVolumeScanFromPath:withPathList:error:]( v13,  "fullVolumeScanFromPath:withPathList:error:",  v18,  v16,  &v30);
  id v19 = v30;

  uint64_t v21 = SALog(v20);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_10002E830(v22, v23, v24, v25, v26, v27, v28, v29);
  }

  v3[2](v3, v19);
}

- (void)runAppSizer:(id)a3
{
}

- (void)runAppSizerWithScanOptions:(unint64_t)a3 reply:(id)a4
{
  uint64_t v5 = (*((uint64_t (**)(id, void))a4 + 2))(a4, 0LL);
  uint64_t v6 = SALog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002E980(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  v15 = objc_opt_new(&OBJC_CLASS___SAVolumeScanner);
  uint64_t v25 = 0LL;
  uint64_t v16 = SALog( -[SAVolumeScanner runAppSizerWithAsyncBlocksNum:withRunMode:withActivity:withScanOptions:error:]( v15,  "runAppSizerWithAsyncBlocksNum:withRunMode:withActivity:withScanOptions:error:",  4LL,  2LL,  0LL,  a3,  &v25));
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10002E910(v17, v18, v19, v20, v21, v22, v23, v24);
  }
}

- (void)addURLSizerHandler:(id)a3 withURLs:(id)a4 reply:(id)a5
{
  uint64_t v7 = (void (**)(id, void *))a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = SALog(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002EA1C();
  }

  id v12 = +[SAURLSizerConfiguration newWithReplyController:urls:]( &OBJC_CLASS___SAURLSizerConfiguration,  "newWithReplyController:urls:",  v9,  v8);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SAURlSizersManager addURLSizerConfiguration:]( &OBJC_CLASS___SAURlSizersManager,  "addURLSizerConfiguration:",  v12));
  v7[2](v7, v13);

  uint64_t v15 = SALog(v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10002E9F0();
  }
}

- (void)runURLSizerWithID:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(id, void))a4;
  id v6 = a3;
  uint64_t v7 = SALog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002EA74();
  }

  id v9 = objc_opt_new(&OBJC_CLASS___SAVolumeScanner);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SAURlSizersManager getURLSizerConfiguration:]( &OBJC_CLASS___SAURlSizersManager,  "getURLSizerConfiguration:",  v6));

  -[SAVolumeScanner setScanOptions:](v9, "setScanOptions:", 1LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 urls]);
  -[SAVolumeScanner scanURLs:withSizer:](v9, "scanURLs:withSizer:", v11, v10);

  v5[2](v5, 0LL);
  uint64_t v13 = SALog(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10002EA48();
  }
}

+ (BOOL)isSAFSupported
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v2 = [&off_10004FB88 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v19;
    char v6 = 1;
    *(void *)&__int128 v3 = 136315394LL;
    __int128 v17 = v3;
    char v7 = 1;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(&off_10004FB88);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        BOOL v10 = +[SASupport volumeSupportsAttributionTags:]( &OBJC_CLASS___SASupport,  "volumeSupportsAttributionTags:",  v9,  v17);
        if (!v10)
        {
          uint64_t v11 = SALog(v10);
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = "+[SAHelper isSAFSupported]";
            __int16 v24 = 2112;
            uint64_t v25 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Volume (%@) doesn't support tagging",  buf,  0x16u);
          }

          char v7 = 0;
        }

        BOOL v13 = +[SASupport volumeSupportsAttributionTags:](&OBJC_CLASS___SASupport, "volumeSupportsAttributionTags:", v9);
        if (!v13)
        {
          uint64_t v14 = SALog(v13);
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = "+[SAHelper isSAFSupported]";
            __int16 v24 = 2112;
            uint64_t v25 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Volume (%@) doesn't support clone mapping",  buf,  0x16u);
          }

          char v6 = 0;
        }
      }

      id v4 = [&off_10004FB88 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v4);
  }

  else
  {
    char v6 = 1;
    char v7 = 1;
  }

  return v6 & v7 & 1;
}

+ (int64_t)runAppSizerWithActivity:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = objc_opt_new(&OBJC_CLASS___SAVolumeScanner);
  id v8 = +[SAActivity newWithActivity:andCompletionHandler:]( &OBJC_CLASS___SAActivity,  "newWithActivity:andCompletionHandler:",  v6,  v5);

  uint64_t v11 = 0LL;
  int64_t v9 = 1LL;
  if (-[SAVolumeScanner runAppSizerWithAsyncBlocksNum:withRunMode:withActivity:withScanOptions:error:]( v7,  "runAppSizerWithAsyncBlocksNum:withRunMode:withActivity:withScanOptions:error:",  4LL,  1LL,  v8,  18945LL,  &v11) == 2) {
    int64_t v9 = 2LL;
  }
  [v8 setActivityResult:v9];

  return v9;
}

- (void)addAppSizerHandler:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SACallbackManager addAppSizerHandler:](&OBJC_CLASS___SACallbackManager, "addAppSizerHandler:", a3));
  v5[2](v5, v6);
}

- (void)removeAppSizerHandler:(id)a3
{
}

- (void)removeURLSizerHandler:(id)a3
{
}

- (void)setAppSizerResultsFilteringOptionsToDefaultWithReply:(id)a3
{
  __int128 v3 = (void (**)(id, void))a3;
  uint64_t v4 = SALog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002EB10(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  +[SAVolumeScanner setAppSizerResultsFilteringToDefault]( &OBJC_CLASS___SAVolumeScanner,  "setAppSizerResultsFilteringToDefault");
  +[SATelemetryManager setAppsFilteringToDefault](&OBJC_CLASS___SATelemetryManager, "setAppsFilteringToDefault");
  v3[2](v3, 0LL);

  uint64_t v14 = SALog(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10002EAA0(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)disableAppSizerResultsFilteringWithReply:(id)a3
{
  __int128 v3 = (void (**)(id, void))a3;
  uint64_t v4 = SALog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002EBF0(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  +[SAVolumeScanner disableAppSizerResultsFiltering](&OBJC_CLASS___SAVolumeScanner, "disableAppSizerResultsFiltering");
  +[SATelemetryManager disableAppsFiltering](&OBJC_CLASS___SATelemetryManager, "disableAppsFiltering");
  v3[2](v3, 0LL);

  uint64_t v14 = SALog(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10002EB80(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (BOOL)isValidMountPoint:(id)a3
{
  uint64_t v3 = qword_10005A9E8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10005A9E8, &stru_10004C650);
  }
  unsigned __int8 v5 = [(id)qword_10005A9E0 containsObject:v4];

  return v5;
}

- (void)setForceTelemetry:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  uint64_t v4 = SALog(v3);
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002ECD0(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  +[SAVolumeScanner setForceTelemetry](&OBJC_CLASS___SAVolumeScanner, "setForceTelemetry");
  v3[2](v3, 0LL);

  uint64_t v14 = SALog(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10002EC60(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)registerPaths:(id)a3 reply:(id)a4
{
  id v98 = a3;
  v97 = (void (**)(id, void *))a4;
  v102 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v99 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = SALog(v99);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002EF34(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if (v98)
  {
    id v14 = [v98 count];
    if (v14)
    {
      id obj = (id)objc_claimAutoreleasedReturnValue(+[SAHelper dynamicRegistrationLock](&OBJC_CLASS___SAHelper, "dynamicRegistrationLock"));
      objc_sync_enter(obj);
      id v115 = 0LL;
      v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v15 = [v93 createDirectoryAtPath:@"/var/db/spaceattribution" withIntermediateDirectories:1 attributes:0 error:&v115];
      uint64_t v16 = (NSError *)v115;
      v94 = v16;
      if ((v15 & 1) == 0)
      {
        uint64_t v65 = SALog(v16);
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v94, "description"));
          sub_10002EEBC(v67, buf, v66);
        }

        v68 = v94;
        v97[2](v97, v94);
        goto LABEL_59;
      }

      uint64_t v17 = objc_opt_new(&OBJC_CLASS___SAAppPathList);
      BOOL v18 = -[SAAppPathList loadFromDisk](v17, "loadFromDisk");
      v103 = v17;
      if (!v18)
      {
        uint64_t v19 = SALog(v18);
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10002EE90();
        }
      }

      uint64_t v21 = objc_autoreleasePoolPush();
      uint64_t v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      __int128 v112 = 0u;
      __int128 v111 = 0u;
      id v23 = v98;
      id v24 = [v23 countByEnumeratingWithState:&v111 objects:v123 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v112;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v112 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v111 + 1) + 8 * (void)i) url]);
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v28,  1LL));

            -[NSMutableArray addObject:](v22, "addObject:", v29);
          }

          id v24 = [v23 countByEnumeratingWithState:&v111 objects:v123 count:16];
        }

        while (v24);
      }

      unsigned int v92 = -[SAAppPathList checkURLsAreOverlappingWithURLs:](v103, "checkURLsAreOverlappingWithURLs:", v22);
      objc_autoreleasePoolPop(v21);
      id v30 = v103;
      if ((v92 & 1) == 0)
      {
        __int128 v109 = 0u;
        __int128 v110 = 0u;
        __int128 v107 = 0u;
        __int128 v108 = 0u;
        id v100 = v23;
        id v31 = [v100 countByEnumeratingWithState:&v107 objects:v122 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v108;
          do
          {
            for (j = 0LL; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v108 != v32) {
                objc_enumerationMutation(v100);
              }
              v34 = *(void **)(*((void *)&v107 + 1) + 8LL * (void)j);
              v35 = objc_autoreleasePoolPush();
              v36 = (void *)objc_claimAutoreleasedReturnValue([v34 bundleID]);
              v37 = -[SAAppPath initWithBundleID:](objc_alloc(&OBJC_CLASS___SAAppPath), "initWithBundleID:", v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue([v34 url]);
              v39 = (void *)objc_claimAutoreleasedReturnValue([v38 path]);
              v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v39,  1LL));

              v41 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList appPathForBundleID:](v103, "appPathForBundleID:", v36));
              LODWORD(v38) = v41 == 0LL;

              if ((_DWORD)v38)
              {
                uint64_t v43 = SALog(v42);
                v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v36;
                  _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "New app in appPathList %@",  buf,  0xCu);
                }
              }

              v45 = (void *)objc_claimAutoreleasedReturnValue(+[SASupport getURLMountPoint:](&OBJC_CLASS___SASupport, "getURLMountPoint:", v40));
              if (v45 && !(BOOL v46 = -[SAHelper isValidMountPoint:](self, "isValidMountPoint:", v45)))
              {
                uint64_t v47 = SALog(v46);
                v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v50 = objc_claimAutoreleasedReturnValue([v34 url]);
                  *(_DWORD *)buf = 136315650;
                  *(void *)&uint8_t buf[4] = "-[SAHelper registerPaths:reply:]";
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v50;
                  *(_WORD *)&buf[22] = 2112;
                  v125 = v45;
                  v96 = (void *)v50;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%s: Rejecting URL (%@) - un-allowed mount point (%@).",  buf,  0x20u);
                }

                v49 = (void *)objc_claimAutoreleasedReturnValue([v34 url]);
                -[NSMutableArray addObject:](v99, "addObject:", v49);
              }

              else
              {
                *(void *)buf = 0LL;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x2020000000LL;
                LOBYTE(v125) = 0;
                v104[0] = _NSConcreteStackBlock;
                v104[1] = 3221225472LL;
                v104[2] = sub_100006EE8;
                v104[3] = &unk_10004C678;
                v104[4] = v34;
                v105 = v102;
                v106 = buf;
                -[SAAppPathList isPathInfoClaimedByAnotherApp:reply:]( v103,  "isPathInfoClaimedByAnotherApp:reply:",  v34,  v104);
                if (!*(_BYTE *)(*(void *)&buf[8] + 24LL))
                {
                  else {
                    -[SAAppPath addSharedURL:](v37, "addSharedURL:", v40);
                  }
                  -[SAAppPathList updateWithAppPath:](v103, "updateWithAppPath:", v37);
                }

                _Block_object_dispose(buf, 8);
              }

              objc_autoreleasePoolPop(v35);
            }

            id v31 = [v100 countByEnumeratingWithState:&v107 objects:v122 count:16];
          }

          while (v31);
        }

        id v30 = v103;
      }

      if (-[NSMutableArray count](v99, "count"))
      {
        v51 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v120 = NSLocalizedFailureReasonErrorKey;
        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The following URLs are mounted on un-allowed mount points:\n%@\nAllowed mount points: %@",  v99,  &off_10004FBB8));
        v121 = v52;
        v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v121,  &v120,  1LL));
        v54 = -[NSError initWithDomain:code:userInfo:]( v51,  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v53);
      }

      else
      {
        id v69 = -[NSMutableArray count](v102, "count");
        if (v69)
        {
          v70 = objc_alloc(&OBJC_CLASS___NSError);
          NSErrorUserInfoKey v118 = NSLocalizedFailureReasonErrorKey;
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The following paths were already registered as unique for other apps OR supplied twice on the same request:\n %@",  v102));
          v119 = v52;
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v119,  &v118,  1LL));
          v54 = -[NSError initWithDomain:code:userInfo:]( v70,  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  17LL,  v53);
        }

        else
        {
          if (!v92)
          {
            v68 = v94;
            if (v94) {
              goto LABEL_55;
            }
LABEL_54:
            id v69 = (id)-[SAAppPathList saveToDisk](v30, "saveToDisk");
            if ((v69 & 1) == 0)
            {
              uint64_t v82 = SALog(v69);
              v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                sub_10002EE20(v83, v84, v85, v86, v87, v88, v89, v90);
              }

              v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  513LL,  0LL));
              v97[2](v97, v91);

              v81 = v103;
              goto LABEL_58;
            }

- (void)runAppSizerWithHandler:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, id))a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_new(&OBJC_CLASS___SAVolumeScanner);
  -[SAHelper addAppSizerHandler:reply:](self, "addAppSizerHandler:reply:", v9, &stru_10004C6B8);

  id v12 = 0LL;
  -[SAVolumeScanner runAppSizerWithAsyncBlocksNum:withRunMode:withActivity:withScanOptions:error:]( v10,  "runAppSizerWithAsyncBlocksNum:withRunMode:withActivity:withScanOptions:error:",  4LL,  2LL,  0LL,  a4,  &v12);
  id v11 = v12;
  v8[2](v8, v11);
}

- (void)unregisterPaths:(id)a3 reply:(id)a4
{
  id v56 = a3;
  uint64_t v57 = (void (**)(id, id))a4;
  uint64_t v5 = SALog(v57);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002F160(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  id obj = (id)objc_claimAutoreleasedReturnValue(+[SAHelper dynamicRegistrationLock](&OBJC_CLASS___SAHelper, "dynamicRegistrationLock"));
  objc_sync_enter(obj);
  uint64_t v59 = objc_opt_new(&OBJC_CLASS___SAAppPathList);
  BOOL v14 = -[SAAppPathList loadFromDisk](v59, "loadFromDisk");
  if (!v14)
  {
    uint64_t v35 = SALog(v14);
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10002F0F0(v36, v37, v38, v39, v40, v41, v42, v43);
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  260LL,  0LL,  v56));
    v57[2](v57, v15);
    goto LABEL_25;
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v15 = v56;
  id v16 = [v15 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v61;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v61 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleID", v56));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList appPathForBundleID:](v59, "appPathForBundleID:", v20));
        if (!v21)
        {
          uint64_t v44 = SALog(0LL);
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_10002F084();
          }

          BOOL v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1024LL,  0LL));
          v57[2](v57, v46);

          goto LABEL_25;
        }

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 url]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v23,  1LL));

        [v21 removeUniqueURL:v24];
        [v21 removeSharedURL:v24];
      }

      id v16 = [v15 countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  -[SAAppPathList clearAppsWithZeroPath](v59, "clearAppsWithZeroPath");
  BOOL v25 = -[SAAppPathList saveToDisk](v59, "saveToDisk");
  if (!v25)
  {
    uint64_t v47 = SALog(v25);
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_10002F014(v48, v49, v50, v51, v52, v53, v54, v55);
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  513LL,  0LL));
    v57[2](v57, v15);
LABEL_25:

    goto LABEL_26;
  }

  uint64_t v26 = SALog(v25);
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_10002EFA4(v27, v28, v29, v30, v31, v32, v33, v34);
  }

  v57[2](v57, 0LL);
LABEL_26:

  objc_sync_exit(obj);
}

- (void)getAppPaths:(id)a3 options:(int)a4 reply:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, void *))a5;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = sub_10000782C;
  uint64_t v39 = sub_10000783C;
  id v40 = 0LL;
  if (a4 == 1)
  {
    uint64_t v17 = objc_opt_new(&OBJC_CLASS___SAAppPathList);
    id v23 = -[SAAppPathList defaultList](v17, "defaultList");
    uint64_t v22 = objc_opt_new(&OBJC_CLASS___SAPathList);
    -[SAPathList updateWithAppPathList:](v22, "updateWithAppPathList:", v17);
    uint64_t v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[SAPathList generateDictionary](v22, "generateDictionary"));
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    if (a4)
    {
LABEL_15:
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL,  (void)v25));

      uint64_t v9 = 0LL;
      goto LABEL_16;
    }

    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v13 = (void *)v36[5];
    v36[5] = (uint64_t)v12;

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100007844;
    v32[3] = &unk_10004C6E0;
    uint64_t v34 = &v35;
    BOOL v14 = v11;
    uint64_t v33 = (SAPathList *)v14;
    +[SAQuery installedAppsAtVolume:sortForUrgency:options:block:]( &OBJC_CLASS___SAQuery,  "installedAppsAtVolume:sortForUrgency:options:block:",  0LL,  4LL,  1LL,  v32);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100007A74;
    v29[3] = &unk_10004C708;
    uint64_t v31 = &v35;
    id v15 = v14;
    uint64_t v30 = v15;
    +[SAQuery installedAppGroupsAtVolume:](&OBJC_CLASS___SAQuery, "installedAppGroupsAtVolume:", v29);
    id v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    uint64_t v17 = v15;
    id v18 = -[SAAppPathList countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v25,  v41,  16LL);
    if (v18)
    {
      uint64_t v19 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)i), "getDictionary", (void)v25));
          -[NSMutableArray addObject:](v16, "addObject:", v21);
        }

        id v18 = -[SAAppPathList countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v25,  v41,  16LL);
      }

      while (v18);
    }

    uint64_t v10 = v16;
    uint64_t v22 = v33;
    uint64_t v9 = v10;
  }

  if (!v9 || !-[NSMutableArray count](v9, "count")) {
    goto LABEL_15;
  }
  id v24 = 0LL;
LABEL_16:
  v8[2](v8, v9, v24);
  _Block_object_dispose(&v35, 8);
}

- (void)getPurgeableInfo:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  char v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, void *))a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SAQuery getFSPurgeableInfo:options:]( &OBJC_CLASS___SAQuery,  "getFSPurgeableInfo:options:",  v7,  (2 * v6) & 4));
  if (v9)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v11 = SALog(0LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002F1D0();
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL));
  }

  v8[2](v8, v9, v10);
}

+ (unint64_t)getOVPFileAndVolumeSize
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  uint64_t v2 = APFSOverProvModel(a1, a2);
  int v3 = v2;
  uint64_t v4 = SALog(v2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "+[SAHelper getOVPFileAndVolumeSize]";
    __int16 v16 = 1024;
    int v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: overprovisioning model %d", buf, 0x12u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007F8C;
  v8[3] = &unk_10004C730;
  v8[4] = &v10;
  BOOL v9 = v3 == 1;
  +[SAUtilities getFileSize:reply:]( &OBJC_CLASS___SAUtilities,  "getFileSize:reply:",  @"/private/var/.overprovisioning_file",  v8);
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)computeSizeOfSystemVolume:(id)a3
{
  uint64_t v21 = (void (**)(id, SAVolumeSizeInfo *, void))a3;
  uint64_t v3 = SALog(v21);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002F30C(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v35 = 0LL;
  v36[0] = &v35;
  v36[1] = 0x2020000000LL;
  v36[2] = 0LL;
  uint64_t v33 = 0LL;
  v34[0] = &v33;
  v34[1] = 0x2020000000LL;
  v34[2] = 0LL;
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_10000782C;
  uint64_t v31 = sub_10000783C;
  id v32 = 0LL;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v12 = [&off_10004FBD0 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
LABEL_5:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(&off_10004FBD0);
      }
      id v15 = *(id *)(*((void *)&v23 + 1) + 8 * v14);
      id v16 = [v15 UTF8String];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000083C0;
      v22[3] = &unk_10004C758;
      v22[4] = v15;
      v22[5] = &v35;
      v22[6] = &v33;
      v22[7] = &v27;
      +[SASupport getVolSizeFromAttrList:completionHandler:]( &OBJC_CLASS___SASupport,  "getVolSizeFromAttrList:completionHandler:",  v16,  v22);
      if (v28[5]) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [&off_10004FBD0 countByEnumeratingWithState:&v23 objects:v37 count:16];
        if (v12) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  unint64_t v17 = +[SAHelper getOVPFileAndVolumeSize](&OBJC_CLASS___SAHelper, "getOVPFileAndVolumeSize");
  *(void *)(v36[0] + 24LL) += v17;
  uint64_t v18 = SALog(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10002F268((uint64_t)v36, (uint64_t)v34, v19);
  }

  uint64_t v20 = objc_opt_new(&OBJC_CLASS___SAVolumeSizeInfo);
  -[SAVolumeSizeInfo setUsed:](v20, "setUsed:", *(void *)(v36[0] + 24LL));
  -[SAVolumeSizeInfo setCapacity:](v20, "setCapacity:", *(void *)(v34[0] + 24LL));
  v21[2](v21, v20, v28[5]);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v35, 8);
}

- (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  id v10 = v8;
  uint64_t v11 = strcmp((const char *)[v10 fileSystemRepresentation], "/");
  if ((_DWORD)v11)
  {
    uint64_t v12 = SALog(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002F47C(v10, v13);
    }

    bzero(&v50, 0x878uLL);
    id v14 = v10;
    if (statfs((const char *)[v14 fileSystemRepresentation], &v50))
    {
      id v15 = __error();
      uint64_t v16 = *v15;
      uint64_t v17 = SALog(v15);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002F3E4(v14, v16, v18);
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v16,  0LL));
      v9[2](v9, 0LL, v19);
    }

    else
    {
      uint64_t v38 = 0LL;
      uint64_t v39 = &v38;
      uint64_t v40 = 0x2020000000LL;
      uint64_t v41 = 0LL;
      uint64_t v34 = 0LL;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x2020000000LL;
      uint64_t v37 = 0LL;
      uint64_t v28 = 0LL;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x3032000000LL;
      uint64_t v31 = sub_10000782C;
      id v32 = sub_10000783C;
      id v33 = 0LL;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000088D4;
      v27[3] = &unk_10004C780;
      v27[4] = &v38;
      v27[5] = &v34;
      v27[6] = &v28;
      id v20 = +[SASupport getVolSizeFromAttrList:completionHandler:]( &OBJC_CLASS___SASupport,  "getVolSizeFromAttrList:completionHandler:",  v50.f_mntonname,  v27);
      if (v29[5])
      {
        ((void (*)(void (**)(id, void, void *), void))v9[2])(v9, 0LL);
      }

      else
      {
        uint64_t v21 = SALog(v20);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v25 = v39[3];
          uint64_t v26 = v35[3];
          *(_DWORD *)buf = 136315906;
          uint64_t v43 = "-[SAHelper computeSizeOfVolumeAtURL:options:completionHandler:]";
          __int16 v44 = 1024;
          int v45 = v6;
          __int16 v46 = 2048;
          uint64_t v47 = v25;
          __int16 v48 = 2048;
          uint64_t v49 = v26;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s:with options = %u, attrListUsed  = %llu, capacity = %llu",  buf,  0x26u);
        }

        __int128 v23 = objc_opt_new(&OBJC_CLASS___SAVolumeSizeInfo);
        -[SAVolumeSizeInfo setUsed:](v23, "setUsed:", v39[3]);
        -[SAVolumeSizeInfo setRawUsed:](v23, "setRawUsed:", v39[3]);
        -[SAVolumeSizeInfo setCapacity:](v23, "setCapacity:", v35[3]);
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v50.f_mntonname));
        -[SAVolumeSizeInfo setMountedOn:](v23, "setMountedOn:", v24);

        ((void (**)(id, SAVolumeSizeInfo *, void *))v9)[2](v9, v23, 0LL);
      }

      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v38, 8);
    }
  }

  else
  {
    -[SAHelper computeSizeOfSystemVolume:](self, "computeSizeOfSystemVolume:", v9);
  }
}

- (void)setForceTTR:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = SALog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002F57C();
  }

  +[SATapToRadar setForceTTR:](&OBJC_CLASS___SATapToRadar, "setForceTTR:", v4);
  v5[2](v5, 0LL);

  uint64_t v9 = SALog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002F50C(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

- (void)setEnableTTR:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = SALog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002F65C();
  }

  +[SATapToRadar setEnableTTR:](&OBJC_CLASS___SATapToRadar, "setEnableTTR:", v4);
  v5[2](v5, 0LL);

  uint64_t v9 = SALog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002F5EC(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

- (void)setAppSizerMaxRerunTimeout:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = SALog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002F6CC(v4, v7);
  }

  uint64_t v8 = objc_opt_new(&OBJC_CLASS___SAVolumeScanner);
  -[SAVolumeScanner setAppSizerMaxRerunTimeout:](v8, "setAppSizerMaxRerunTimeout:", v4);

  v5[2](v5, 0LL);
}

- (void)getLastTelemetryData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SALog(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002F73C(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  +[SATelemetryManager getLastTelemetryData:](&OBJC_CLASS___SATelemetryManager, "getLastTelemetryData:", v3);
}

- (void)importFromPlist:(id)a3 reply:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = SALog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002F7AC();
  }

  uint64_t v9 = objc_opt_new(&OBJC_CLASS___SAAppPathList);
  -[SAAppPathList loadFromDisk](v9, "loadFromDisk");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList importFromPlists:](v9, "importFromPlists:", v5));
  -[SAAppPathList saveToDisk](v9, "saveToDisk");
  v6[2](v6, v10);
}

- (void)clearLastTelemetryData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SALog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002F81C(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  +[SATelemetryManager clearLastTelemetryData:](&OBJC_CLASS___SATelemetryManager, "clearLastTelemetryData:", v3);
}

@end
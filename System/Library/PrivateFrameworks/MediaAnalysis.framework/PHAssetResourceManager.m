@interface PHAssetResourceManager
+ (id)vcp_fileCacheDirectoryPath;
+ (int)vcp_requestFileURLForAssetResource:(id)a3 taskID:(unint64_t)a4 completionHandler:(id)a5;
+ (int)vcp_requestInMemoryDownload:(id)a3 taskID:(unint64_t)a4 data:(id *)a5 cancel:(id)a6;
+ (void)vcp_createFileCacheDirectoryIfNeeded;
+ (void)vcp_flushFileCache;
+ (void)vcp_flushResourceURL:(id)a3;
+ (void)vcp_reportDownloadBytes:(unint64_t)a3 taskID:(unint64_t)a4;
@end

@implementation PHAssetResourceManager

+ (id)vcp_fileCacheDirectoryPath
{
  v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"com.apple.mediaanalysis"]);

  return v4;
}

+ (void)vcp_createFileCacheDirectoryIfNeeded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResourceManager vcp_fileCacheDirectoryPath]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_fileCacheDirectoryPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v4 = [v3 fileExistsAtPath:v2 isDirectory:&v38];

  if (v4) {
    BOOL v7 = v38 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v37 = 0LL;
      unsigned __int8 v9 = [v8 removeItemAtPath:v2 error:&v37];
      id v10 = v37;

      if ((v9 & 1) == 0)
      {
        uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
        if ((int)v13 >= 3)
        {
          uint64_t v15 = VCPLogInstance(v13, v14);
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          os_log_type_t v17 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v16, v17))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
            *(_DWORD *)buf = 138412290;
            v40 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[Resource] Failed to remove file obstructing resource file cache directory (%@)",  buf,  0xCu);
          }
        }
      }
    }

    else
    {
      id v10 = 0LL;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v36 = v10;
    unsigned __int8 v25 = [v24 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v22 = v36;

    uint64_t v28 = MediaAnalysisLogLevel(v26, v27);
    if ((v25 & 1) != 0)
    {
      if ((int)v28 >= 6)
      {
        uint64_t v30 = VCPLogInstance(v28, v29);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        os_log_type_t v32 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v31, v32))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "[Resource] Created resource file cache directory",  buf,  2u);
        }

+ (int)vcp_requestFileURLForAssetResource:(id)a3 taskID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_msgSend((id)objc_opt_class(a1), "vcp_createFileCacheDirectoryIfNeeded");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_uniformTypeIdentifier"));
  os_log_type_t v32 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredFilenameExtension]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 assetLocalIdentifier]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHObject uuidFromLocalIdentifier:](&OBJC_CLASS___PHObject, "uuidFromLocalIdentifier:", v11));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathExtension:v14]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathExtension:v32]);

  id v17 = objc_msgSend((id)objc_opt_class(a1), "vcp_fileCacheDirectoryPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v16]);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v19));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000175EC;
  v39[3] = &unk_1001BA138;
  id v21 = v8;
  id v40 = v21;
  id v22 = v20;
  id v41 = v22;
  os_log_type_t v23 = objc_retainBlock(v39);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100017830;
  v35[3] = &unk_1001BA160;
  id v24 = v21;
  id v37 = v22;
  id v38 = v9;
  id v36 = v24;
  id v25 = v22;
  id v26 = v9;
  uint64_t v27 = objc_retainBlock(v35);
  uint64_t v28 = objc_alloc_init(&OBJC_CLASS___PHAssetResourceRequestOptions);
  -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v28, "setNetworkAccessAllowed:", 1LL);
  -[PHAssetResourceRequestOptions setDownloadPriority:](v28, "setDownloadPriority:", 0LL);
  -[PHAssetResourceRequestOptions setDownloadIntent:](v28, "setDownloadIntent:", 6LL);
  -[PHAssetResourceRequestOptions setPruneAfterAvailableOnLowDisk:](v28, "setPruneAfterAvailableOnLowDisk:", 1LL);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100017944;
  v33[3] = &unk_1001B9850;
  id v34 = v24;
  id v29 = v24;
  -[PHAssetResourceRequestOptions setProgressHandler:](v28, "setProgressHandler:", v33);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetResourceManager defaultManager](&OBJC_CLASS___PHAssetResourceManager, "defaultManager"));
  LODWORD(v14) = [v30 requestFileURLForAssetResource:v29 options:v28 urlReceivedHandler:v23 completionHandler:v27];

  return (int)v14;
}

+ (void)vcp_flushResourceURL:(id)a3
{
  id v3 = a3;
  uint64_t v5 = MediaAnalysisLogLevel(v3, v4);
  if ((int)v5 >= 7)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
      *(_DWORD *)buf = 138412290;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[Resource] Flushing cached resource: %@", buf, 0xCu);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v23 = 0LL;
  unsigned __int8 v12 = [v11 removeItemAtURL:v3 error:&v23];
  id v13 = v23;

  if ((v12 & 1) == 0)
  {
    uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v16 >= 3)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
        *(_DWORD *)buf = 138412546;
        id v25 = v21;
        __int16 v26 = 2112;
        uint64_t v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[Resource] Failed to delete %@ (%@)", buf, 0x16u);
      }
    }
  }
}

+ (void)vcp_flushFileCache
{
  uint64_t v3 = MediaAnalysisLogLevel(a1, a2);
  if ((int)v3 >= 7)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[Resource] Flushing file cache", buf, 2u);
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = objc_msgSend((id)objc_opt_class(a1), "vcp_fileCacheDirectoryPath");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 enumeratorAtPath:v10]);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v18 = (void *)objc_opt_class(a1);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vcp_fileCacheDirectoryPath", (void)v22));
        os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathComponent:v17]);

        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v20));
        objc_msgSend(a1, "vcp_flushResourceURL:", v21);
      }

      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v14);
  }
}

+ (void)vcp_reportDownloadBytes:(unint64_t)a3 taskID:(unint64_t)a4
{
  uint64_t v6 = MediaAnalysisLogLevel(a1, a2);
  if ((int)v6 >= 7)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = VCPAnalyticsEventDasDutyCycleTaskKey;
      uint64_t v12 = VCPTaskIDDescription(a4);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = qos_class_self();
      uint64_t v15 = VCPMAQoSDescription(v14);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138413058;
      uint64_t v30 = v11;
      __int16 v31 = 2112;
      os_log_type_t v32 = v13;
      __int16 v33 = 2112;
      id v34 = v16;
      __int16 v35 = 2048;
      unint64_t v36 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[DAS QoS] %@: %@ (%@) download %lu bytes", buf, 0x2Au);
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  uint64_t v18 = VCPAnalyticsEventDasDutyCycleTaskKey;
  uint64_t v26 = VCPAnalyticsFieldKeyTaskName;
  uint64_t v19 = VCPTaskIDDescription(a4);
  os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v27 = VCPAnalyticsFieldKeyQoS;
  uint64_t v21 = qos_class_self();
  uint64_t v22 = VCPMAQoSDescription(v21);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3,  v26,  v27,  VCPAnalyticsFieldKeyDownloadAssetCount,  VCPAnalyticsFieldKeyDownloadBytes,  v20,  v23,  &off_1001C81F8));
  v28[3] = v24;
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  &v26,  4LL));
  [v17 sendEvent:v18 withAnalytics:v25];
}

+ (int)vcp_requestInMemoryDownload:(id)a3 taskID:(unint64_t)a4 data:(id *)a5 cancel:(id)a6
{
  id v9 = a3;
  os_log_type_t v10 = (uint64_t (**)(void))a6;
  id obj = a1;
  objc_sync_enter(obj);
  v68 = v9;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 assetLocalIdentifier]);
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 7)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%@] Attempt to download resource: %@", buf, 0x16u);
    }
  }

  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___PHAssetResourceRequestOptions);
  -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v18, "setNetworkAccessAllowed:", 1LL);
  -[PHAssetResourceRequestOptions setDownloadIsTransient:](v18, "setDownloadIsTransient:", 1LL);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_100102EE8;
  v78[3] = &unk_1001B9850;
  id v19 = v11;
  id v79 = v19;
  v66 = objc_retainBlock(v78);
  -[PHAssetResourceRequestOptions setProgressHandler:](v18, "setProgressHandler:", v66);
  os_log_type_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  int v85 = 0;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_100102FC4;
  v71[3] = &unk_1001BD798;
  id v65 = v19;
  id v72 = v65;
  v75 = buf;
  id v76 = obj;
  uint64_t v22 = v20;
  v73 = v22;
  unint64_t v77 = a4;
  __int128 v23 = v21;
  v74 = v23;
  __int128 v24 = objc_retainBlock(v71);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_100103174;
  v69[3] = &unk_1001BD7C0;
  __int128 v25 = v22;
  v70 = v25;
  uint64_t v26 = objc_retainBlock(v69);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetResourceManager defaultManager](&OBJC_CLASS___PHAssetResourceManager, "defaultManager"));
  id v28 = [v27 requestDataForAssetResource:v68 options:v18 dataReceivedHandler:v26 completionHandler:v24];

  if (!(_DWORD)v28)
  {
    uint64_t v44 = MediaAnalysisLogLevel(v29, v30);
    if ((int)v44 >= 3)
    {
      uint64_t v46 = VCPLogInstance(v44, v45);
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      os_log_type_t v48 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v47, v48))
      {
        *(_WORD *)v80 = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Failed to issue resource request", v80, 2u);
      }
    }

@end
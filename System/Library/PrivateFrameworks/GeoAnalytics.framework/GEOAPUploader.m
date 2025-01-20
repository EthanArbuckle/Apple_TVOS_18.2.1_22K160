@interface GEOAPUploader
- (BOOL)_debugUploadCountersEnabled;
- (BOOL)_startTaskForFile:(id)a3 taskDescription:(id)a4 analyticSessionType:(int)a5 apURLsessionConfigType:(int)a6 ttl:(double)a7;
- (GEOAPUploader)init;
- (id)_additionalHTTPHeadersForAnalyticSessionType:(int)a3;
- (id)_sessionForType:(int)a3;
- (id)_urlForAnalyticSessionType:(int)a3;
- (id)_urlForBatchId:(unint64_t)a3;
- (id)filePathForTaskDescription:(id)a3;
- (id)fileURLForTaskDescription:(id)a3;
- (id)persistence;
- (id)tempFilePathForTaskDescription;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_clearExpired;
- (void)_clearUploadTimer;
- (void)_setupBackgroundTask;
- (void)_startUploadTimer;
- (void)_submitBatchForUploadWithBatchId:(unint64_t)a3;
- (void)_submitBatchesForUpload;
@end

@implementation GEOAPUploader

- (GEOAPUploader)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GEOAPUploader;
  v2 = -[GEOAPUploader init](&v11, "init");
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos("com.apple.geo.analytics.upload", 17LL);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    uploadQueue = v2->_uploadQueue;
    v2->_uploadQueue = (OS_dispatch_queue *)v4;

    v6 = (dispatch_queue_s *)v2->_uploadQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CECC;
    block[3] = &unk_1000288C0;
    v7 = v2;
    v10 = v7;
    dispatch_async(v6, block);
    -[GEOAPUploader _setupBackgroundTask](v7, "_setupBackgroundTask");
  }

  return v2;
}

- (id)persistence
{
  if (qword_100033E08 != -1) {
    dispatch_once(&qword_100033E08, &stru_100028B58);
  }
  return (id)qword_100033E00;
}

- (void)_setupBackgroundTask
{
  if (sub_10000458C(0LL))
  {
    id v3 = [sub_1000046A8() sharedScheduler];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = geo_dispatch_queue_create_with_qos("com.apple.geo.analytics.bg_queue", 9LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000D4A4;
    v9[3] = &unk_100028B80;
    id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    id v10 = v6;
    objc_super v11 = self;
    if (([v4 registerForTaskWithIdentifier:@"com.apple.geo.analytics" usingQueue:v6 launchHandler:v9] & 1) == 0)
    {
      id v7 = sub_10000C130();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = @"com.apple.geo.analytics";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "BGSystemTaskScheduler failed to register '%@'",  buf,  0xCu);
      }
    }
  }

- (BOOL)_debugUploadCountersEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
  if ([v2 isInternalInstall]) {
    char BOOL = GEOConfigGetBOOL( GeoAnalyticsConfig__debug_UploadCountersEnabled[0],  GeoAnalyticsConfig__debug_UploadCountersEnabled[1]);
  }
  else {
    char BOOL = 0;
  }

  return BOOL;
}

- (void)_startUploadTimer
{
  uint64_t UInteger = GEOConfigGetUInteger( GeoAnalyticsConfig_AnalyticsPipelineUploadHolddownTimeInSeconds[0],  GeoAnalyticsConfig_AnalyticsPipelineUploadHolddownTimeInSeconds[1]);
  dispatch_time_t v4 = dispatch_time(0LL, 1000000000 * UInteger);
  dispatch_source_set_timer((dispatch_source_t)self->_uploadTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  id v5 = sub_10000C130();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134217984;
    uint64_t v8 = UInteger;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "upload holddown timer set to fire in %lld seconds",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)_clearUploadTimer
{
  id v2 = sub_10000C130();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)dispatch_time_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "upload holddown timer was cleared", v4, 2u);
  }
}

- (void)_clearExpired
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[GEOAPUploader persistence](self, "persistence"));
  [v2 clearExpiredLogMsgsWithResultBlock:&stru_100028BC0];
}

- (void)_submitBatchesForUpload
{
  id v3 = sub_10000B9B4();
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = sub_10000BEC0((BOOL)v4);

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPUploader persistence](self, "persistence"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 selectBatchIdsForBatchUpload]);

    id v8 = [v7 count];
    id v9 = sub_10000C130();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    objc_super v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v22 = [v7 count];
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%lu analytic types ready for upload",  buf,  0xCu);
      }

      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      objc_super v11 = v7;
      id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            -[GEOAPUploader _submitBatchForUploadWithBatchId:]( self,  "_submitBatchForUploadWithBatchId:",  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)i), "unsignedLongLongValue", (void)v16));
          }

          id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        }

        while (v13);
      }
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "nothing available for upload", buf, 2u);
    }
  }

- (void)_submitBatchForUploadWithBatchId:(unint64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPUploader _urlForBatchId:](self, "_urlForBatchId:"));
  if (v5)
  {
    uint64_t v88 = 0LL;
    v89 = &v88;
    uint64_t v90 = 0x2020000000LL;
    uint64_t v91 = 0LL;
    uint64_t v84 = 0LL;
    v85 = &v84;
    uint64_t v86 = 0x2020000000LL;
    uint64_t v87 = 0LL;
    uint64_t v80 = 0LL;
    v81 = &v80;
    uint64_t v82 = 0x2020000000LL;
    uint64_t v83 = 0LL;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v103 = 0x3032000000LL;
    v104 = sub_10000E860;
    v105 = sub_10000E870;
    id v106 = 0LL;
    uint64_t v74 = 0LL;
    v75 = &v74;
    uint64_t v76 = 0x3032000000LL;
    v77 = sub_10000E860;
    v78 = sub_10000E870;
    id v79 = 0LL;
    uint64_t v70 = 0LL;
    v71 = &v70;
    uint64_t v72 = 0x2020000000LL;
    char v73 = 0;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    uint64_t v8 = GEOBatchUploadPolicyType(a3);
    uint64_t v9 = GEOBatchLogMessageType(a3);
    int v10 = GEOBatchOpaqueAppID(a3);
    id v11 = sub_10000C130();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    if ((int)v9 <= 11999)
    {
      id v13 = @"LOG_MESSAGE_TYPE_UNKNOWN";
      switch((int)v9)
      {
        case 0:
          goto LABEL_41;
        case 1:
          id v13 = @"DEBUGLOG";
          break;
        case 2:
          id v13 = @"CURATED_COLLECTION_SESSION";
          break;
        case 3:
          id v13 = @"FIFTEEN_MONTH_SESSION";
          break;
        case 4:
          id v13 = @"PRESSURE_DATA_SESSION";
          break;
        case 5:
          id v13 = @"POI_BUSYNESS_DATA_SESSION";
          break;
        case 6:
          id v13 = @"FIFTEEN_MONTH_USER_SESSION";
          break;
        case 7:
          id v13 = @"NETWORK_SELECTION_HARVEST_SESSION";
          break;
        default:
          if ((_DWORD)v9 == 10000)
          {
            id v13 = @"USAGE";
          }

          else
          {
            if ((_DWORD)v9 != 11000) {
              goto LABEL_29;
            }
            id v13 = @"SHORT_SESSION_USAGE";
          }

          break;
      }

      goto LABEL_41;
    }

    if ((int)v9 > 29999)
    {
      switch((int)v9)
      {
        case 50000:
          id v13 = @"REALTIME_TRAFFIC_PROBE";
          break;
        case 50001:
          id v13 = @"BATCH_TRAFFIC_PROBE";
          break;
        case 50002:
          id v13 = @"WIFI_CONNECTION_QUALITY_PROBE_COLLECTION";
          break;
        case 50003:
          id v13 = @"LOG_DISCARD_EVENT";
          break;
        default:
          if ((_DWORD)v9 == 30000)
          {
            id v13 = @"NAVIGATION_TRACE";
          }

          else
          {
            if ((_DWORD)v9 != 40000) {
              goto LABEL_29;
            }
            id v13 = @"TELEMETRY";
          }

          break;
      }

      goto LABEL_41;
    }

    if ((int)v9 <= 13999)
    {
      if ((_DWORD)v9 == 12000)
      {
        id v13 = @"LONG_SESSION_USAGE";
        goto LABEL_41;
      }

      if ((_DWORD)v9 == 13000)
      {
        id v13 = @"SESSIONLESS_USAGE";
        goto LABEL_41;
      }
    }

    else
    {
      switch((_DWORD)v9)
      {
        case 0x36B0:
          id v13 = @"LONG_SESSION_LOG_FRAMEWORK_USAGE";
          goto LABEL_41;
        case 0x3A98:
          id v13 = @"COHORTS_SESSION_USAGE";
          goto LABEL_41;
        case 0x4E20:
          id v13 = @"PERFORMANCE";
LABEL_41:
          __int128 v16 = v13;
          if (v8 >= 0xC) {
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v8));
          }
          else {
            __int128 v17 = *(&off_100028D10 + (int)v8);
          }
          *(_DWORD *)v92 = 138413314;
          v93 = v7;
          __int16 v94 = 2048;
          unint64_t v95 = a3;
          __int16 v96 = 2112;
          v97 = v16;
          __int16 v98 = 2112;
          v99 = v17;
          __int16 v100 = 1024;
          int v101 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "(%@) upload requested for batch id %llu / message Type : %@, upload policy : %@, opaqueId : %u",  v92,  0x30u);

LABEL_45:
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUploadPolicies sharedPolicies](&OBJC_CLASS___GEOAPUploadPolicies, "sharedPolicies"));
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uploadPolicyForUploadPolicyType:v8]);

          if (v8 >= 0xC) {
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v8));
          }
          else {
            v20 = *(&off_100028D10 + (int)v8);
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 uploadStages]);
          v44 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v44 urlSessionConfig]);
          id v43 = [v22 type];

          if (v43 >= 7) {
            v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v43));
          }
          else {
            v41 = *(&off_100028E10 + (int)v43);
          }
          [v44 ttl];
          uint64_t v24 = v23;
          id v42 = sub_10000BF40(objc_alloc(&OBJC_CLASS___GEOAPUploadFileWriter), a3);
          if (!v42)
          {
            id v36 = sub_10000C130();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v92 = 138412546;
              v93 = v7;
              __int16 v94 = 2048;
              unint64_t v95 = a3;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "(%@) unable to create upload file writer for batch id %llu; unable to upload right now",
                v92,
                0x16u);
            }

            v30 = 0LL;
            goto LABEL_65;
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue( +[GEOReferenceTimeManager sharedManager]( &OBJC_CLASS___GEOReferenceTimeManager,  "sharedManager"));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bestReferenceDate]);

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPUploader persistence](self, "persistence"));
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472LL;
          v60[2] = sub_10000E878;
          v60[3] = &unk_100028C10;
          id v40 = v26;
          id v61 = v40;
          v64 = &v84;
          v65 = &v80;
          v66 = &v88;
          p___int128 buf = &buf;
          v68 = &v74;
          id v62 = v42;
          id v63 = v7;
          unint64_t v69 = a3;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_10000EA44;
          v45[3] = &unk_100028C38;
          v51 = &v80;
          v52 = &buf;
          v28 = self;
          uint64_t v57 = v24;
          id v29 = v63;
          id v46 = v29;
          id v47 = v41;
          id v48 = v20;
          v53 = &v88;
          unint64_t v58 = a3;
          v54 = &v74;
          int v59 = (int)v43;
          v30 = v42;
          id v49 = v62;
          v50 = v28;
          v55 = &v70;
          v56 = &v84;
          [v27 selectLogMsgsForBatchUploadWithBatchId:a3 visitorBlock:v60 completionBlock:v45];

          unsigned int v31 = -[GEOAPUploader _debugUploadCountersEnabled](v28, "_debugUploadCountersEnabled");
          v32 = v81;
          if (v31 && v81[3] && *((_BYTE *)v71 + 24))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[GEOAPDebugPersistence sharedInstance]( &OBJC_CLASS___GEOAPDebugPersistence,  "sharedInstance"));
            uint64_t v34 = v75[5];
            uint64_t v35 = GEOBatchAnalyticsSessionType(a3);
            LODWORD(v39) = 1;
            [v33 addInflightUploadWithBatchUUID:v29 createTime:v34 sessionType:v35 eventCount:*((unsigned int *)v81 + 6) uploadSize:*((unsigned int *)v89 + 6) uploadPolicy:v43 stageNum:v39];

            v32 = v81;
          }

          if (v32[3])
          {
            if (!*((_BYTE *)v71 + 24)) {
              goto LABEL_63;
            }
          }

          else if (v85[3])
          {
LABEL_63:
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPUploader persistence](v28, "persistence"));
            [v38 clearPendingLogMsgElemsForBatchUploadWithBatchId:a3];
          }

          v37 = (os_log_s *)v40;
LABEL_65:

          _Block_object_dispose(&v70, 8);
          _Block_object_dispose(&v74, 8);

          _Block_object_dispose(&buf, 8);
          _Block_object_dispose(&v80, 8);
          _Block_object_dispose(&v84, 8);
          _Block_object_dispose(&v88, 8);
          goto LABEL_66;
      }
    }

- (id)tempFilePathForTaskDescription
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUtils GEOAPCachePath](&OBJC_CLASS___GEOAPUtils, "GEOAPCachePath"));
  id v3 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v3, "UUIDString"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:v4]);

  return v5;
}

- (id)filePathForTaskDescription:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUtils GEOAPCachePath](&OBJC_CLASS___GEOAPUtils, "GEOAPCachePath"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v3]);

  return v5;
}

- (id)fileURLForTaskDescription:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPUploader filePathForTaskDescription:](self, "filePathForTaskDescription:", a3));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));

  return v4;
}

- (id)_sessionForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  sessionCache = self->_sessionCache;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](sessionCache, "objectForKey:", v6));

  if (!v7)
  {
    if (v3 >= 7) {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v3));
    }
    else {
      uint64_t v8 = *(&off_100028E10 + (int)v3);
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.geo.analytics.%@",  v8));

    int v10 = (void *)objc_claimAutoreleasedReturnValue( +[GEOAPURLSessionConfig configForURLSessionConfigType:]( &OBJC_CLASS___GEOAPURLSessionConfig,  "configForURLSessionConfigType:",  v3));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
    if ([v11 isInternalInstall]) {
      char BOOL = GEOConfigGetBOOL( GeoAnalyticsConfig__debug_AlwaysUseExpensiveUpload[0],  GeoAnalyticsConfig__debug_AlwaysUseExpensiveUpload[1]);
    }
    else {
      char BOOL = 0;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v9));
    objc_msgSend( v13,  "set_allowsTLSSessionTickets:",  GEOConfigGetBOOL(GeoServicesConfig_TLSSessionTicketsEnabled[0], GeoServicesConfig_TLSSessionTicketsEnabled[1]));
    if ((BOOL & 1) != 0)
    {
      uint64_t v14 = 1LL;
      objc_msgSend(v13, "set_allowsExpensiveAccess:", 1);
    }

    else
    {
      objc_msgSend(v13, "set_allowsExpensiveAccess:", objc_msgSend(v10, "requireWifi") ^ 1);
      uint64_t v14 = [v10 requireWifi] ^ 1;
    }

    [v13 setAllowsCellularAccess:v14];
    objc_msgSend(v13, "set_requiresPowerPluggedIn:", objc_msgSend(v10, "requirePower"));
    objc_msgSend(v13, "setDiscretionary:", objc_msgSend(v10, "discretionary"));
    objc_msgSend( v13,  "setAllowsConstrainedNetworkAccess:",  GEOConfigGetBOOL( GeoAnalyticsConfig_AnalyticsAllowedInLowDataMode[0],  GeoAnalyticsConfig_AnalyticsAllowedInLowDataMode[1]));
    [v13 setSessionSendsLaunchEvents:1];

    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v13,  self,  0LL));
    v15 = self->_sessionCache;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    -[NSCache setObject:forKey:cost:](v15, "setObject:forKey:cost:", v7, v16, 1LL);
  }

  return v7;
}

- (BOOL)_startTaskForFile:(id)a3 taskDescription:(id)a4 analyticSessionType:(int)a5 apURLsessionConfigType:(int)a6 ttl:(double)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v23 = a3;
  id v25 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPUploader _urlForAnalyticSessionType:](self, "_urlForAnalyticSessionType:", v9));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v12));
  [v13 setHTTPMethod:@"POST"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[GEOAPUploader _additionalHTTPHeadersForAnalyticSessionType:]( self,  "_additionalHTTPHeadersForAnalyticSessionType:",  v9));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v18, v23));
        [v13 addValue:v19 forHTTPHeaderField:v18];
      }

      id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v15);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPUploader _sessionForType:](self, "_sessionForType:", v8, v23));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uploadTaskWithRequest:v13 fromFile:v24]);
  [v21 setTaskDescription:v25];
  objc_msgSend(v21, "set_timeoutIntervalForResource:", a7);
  [v21 resume];

  return 1;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uploadQueue = self->_uploadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F528;
  block[3] = &unk_100028CB0;
  id v13 = v8;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync((dispatch_queue_t)uploadQueue, block);
}

- (id)_urlForBatchId:(unint64_t)a3
{
  return -[GEOAPUploader _urlForAnalyticSessionType:]( self,  "_urlForAnalyticSessionType:",  GEOBatchAnalyticsSessionType(a3));
}

- (id)_urlForAnalyticSessionType:(int)a3
{
  uint64_t v3 = 0LL;
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t v4 = 44LL;
      goto LABEL_14;
    case 3:
    case 4:
      uint64_t v4 = 45LL;
      goto LABEL_14;
    case 5:
    case 6:
      uint64_t v4 = 46LL;
      goto LABEL_14;
    case 7:
    case 8:
    case 14:
    case 17:
      uint64_t v4 = 47LL;
      goto LABEL_14;
    case 9:
      uint64_t String = GEOConfigGetString(GeoAnalyticsConfig_NavFullTraceEvent[0], GeoAnalyticsConfig_NavFullTraceEvent[1]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(String);
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));

      return v3;
    case 10:
      uint64_t v4 = 30LL;
      goto LABEL_14;
    case 11:
      uint64_t v4 = 31LL;
      goto LABEL_14;
    case 12:
      uint64_t v4 = 38LL;
      goto LABEL_14;
    case 13:
      uint64_t v4 = 56LL;
      goto LABEL_14;
    case 15:
      uint64_t v4 = 54LL;
      goto LABEL_14;
    case 16:
      uint64_t v4 = 57LL;
      goto LABEL_14;
    case 19:
      uint64_t v4 = 59LL;
LABEL_14:
      uint64_t v7 = GEOGetURL(v4, a2);
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    default:
      return v3;
  }

  return v3;
}

- (id)_additionalHTTPHeadersForAnalyticSessionType:(int)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
  unsigned int v5 = [v4 isInternalInstall];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    [v6 setObject:v8 forKeyedSubscript:@"X-uuid"];

    if (a3 != 12) {
      goto LABEL_9;
    }
    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (a3 == 12)
  {
LABEL_6:
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
LABEL_7:
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 osAndBuildVersion]);
    [v6 setObject:v10 forKeyedSubscript:@"X-os-version"];

    goto LABEL_9;
  }

  id v6 = 0LL;
LABEL_9:
  if ([v6 count]) {
    id v11 = [v6 copy];
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end
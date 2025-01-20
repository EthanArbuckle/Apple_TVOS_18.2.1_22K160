@interface MADProgressManager
+ (BOOL)_reportFullAnalysisPerTypeWorkloadProgress:(id)a3;
+ (BOOL)_reportWorkloadProgressForTask:(unint64_t)a3 progressDetail:(id)a4;
+ (id)_calculateCompleteDateWithEvent:(id)a3 progress:(unint64_t)a4 taskID:(unint64_t)a5 checkpoint:(unint64_t)a6 featureAvailableCheck:(BOOL)a7 database:(id)a8 completeTimestampKey:(id)a9 completeThreshold:(unint64_t)a10 checkpointTimestampKey:(id)a11 currentDate:(id)a12 startDate:(id)a13;
+ (id)_featureCodeWithTaskID:(unint64_t)a3;
+ (id)_getStartDateFromDatabase:(id)a3 withStartTimestampKey:(id)a4 coreAnalyticsEventKey:(id)a5 andCurrentDate:(id)a6;
+ (id)_queryAndReportProgressForAnalysis:(unint64_t)a3 photoLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5;
+ (id)_queryAndReportProgressForPhotoLibrary:(id)a3 analysisType:(unint64_t)a4 analysisSubtype:(unint64_t)a5 queryKeys:(id)a6 cancelOrExtendTimeoutBlock:(id)a7;
+ (id)_queryAndReportProgressForPrioritizedFaceAnalysisForPhotoLibrary:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
+ (unint64_t)_computeProgressPercentageWithProcessedCount:(unint64_t)a3 andTotalCount:(unint64_t)a4;
+ (void)_prepareBGSTCheckpointWithEvent:(id)a3 taskID:(unint64_t)a4 checkpoint:(unint64_t)a5 featureAvailableCheck:(BOOL)a6 database:(id)a7 databaseModified:(BOOL *)a8 checkpointTimestampKey:(id)a9 currentDate:(id)a10;
+ (void)_queryAndReportProgressForMediaAnalysisImageForPhotoLibrary:(id)a3 reuseCachedValue:(BOOL)a4;
+ (void)_reportMediaAnalysisImageCheckpoint:(unint64_t)a3 withProgressPercentage:(unint64_t)a4 checkpointTimestampKey:(id)a5 photoLibrary:(id)a6;
+ (void)_reportMediaAnalysisSubcategoryWorkloadProgress:(unint64_t)a3 totalAssetCount:(unint64_t)a4 forSubCategory:(id)a5;
+ (void)requestProgressUpdateForTasks:(id)a3;
+ (void)resetProcessingCheckpointForTask:(unint64_t)a3;
+ (void)updateProgressForTask:(unint64_t)a3 photoLibrary:(id)a4 reuseCachedValue:(BOOL)a5 cancelOrExtendTimeoutBlock:(id)a6;
+ (void)updateProgressIfRequestedForTasks:(id)a3 photoLibrary:(id)a4 reuseCachedValue:(BOOL)a5 cancelOrExtendTimeoutBlock:(id)a6;
- (MADProgressManager)initWithPhotoLibrary:(id)a3;
@end

@implementation MADProgressManager

- (MADProgressManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MADProgressManager;
  v6 = -[MADProgressManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
  }

  return v7;
}

+ (unint64_t)_computeProgressPercentageWithProcessedCount:(unint64_t)a3 andTotalCount:(unint64_t)a4
{
  if (a4) {
    return (unint64_t)(float)((float)((float)a3 / (float)a4) * 100.0);
  }
  else {
    return 0LL;
  }
}

+ (id)_getStartDateFromDatabase:(id)a3 withStartTimestampKey:(id)a4 coreAnalyticsEventKey:(id)a5 andCurrentDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 keyExistsInKeyValueStore:v10])
  {
    id v13 = [v9 valueForKey:v10];
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v13));
    uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v16 >= 7)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      os_log_type_t v20 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
        int v31 = 138412802;
        id v32 = v11;
        __int16 v33 = 2112;
        v34 = v21;
        __int16 v35 = 2048;
        uint64_t v36 = (uint64_t)v13;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[%@] started on %@ (timestamp: %lld)",  (uint8_t *)&v31,  0x20u);
      }

+ (id)_featureCodeWithTaskID:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v5 = &off_1001B8698;
  }

  else
  {
    if (a3 != 3) {
      return 0LL;
    }
    id v5 = off_1001B8690;
  }

  return (id)objc_claimAutoreleasedReturnValue(-[__objc2_class featureCodes](*v5, "featureCodes", v3, v4));
}

+ (void)_prepareBGSTCheckpointWithEvent:(id)a3 taskID:(unint64_t)a4 checkpoint:(unint64_t)a5 featureAvailableCheck:(BOOL)a6 database:(id)a7 databaseModified:(BOOL *)a8 checkpointTimestampKey:(id)a9 currentDate:(id)a10
{
  BOOL v12 = a6;
  id v92 = a3;
  id v89 = a7;
  id v90 = a9;
  id v88 = a10;
  id v17 = MADTaskIdentifierForBackgroundTask(a4, v16);
  uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
  v93 = (void *)v18;
  int v20 = BGSystemTaskCustomCheckpointMax;
  int v21 = BGSystemTaskCustomCheckpointMin;
  if (BGSystemTaskCustomCheckpointMax < a5 || BGSystemTaskCustomCheckpointMin > a5)
  {
    uint64_t v23 = MediaAnalysisLogLevel(v18, v19);
    if ((int)v23 >= 4)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      os_log_type_t v27 = VCPLogToOSLogType[4];
      v87 = v26;
      if (!os_log_type_enabled(v26, v27)) {
        goto LABEL_52;
      }
      *(_DWORD *)buf = 138413058;
      id v101 = v92;
      __int16 v102 = 1024;
      *(_DWORD *)v103 = a5;
      *(_WORD *)&v103[4] = 1024;
      *(_DWORD *)&v103[6] = v21;
      *(_WORD *)&v103[10] = 1024;
      *(_DWORD *)&v103[12] = v20;
      v28 = "[%@] MADBGCheckpoint %d is not within range [%d, %d]";
      double v29 = v26;
      os_log_type_t v30 = v27;
      uint32_t v31 = 30;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v29, v30, v28, buf, v31);
      goto LABEL_52;
    }
  }

  else
  {
    if (v18)
    {
      id v32 = [v89 valueForKey:v90];
      if (v32)
      {
        v87 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v32));
        uint64_t v34 = MediaAnalysisLogLevel(v87, v33);
        if ((int)v34 >= 7)
        {
          uint64_t v36 = VCPLogInstance(v34, v35);
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          os_log_type_t v38 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v37, v38))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s description](v87, "description"));
            *(_DWORD *)buf = 138412802;
            id v101 = v92;
            __int16 v102 = 2112;
            *(void *)v103 = v39;
            *(_WORD *)&v103[8] = 2048;
            *(void *)&v103[10] = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "[%@] checkpoint reported on %@ (timestamp: %lld)",  buf,  0x20u);
          }
        }

+ (id)_calculateCompleteDateWithEvent:(id)a3 progress:(unint64_t)a4 taskID:(unint64_t)a5 checkpoint:(unint64_t)a6 featureAvailableCheck:(BOOL)a7 database:(id)a8 completeTimestampKey:(id)a9 completeThreshold:(unint64_t)a10 checkpointTimestampKey:(id)a11 currentDate:(id)a12 startDate:(id)a13
{
  BOOL v50 = a7;
  id v15 = a3;
  id v16 = a8;
  id v17 = a9;
  id v18 = a11;
  id v19 = a12;
  id v51 = a13;
  unsigned __int8 v52 = 0;
  if (a4 < a10)
  {
    [v16 removeKey:v17];
    if (VCPAnalysisComplete90Percentage == a10)
    {
      id v20 = [v16 removeKey:v18];
      uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
      if ((int)v22 >= 7)
      {
        uint64_t v24 = VCPLogInstance(v22, v23);
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        os_log_type_t v26 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v25, v26))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v15;
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "[%@] not completed yet", buf, 0xCu);
        }
      }
    }

    id v27 = 0LL;
    unsigned __int8 v52 = 1;
LABEL_22:
    [v16 commit];
    goto LABEL_23;
  }

  if ([v16 keyExistsInKeyValueStore:v17])
  {
    id v28 = [v16 valueForKey:v17];
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v28));
    uint64_t v30 = MediaAnalysisLogLevel(v27, v29);
    if ((int)v30 >= 7)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)buf = 138412802;
        id v54 = v15;
        __int16 v55 = 2112;
        uint64_t v56 = objc_claimAutoreleasedReturnValue([v27 description]);
        __int16 v57 = 2048;
        id v58 = v28;
        uint64_t v35 = (void *)v56;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "[%@] completed on %@ (timestamp: %lld)", buf, 0x20u);
      }
    }

    int v36 = 0;
  }

  else
  {
    [v19 timeIntervalSinceReferenceDate];
    [v16 setValue:(uint64_t)v37 forKey:v17];
    id v27 = v19;
    uint64_t v39 = MediaAnalysisLogLevel(v27, v38);
    if ((int)v39 >= 7)
    {
      uint64_t v41 = VCPLogInstance(v39, v40);
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      os_log_type_t v43 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v42, v43))
      {
        os_log_type_t v44 = (void *)objc_claimAutoreleasedReturnValue([v27 description]);
        [v27 timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 138413058;
        id v54 = v15;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)v17;
        __int16 v57 = 2112;
        id v58 = v44;
        __int16 v59 = 2048;
        uint64_t v60 = (uint64_t)v45;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "[%@] No previous completion date, setting %@ as now (%@, timestamp: %lld)",  buf,  0x2Au);
      }
    }

    int v36 = 1;
    unsigned __int8 v52 = 1;
  }

  if (VCPAnalysisComplete90Percentage == a10)
  {
    [a1 _prepareBGSTCheckpointWithEvent:v15 taskID:a5 checkpoint:a6 featureAvailableCheck:v50 database:v16 databaseModified:&v52 checkpointTimest ampKey:v18 currentDate:v19];
    int v36 = v52;
  }

  if (v36) {
    goto LABEL_22;
  }
LABEL_23:

  return v27;
}

+ (id)_queryAndReportProgressForPhotoLibrary:(id)a3 analysisType:(unint64_t)a4 analysisSubtype:(unint64_t)a5 queryKeys:(id)a6 cancelOrExtendTimeoutBlock:(id)a7
{
  id v11 = a3;
  id v96 = a6;
  id v86 = a7;
  v87 = v11;
  __int128 v95 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v11));
  id v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v97 = 0LL;
  LODWORD(a7) = +[VCPAnalysisProgressQuery queryProgressDetail:photoLibrary:taskID:cancelOrExtendTimeoutBlock:]( &OBJC_CLASS___VCPAnalysisProgressQuery,  "queryProgressDetail:photoLibrary:taskID:cancelOrExtendTimeoutBlock:",  &v97,  v11,  a4,  v86);
  id v12 = v97;
  id v88 = v12;
  if (!(_DWORD)a7)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"countProcessedQueryKey"]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:v21]);
    uint64_t v83 = (char *)[v22 unsignedIntegerValue];

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"countTotalAllowedQueryKey"]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:v23]);
    id v85 = [v24 unsignedIntegerValue];

    id v25 = [a1 _computeProgressPercentageWithProcessedCount:v83 andTotalCount:v85];
    uint64_t v92 = (uint64_t)v25;
    switch(a4)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        signed int v27 = VCPPhotosSceneProcessingVersionInternal();
        goto LABEL_20;
      case 3uLL:
        signed int v27 = objc_msgSend(v87, "mad_faceProcessingInternalVersion");
        goto LABEL_20;
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xBuLL:
        goto LABEL_12;
      case 0xAuLL:
        id v28 = (int *)&VCPPhotosOCRProcessingVersion;
        goto LABEL_22;
      case 0xCuLL:
        signed int v27 = VCPPhotosVisualSearchAlgorithmVersion();
LABEL_20:
        uint64_t v35 = v27;
        goto LABEL_23;
      default:
        if (a4 == 16)
        {
          id v28 = (int *)&VCPPhotosPECProcessingVersion;
        }

        else
        {
          if (a4 != 255)
          {
LABEL_12:
            uint64_t v29 = MediaAnalysisLogLevel(v25, v26);
            if ((int)v29 >= 4)
            {
              uint64_t v31 = VCPLogInstance(v29, v30);
              uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              os_log_type_t v33 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v32, v33))
              {
                os_log_type_t v34 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"]);
                *(_DWORD *)buf = 138412546;
                id v99 = v34;
                __int16 v100 = 1024;
                int v101 = a4;
                _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%@] Unsupported analysis type %d", buf, 0x12u);
              }
            }

            uint64_t v35 = 0LL;
LABEL_23:
            [v95 storeProgressForActivityID:a4 withAnalysisSubtype:a5 version:v35 processedAssetCount:v83 totalAssetCount:v85];
            os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"));
            uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s persistentDomainForName:]( log,  "persistentDomainForName:",  MediaAnalysisDaemonDomain));
            int v36 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"progressPercentageQueryKey"]);
            double v37 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKey:v36]);
            BOOL v38 = v92 == [v37 unsignedIntValue];

            if (!v38)
            {
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v92));
              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"progressPercentageQueryKey"]);
              -[os_log_s setObject:forKey:](log, "setObject:forKey:", v39, v40);
            }

            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"startTimestampQueryKey"]);
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"]);
            v91 = (void *)objc_claimAutoreleasedReturnValue( [a1 _getStartDateFromDatabase:v95 withStartTimestampKey:v41 coreAnalyticsEventKey:v42 andCurrentDate:v94]);

            os_log_type_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
            os_log_type_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 components:16 fromDate:v91 toDate:v94 options:0]);
            id v81 = [v44 day];

            uint64_t v45 = 0LL;
            id v89 = 0LL;
            id v90 = (__CFString *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"]);
            if (v90 == @"PrioritizedFaceAnalysis") {
              uint64_t v46 = 501LL;
            }
            else {
              uint64_t v46 = 509LL;
            }
            v110[0] = VCPAnalysisComplete50Percentage;
            v110[1] = VCPAnalysisComplete90Percentage;
            uint64_t v47 = VCPAnalysisComplete99Percentage;
            v110[2] = VCPAnalysisComplete99Percentage;
            do
            {
              uint64_t v48 = objc_autoreleasePoolPush();
              uint64_t v49 = v110[v45];
              uint64_t v50 = VCPPercentCompleteTimestampKeyForTask(a4, v49, 1LL);
              id v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
              unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue( [v96 objectForKeyedSubscript:@"checkpointWithFailureTimestampQueryKey"]);
              double v53 = (void *)objc_claimAutoreleasedReturnValue( [a1 _calculateCompleteDateWithEvent:v90 progress:v92 taskID:a4 checkpoint:v46 featureAvailableCheck:0 databas e:v95 completeTimestampKey:v51 completeThreshold:v49 checkpointTimestampKey:v52 currentDate:v94 startDate:v91]);

              uint64_t v54 = VCPPercentCompleteTimestampKeyForTask(a4, v49, 0LL);
              __int16 v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
              uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"checkpointTimestampQueryKey"]);
              __int16 v57 = (void *)objc_claimAutoreleasedReturnValue( [a1 _calculateCompleteDateWithEvent:v90 progress:v92 taskID:a4 checkpoint:v46 featureAvailableCheck:1 databas e:v95 completeTimestampKey:v55 completeThreshold:v49 checkpointTimestampKey:v56 currentDate:v94 startDate:v91]);

              if (v49 == v47)
              {
                id v58 = v53;

                id v89 = v58;
              }

              objc_autoreleasePoolPop(v48);
              ++v45;
            }

            while (v45 != 3);
            if (v89)
            {
              __int16 v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
              uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v59 components:16 fromDate:v91 toDate:v89 options:0]);
              uint64_t v61 = (uint64_t)[v60 day];
            }

            else
            {
              uint64_t v61 = -1LL;
            }

            id v62 = [v95 commit];
            uint64_t v64 = MediaAnalysisLogLevel(v62, v63);
            if ((int)v64 >= 6)
            {
              uint64_t v66 = VCPLogInstance(v64, v65);
              uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
              os_log_type_t v68 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v67, v68))
              {
                unsigned __int8 v69 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"]);
                *(_DWORD *)buf = 138413570;
                id v99 = v69;
                __int16 v100 = 1024;
                int v101 = v92;
                __int16 v102 = 1024;
                int v103 = (int)v83;
                __int16 v104 = 1024;
                int v105 = (int)v85;
                __int16 v106 = 1024;
                int v107 = (int)v81;
                __int16 v108 = 1024;
                int v109 = v61;
                _os_log_impl( (void *)&_mh_execute_header,  v67,  v68,  "[%@] progress %du%% (%du analyzed assets, %du total assets, %du days since start, %du days spent to complete)",  buf,  0x2Au);
              }
            }

            v70 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"coreAnalyticsEventQueryKey"]);
            VCPCoreAnalyticsReportEventAnalysisProgress(v70, (uint64_t)v81, v61, v92, (uint64_t)v85);

            uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"countFailedQueryKey"]);
            v72 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:v71]);
            id v73 = [v72 unsignedIntegerValue];

            id v74 = [a1 _computeProgressPercentageWithProcessedCount:&v83[(void)v73] andTotalCount:v85];
            uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( [v96 objectForKeyedSubscript:@"progressPercentageWithFailureQueryKey"]);
            v76 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKey:v75]);
            BOOL v77 = v74 == (id)[v76 unsignedIntValue];

            if (!v77)
            {
              os_log_type_t v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v74));
              v79 = (void *)objc_claimAutoreleasedReturnValue( [v96 objectForKeyedSubscript:@"progressPercentageWithFailureQueryKey"]);
              -[os_log_s setObject:forKey:](log, "setObject:forKey:", v78, v79);
            }

            id v20 = v88;

            goto LABEL_42;
          }

+ (BOOL)_reportWorkloadProgressForTask:(unint64_t)a3 progressDetail:(id)a4
{
  id v5 = a4;
  uint64_t v6 = VCPTaskIDDescription(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = MADTaskIdentifierForBackgroundTask(a3, v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:VCPAnalysisCountProcessedKey]);
    uint64_t v13 = [v12 unsignedIntegerValue];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:VCPAnalysisCountTotalAllowedKey]);
    uint64_t v15 = [v14 unsignedIntegerValue];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:VCPAnalysisCountFailedKey]);
    id v17 = [v16 unsignedIntegerValue];

    else {
      unint64_t v20 = (unint64_t)v17;
    }
    if (v15)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskCheckpoints sharedInstance](&OBJC_CLASS___BGSystemTaskCheckpoints, "sharedInstance"));
      float v22 = (double)(unint64_t)v13 * 100.0 / (double)(unint64_t)v15;
      id v66 = 0LL;
      unsigned __int8 v23 = [v21 reportProgressForTaskWithName:v11 withGlobalTarget:v15 completed:vcvtas_u32_f32(v22) atDate:0 category:10 subCategory:0 error:&v66];
      id v24 = v66;

      if ((v23 & 1) != 0)
      {
        uint64_t v27 = MediaAnalysisLogLevel(v25, v26);
        if ((int)v27 >= 5)
        {
          uint64_t v29 = VCPLogInstance(v27, v28);
          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          os_log_type_t v31 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v30, v31))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)os_log_type_t v68 = (_DWORD)v13;
            *(_WORD *)&v68[4] = 1024;
            *(_DWORD *)&v68[6] = (_DWORD)v15;
            *(_WORD *)&v68[10] = 2112;
            *(void *)&v68[12] = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "[MADProgressManager] Reported progress (%d/%d) for %@",  buf,  0x18u);
          }
        }

        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[BGSystemTaskCheckpoints sharedInstance]( &OBJC_CLASS___BGSystemTaskCheckpoints,  "sharedInstance"));
        float v33 = (double)v20 * 100.0 / (double)(unint64_t)v15;
        id v65 = v24;
        unsigned __int8 v34 = [v32 reportProgressForTaskWithName:v11 withGlobalTarget:v15 completed:vcvtas_u32_f32(v33) atDate:0 category:10 subCategory:@"failed" error:&v65];
        id v35 = v65;

        if ((v34 & 1) != 0)
        {
          uint64_t v38 = MediaAnalysisLogLevel(v36, v37);
          if ((int)v38 >= 5)
          {
            uint64_t v40 = VCPLogInstance(v38, v39);
            uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            os_log_type_t v42 = VCPLogToOSLogType[5];
            if (os_log_type_enabled(v41, v42))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)os_log_type_t v68 = v20;
              *(_WORD *)&v68[4] = 1024;
              *(_DWORD *)&v68[6] = (_DWORD)v15;
              *(_WORD *)&v68[10] = 2112;
              *(void *)&v68[12] = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "[MADProgressManager] Reported failed-assets-percentage (%d/%d) for %@",  buf,  0x18u);
            }

            BOOL v43 = 1;
LABEL_33:
            id v24 = v35;
LABEL_34:

            goto LABEL_38;
          }

          BOOL v43 = 1;
        }

        else
        {
          uint64_t v60 = MediaAnalysisLogLevel(v36, v37);
          if ((int)v60 >= 4)
          {
            uint64_t v62 = VCPLogInstance(v60, v61);
            uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
            os_log_type_t v63 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v41, v63))
            {
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)os_log_type_t v68 = v20;
              *(_WORD *)&v68[4] = 1024;
              *(_DWORD *)&v68[6] = (_DWORD)v15;
              *(_WORD *)&v68[10] = 2112;
              *(void *)&v68[12] = v7;
              __int16 v69 = 2112;
              id v70 = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  v63,  "[MADProgressManager] Failed to report failed-assets-precentage (%d/%d) for %@ - %@",  buf,  0x22u);
            }

            BOOL v43 = 0;
            goto LABEL_33;
          }

          BOOL v43 = 0;
        }

        id v24 = v35;
        goto LABEL_38;
      }

      uint64_t v56 = MediaAnalysisLogLevel(v25, v26);
      if ((int)v56 >= 4)
      {
        uint64_t v58 = VCPLogInstance(v56, v57);
        uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        os_log_type_t v59 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v41, v59))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)os_log_type_t v68 = (_DWORD)v13;
          *(_WORD *)&v68[4] = 1024;
          *(_DWORD *)&v68[6] = (_DWORD)v15;
          *(_WORD *)&v68[10] = 2112;
          *(void *)&v68[12] = v7;
          __int16 v69 = 2112;
          id v70 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  v59,  "[MADProgressManager] Failed to report progress (%d/%d) for %@ - %@",  buf,  0x22u);
        }

        BOOL v43 = 0;
        goto LABEL_34;
      }

+ (BOOL)_reportFullAnalysisPerTypeWorkloadProgress:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:VCPAnalysisCountFullAnalysisLivePhotoCountKey]);
  id v6 = [v5 unsignedIntegerValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:VCPAnalysisCountFullAnalysisLivePhotoProcessedKey]);
  id v8 = [v7 unsignedIntegerValue];

  if (v6)
  {
    float v11 = (double)(unint64_t)v8 * 100.0 / (double)(unint64_t)v6;
    [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:vcvtas_u32_f32(v11) totalAssetCount:v6 forSubCategory:@"livePhotos-processed"];
  }

  else
  {
    uint64_t v12 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v12 >= 5)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v15, v16))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[MADProgressManager] Live Photo count equal to 0, skipping reporting.",  buf,  2u);
      }
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:VCPAnalysisCountFullAnalysisVideoCountKey]);
  id v18 = [v17 unsignedIntegerValue];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:VCPAnalysisCountFullAnalysisVideoProcessedKey]);
  id v20 = [v19 unsignedIntegerValue];

  if (v18)
  {
    float v23 = (double)(unint64_t)v20 * 100.0 / (double)(unint64_t)v18;
    [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:vcvtas_u32_f32(v23) totalAssetCount:v18 forSubCategory:@"videos-processed"];
  }

  else
  {
    uint64_t v24 = MediaAnalysisLogLevel(v21, v22);
    if ((int)v24 >= 5)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v27, v28))
      {
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "[MADProgressManager] Video count equal to 0, skipping reporting.",  v30,  2u);
      }
    }
  }

  return 1;
}

+ (id)_queryAndReportProgressForPrioritizedFaceAnalysisForPhotoLibrary:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = @"countProcessedQueryKey";
  v13[1] = @"countTotalAllowedQueryKey";
  v14[0] = VCPAnalysisCountPrioritizedProcessedKey;
  v14[1] = VCPAnalysisCountPrioritizedTotalAllowedKey;
  v13[2] = @"startTimestampQueryKey";
  uint64_t v8 = VCPStartTimestampKeyForTask(3LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v14[2] = v9;
  v14[3] = VCPKeyValuePrioritizedFaceAnalysisProgressPercentage;
  v13[3] = @"progressPercentageQueryKey";
  v13[4] = @"checkpointTimestampQueryKey";
  v14[4] = VCPKeyValuePrioritizedFaceCheckpointReportedTimestamp;
  v14[5] = VCPKeyValuePrioritizedFaceAnalysisProgressPercentageWithFailure;
  v13[5] = @"progressPercentageWithFailureQueryKey";
  v13[6] = @"checkpointWithFailureTimestampQueryKey";
  v13[7] = @"coreAnalyticsEventQueryKey";
  v14[6] = VCPKeyValuePrioritizedFaceCheckpointWithFailureReportedTimestamp;
  v14[7] = @"PrioritizedFaceAnalysis";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  8LL));

  float v11 = (void *)objc_claimAutoreleasedReturnValue( [a1 _queryAndReportProgressForPhotoLibrary:v6 analysisType:3 analysisSubtype:1 queryKeys:v10 cancelOrExtendTimeoutBlock:v7]);
  return v11;
}

+ (id)_queryAndReportProgressForAnalysis:(unint64_t)a3 photoLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v8 = a4;
  id v28 = a5;
  v29[0] = @"countProcessedQueryKey";
  v29[1] = @"countFailedQueryKey";
  v30[0] = VCPAnalysisCountProcessedKey;
  v30[1] = VCPAnalysisCountFailedKey;
  v30[2] = VCPAnalysisCountTotalAllowedKey;
  v29[2] = @"countTotalAllowedQueryKey";
  v29[3] = @"startTimestampQueryKey";
  uint64_t v9 = VCPStartTimestampKeyForTask(a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v30[3] = v10;
  v29[4] = @"progressPercentageQueryKey";
  uint64_t v11 = VCPProgressPercentageKeyForTask(a3, 0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v30[4] = v12;
  v29[5] = @"checkpointTimestampQueryKey";
  uint64_t v13 = VCPBGSTCheckpointTimestampKeyForTask(a3, 0LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v30[5] = v14;
  v29[6] = @"progressPercentageWithFailureQueryKey";
  uint64_t v15 = VCPProgressPercentageKeyForTask(a3, 1LL);
  os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v30[6] = v16;
  v29[7] = @"checkpointWithFailureTimestampQueryKey";
  uint64_t v17 = VCPBGSTCheckpointTimestampKeyForTask(a3, 1LL);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v30[7] = v18;
  v29[8] = @"coreAnalyticsEventQueryKey";
  uint64_t v19 = VCPTaskIDDescription(a3);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v30[8] = v20;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  9LL));

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [a1 _queryAndReportProgressForPhotoLibrary:v8 analysisType:a3 analysisSubtype:0 queryKeys:v21 cancelOrExtendTimeoutBlock:v28]);
  if ([a1 _reportWorkloadProgressForTask:a3 progressDetail:v22])
  {
    uint64_t v23 = VCPRequestBGSTProgressReportKeyForTask(a3);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v8));
    uint64_t v26 = v25;
    if (v24)
    {
      [v25 setValue:0 forKey:v24];
      [v26 commit];
    }
  }

  if (a3 == 1) {
    [a1 _reportFullAnalysisPerTypeWorkloadProgress:v22];
  }

  return v22;
}

+ (void)_reportMediaAnalysisImageCheckpoint:(unint64_t)a3 withProgressPercentage:(unint64_t)a4 checkpointTimestampKey:(id)a5 photoLibrary:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v10));
  uint64_t v13 = v11;
  if (VCPAnalysisComplete90Percentage > a4)
  {
    id v14 = [v11 removeKey:v9];
    uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v16 < 7)
    {
LABEL_36:
      [v13 commit];
      goto LABEL_37;
    }

    uint64_t v18 = VCPLogInstance(v16, v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v67 = @"MediaAnalysisImage";
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%@] not completed yet", buf, 0xCu);
    }

+ (void)_reportMediaAnalysisSubcategoryWorkloadProgress:(unint64_t)a3 totalAssetCount:(unint64_t)a4 forSubCategory:(id)a5
{
  id v7 = a5;
  uint64_t v8 = VCPTaskIDDescription(1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v11 = MADTaskIdentifierForBackgroundTask(1LL, v10);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  id v14 = (void *)v12;
  if (a4)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskCheckpoints sharedInstance](&OBJC_CLASS___BGSystemTaskCheckpoints, "sharedInstance"));
    id v37 = 0LL;
    unsigned __int8 v16 = [v15 reportProgressForTaskWithName:v14 withGlobalTarget:a4 completed:a3 atDate:0 category:10 subCategory:v7 error:&v37];
    id v17 = v37;

    if ((v16 & 1) != 0)
    {
      uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
      if ((int)v20 >= 5)
      {
        uint64_t v22 = VCPLogInstance(v20, v21);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        os_log_type_t v24 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)uint64_t v39 = a3;
          *(_WORD *)&v39[4] = 1024;
          *(_DWORD *)&v39[6] = a4;
          *(_WORD *)uint64_t v40 = 2112;
          *(void *)&v40[2] = v9;
          *(_WORD *)uint64_t v41 = 2112;
          *(void *)&v41[2] = v7;
          uint64_t v25 = "[MADProgressManager] Reported progress (%d percent of %d) for %@ (%@)";
          uint64_t v26 = v23;
          os_log_type_t v27 = v24;
          uint32_t v28 = 34;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
          goto LABEL_13;
        }

        goto LABEL_13;
      }
    }

    else
    {
      uint64_t v33 = MediaAnalysisLogLevel(v18, v19);
      if ((int)v33 >= 4)
      {
        uint64_t v35 = VCPLogInstance(v33, v34);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        os_log_type_t v36 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v23, v36))
        {
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)uint64_t v39 = a3;
          *(_WORD *)&v39[4] = 1024;
          *(_DWORD *)&v39[6] = a4;
          *(_WORD *)uint64_t v40 = 2112;
          *(void *)&v40[2] = v9;
          *(_WORD *)uint64_t v41 = 2112;
          *(void *)&v41[2] = v7;
          __int16 v42 = 2112;
          id v43 = v17;
          uint64_t v25 = "[MADProgressManager] Failed to report progress (%d percent of %d) for %@ (%@) - %@";
          uint64_t v26 = v23;
          os_log_type_t v27 = v36;
          uint32_t v28 = 44;
          goto LABEL_12;
        }

+ (void)_queryAndReportProgressForMediaAnalysisImageForPhotoLibrary:(id)a3 reuseCachedValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v6));
  uint64_t v8 = v7;
  id v36 = 0LL;
  id v37 = 0LL;
  if (v4)
  {
    uint64_t v9 = VCPKeyValueMediaAnalysisImagePriority1ProgressPercentage;
    if ([v7 keyExistsInKeyValueStore:VCPKeyValueMediaAnalysisImagePriority1ProgressPercentage])
    {
      id v37 = [v8 valueForKey:v9];
      uint64_t v10 = 0LL;
      id v36 = [v8 valueForKey:VCPKeyValueMediaAnalysisImagePriority1TotalAssetCount];
      goto LABEL_5;
    }
  }

  id v35 = 0LL;
  unsigned __int8 v11 = objc_msgSend( v6,  "mad_calculateProgressPercentage:totalAssetCount:progressPercentageWithFailure:taskID:phTaskID :priority:failedAssetCount:error:",  &v37,  &v36,  0,  1,  17,  1,  0,  &v35);
  id v12 = v35;
  uint64_t v10 = v12;
  if ((v11 & 1) != 0)
  {
LABEL_5:
    [a1 _reportMediaAnalysisImageCheckpoint:507 withProgressPercentage:v37 checkpointTimestampKey:VCPKeyValueMediaAnalysisImagePriority1CheckpointReportedTimestamp photoLibrary:v6];
    [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:v37 totalAssetCount:v36 forSubCategory:@"prioritized"];
    unint64_t v33 = 0LL;
    uint64_t v34 = 0LL;
    uint64_t v32 = 0LL;
    unint64_t v14 = (int)[v8 queryAssetCountForTaskID:255];
    id v31 = v10;
    unsigned __int8 v15 = objc_msgSend( v6,  "mad_calculateProgressPercentage:totalAssetCount:progressPercentageWithFailure:taskID:phTask ID:priority:failedAssetCount:error:",  &v34,  &v33,  &v32,  1,  17,  0,  v14,  &v31);
    id v16 = v31;

    if ((v15 & 1) != 0)
    {
      unint64_t v19 = v33;
      [a1 _reportMediaAnalysisImageCheckpoint:508 withProgressPercentage:v34 checkpointTimestampKey:VCPKeyValueMediaAnalysisImageCheckpointReportedTimestamp photoLibrary:v6];
      [a1 _reportMediaAnalysisImageCheckpoint:504 withProgressPercentage:v32 checkpointTimestampKey:VCPKeyValueMediaAnalysisImageCheckpointWithFailureReportedTimestamp photoLibrary:v6];
      [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:v34 totalAssetCount:v33 forSubCategory:@"image"];
      float v20 = (double)v14 * 100.0 / (double)v19;
      [a1 _reportMediaAnalysisSubcategoryWorkloadProgress:vcvtas_u32_f32(v20) totalAssetCount:v33 forSubCategory:@"failedImage"];
    }

    else
    {
      uint64_t v26 = MediaAnalysisLogLevel(v17, v18);
      if ((int)v26 >= 3)
      {
        uint64_t v28 = VCPLogInstance(v26, v27);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        os_log_type_t v30 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v39 = @"MediaAnalysisImage";
          __int16 v40 = 1024;
          int v41 = 0;
          __int16 v42 = 2112;
          id v43 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "[%@] Failed to query progress for priority %u: %@",  buf,  0x1Cu);
        }
      }
    }

    goto LABEL_16;
  }

  uint64_t v21 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v21 >= 3)
  {
    uint64_t v23 = VCPLogInstance(v21, v22);
    os_log_type_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v25 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v39 = @"MediaAnalysisImage";
      __int16 v40 = 1024;
      int v41 = 1;
      __int16 v42 = 2112;
      id v43 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "[%@] Failed to query progress for priority %u: %@",  buf,  0x1Cu);
    }
  }

  id v16 = v10;
LABEL_16:
}

+ (void)updateProgressForTask:(unint64_t)a3 photoLibrary:(id)a4 reuseCachedValue:(BOOL)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  unsigned __int8 v11 = (uint64_t (**)(void))a6;
  id v13 = MADTaskIdentifierForBackgroundTask(a3, v12);
  uint32_t v80 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v10));
  if (a3 == 1)
  {
    uint64_t v35 = mach_absolute_time();
    uint64_t v36 = VCPSignPostLog(v35);
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    os_signpost_id_t v38 = os_signpost_id_generate(v37);

    uint64_t v40 = VCPSignPostLog(v39);
    int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    __int16 v42 = v41;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_INTERVAL_BEGIN,  v38,  "VCPMADCollectAndReportAnalysisProgress_MediaAnalysisImage",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v43 = VCPSignPostLog([a1 _queryAndReportProgressForMediaAnalysisImageForPhotoLibrary:v10 reuseCachedValue:v7]);
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    uint64_t v45 = v44;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v45,  OS_SIGNPOST_INTERVAL_END,  v38,  "VCPMADCollectAndReportAnalysisProgress_MediaAnalysisImage",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v35)
    {
      uint64_t v46 = mach_absolute_time();
      VCPPerformance_LogMeasurement("VCPMADCollectAndReportAnalysisProgress_MediaAnalysisImage", v46 - v35);
    }
  }

  else if (a3 == 3)
  {
    uint64_t v15 = mach_absolute_time();
    uint64_t v16 = VCPSignPostLog(v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    uint64_t v20 = VCPSignPostLog(v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v18,  "VCPMADCollectAndReportAnalysisProgress_CacheFaceProgress",  (const char *)&unk_100199097,  buf,  2u);
    }

    id v23 = [v14 valueForKey:VCPKeyValueNumberOfAssetsAllowedForPhotosFaceProcessing];
    if (!v23) {
      id v23 = [v14 cacheCurrentFaceProgress];
    }
    uint64_t v24 = VCPSignPostLog(v23);
    os_log_type_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = v25;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_END,  v18,  "VCPMADCollectAndReportAnalysisProgress_CacheFaceProgress",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v15)
    {
      uint64_t v27 = mach_absolute_time();
      VCPPerformance_LogMeasurement("VCPMADCollectAndReportAnalysisProgress_CacheFaceProgress", v27 - v15);
    }

    if (v11)
    {
      uint64_t v28 = v11[2](v11);
      if ((_DWORD)v28)
      {
        uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
        if ((int)v30 >= 5)
        {
          uint64_t v32 = VCPLogInstance(v30, v31);
          unint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          os_log_type_t v34 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v33, v34))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v82 = v80;
LABEL_39:
            _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "[%@] User cancelled during updateProgressForTask ...",  buf,  0xCu);
            goto LABEL_40;
          }

          goto LABEL_40;
        }

        goto LABEL_50;
      }
    }

    uint64_t v47 = mach_absolute_time();
    uint64_t v48 = VCPSignPostLog(v47);
    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    os_signpost_id_t v50 = os_signpost_id_generate(v49);

    uint64_t v52 = VCPSignPostLog(v51);
    id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    uint64_t v54 = v53;
    if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v54,  OS_SIGNPOST_INTERVAL_BEGIN,  v50,  "VCPMADCollectAndReportAnalysisProgress_PrioritizedFace",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v55 = VCPSignPostLog(  [a1 _queryAndReportProgressForPrioritizedFaceAnalysisForPhotoLibrary:v10 cancelOrExtendTimeoutBlock:v11]);
    uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    uint64_t v57 = v56;
    if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v57,  OS_SIGNPOST_INTERVAL_END,  v50,  "VCPMADCollectAndReportAnalysisProgress_PrioritizedFace",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v47)
    {
      uint64_t v58 = mach_absolute_time();
      VCPPerformance_LogMeasurement("VCPMADCollectAndReportAnalysisProgress_PrioritizedFace", v58 - v47);
    }
  }

  if (v11 && (uint64_t v59 = v11[2](v11), (_DWORD)v59))
  {
    uint64_t v61 = MediaAnalysisLogLevel(v59, v60);
    if ((int)v61 >= 5)
    {
      uint64_t v63 = VCPLogInstance(v61, v62);
      unint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      os_log_type_t v34 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v82 = v80;
        goto LABEL_39;
      }

+ (void)updateProgressIfRequestedForTasks:(id)a3 photoLibrary:(id)a4 reuseCachedValue:(BOOL)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  id v48 = a3;
  id v8 = a4;
  id v54 = a6;
  uint64_t v55 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v48;
  id v13 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v13)
  {
    uint64_t v57 = (uint64_t)v12;
    uint64_t v58 = *(void *)v60;
    os_log_type_t type = VCPLogToOSLogType[4];
    uint64_t v53 = VCPKeyValueMediaAnalysisImagePriority1MCEnableTimestamp;
    os_log_type_t v49 = VCPLogToOSLogType[3];
    os_log_type_t v50 = VCPLogToOSLogType[6];
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v60 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_autoreleasePoolPush();
        id v17 = [v15 unsignedIntegerValue];
        uint64_t v18 = VCPRequestBGSTProgressReportKeyForTask(v17);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v20 = VCPLastBGSTProgressReportAttemptKeyForTask(v17);
        uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
        id v23 = (void *)v21;
        if (v19) {
          BOOL v24 = v21 == 0;
        }
        else {
          BOOL v24 = 1;
        }
        if (v24)
        {
          uint64_t v25 = MediaAnalysisLogLevel(v21, v22);
          uint64_t v27 = VCPLogInstance(v25, v26);
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, type))
          {
            *(_DWORD *)buf = 67109120;
            int v64 = (int)v17;
            uint64_t v29 = v28;
            os_log_type_t v30 = type;
            uint64_t v31 = "[MADProgressManager] Unable to report progress for unknown task %d";
            uint32_t v32 = 8;
            goto LABEL_14;
          }

+ (void)requestProgressUpdateForTasks:(id)a3
{
  id v21 = a3;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v3));

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = v21;
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    os_log_type_t v8 = VCPLogToOSLogType[4];
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        double v11 = objc_autoreleasePoolPush();
        id v12 = [v10 unsignedIntegerValue];
        int v13 = (int)v12;
        uint64_t v14 = VCPRequestBGSTProgressReportKeyForTask(v12);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v16)
        {
          [v4 setValue:1 forKey:v16];
        }

        else
        {
          uint64_t v17 = MediaAnalysisLogLevel(0LL, v15);
          if ((int)v17 >= 4)
          {
            uint64_t v19 = VCPLogInstance(v17, v18);
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, v8))
            {
              *(_DWORD *)buf = 67109120;
              int v27 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  v8,  "[MADProgressManager] Unable to request progress report for unknown task %d",  buf,  8u);
            }
          }
        }

        objc_autoreleasePoolPop(v11);
      }

      id v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v6);
  }

  [v4 commit];
}

+ (void)resetProcessingCheckpointForTask:(unint64_t)a3
{
  id v4 = MADTaskIdentifierForBackgroundTask(a3, (uint64_t)a2);
  os_log_type_t v49 = (void *)objc_claimAutoreleasedReturnValue(v4);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _featureCodeWithTaskID:a3]);
  id v6 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v53;
    os_log_type_t v8 = VCPLogToOSLogType[5];
    os_log_type_t v47 = VCPLogToOSLogType[3];
    os_log_type_t type = VCPLogToOSLogType[7];
    uint64_t v46 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v53 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        double v11 = objc_autoreleasePoolPush();
        if ([v10 unsignedIntegerValue])
        {
          id v13 = [v10 unsignedIntegerValue];
          id v51 = 0LL;
          unsigned __int8 v14 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:forFeature:error:]( &OBJC_CLASS___BGSystemTaskCheckpoints,  "reportFeatureCheckpoint:forFeature:error:",  3LL,  v13,  &v51);
          uint64_t v15 = (os_log_s *)v51;
          uint64_t v17 = v15;
          if ((v14 & 1) != 0)
          {
            uint64_t v18 = MediaAnalysisLogLevel(v15, v16);
            if ((int)v18 >= 5)
            {
              uint64_t v20 = VCPLogInstance(v18, v19);
              id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, v8))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)uint64_t v57 = v10;
                *(_WORD *)&v57[8] = 2112;
                *(void *)&v57[10] = v49;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  v8,  "[MADProgressManager] Reported BGST Checkpoint reset for feature code %@ - %@",  buf,  0x16u);
              }

- (void).cxx_destruct
{
}

@end
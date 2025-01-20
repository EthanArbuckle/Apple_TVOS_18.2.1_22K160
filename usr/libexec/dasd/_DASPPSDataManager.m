@interface _DASPPSDataManager
+ (id)sharedInstance;
- (BOOL)sendDataToPPS:(id)a3 ppsID:(PPSTelemetryIdentifier *)a4;
- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5;
- (NSMutableDictionary)mediaanalysisProgressMapping;
- (NSMutableDictionary)ppsIDMapping;
- (OS_os_log)log;
- (PPSTelemetryIdentifier)ppsIDForSubsystem:(id)a3 category:(id)a4;
- (_DASPPSDataManager)init;
- (id)filterTimeSeriesByFeatureCodes:(id)a3 timeSeries:(id)a4;
- (id)filterTimeSeriesByTaskIdentifiers:(id)a3 timeSeries:(id)a4;
- (id)filterTimeSeriesByTimeFilter:(id)a3 timeSeries:(id)a4;
- (id)getPPSData:(id)a3 filepath:(id)a4 error:(id *)a5;
- (id)getPPSHistogram:(id)a3 category:(id)a4 valueFilter:(id)a5 dimensions:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9;
- (id)getPPSTimeIntervalSet:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9;
- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9;
- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 filepath:(id)a10 error:(id *)a11;
- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 readDirection:(unint64_t)a10 filepath:(id)a11 error:(id *)a12;
- (id)getTaskDependencyGraphs:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)loadBuddyData:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)loadConfig:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)loadFeatureCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadIntensiveTaskBlockingReasons:(id)a3 metrics:(id)a4 filepath:(id)a5;
- (id)loadTaskBlockingReasons:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadTaskCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadTaskDependencies:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadTaskDependencyGraph:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)loadTaskProgress:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadTasksForFeatures:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (void)setLog:(id)a3;
- (void)setMediaanalysisProgressMapping:(id)a3;
- (void)setPpsIDMapping:(id)a3;
@end

@implementation _DASPPSDataManager

- (_DASPPSDataManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____DASPPSDataManager;
  v2 = -[_DASPPSDataManager init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"ppsDataManager"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    ppsIDMapping = v2->_ppsIDMapping;
    v2->_ppsIDMapping = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mediaanalysisProgressMapping = v2->_mediaanalysisProgressMapping;
    v2->_mediaanalysisProgressMapping = (NSMutableDictionary *)v7;

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_mediaanalysisProgressMapping,  "setObject:forKeyedSubscript:",  @"com.apple.mediaanalysisd.photos.face",  @"FaceAnalysis");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_mediaanalysisProgressMapping,  "setObject:forKeyedSubscript:",  @"com.apple.mediaanalysisd.photos.scene",  @"SceneAnalysis");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_mediaanalysisProgressMapping,  "setObject:forKeyedSubscript:",  @"com.apple.mediaanalysisd.photos.full",  @"MediaAnalysis");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_mediaanalysisProgressMapping,  "setObject:forKeyedSubscript:",  @"com.apple.mediaanalysisd.photos.visualsearch",  @"VisualSearchAnalysis");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_mediaanalysisProgressMapping,  "setObject:forKeyedSubscript:",  @"com.apple.mediaanalysisd.photos.ocr",  @"OCRAnalysis");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_mediaanalysisProgressMapping,  "setObject:forKeyedSubscript:",  @"com.apple.mediaanalysisd.photos.pec",  @"PECAnalysis");
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100036CC8;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157790 != -1) {
    dispatch_once(&qword_100157790, block);
  }
  return (id)qword_100157788;
}

- (PPSTelemetryIdentifier)ppsIDForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager ppsIDMapping](self, "ppsIDMapping"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v6, v7));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager ppsIDMapping](self, "ppsIDMapping"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

  if (v11)
  {
    [v11 getValue:&v24 size:8];
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Creating PPS ID for %@", buf, 0xCu);
    }

    uint64_t v24 = PPSCreateTelemetryIdentifier(v6, v7);
    if (v24)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue value:withObjCType:]( &OBJC_CLASS___NSValue,  "value:withObjCType:",  &v24,  "^{PPSTelemetryIdentifier=}"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager ppsIDMapping](self, "ppsIDMapping"));
      [v13 setObject:v11 forKeyedSubscript:v9];
    }

    else
    {
      v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000B2C64(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      v11 = 0LL;
    }
  }

  v22 = (PPSTelemetryIdentifier *)v24;

  objc_sync_exit(v8);
  return v22;
}

- (id)filterTimeSeriesByTaskIdentifiers:(id)a3 timeSeries:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.TaskName IN %@",  v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 array]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 filteredArrayUsingPredicate:v7]);

    id v10 = [objc_alloc((Class)sub_100036FA8()) initWithEvents:v9];
  }

  else
  {
    id v10 = v6;
  }

  return v10;
}

- (id)filterTimeSeriesByFeatureCodes:(id)a3 timeSeries:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.FeatureCode IN %@",  v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 array]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 filteredArrayUsingPredicate:v7]);

    id v10 = [objc_alloc((Class)sub_100036FA8()) initWithEvents:v9];
  }

  else
  {
    id v10 = v6;
  }

  return v10;
}

- (id)filterTimeSeriesByTimeFilter:(id)a3 timeSeries:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    id v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);
    [v8 timeIntervalSince1970];
    uint64_t v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 endDate]);
    [v11 timeIntervalSince1970];
    uint64_t v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"@epochTimestamp >= %lf AND @epochTimestamp <= %lf",  v10,  v13));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 array]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 filteredArrayUsingPredicate:v14]);

    id v17 = [objc_alloc((Class)sub_100036FA8()) initWithEvents:v16];
  }

  else
  {
    id v17 = v5;
  }

  return v17;
}

- (id)getTaskDependencyGraphs:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id obj = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager loadTaskDependencies:metrics:timeFilter:filepath:]( self,  "loadTaskDependencies:metrics:timeFilter:filepath:"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  v36 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 array]);
  id v8 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 metricKeysAndValues]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"TaskName"]);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 metricKeysAndValues]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"ProducedResultIdentifiers"]);

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 metricKeysAndValues]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"DependencyIdentifiers"]);

        uint64_t v19 = -[_DASTaskDependencies initWithProducedResultIdentifiers:dependencyIdentifiers:]( objc_alloc(&OBJC_CLASS____DASTaskDependencies),  "initWithProducedResultIdentifiers:dependencyIdentifiers:",  v16,  v18);
        [v41 setObject:v19 forKeyedSubscript:v14];
      }

      id v9 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }

    while (v9);
  }

  id v40 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obja = obj;
  id v20 = [obja countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(obja);
        }
        uint64_t v24 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)j);
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v25 = v39;
        id v26 = [v25 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v43;
LABEL_15:
          uint64_t v29 = 0LL;
          while (1)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v42 + 1) + 8 * v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue([0 nodeForTaskIdentifier:v24]);

            if (v31) {
              break;
            }
            if (v27 == (id)++v29)
            {
              id v27 = [v25 countByEnumeratingWithState:&v42 objects:v54 count:16];
              if (v27) {
                goto LABEL_15;
              }
              goto LABEL_21;
            }
          }

          id v32 = v30;

          if (v32) {
            goto LABEL_24;
          }
        }

        else
        {
LABEL_21:
        }

        v33 = objc_alloc(&OBJC_CLASS____DASTaskDependencyGraph);
        v34 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTaskDependencyGraph constructTaskDependencyGraphForTask:dependencyDataMap:]( v33,  "constructTaskDependencyGraphForTask:dependencyDataMap:",  v24,  v41));

        [v25 addObject:v34];
        id v32 = 0LL;
LABEL_24:
        [v40 setObject:v32 forKeyedSubscript:v24];
      }

      id v21 = [obja countByEnumeratingWithState:&v46 objects:v55 count:16];
    }

    while (v21);
  }

  return v40;
}

- (id)getPPSData:(id)a3 filepath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  log = v10->_log;
  BOOL v12 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting PPS Data from provided filepath",  buf,  2u);
    }

    id v30 = 0LL;
    unsigned int v13 = [v9 checkResourceIsReachableAndReturnError:&v30];
    id v14 = v30;
    if (v13)
    {
      uint64_t v36 = 0LL;
      v37 = &v36;
      uint64_t v38 = 0x2050000000LL;
      uint64_t v15 = (void *)qword_1001577A8;
      uint64_t v39 = qword_1001577A8;
      if (!qword_1001577A8)
      {
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v32 = 3221225472LL;
        uint64_t v33 = (uint64_t)sub_100039944;
        v34 = &unk_100115300;
        v35 = &v36;
        sub_100039944((uint64_t)buf);
        uint64_t v15 = (void *)v37[3];
      }

      uint64_t v16 = v15;
      _Block_object_dispose(&v36, 8);
      id v17 = [[v16 alloc] initWithFilepath:v9];
      id v29 = v14;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataForRequest:v8 withError:&v29]);
      id v19 = v29;

      id v14 = v19;
    }

    else
    {
      uint64_t v18 = 0LL;
    }

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 138413314;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2112;
    id v32 = v17;
    __int16 v33 = 2112;
    id v34 = v18;
    __int16 v35 = 2112;
    id v36 = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@",  (uint8_t *)&v27,  0x34u);
  }

  id v22 = sub_100037A8C(v15, v16, v17);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = [objc_alloc((Class)sub_100037B74()) initWithMetrics:v18 predicate:v23 timeFilter:v19];
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v24, v20, a9));

  return v25;
}

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 filepath:(id)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    id v30 = v16;
    __int16 v31 = 2112;
    id v32 = v17;
    __int16 v33 = 2112;
    id v34 = v18;
    __int16 v35 = 2112;
    id v36 = v19;
    __int16 v37 = 2112;
    id v38 = v20;
    __int16 v39 = 2048;
    unint64_t v40 = a8;
    __int16 v41 = 2048;
    unint64_t v42 = a9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@ & limitCou nt:%lu & offsetCount:%lu",  buf,  0x48u);
  }

  id v23 = sub_100037A8C(v16, v17, v18);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = [objc_alloc((Class)sub_100037B74()) initWithMetrics:v19 predicate:v24 timeFilter:v20 limitCount:a8 offsetCount:a9];
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v25, v21, a11));

  return v26;
}

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 readDirection:(unint64_t)a10 filepath:(id)a11 error:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a11;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414082;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v18;
    __int16 v34 = 2112;
    id v35 = v19;
    __int16 v36 = 2112;
    id v37 = v20;
    __int16 v38 = 2112;
    id v39 = v21;
    __int16 v40 = 2048;
    unint64_t v41 = a8;
    __int16 v42 = 2048;
    unint64_t v43 = a9;
    __int16 v44 = 2048;
    unint64_t v45 = a10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@ & limitCou nt:%lu & offsetCount:%lu & readDirection: %lu",  buf,  0x52u);
  }

  id v24 = sub_100037A8C(v17, v18, v19);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = [objc_alloc((Class)sub_100037B74()) initWithMetrics:v20 predicate:v25 timeFilter:v21 limitCount:a8 offsetCount:a9 readDirection:a10];
  int v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v26, v22, a12));

  return v27;
}

- (id)getPPSHistogram:(id)a3 category:(id)a4 valueFilter:(id)a5 dimensions:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    id v35 = v17;
    *(_WORD *)__int16 v36 = 2112;
    *(void *)&v36[2] = v18;
    __int16 v37 = 2112;
    id v38 = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Getting PPSHistogram for subsystem: %@ category: %@ with valueFilter: %@ dimensions: %@ timeFilter: %@",  buf,  0x34u);
  }

  id v22 = sub_100037A8C(v15, v16, v17);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2050000000LL;
  id v24 = (void *)qword_1001577C8;
  uint64_t v33 = qword_1001577C8;
  if (!qword_1001577C8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_1000399EC;
    id v35 = &unk_100115300;
    *(void *)__int16 v36 = &v30;
    sub_1000399EC((uint64_t)buf);
    id v24 = (void *)v31[3];
  }

  id v25 = v24;
  _Block_object_dispose(&v30, 8);
  id v26 = objc_alloc(v25);
  id v27 = objc_msgSend(v26, "initWithDimensions:predicate:timeFilter:", v18, v23, v19, v30);
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v27, v20, a9));

  return v28;
}

- (id)getPPSTimeIntervalSet:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    id v35 = v17;
    *(_WORD *)__int16 v36 = 2112;
    *(void *)&v36[2] = v18;
    __int16 v37 = 2112;
    id v38 = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Getting PPSTimeIntervalSet for subsystem: %@ category: %@ with valueFilter: %@ metrics: %@ timeFilter: %@",  buf,  0x34u);
  }

  id v22 = sub_100037A8C(v15, v16, v17);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2050000000LL;
  id v24 = (void *)qword_1001577D0;
  uint64_t v33 = qword_1001577D0;
  if (!qword_1001577D0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_100039A40;
    id v35 = &unk_100115300;
    *(void *)__int16 v36 = &v30;
    sub_100039A40((uint64_t)buf);
    id v24 = (void *)v31[3];
  }

  id v25 = v24;
  _Block_object_dispose(&v30, 8);
  id v26 = objc_alloc(v25);
  id v27 = objc_msgSend(v26, "initWithMetrics:predicate:timeFilter:", v18, v23, v19, v30);
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v27, v20, a9));

  return v28;
}

- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v8 = a3;
  LOBYTE(a5) = -[_DASPPSDataManager sendDataToPPS:ppsID:]( self,  "sendDataToPPS:ppsID:",  v8,  -[_DASPPSDataManager ppsIDForSubsystem:category:](self, "ppsIDForSubsystem:category:", a4, a5));

  return (char)a5;
}

- (BOOL)sendDataToPPS:(id)a3 ppsID:(PPSTelemetryIdentifier *)a4
{
  id v6 = a3;
  if (!v6)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B2D08(log, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_10;
  }

  id v7 = self->_log;
  if (!a4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B2D38(v7, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_10:
    BOOL v8 = 0;
    goto LABEL_11;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000B2D68((uint64_t)v6, v7);
  }
  PPSSendTelemetry(a4, v6);
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)loadTaskCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting task checkpoints for %@ with metrics: %@ & timeFilter: %@",  buf,  0x20u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"TaskCheckpoint",  0LL,  v11,  0LL,  v13,  0LL));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v12,  v15));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTaskIdentifiers:timeSeries:]( self,  "filterTimeSeriesByTaskIdentifiers:timeSeries:",  v10,  v16));
  return v17;
}

- (id)loadTaskBlockingReasons:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting task blocking reasons for %@ with metrics: %@ & timeFilter: %@",  buf,  0x20u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"TaskBlockingPolicies",  0LL,  v11,  0LL,  v13,  0LL));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v12,  v15));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTaskIdentifiers:timeSeries:]( self,  "filterTimeSeriesByTaskIdentifiers:timeSeries:",  v10,  v16));
  return v17;
}

- (id)loadIntensiveTaskBlockingReasons:(id)a3 metrics:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting intensive task blocking reasons with metrics: %@ & timeFilter: %@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"IntensiveTasksBlockingPolicies",  0LL,  v9,  0LL,  v10,  0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v8,  v12));

  return v13;
}

- (id)loadFeatureCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting feature checkpoints for %@ with metrics: %@",  buf,  0x16u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"FeatureCheckpoint",  0LL,  v11,  0LL,  v13,  0LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v12,  v15));

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByFeatureCodes:timeSeries:]( self,  "filterTimeSeriesByFeatureCodes:timeSeries:",  v10,  v16));
  return v17;
}

- (id)loadConfig:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting Config with metrics: %@ & timeFilter: %@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"Config",  0LL,  v8,  0LL,  v10,  0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v9,  v12));

  return v13;
}

- (id)loadTaskProgress:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v40 = a5;
  id v39 = a6;
  unint64_t v41 = self;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v61 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting task progress for %@ with metrics: %@ & timeFilter: %@",  buf,  0x20u);
  }

  __int16 v36 = v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"TaskWorkload",  0LL,  v11,  0LL,  v39,  0LL));
  id v38 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v40,  v13));

  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v10));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager mediaanalysisProgressMapping](self, "mediaanalysisProgressMapping"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allValues]);
  unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v10;
  id v16 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(obj);
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    }

    while (v16);
  }

  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTaskIdentifiers:timeSeries:]( self,  "filterTimeSeriesByTaskIdentifiers:timeSeries:",  v42,  v38));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v43 = (id)objc_claimAutoreleasedReturnValue([v37 array]);
  id v20 = [v43 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v47 != v21) {
          objc_enumerationMutation(v43);
        }
        __int16 v23 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
        [v23 epochTimestamp];
        [v23 monotonicTimestamp];
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 metricKeysAndValues]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v24));

        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"TaskName"]);
        unsigned int v27 = [v26 isEqualToString:@"com.apple.mediaanalysisd.progress"];

        if (v27)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager mediaanalysisProgressMapping](v41, "mediaanalysisProgressMapping"));
          __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"SubCategory"]);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v29]);
          [v25 setObject:v30 forKeyedSubscript:@"TaskName"];
        }

        uint64_t v54 = 0LL;
        v55 = &v54;
        uint64_t v56 = 0x2050000000LL;
        id v31 = (void *)qword_1001577D8;
        uint64_t v57 = qword_1001577D8;
        if (!qword_1001577D8)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&uint8_t buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_100039A94;
          v61 = &unk_100115300;
          v62 = &v54;
          sub_100039A94((uint64_t)buf);
          id v31 = (void *)v55[3];
        }

        id v32 = v31;
        _Block_object_dispose(&v54, 8);
        [v23 monotonicTimestamp];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "eventWithMonotonicTimestamp:timeOffset:dictionary:", v25));
        [v19 addObject:v33];
      }

      id v20 = [v43 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }

    while (v20);
  }

  id v34 = [objc_alloc((Class)sub_100036FA8()) initWithEvents:v19];
  return v34;
}

- (id)loadTasksForFeatures:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting tasks for Feature Codes: %@ with metrics: %@ & timeFilter: %@",  buf,  0x20u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"TaskFeatureCodes",  0LL,  v11,  0LL,  v13,  0LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v12,  v15));

  return v16;
}

- (id)loadTaskDependencies:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting dependencies for tasks: %@ with metrics: %@ & timeFilter: %@",  buf,  0x20u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"TaskDependencies",  0LL,  v11,  0LL,  v13,  0LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v12,  v15));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTaskIdentifiers:timeSeries:]( self,  "filterTimeSeriesByTaskIdentifiers:timeSeries:",  v10,  v16));
  return v17;
}

- (id)loadTaskDependencyGraph:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v35 = 0LL;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"TaskDependencies",  0LL,  0LL,  0LL,  a5,  &v35));
  id v11 = v35;
  if (v11)
  {
    id v12 = 0LL;
  }

  else
  {
    id v29 = v9;
    id v30 = v8;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v9,  v10));

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v10 = v13;
    id v15 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v10);
          }
          id v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 metricKeysAndValues]);
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"TaskName"]);

          if (v21)
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 metricKeysAndValues]);
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"ProducedResultIdentifiers"]);

            id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 metricKeysAndValues]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"DependencyIdentifiers"]);

            id v26 = -[_DASTaskDependencies initWithProducedResultIdentifiers:dependencyIdentifiers:]( objc_alloc(&OBJC_CLASS____DASTaskDependencies),  "initWithProducedResultIdentifiers:dependencyIdentifiers:",  v23,  v25);
            [v14 setObject:v26 forKeyedSubscript:v21];
          }
        }

        id v16 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }

      while (v16);
    }

    unsigned int v27 = objc_alloc(&OBJC_CLASS____DASTaskDependencyGraph);
    id v8 = v30;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTaskDependencyGraph constructTaskDependencyGraphForTask:dependencyDataMap:]( v27,  "constructTaskDependencyGraphForTask:dependencyDataMap:",  v30,  v14));

    id v11 = 0LL;
    id v9 = v29;
  }

  return v12;
}

- (id)loadBuddyData:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting Buddy Data with metrics: %@ & timeFilter: %@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:]( self,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"BuddyData",  0LL,  v8,  0LL,  v10,  0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:]( self,  "filterTimeSeriesByTimeFilter:timeSeries:",  v9,  v12));

  return v13;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableDictionary)ppsIDMapping
{
  return self->_ppsIDMapping;
}

- (void)setPpsIDMapping:(id)a3
{
}

- (NSMutableDictionary)mediaanalysisProgressMapping
{
  return self->_mediaanalysisProgressMapping;
}

- (void)setMediaanalysisProgressMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
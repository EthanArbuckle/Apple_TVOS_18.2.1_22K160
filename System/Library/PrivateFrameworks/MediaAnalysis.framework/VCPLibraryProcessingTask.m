@interface VCPLibraryProcessingTask
+ (id)taskWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (VCPLibraryProcessingTask)init;
- (VCPLibraryProcessingTask)initWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7;
- (float)resourceRequirement;
- (id)createTaskBacklogForPhotoLibrary:(id)a3 withDatabase:(id)a4;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPLibraryProcessingTask

- (VCPLibraryProcessingTask)init
{
  return 0LL;
}

- (VCPLibraryProcessingTask)initWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = (Block_layout *)a6;
  v17 = (Block_layout *)a7;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___VCPLibraryProcessingTask;
  v18 = -[VCPLibraryProcessingTask init](&v29, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_photoLibraries, a3);
    id v20 = objc_retainBlock(v15);
    id progressHandler = v19->_progressHandler;
    v19->_id progressHandler = v20;

    if (v16) {
      v22 = v16;
    }
    else {
      v22 = &stru_1001BCF88;
    }
    v23 = objc_retainBlock(v22);
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v23;

    if (v17) {
      v25 = v17;
    }
    else {
      v25 = &stru_1001BCFA8;
    }
    v26 = objc_retainBlock(v25);
    id cancelBlock = v19->_cancelBlock;
    v19->_id cancelBlock = v26;

    objc_storeStrong((id *)&v19->_options, a4);
  }

  return v19;
}

+ (id)taskWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibraries:v12 andOptions:v13 andProgressHandler:v14 andCompletionHandler:v15 andCancelBlock:v16];

  return v17;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VCPLibraryProcessingTask;
  -[VCPLibraryProcessingTask dealloc](&v4, "dealloc");
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

- (id)createTaskBacklogForPhotoLibrary:(id)a3 withDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v7 exists])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[VCPBackgroundProcessingMetrics sharedMetricsWithPhotoLibrary:]( &OBJC_CLASS___VCPBackgroundProcessingMetrics,  "sharedMetricsWithPhotoLibrary:",  v6));
    [v9 loadMetrics];

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[VCPAssetMaintenanceTask taskWithPhotoLibrary:]( &OBJC_CLASS___VCPAssetMaintenanceTask,  "taskWithPhotoLibrary:",  v6));
    [v8 addObject:v10];
  }

  id v11 = objc_msgSend(v6, "vcp_anyAssetsForTaskID:", 1);
  if ((_DWORD)v11)
  {
    if ((_os_feature_enabled_impl("MediaAnalysis", "UnifiedFullAnalysis") & 1) == 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[VCPResumePausedAnalysisTask taskWithPhotoLibrary:]( &OBJC_CLASS___VCPResumePausedAnalysisTask,  "taskWithPhotoLibrary:",  v6));
      [v8 addObject:v25];

      v26 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFailedAssetAnalysisTask taskWithPhotoLibrary:options:]( &OBJC_CLASS___VCPFailedAssetAnalysisTask,  "taskWithPhotoLibrary:options:",  v6,  self->_options));
      [v8 addObject:v26];

      v27 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMediaTypeAnalysisTask taskWithPhotoLibrary:mediaType:]( &OBJC_CLASS___VCPMediaTypeAnalysisTask,  "taskWithPhotoLibrary:mediaType:",  v6,  1LL));
      [v8 addObject:v27];

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMediaTypeAnalysisTask taskWithPhotoLibrary:mediaType:]( &OBJC_CLASS___VCPMediaTypeAnalysisTask,  "taskWithPhotoLibrary:mediaType:",  v6,  2LL));
      [v8 addObject:v19];
      goto LABEL_12;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MADFullAnalysisResultsSynchronizationTask taskWithPhotoLibrary:]( &OBJC_CLASS___MADFullAnalysisResultsSynchronizationTask,  "taskWithPhotoLibrary:",  v6));
    [v8 addObject:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPUnifiedFullAnalysisTask taskWithPhotoLibrary:options:]( &OBJC_CLASS___VCPUnifiedFullAnalysisTask,  "taskWithPhotoLibrary:options:",  v6,  self->_options));
    [v8 addObject:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_options,  "objectForKeyedSubscript:",  VCPTurboProcessing_ImageOnlyKey));
    unsigned __int8 v16 = [v15 BOOLValue];

    if ((v16 & 1) == 0)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[VCPResumePausedAnalysisTask taskWithPhotoLibrary:]( &OBJC_CLASS___VCPResumePausedAnalysisTask,  "taskWithPhotoLibrary:",  v6));
      [v8 addObject:v17];

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFailedAssetAnalysisTask taskWithPhotoLibrary:options:]( &OBJC_CLASS___VCPFailedAssetAnalysisTask,  "taskWithPhotoLibrary:options:",  v6,  self->_options));
      [v8 addObject:v18];

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMediaTypeAnalysisTask taskWithPhotoLibrary:mediaType:]( &OBJC_CLASS___VCPMediaTypeAnalysisTask,  "taskWithPhotoLibrary:mediaType:",  v6,  2LL));
      [v8 addObject:v19];
LABEL_12:
    }
  }

  else
  {
    uint64_t v20 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v20 >= 5)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v24 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v23, v24))
      {
        *(_WORD *)objc_super v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Photo library is empty", v29, 2u);
      }
    }
  }

  return v8;
}

- (int)run
{
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000C7154;
  v35[3] = &unk_1001BC570;
  v35[4] = self;
  unsigned __int8 v3 = objc_retainBlock(v35);
  photoLibraries = self->_photoLibraries;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000C723C;
  v34[3] = &unk_1001B9E98;
  v34[4] = self;
  v27 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADSceneLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  photoLibraries,  v34,  v3,  &stru_1001BCFC8));
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  id v6 = [v5 run];
  int v33 = (int)v6;
  uint64_t v7 = VCPSignPostLog(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v11 = VCPSignPostLog(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "VCPLibraryProcessingTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v14, "start");
  if (-[NSArray count](self->_photoLibraries, "count") && !*((_DWORD *)v31 + 6))
  {
    double v15 = (double)-[NSArray count](self->_photoLibraries, "count");
    unsigned __int8 v16 = self->_photoLibraries;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000C7244;
    v28[3] = &unk_1001BD018;
    *(double *)&v28[6] = 90.0 / v15;
    v28[4] = self;
    v28[5] = &v30;
    -[NSArray enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", v28);
  }

  -[VCPTimeMeasurement stop](v14, "stop");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v14, "elapsedTimeSeconds");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v17 setValue:v18 forField:@"TimeAnalyzingInSeconds" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v14, "elapsedTimeSeconds");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v19 setValue:v20 forField:@"TotalAnalyzingTimeInSeconds" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  uint64_t v22 = VCPSignPostLog(v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  os_log_type_t v24 = v23;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_END,  v9,  "VCPLibraryProcessingTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  VCPPerformance_ReportSummary();
  (*((void (**)(void))self->_completionHandler + 2))();
  int v25 = *((_DWORD *)v31 + 6);

  _Block_object_dispose(&v30, 8);
  return v25;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
}

@end
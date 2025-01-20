@interface VideoTranscodingTask
+ (BOOL)shouldMaximizeVideoConversionPowerEfficiencyForOptions:(id)a3 inputAssetDuration:(double)a4 taskIdentifier:(id)a5;
+ (id)metadataItemsByApplyingSignatureMetadataFromOptions:(id)a3 toMetadataItems:(id)a4;
+ (id)signatureOptionToIdentifierMapping;
- (BOOL)didDetectHang;
- (BOOL)hasProgress;
- (BOOL)hasSlowMotionAdjustments;
- (VideoConversionHangDetector)hangDetector;
- (double)currentFractionCompleted;
- (id)outputAssetInformationWithError:(id *)a3;
- (void)callCompletionHandler;
- (void)cancel;
- (void)cancelProgressUpdateTimerAndMarkEndTime;
- (void)cancelTranscode;
- (void)determineAndNotifyProgress;
- (void)performConversion;
- (void)performExport;
- (void)setHangDetector:(id)a3;
- (void)startProgressUpdateTimerAndMarkStartTime;
- (void)transitionToRunningStateAndConditionallyRunBlock:(id)a3;
@end

@implementation VideoTranscodingTask

- (void)performConversion
{
  if ((id)-[VideoConversionTask status](self, "status") != (id)4
    && (id)-[VideoConversionTask status](self, "status") != (id)5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"VideoConversionService.m",  299,  @"Job in unexpected status %ld",  -[VideoConversionTask status](self, "status"));
  }

  if ((id)-[VideoConversionTask status](self, "status") != (id)4)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___VideoTranscodingTask;
    -[VideoConversionTask performConversion](&v5, "performConversion");
    -[VideoConversionTask loadAsset](self, "loadAsset");
    -[VideoTranscodingTask performExport](self, "performExport");
  }

- (void)determineAndNotifyProgress
{
  if ((id)-[VideoConversionTask status](self, "status") == (id)6
    && -[VideoTranscodingTask hasProgress](self, "hasProgress"))
  {
    -[VideoTranscodingTask currentFractionCompleted](self, "currentFractionCompleted");
    double v4 = v3;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoTranscodingTask hangDetector](self, "hangDetector"));
    [v5 updateCurrentProgress:v4];
  }

  else
  {
    double v4 = NAN;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask progressObserver](self, "progressObserver"));
  if (v6)
  {
    id v7 = v6;
    [v6 videoConversionTask:self didUpdateFractionCompleted:v4];
    v6 = v7;
  }
}

- (BOOL)didDetectHang
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoTranscodingTask hangDetector](self, "hangDetector"));
  unsigned __int8 v3 = [v2 didDetectHang];

  return v3;
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[VideoConversionTask status](v2, "status");
  -[VideoConversionTask setStatus:](v2, "setStatus:", 4LL);
  if (v3 == (id)5)
  {
    NSErrorUserInfoKey v8 = NSDebugDescriptionErrorKey;
    v9 = @"Export was cancelled while conversion task was still enqueued";
    double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  5LL,  v4));
    -[VideoConversionTask setError:](v2, "setError:", v5);

    -[VideoTranscodingTask callCompletionHandler](v2, "callCompletionHandler");
  }

  else if (v3 == (id)6)
  {
    -[VideoTranscodingTask cancelTranscode](v2, "cancelTranscode");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Ignoring cancellation request for transcode task in state %ld",  (uint8_t *)&v6,  0xCu);
  }

  objc_sync_exit(v2);
}

- (void)performExport
{
  v2 = NSStringFromSelector(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Subclasses must override %@",  v3);
}

- (BOOL)hasProgress
{
  v2 = NSStringFromSelector(a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Subclasses must override %@",  v3);

  return 0;
}

- (double)currentFractionCompleted
{
  v2 = NSStringFromSelector(a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Subclasses must override %@",  v3);

  return NAN;
}

- (void)cancelTranscode
{
  v2 = NSStringFromSelector(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Subclasses must override %@",  v3);
}

- (void)transitionToRunningStateAndConditionallyRunBlock:(id)a3
{
  objc_super v5 = (void (**)(void))a3;
  double v4 = self;
  objc_sync_enter(v4);
  if ((id)-[VideoConversionTask status](v4, "status") != (id)4)
  {
    -[VideoConversionTask setStatus:](v4, "setStatus:", 6LL);
    v5[2]();
  }

  objc_sync_exit(v4);
}

- (BOOL)hasSlowMotionAdjustments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKey:@"PAMediaConversionServiceOptionVideoAdjustmentsPropertyListKey"]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)callCompletionHandler
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VideoTranscodingTask;
  -[VideoConversionTask callCompletionHandler](&v3, "callCompletionHandler");
  -[VideoTranscodingTask cancelProgressUpdateTimerAndMarkEndTime](self, "cancelProgressUpdateTimerAndMarkEndTime");
}

- (void)startProgressUpdateTimerAndMarkStartTime
{
  v2 = self;
  objc_sync_enter(v2);
  if (!-[VideoConversionTask timerStatus](v2, "timerStatus"))
  {
    -[VideoConversionTask setTimerStatus:](v2, "setTimerStatus:", 1LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v4);
    -[VideoConversionTask setProgressUpdateTimerSource:](v2, "setProgressUpdateTimerSource:", v5);

    int v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask progressUpdateTimerSource](v2, "progressUpdateTimerSource"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000122C0;
    handler[3] = &unk_100030F78;
    handler[4] = v2;
    dispatch_source_set_event_handler(v6, handler);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](v2, "options"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"PAMediaConversionServiceOptionProgressUpdateTimeIntervalKey"]);
    v9 = (void *)v8;
    v10 = &off_100033318;
    if (v8) {
      v10 = (_UNKNOWN **)v8;
    }
    v11 = v10;

    [v11 doubleValue];
    double v13 = v12;
    v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask progressUpdateTimerSource](v2, "progressUpdateTimerSource"));
    dispatch_source_set_timer(v14, 0LL, (unint64_t)(v13 * 1000000000.0), 0x5F5E100uLL);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](v2, "options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldSimulateConversionHangKey"]);
    unsigned int v17 = [v16 BOOLValue];

    v18 = objc_alloc(&OBJC_CLASS___VideoConversionHangDetector);
    double v19 = 3600.0;
    if (v17) {
      double v19 = 5.0;
    }
    v20 = -[VideoConversionHangDetector initWithThresholdTimeInterval:](v18, "initWithThresholdTimeInterval:", v19);
    -[VideoTranscodingTask setHangDetector:](v2, "setHangDetector:", v20);

    -[VideoTranscodingTask determineAndNotifyProgress](v2, "determineAndNotifyProgress");
    v21 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask progressUpdateTimerSource](v2, "progressUpdateTimerSource"));
    dispatch_resume(v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[VideoConversionTask setConversionStartTime:](v2, "setConversionStartTime:", v22);
  }

  objc_sync_exit(v2);
}

- (void)cancelProgressUpdateTimerAndMarkEndTime
{
  obj = self;
  objc_sync_enter(obj);
  if ((id)-[VideoConversionTask timerStatus](obj, "timerStatus") != (id)2)
  {
    -[VideoConversionTask setTimerStatus:](obj, "setTimerStatus:", 2LL);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[VideoConversionTask setConversionEndTime:](obj, "setConversionEndTime:", v2);

    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask progressUpdateTimerSource](obj, "progressUpdateTimerSource"));
    if (v3)
    {
      BOOL v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask progressUpdateTimerSource](obj, "progressUpdateTimerSource"));
      dispatch_source_cancel(v4);

      -[VideoConversionTask setProgressUpdateTimerSource:](obj, "setProgressUpdateTimerSource:", 0LL);
    }
  }

  objc_sync_exit(obj);
}

- (id)outputAssetInformationWithError:(id *)a3
{
  if (!a3)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v33 handleFailureInMethod:a2, self, @"VideoConversionService.m", 490, @"Invalid parameter not satisfying: %@", @"outError" object file lineNumber description];
  }

  dispatch_source_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputMainResourceURL](self, "outputMainResourceURL"));
  if (-[VideoConversionTask isMetadataTrackExtractionConversion](self, "isMetadataTrackExtractionConversion"))
  {
    int v6 = 0LL;
    id v7 = 0LL;
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    double v10 = CGSizeZero.width;
    double v11 = height;
    goto LABEL_8;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](&OBJC_CLASS___AVURLAsset, "URLAssetWithURL:options:", v5, 0LL));
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[PFMediaUtilities tracksWithMediaType:forAsset:]( &OBJC_CLASS___PFMediaUtilities,  "tracksWithMediaType:forAsset:",  AVMediaTypeVideo,  v7));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v12 lastObject]);

  if (v7 && v6)
  {
    [v6 naturalSize];
    double v10 = v13;
    double v11 = v14;
    [v6 preferredTransform];
    double width = v11 * *(double *)&v35[3] + *(double *)&v35[1] * v10;
    double height = v11 * *(double *)&v35[4] + *(double *)&v35[2] * v10;
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    v35[0] = 0LL;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 attributesOfItemAtPath:v16 error:v35]);
    id v18 = v35[0];

    if (v17)
    {
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:NSFileSize]);
      if ([v19 integerValue])
      {
        v36[0] = @"PAMediaConversionServicePixelWidthKey";
        id v34 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
        v37[0] = v20;
        v36[1] = @"PAMediaConversionServicePixelHeightKey";
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
        v37[1] = v21;
        v36[2] = @"PAMediaConversionServiceOrientedPixelWidthKey";
        v22 = v7;
        v23 = v5;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(width)));
        v37[2] = v24;
        v36[3] = @"PAMediaConversionServiceOrientedPixelHeightKey";
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(height)));
        v36[4] = @"PAMediaConversionServiceFileSizeKey";
        v37[3] = v25;
        v37[4] = v19;
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  5LL));

        id v18 = v34;
        dispatch_source_t v5 = v23;
        id v7 = v22;

        v27 = 0LL;
LABEL_18:

        goto LABEL_19;
      }

      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      v39 = @"Unable to get file information about converted asset";
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
      id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v27));
    }

    else
    {
      v40[0] = NSLocalizedDescriptionKey;
      v40[1] = NSUnderlyingErrorKey;
      v41[0] = @"Unable to get file system information about converted asset";
      v41[1] = v18;
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));
      id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v27));
      double v19 = 0LL;
    }

    v26 = 0LL;
    *a3 = v28;
    goto LABEL_18;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    *(_DWORD *)buf = 138412802;
    v45 = v31;
    __int16 v46 = 2112;
    v47 = v7;
    __int16 v48 = 2112;
    v49 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get AV information about converted asset at %@ (%@/%@)",  buf,  0x20u);
  }

  NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to get AV information about converted asset (%@/%@)",  v7,  v6));
  v43 = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));

  v26 = 0LL;
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v27));
  }
LABEL_19:

  return v26;
}

- (VideoConversionHangDetector)hangDetector
{
  return (VideoConversionHangDetector *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setHangDetector:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)signatureOptionToIdentifierMapping
{
  if (qword_100039788 != -1) {
    dispatch_once(&qword_100039788, &stru_100030F28);
  }
  return (id)qword_100039780;
}

+ (id)metadataItemsByApplyingSignatureMetadataFromOptions:(id)a3 toMetadataItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10001267C;
  double v19 = sub_10001268C;
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v7));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 signatureOptionToIdentifierMapping]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100012694;
  v12[3] = &unk_100030F50;
  id v9 = v6;
  id v13 = v9;
  double v14 = &v15;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

+ (BOOL)shouldMaximizeVideoConversionPowerEfficiencyForOptions:(id)a3 inputAssetDuration:(double)a4 taskIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v18 handleFailureInMethod:a2, a1, @"VideoConversionService.m", 421, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }

  if (a4 == 0.0)
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2, a1, @"VideoConversionService.m", 422, @"Invalid parameter not satisfying: %@", @"inputAssetDuration" object file lineNumber description];
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionPowerEfficiencyKey"]);
  id v12 = [v11 integerValue];

  if (v12 == (id)1)
  {
    BOOL v16 = 1;
  }

  else if (v12 == (id)2)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionPowerEfficiencyMinimumDurationKey"]);
    [v13 doubleValue];
    double v15 = v14;

    if (v15 <= 0.0)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v20 handleFailureInMethod:a2 object:a1 file:@"VideoConversionService.m" lineNumber:430 description:@"PAMediaConversionServiceOptionPowerEfficiencyMinimumDurationKey option is required for PAMediaConversionServicePowerEfficiencyMaximizeWithMinimumDuration"];
    }

    BOOL v16 = v15 < a4;
  }

  else
  {
    BOOL v16 = 0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    BOOL v22 = v16;
    __int16 v23 = 2048;
    id v24 = v12;
    __int16 v25 = 2048;
    double v26 = a4;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Maximize video conversion power efficiency: %d (mode = %ld, duration = %f, conversion task = %{public}@)",  buf,  0x26u);
  }

  return v16;
}

@end
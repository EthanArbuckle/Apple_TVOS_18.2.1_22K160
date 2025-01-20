@interface VideoConversionTask
+ (BOOL)supportsDeduplication;
+ (id)temporaryFileURLWithNameComponent:(id)a3 pathExtension:(id)a4;
- (AVAsset)asset;
- (BOOL)didCallCompletionHandler;
- (BOOL)didDetectHang;
- (BOOL)isMetadataTrackExtractionConversion;
- (BOOL)isPassthroughConversion;
- (BOOL)requiresPhotosAdjustmentRendering;
- (BOOL)wantsResultAsData;
- (MediaConversionRequestTracker)requestTracker;
- (NSDate)conversionEndTime;
- (NSDate)conversionStartTime;
- (NSDate)enqueueTime;
- (NSError)error;
- (NSMutableDictionary)options;
- (NSMutableDictionary)resultInformation;
- (NSString)identifier;
- (NSURL)outputMainResourceURL;
- (NSURL)sourceMainResourceURL;
- (OS_dispatch_source)progressUpdateTimerSource;
- (PAMediaConversionServiceResourceURLCollection)outputURLCollection;
- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection;
- (VideoConversionTask)initWithSourceBookmarkDictionary:(id)a3 outputURLCollection:(id)a4 options:(id)a5 requestTracker:(id)a6;
- (VideoConversionTaskProgressUpdateObserver)progressObserver;
- (id)completionHandler;
- (int64_t)status;
- (unint64_t)timerStatus;
- (void)callCompletionHandler;
- (void)didEnqueue;
- (void)loadAsset;
- (void)performConversion;
- (void)resolveSourceBookmarkDictionary:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConversionEndTime:(id)a3;
- (void)setConversionStartTime:(id)a3;
- (void)setDidCallCompletionHandler:(BOOL)a3;
- (void)setEnqueueTime:(id)a3;
- (void)setError:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOutputURLCollection:(id)a3;
- (void)setProgressObserver:(id)a3;
- (void)setProgressUpdateTimerSource:(id)a3;
- (void)setRequestTracker:(id)a3;
- (void)setResultInformation:(id)a3;
- (void)setSourceURLCollection:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimerStatus:(unint64_t)a3;
- (void)updateResultTracker;
@end

@implementation VideoConversionTask

- (VideoConversionTask)initWithSourceBookmarkDictionary:(id)a3 outputURLCollection:(id)a4 options:(id)a5 requestTracker:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___VideoConversionTask;
  v14 = -[VideoConversionTask init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    -[VideoConversionTask setRequestTracker:](v14, "setRequestTracker:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v12));
    -[VideoConversionTask setOptions:](v15, "setOptions:", v16);

    -[VideoConversionTask resolveSourceBookmarkDictionary:](v15, "resolveSourceBookmarkDictionary:", v10);
    -[VideoConversionTask setOutputURLCollection:](v15, "setOutputURLCollection:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[VideoConversionTask setResultInformation:](v15, "setResultInformation:", v17);
  }

  return v15;
}

- (void)resolveSourceBookmarkDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___PAMediaConversionServiceResourceURLCollectionAccessProvider);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  v7 = -[PAMediaConversionServiceResourceURLCollectionAccessProvider initWithOptions:](v5, "initWithOptions:", v6);

  id v14 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceResourceURLCollection collectionForBookmarkDataDictionaryRepresentation:accessProvider:error:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLCollection,  "collectionForBookmarkDataDictionaryRepresentation:accessProvider:error:",  v4,  v7,  &v14));

  id v9 = v14;
  if (!v8) {
    -[VideoConversionTask setError:](self, "setError:", v9);
  }
  -[VideoConversionTask setSourceURLCollection:](self, "setSourceURLCollection:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask requestTracker](self, "requestTracker"));
  [v10 setSourceURLCollection:v8];

  if ([v8 allURLsAreReadable])
  {
    id v11 = v9;
  }

  else
  {
    id v12 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      __int16 v17 = 2114;
      v18 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to access source URL for conversion task %{public}@: %{public}@",  buf,  0x16u);
    }

    -[VideoConversionTask setError:](self, "setError:", v11);
  }
}

- (NSURL)sourceMainResourceURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask sourceURLCollection](self, "sourceURLCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"]);

  return (NSURL *)v3;
}

- (NSURL)outputMainResourceURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputURLCollection](self, "outputURLCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"]);

  return (NSURL *)v3;
}

- (void)loadAsset
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask error](self, "error"));

  if (!v3)
  {
    id v9 = AVURLAssetPreferPreciseDurationAndTimingKey;
    id v10 = &__kCFBooleanTrue;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask sourceMainResourceURL](self, "sourceMainResourceURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](&OBJC_CLASS___AVURLAsset, "URLAssetWithURL:options:", v5, v4));
    -[VideoConversionTask setAsset:](self, "setAsset:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  3LL,  0LL));
      -[VideoConversionTask setError:](self, "setError:", v8);
    }
  }

- (void)callCompletionHandler
{
  obj = self;
  objc_sync_enter(obj);
  if (-[VideoConversionTask didCallCompletionHandler](obj, "didCallCompletionHandler"))
  {
    objc_sync_exit(obj);
  }

  else
  {
    -[VideoConversionTask setDidCallCompletionHandler:](obj, "setDidCallCompletionHandler:", 1LL);
    objc_sync_exit(obj);

    if ((id)-[VideoConversionTask status](obj, "status") != (id)1)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask error](obj, "error"));

      if (!v2)
      {
        NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
        v16 = @"Conversion failed for unknown reason";
        v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
        id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  2LL,  v3));
        -[VideoConversionTask setError:](obj, "setError:", v4);
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](obj, "identifier"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask error](obj, "error"));
        *(_DWORD *)buf = 138543618;
        id v12 = v8;
        __int16 v13 = 2114;
        id v14 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Video conversion error for conversion task %{public}@: %{public}@",  buf,  0x16u);
      }
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask resultInformation](obj, "resultInformation"));
    [v6 setObject:v5 forKeyedSubscript:@"PAMediaConversionServiceConversionEndDateKey"];

    -[VideoConversionTask updateResultTracker](obj, "updateResultTracker");
    v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[VideoConversionTask completionHandler](obj, "completionHandler"));
    v7[2](v7, -[VideoConversionTask status](obj, "status"));
  }

- (void)updateResultTracker
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask error](self, "error"));
  -[MediaConversionRequestTracker setError:](self->_requestTracker, "setError:", v3);

  v9[0] = @"videoConversionStatus";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_status));
  v9[1] = @"videoConversionOperationType";
  v10[0] = v4;
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  -[MediaConversionRequestTracker setServiceInformation:](self->_requestTracker, "setServiceInformation:", v8);
}

- (BOOL)wantsResultAsData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)didEnqueue
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[VideoConversionTask setEnqueueTime:](self, "setEnqueueTime:", v3);
}

- (void)performConversion
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask resultInformation](self, "resultInformation"));
  [v3 setObject:v4 forKeyedSubscript:@"PAMediaConversionServiceConversionStartDateKey"];
}

- (BOOL)isPassthroughConversion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPassthroughConversionKey"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isMetadataTrackExtractionConversion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsVideoMetadataTrackExtractionKey"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)requiresPhotosAdjustmentRendering
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"PAMediaConversionServiceOptionAdjustmentInformationKey"]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableDictionary)options
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOptions:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)outputURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setOutputURLCollection:(id)a3
{
}

- (NSMutableDictionary)resultInformation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setResultInformation:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setError:(id)a3
{
}

- (AVAsset)asset
{
  return (AVAsset *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAsset:(id)a3
{
}

- (OS_dispatch_source)progressUpdateTimerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setProgressUpdateTimerSource:(id)a3
{
}

- (unint64_t)timerStatus
{
  return self->_timerStatus;
}

- (void)setTimerStatus:(unint64_t)a3
{
  self->_timerStatus = a3;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSDate)enqueueTime
{
  return (NSDate *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setEnqueueTime:(id)a3
{
}

- (NSDate)conversionStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setConversionStartTime:(id)a3
{
}

- (NSDate)conversionEndTime
{
  return (NSDate *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setConversionEndTime:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)didCallCompletionHandler
{
  return self->_didCallCompletionHandler;
}

- (void)setDidCallCompletionHandler:(BOOL)a3
{
  self->_didCallCompletionHandler = a3;
}

- (BOOL)didDetectHang
{
  return self->_didDetectHang;
}

- (MediaConversionRequestTracker)requestTracker
{
  return (MediaConversionRequestTracker *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setRequestTracker:(id)a3
{
}

- (VideoConversionTaskProgressUpdateObserver)progressObserver
{
  return (VideoConversionTaskProgressUpdateObserver *)objc_loadWeakRetained((id *)&self->_progressObserver);
}

- (void)setProgressObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsDeduplication
{
  return 1;
}

+ (id)temporaryFileURLWithNameComponent:(id)a3 pathExtension:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v6]);

  if (v5)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathExtension:v5]);

    id v9 = (void *)v10;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9));

  return v11;
}

@end
@interface ImageConversionService
+ (void)run;
- (BOOL)convertImageWithOptions:(id)a3 sourceURLCollection:(id)a4 outputURLCollection:(id)a5 outputData:(id *)a6 outputFileType:(id *)a7 outputImageInfo:(id *)a8 error:(id *)a9;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)setupSourceAndDestinationForRequestTracker:(id)a3 imageConversionOptions:(id)a4 error:(id *)a5;
- (BOOL)validatePhotosAdjustmentsCalculationRequestOptions:(id)a3 error:(id *)a4;
- (BOOL)validateRequestOptions:(id)a3 error:(id *)a4;
- (ImageConversionService)init;
- (MediaConversionQueue)requestQueue;
- (NSXPCListener)listener;
- (id)urlCollectionForBookmarkDictionaryKey:(id)a3 inOptions:(id)a4 removeExistingEmptyFiles:(BOOL)a5 error:(id *)a6;
- (int64_t)incrementPendingRequestCountWithRequestIdentifier:(id)a3;
- (int64_t)pendingRequestCount;
- (void)conversionQueue:(id)a3 processNextEntry:(id)a4;
- (void)conversionQueueDidFinishProcessingEntry:(id)a3;
- (void)convertImageWithOptions:(id)a3 reply:(id)a4;
- (void)decrementPendingRequestCountWithRequestIdentifier:(id)a3;
- (void)enumerateEnvironmentVariablePairsInRequestOptions:(id)a3 block:(id)a4;
- (void)performBeginRequestActionsForUnitTestSupportOptions:(id)a3;
- (void)performEndRequestActionsForUnitTestSupportOptions:(id)a3;
- (void)replyToCompletionHandler:(id)a3 requestIdentifier:(id)a4 resultData:(id)a5 resultImageInformation:(id)a6 signpostID:(unint64_t)a7 error:(id)a8;
- (void)requestStatusWithReply:(id)a3;
- (void)run;
- (void)setListener:(id)a3;
- (void)setPendingRequestCount:(int64_t)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation ImageConversionService

- (ImageConversionService)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ImageConversionService;
  v2 = -[ImageConversionService init](&v9, "init");
  if (v2)
  {
    os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, v2);
    id v4 = &_os_log_default;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_EVENT,  v3,  "com.apple.photos.mediaconversion.service.init",  "",  v8,  2u);
    }

    v5 = -[MediaConversionQueue initWithDelegate:]( objc_alloc(&OBJC_CLASS___MediaConversionQueue),  "initWithDelegate:",  v2);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v5;
  }

  return v2;
}

- (void)run
{
  os_signpost_id_t v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.photos.ImageConversionService");
  -[ImageConversionService setListener:](self, "setListener:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ImageConversionService listener](self, "listener"));
  [v4 setDelegate:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ImageConversionService listener](self, "listener"));
  [v5 resume];

  dispatch_main();
}

- (void)convertImageWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v38 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"]);
  v8 = objc_opt_new(&OBJC_CLASS___ClientRequest);
  -[ClientRequest setSignpostID:]( v8,  "setSignpostID:",  os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, v7));
  objc_super v9 = -[ClientRequest signpostID](v8, "signpostID");
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = (os_signpost_id_t)v9;
    if (os_signpost_enabled((os_log_t)&_os_log_default))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "com.apple.photos.mediaconversion.service",  "",  buf,  2u);
    }
  }

  int64_t v34 = -[ImageConversionService incrementPendingRequestCountWithRequestIdentifier:]( self,  "incrementPendingRequestCountWithRequestIdentifier:",  v7);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
  v39 = (void *)objc_claimAutoreleasedReturnValue( [v36 objectForKeyedSubscript:@"PAMCS_CONNECTION_USER_INFO_CONNECTION_IDENTIFIER_KEY"]);
  context = objc_autoreleasePoolPush();
  unint64_t v12 = -[MediaConversionQueue nextRequestNumber](self->_requestQueue, "nextRequestNumber");
  v13 = -[MediaConversionRequestTracker initWithRequestOptions:requestNumber:]( objc_alloc(&OBJC_CLASS___MediaConversionRequestTracker),  "initWithRequestOptions:requestNumber:",  v6,  v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionQueue queueEntryWithConversionOptions:]( self->_requestQueue,  "queueEntryWithConversionOptions:",  v6));
  [v14 setTaskTypeSupportsDeduplication:1];
  id v42 = 0LL;
  unsigned __int8 v15 = -[ImageConversionService validateRequestOptions:error:](self, "validateRequestOptions:error:", v6, &v42);
  id v16 = v42;
  v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      unint64_t v44 = (unint64_t)v14;
      __int16 v45 = 2114;
      v46 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Invalid request options for %{public}@: %{public}@",  buf,  0x16u);
    }

    goto LABEL_17;
  }

  id v41 = v16;
  unsigned __int8 v18 = -[ImageConversionService setupSourceAndDestinationForRequestTracker:imageConversionOptions:error:]( self,  "setupSourceAndDestinationForRequestTracker:imageConversionOptions:error:",  v13,  v6,  &v41);
  id v33 = v41;

  if ((v18 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v29 = -[MediaConversionRequestTracker clientProcessIdentifier](v13, "clientProcessIdentifier");
      *(_DWORD *)buf = 138543618;
      unint64_t v44 = (unint64_t)v14;
      __int16 v45 = 1024;
      LODWORD(v46) = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Rejecting conversion request (image) %{public}@ from [%d] because source or destination URLs are invalid",  buf,  0x12u);
    }

    v17 = v33;
    -[MediaConversionRequestTracker setError:](v13, "setError:", v33);
    -[MediaConversionRequestTracker markAsCompletedWithInitialRequestIdentifier:]( v13,  "markAsCompletedWithInitialRequestIdentifier:",  0LL);
LABEL_17:
    id v21 = (id)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestIdentifier](v13, "requestIdentifier"));
    v26 = v38;
    -[ImageConversionService replyToCompletionHandler:requestIdentifier:resultData:resultImageInformation:signpostID:error:]( self,  "replyToCompletionHandler:requestIdentifier:resultData:resultImageInformation:signpostID:error:",  v38,  v21,  0LL,  0LL,  -[ClientRequest signpostID](v8, "signpostID"),  v17);
    goto LABEL_21;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker sourceURLCollection](v13, "sourceURLCollection"));
  [v14 setSourceURLCollection:v19];

  -[ClientRequest setImageClientReplyHandler:](v8, "setImageClientReplyHandler:", v38);
  -[ClientRequest setRequestTracker:](v8, "setRequestTracker:", v13);
  -[ClientRequest setConnection:](v8, "setConnection:", v11);
  -[ClientRequest setConnectionIdentifier:](v8, "setConnectionIdentifier:", v39);
  requestQueue = self->_requestQueue;
  id v40 = 0LL;
  -[MediaConversionQueue enqueueEntry:clientRequest:isDuplicateOfOriginalQueueEntry:]( requestQueue,  "enqueueEntry:clientRequest:isDuplicateOfOriginalQueueEntry:",  v14,  v8,  &v40);
  id v21 = v40;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    if (v21) {
      v22 = v21;
    }
    else {
      v22 = v14;
    }
    id v23 = v22;
    unint64_t v24 = -[MediaConversionRequestTracker effectivePriority](v13, "effectivePriority");
    if (v24 > 4) {
      v25 = 0LL;
    }
    else {
      v25 = off_100028D80[v24];
    }
    v32 = v25;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestOptionsSignatureString](v13, "requestOptionsSignatureString"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker sourceURLFilenameOnlySummary](v13, "sourceURLFilenameOnlySummary"));
    v31 = v23;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
    *(_DWORD *)buf = 134220291;
    unint64_t v44 = v12;
    __int16 v45 = 2114;
    v46 = v7;
    __int16 v47 = 2112;
    v48 = v32;
    __int16 v49 = 2114;
    v50 = v37;
    __int16 v51 = 2114;
    v52 = v30;
    __int16 v53 = 2113;
    v54 = v27;
    __int16 v55 = 2114;
    v56 = v28;
    __int16 v57 = 1024;
    BOOL v58 = v21 != 0LL;
    __int16 v59 = 2114;
    v60 = v39;
    __int16 v61 = 2048;
    int64_t v62 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Received conversion request #%lu %{public}@ (%@, %{public}@) with signature %{public}@ for %{private}@, attached t o conversion task %{public}@, isDuplicate = %d, connection %{public}@, pending request count now %ld",  buf,  0x62u);
  }

  v17 = v33;
  v26 = v38;
LABEL_21:

  objc_autoreleasePoolPop(context);
}

- (void)requestStatusWithReply:(id)a3
{
  v8 = @"PAMediaConversionServiceProcessIdentifierKey";
  id v4 = a3;
  v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  (*((void (**)(id, void *, void))a3 + 2))(v4, v7, 0LL);
}

- (BOOL)setupSourceAndDestinationForRequestTracker:(id)a3 imageConversionOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[ImageConversionService urlCollectionForBookmarkDictionaryKey:inOptions:removeExistingEmptyFiles:error:]( self,  "urlCollectionForBookmarkDictionaryKey:inOptions:removeExistingEmptyFiles:error:",  @"PAMediaConversionServiceSourceBookmarkCollectionKey",  v9,  0LL,  a5));
  if (!v10) {
    goto LABEL_11;
  }
  [v8 setSourceURLCollection:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"PAMediaConversionServiceDestinationBookmarkCollectionKey"]);

  if (!v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"]);
    uint64_t v15 = [v14 BOOLValue];

    if ((v15 & 1) != 0) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned __int8 v18 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Neither destination URL collection nor wants-data option specified",  v18,  2u);
      if (!a5) {
        goto LABEL_11;
      }
    }

    else if (!a5)
    {
      goto LABEL_11;
    }

    BOOL v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  0LL));
    goto LABEL_12;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue( -[ImageConversionService urlCollectionForBookmarkDictionaryKey:inOptions:removeExistingEmptyFiles:error:]( self,  "urlCollectionForBookmarkDictionaryKey:inOptions:removeExistingEmptyFiles:error:",  @"PAMediaConversionServiceDestinationBookmarkCollectionKey",  v9,  1LL,  a5));
  if (!v12)
  {
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }

  v13 = (void *)v12;
  [v8 setDestinationURLCollection:v12];

LABEL_6:
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

- (BOOL)validateRequestOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPhotosAdjustmentsCalculationKey"]);
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    unsigned __int8 v9 = -[ImageConversionService validatePhotosAdjustmentsCalculationRequestOptions:error:]( self,  "validatePhotosAdjustmentsCalculationRequestOptions:error:",  v6,  a4);
    goto LABEL_17;
  }

  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionApplyOrientationTransformKey"]);
  unsigned int v11 = [v10 BOOLValue];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionEnableOutputCorruptionDetectionHeuristicsKey"]);
  unsigned int v13 = [v12 BOOLValue];

  if (!v13 || !v11)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMetadataPolicyKey"]);
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v17));

      v27[0] = @"PAMediaConversionServiceOptionScaleFactorKey";
      v27[1] = @"PAMediaConversionServiceOptionMaximumPixelCountKey";
      v27[2] = @"PAMediaConversionServiceOptionMaximumLongSideLengthKey";
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 3LL));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v19));

      [v18 intersectSet:v20];
      id v21 = [v18 count];
      unsigned __int8 v9 = v21 == (id)1;
      if (a4 && v21 != (id)1)
      {
        NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Expected exactly one scaling request option but received %lu: %@",  [v18 count],  v18));
        v26 = v22;
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  6LL,  v23));
      }
    }

    else
    {
      if (!a4)
      {
        unsigned __int8 v9 = 0;
        goto LABEL_16;
      }

      v28 = @"PAMediaConversionServiceErrorOffendingItemNameKey";
      unsigned int v29 = @"PAMediaConversionServiceOptionMetadataPolicyKey";
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      unsigned __int8 v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  1LL,  v18));
    }

LABEL_16:
    goto LABEL_17;
  }

  if (a4)
  {
    NSErrorUserInfoKey v30 = NSDebugDescriptionErrorKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid combination of %@ and %@ request options",  @"PAMediaConversionServiceOptionApplyOrientationTransformKey",  @"PAMediaConversionServiceOptionEnableOutputCorruptionDetectionHeuristicsKey"));
    v31 = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  6LL,  v15));
  }

  unsigned __int8 v9 = 0;
LABEL_17:

  return v9;
}

- (BOOL)validatePhotosAdjustmentsCalculationRequestOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"PAMediaConversionServiceInputFileTypeKey"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[PFUniformTypeUtilities typeWithIdentifier:]( &OBJC_CLASS___PFUniformTypeUtilities,  "typeWithIdentifier:",  v6));
  if (v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOrientationKey"]);
    unsigned int v9 = [v8 unsignedIntValue] - 1;
    BOOL v10 = v9 < 8;
    if (a4 && v9 >= 8)
    {
      unsigned int v13 = @"PAMediaConversionServiceErrorOffendingItemNameKey";
      v14 = @"PAMediaConversionServiceOptionOrientationKey";
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  1LL,  v11));

      BOOL v10 = 0;
    }
  }

  else
  {
    if (!a4)
    {
      BOOL v10 = 0;
      goto LABEL_8;
    }

    uint64_t v15 = @"PAMediaConversionServiceErrorOffendingItemNameKey";
    BOOL v16 = @"PAMediaConversionServiceInputFileTypeKey";
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  1LL,  v8));
  }

LABEL_8:
  return v10;
}

- (int64_t)incrementPendingRequestCountWithRequestIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  int64_t pendingRequestCount = v6->_pendingRequestCount;
  if (pendingRequestCount < 0)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:v6 file:@"ImageConversionService.m" lineNumber:264 description:@"Pending request count underflow"];

    int64_t pendingRequestCount = v6->_pendingRequestCount;
  }

  int64_t v8 = pendingRequestCount + 1;
  v6->_int64_t pendingRequestCount = pendingRequestCount + 1;
  objc_sync_exit(v6);

  return v8;
}

- (void)replyToCompletionHandler:(id)a3 requestIdentifier:(id)a4 resultData:(id)a5 resultImageInformation:(id)a6 signpostID:(unint64_t)a7 error:(id)a8
{
  v14 = (void (*)(id, id, id, id))*((void *)a3 + 2);
  id v15 = a4;
  v14(a3, a5, a6, a8);
  id v16 = &_os_log_default;
  if (a7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_INTERVAL_END,  a7,  "com.apple.photos.mediaconversion.service",  "",  v17,  2u);
  }

  -[ImageConversionService decrementPendingRequestCountWithRequestIdentifier:]( self,  "decrementPendingRequestCountWithRequestIdentifier:",  v15);
}

- (void)decrementPendingRequestCountWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = v5->_pendingRequestCount - 1;
  v5->_int64_t pendingRequestCount = v6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Sent reply for image conversion request %{public}@, pending request count now %ld",  (uint8_t *)&v7,  0x16u);
  }

  objc_sync_exit(v5);
}

- (void)performBeginRequestActionsForUnitTestSupportOptions:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitDuringRequestKey"]);
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = @"PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitDuringRequestKey";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Terminating process because %@ request option is set",  buf,  0xCu);
    }

    exit(1);
  }

  -[ImageConversionService enumerateEnvironmentVariablePairsInRequestOptions:block:]( self,  "enumerateEnvironmentVariablePairsInRequestOptions:block:",  v6,  &stru_100028D18);
}

- (void)performEndRequestActionsForUnitTestSupportOptions:(id)a3
{
  id v4 = a3;
  -[ImageConversionService enumerateEnvironmentVariablePairsInRequestOptions:block:]( self,  "enumerateEnvironmentVariablePairsInRequestOptions:block:",  v4,  &stru_100028D38);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitAfterRequestKey"]);

  LODWORD(v4) = [v5 BOOLValue];
  if ((_DWORD)v4) {
    xpc_transaction_exit_clean();
  }
}

- (void)enumerateEnvironmentVariablePairsInRequestOptions:(id)a3 block:(id)a4
{
  unsigned int v5 = (void (**)(id, void *, void *))a4;
  id obj = (id)objc_claimAutoreleasedReturnValue( [a3 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportExtraEnvironmentVariablesKey"]);
  if (obj)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v6 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@"="]);
          if ([v11 count] != (id)2)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v14 handleFailureInMethod:a2, self, @"ImageConversionService.m", 324, @"Unexpected env var item count: %@", v10 object file lineNumber description];
          }

          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
          if ([v12 rangeOfString:@"^CI_.+$" options:1024] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v12;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Ignoring unsupported env var key %@",  buf,  0xCu);
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v23 = v12;
              __int16 v24 = 2112;
              NSErrorUserInfoKey v25 = v13;
              __int16 v26 = 2112;
              v27 = @"PAMediaConversionServiceOptionUnitTestSupportExtraEnvironmentVariablesKey";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting environment variable '%@' to '%@' because %@ request option is set",  buf,  0x20u);
            }

            v5[2](v5, v12, v13);
          }
        }

        id v7 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
      }

      while (v7);
    }
  }
}

- (BOOL)convertImageWithOptions:(id)a3 sourceURLCollection:(id)a4 outputURLCollection:(id)a5 outputData:(id *)a6 outputFileType:(id *)a7 outputImageInfo:(id *)a8 error:(id *)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = v15;
  v102 = a8;
  if (a8)
  {
    if (v15) {
      goto LABEL_5;
    }
  }

  else
  {
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v87 handleFailureInMethod:a2, self, @"ImageConversionService.m", 344, @"Invalid parameter not satisfying: %@", @"outputImageInfo" object file lineNumber description];

    if (v16) {
      goto LABEL_5;
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"]);
  unsigned __int8 v18 = [v17 BOOLValue];

  if ((v18 & 1) == 0)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v19,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"ImageConversionService.m",  346,  @"Neither destination URL collection nor NSData output option, should have been rejected at request enqueue time");
  }

- (id)urlCollectionForBookmarkDictionaryKey:(id)a3 inOptions:(id)a4 removeExistingEmptyFiles:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Nil %{public}@ URL collection bookmark dictionary in options",  buf,  0xCu);
    }

    id v13 = 0LL;
    if (!a6) {
      goto LABEL_22;
    }
LABEL_7:
    v22 = @"PAMediaConversionServiceErrorOffendingItemNameKey";
    id v23 = v9;
    uint64_t v12 = (PAMediaConversionServiceResourceURLCollectionAccessProvider *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v14 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  1LL,  v12));
LABEL_26:

    goto LABEL_27;
  }

  if ([v9 isEqualToString:@"PAMediaConversionServiceSourceBookmarkCollectionKey"]) {
    uint64_t v12 = -[PAMediaConversionServiceResourceURLCollectionAccessProvider initWithOptions:]( objc_alloc(&OBJC_CLASS___PAMediaConversionServiceResourceURLCollectionAccessProvider),  "initWithOptions:",  v10);
  }
  else {
    uint64_t v12 = 0LL;
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceResourceURLCollection collectionForBookmarkDataDictionaryRepresentation:accessProvider:error:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLCollection,  "collectionForBookmarkDataDictionaryRepresentation:accessProvider:error:",  v11,  v12,  a6));
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create URL collection for key %{public}@",  buf,  0xCu);
    }

    id v13 = 0LL;
    id v14 = 0LL;
    goto LABEL_26;
  }

  id v13 = v15;
  if ([v15 urlCount])
  {
    if (v7)
    {
      id v21 = 0LL;
      unsigned __int8 v16 = [v13 removeExistingEmptyFilesWithError:&v21];
      id v17 = v21;
      unsigned __int8 v18 = v17;
      if ((v16 & 1) == 0)
      {
        id v14 = 0LL;
        if (a6 && v17)
        {
          v26[0] = @"PAMediaConversionServiceErrorOffendingItemNameKey";
          v26[1] = NSUnderlyingErrorKey;
          v27[0] = v9;
          v27[1] = v17;
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
          *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v19));

          id v14 = 0LL;
        }

        goto LABEL_25;
      }
    }

    else
    {
      unsigned __int8 v18 = 0LL;
    }

    id v14 = v13;
LABEL_25:

    goto LABEL_26;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Empty url collection for key %{public}@",  buf,  0xCu);
  }

  if (a6) {
    goto LABEL_7;
  }
LABEL_22:
  id v14 = 0LL;
LABEL_27:

  return v14;
}

- (void)conversionQueue:(id)a3 processNextEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 initialRequestConversionOptions]);
  id v45 = self;
  -[ImageConversionService performBeginRequestActionsForUnitTestSupportOptions:]( self,  "performBeginRequestActionsForUnitTestSupportOptions:",  v8);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 anyDestinationURLCollectionForQueueEntry:v7]);
  id v41 = v6;
  id v38 = (void *)v9;
  v39 = (void *)v8;
  if (!v9)
  {
    uint64_t v14 = 0LL;
    id v13 = 0LL;
    goto LABEL_5;
  }

  uint64_t v10 = v9;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v54 = 0LL;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceSharedUtilitiesServiceSide temporaryFilesDirectoryURLForConversionTaskIdentifier:error:]( &OBJC_CLASS___PAMediaConversionServiceSharedUtilitiesServiceSide,  "temporaryFilesDirectoryURLForConversionTaskIdentifier:error:",  v11,  &v54));
  id v13 = v54;

  if (v12)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceSharedUtilitiesServiceSide temporaryDestinationURLCollectionForFinalDestinationURLCollection:inParentDirectoryURL:]( &OBJC_CLASS___PAMediaConversionServiceSharedUtilitiesServiceSide,  "temporaryDestinationURLCollectionForFinalDestinationURLCollection:inParentDirectoryURL:",  v10,  v12));
    [v7 setTemporaryFilesParentDirectoryURL:v12];

LABEL_5:
    id v15 = objc_autoreleasePoolPush();
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 sourceURLCollection]);
    id v52 = 0LL;
    id v53 = 0LL;
    id v50 = v13;
    id v51 = 0LL;
    BOOL v17 = -[ImageConversionService convertImageWithOptions:sourceURLCollection:outputURLCollection:outputData:outputFileType:outputImageInfo:error:]( v45,  "convertImageWithOptions:sourceURLCollection:outputURLCollection:outputData:outputFileType:outputImageInfo:error:",  v8,  v16,  v14,  &v53,  &v52,  &v51,  &v50);
    id v18 = v53;
    id v19 = v52;
    id v20 = v51;
    id v21 = v50;

    objc_autoreleasePoolPop(v15);
    id v22 = v20;
    id v23 = (id)v17;
    id v13 = v21;
    id v6 = v41;
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v57 = v7;
    __int16 v58 = 2112;
    id v59 = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create temporary files directory for request %{public}@: %@",  buf,  0x16u);
  }

  uint64_t v14 = 0LL;
  id v18 = 0LL;
  id v22 = 0LL;
  id v19 = 0LL;
  id v23 = 0LL;
LABEL_9:
  unint64_t v44 = v13;
  id v35 = v22;
  id v40 = v7;
  v36 = v19;
  v37 = (void *)v14;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "markCompletionAndRetrieveClientRequestsForQueueEntry:resultURLCollection:didConvertSuccessfu lly:conversionOutputInformation:conversionOutputData:conversionOutputFileType:conversionError:",  v7,  v14,  v23,  v13));
  id v24 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v43 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v47 != v43) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        v28 = objc_autoreleasePoolPush();
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v27 requestTracker]);
        uint64_t v30 = v29;
        id v31 = v23;
        if ((_DWORD)v23) {
          v32 = (void *)objc_claimAutoreleasedReturnValue([v29 outputInformation]);
        }
        else {
          v32 = 0LL;
        }
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v27 imageClientReplyHandler]);
        unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
        -[ImageConversionService replyToCompletionHandler:requestIdentifier:resultData:resultImageInformation:signpostID:error:]( v45,  "replyToCompletionHandler:requestIdentifier:resultData:resultImageInformation:signpostID:error:",  v33,  v34,  v18,  v32,  [v27 signpostID],  v44);

        objc_autoreleasePoolPop(v28);
        id v23 = v31;
      }

      id v25 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    }

    while (v25);
  }

  -[ImageConversionService performEndRequestActionsForUnitTestSupportOptions:]( v45,  "performEndRequestActionsForUnitTestSupportOptions:",  v39);
}

- (void)conversionQueueDidFinishProcessingEntry:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  uint64_t v6 = objc_sync_enter(v5);
  if (!v5->_pendingRequestCount)
  {
    CMPhotoReleaseHardwareResources(v6);
    uint64_t v10 = 0x7FF8000000000000LL;
    int v9 = 0;
    uint64_t v7 = pc_session_create(&v9, __stderrp, __stderrp);
    if (v7)
    {
      uint64_t v8 = getpid();
      pc_session_set_procpid(v7, v8);
      int v9 = pc_session_begin(v7);
      if (!v9) {
        pc_session_get_value(v7, 0LL, 0x6375726D656D0000LL, &v10, buf, 0LL);
      }
      pc_session_destroy(v7);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Finished processing last queue entry, dirty memory = %.0f KB",  buf,  0xCu);
    }
  }

  objc_sync_exit(v5);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v4 _xpcConnection]);
  pid_t pid = xpc_connection_get_pid(v6);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v5;
    __int16 v28 = 1024;
    pid_t v29 = pid;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Connection %{public}@ [%d] accepted",  buf,  0x12u);
  }

  id v24 = @"PAMCS_CONNECTION_USER_INFO_CONNECTION_IDENTIFIER_KEY";
  uint64_t v25 = v5;
  id v22 = (void *)v5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
  [v4 setUserInfo:v8];

  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ImageConversionService));
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PAMediaConversionServiceImageMetadataPolicy);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNull);
  id v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v21,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  objc_opt_class(&OBJC_CLASS___NSValue),  0LL);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v9 setClasses:v19 forSelector:"convertImageWithOptions:reply:" argumentIndex:0 ofReply:0];
  [v4 setExportedInterface:v9];
  [v4 setExportedObject:self];
  [v4 resume];

  return 1;
}

- (int64_t)pendingRequestCount
{
  return self->_pendingRequestCount;
}

- (void)setPendingRequestCount:(int64_t)a3
{
  self->_int64_t pendingRequestCount = a3;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setListener:(id)a3
{
}

- (MediaConversionQueue)requestQueue
{
  return (MediaConversionQueue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)run
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 run];
}

@end
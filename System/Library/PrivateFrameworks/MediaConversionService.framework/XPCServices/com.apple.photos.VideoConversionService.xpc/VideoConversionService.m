@interface VideoConversionService
+ (id)resourceURLCollectionForDestinationBookmarkDictionary:(id)a3 error:(id *)a4;
+ (void)_forceCrashAfterVideoConversionHangDetectedWithMarker;
+ (void)run;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)optionsRequirePhotosAdjustmentProcessing:(id)a3;
- (MediaConversionQueue)requestQueue;
- (NSXPCListener)listener;
- (VideoConversionService)init;
- (id)connectionTerminationEventHandlerForConnectionIdentifier:(id)a3 eventDescription:(id)a4;
- (void)cancelJobWithIdentifier:(id)a3;
- (void)cancelJobsForConnectionWithIdentifier:(id)a3;
- (void)conversionQueue:(id)a3 cancelCurrentlyProcessingEntry:(id)a4;
- (void)conversionQueue:(id)a3 didCancelQueuedEntry:(id)a4 clientRequests:(id)a5;
- (void)conversionQueue:(id)a3 processNextEntry:(id)a4;
- (void)convertVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)echo:(id)a3 reply:(id)a4;
- (void)extractStillImageFromVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)generateGIFForVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)modifyJobWithIdentifier:(id)a3 modifications:(id)a4;
- (void)performConversionOfClass:(Class)a3 forSourceBookmarkDictionary:(id)a4 destinationBookmarkDictionary:(id)a5 options:(id)a6 replyHandler:(id)a7;
- (void)requestStatusWithReply:(id)a3;
- (void)run;
- (void)setListener:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)singlePassConvertVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6;
@end

@implementation VideoConversionService

- (VideoConversionService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VideoConversionService;
  v2 = -[VideoConversionService init](&v6, "init");
  if (v2)
  {
    v3 = -[MediaConversionQueue initWithDelegate:]( objc_alloc(&OBJC_CLASS___MediaConversionQueue),  "initWithDelegate:",  v2);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v3;
  }

  return v2;
}

- (void)run
{
  v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.photos.VideoConversionService");
  -[VideoConversionService setListener:](self, "setListener:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionService listener](self, "listener"));
  [v4 setDelegate:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionService listener](self, "listener"));
  [v5 resume];

  dispatch_main();
}

- (void)performConversionOfClass:(Class)a3 forSourceBookmarkDictionary:(id)a4 destinationBookmarkDictionary:(id)a5 options:(id)a6 replyHandler:(id)a7
{
  id v13 = a4;
  id v72 = a5;
  id v14 = a6;
  id v15 = a7;
  v74 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"]);
  if (!v74)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v61 handleFailureInMethod:a2, self, @"VideoConversionService.m", 1537, @"Invalid parameter not satisfying: %@", @"requestIdentifier" object file lineNumber description];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v16 userInfo]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v69 objectForKeyedSubscript:@"PAMCS_CONNECTION_USER_INFO_CONNECTION_IDENTIFIER_KEY"]);
  v19 = (void *)objc_opt_new(&OBJC_CLASS___ClientRequest, v18);
  v70 = v16;
  [v19 setConnection:v16];
  v71 = (void *)v17;
  [v19 setConnectionIdentifier:v17];
  [v19 setVideoClientReplyHandler:v15];
  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsProgressKey"]);
  objc_msgSend(v19, "setWantsProgress:", objc_msgSend(v20, "BOOLValue"));

  v21 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionJobPriorityKey"]);
  id v22 = [v21 integerValue];

  id v67 = v15;
  if (!v22)
  {
    id v23 = [v14 mutableCopy];
    [v23 setObject:&off_100033330 forKeyedSubscript:@"PAMediaConversionServiceOptionJobPriorityKey"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v24 = @"background";
      *(_DWORD *)buf = 138543618;
      v79 = v74;
      __int16 v80 = 2112;
      v81 = @"background";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Request %{public}@ does not have a priority, the client should provide one. Defaulting to %@.",  buf,  0x16u);
    }

    id v14 = v23;
  }

  unint64_t v25 = -[MediaConversionQueue nextRequestNumber](self->_requestQueue, "nextRequestNumber");
  id v26 = [v14 mutableCopy];
  [v26 setObject:v13 forKeyedSubscript:@"PAMediaConversionServiceSourceBookmarkCollectionKey"];
  v68 = v26;
  unint64_t v62 = v25;
  v73 = -[MediaConversionRequestTracker initWithRequestOptions:requestNumber:]( objc_alloc(&OBJC_CLASS___MediaConversionRequestTracker),  "initWithRequestOptions:requestNumber:",  v26,  v25);
  objc_msgSend(v19, "setRequestTracker:");
  v27 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionQueue queueEntryWithConversionOptions:]( self->_requestQueue,  "queueEntryWithConversionOptions:",  v14));
  objc_msgSend( v27,  "setTaskTypeSupportsDeduplication:",  -[objc_class supportsDeduplication](a3, "supportsDeduplication"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  id v77 = 0LL;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceSharedUtilitiesServiceSide temporaryFilesDirectoryURLForConversionTaskIdentifier:error:]( &OBJC_CLASS___PAMediaConversionServiceSharedUtilitiesServiceSide,  "temporaryFilesDirectoryURLForConversionTaskIdentifier:error:",  v28,  &v77));
  v30 = (__CFString *)v77;

  if (v29)
  {
    v63 = a3;
    [v27 setTemporaryFilesParentDirectoryURL:v29];
    v31 = v29;
    v32 = (void *)objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"]);
    unsigned int v33 = [v32 BOOLValue];

    v65 = v31;
    id v66 = v13;
    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([v31 URLByAppendingPathComponent:v74]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 URLByAppendingPathExtension:@"mov"]);

      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLCollection,  "collectionWithMainResourceURL:",  v35));
    }

    else
    {
      v76 = v30;
      id v39 = [(id)objc_opt_class(self) resourceURLCollectionForDestinationBookmarkDictionary:v72 error:&v76];
      v35 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v40 = v76;

      if (!v35)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v40, "domain"));
        if ([v42 isEqualToString:NSCocoaErrorDomain])
        {
          id v43 = -[__CFString code](v40, "code");

          v37 = (void (**)(void, void, void, void))v67;
          if (v43 == (id)4)
          {
            [v19 setRequiresDeduplicationAgainstOriginalWithIdenticalOutput:1];
            v35 = 0LL;
            uint64_t v36 = 0LL;
            v30 = v40;
            id v13 = v66;
LABEL_22:
            v38 = v73;

            id v44 = objc_alloc(v63);
            Class v64 = (Class)v36;
            id v45 = [v44 initWithSourceBookmarkDictionary:v13 outputURLCollection:v36 options:v14 requestTracker:v73];
            v46 = (void *)objc_claimAutoreleasedReturnValue([v45 sourceURLCollection]);
            [v27 setSourceURLCollection:v46];

            uint64_t v47 = objc_claimAutoreleasedReturnValue([v27 identifier]);
            [v45 setIdentifier:v47];

            [v27 setVideoConversionTask:v45];
            [v45 setProgressObserver:v27];
            [v45 didEnqueue];
            requestQueue = self->_requestQueue;
            id v75 = 0LL;
            LOBYTE(v47) = -[MediaConversionQueue enqueueEntry:clientRequest:isDuplicateOfOriginalQueueEntry:]( requestQueue,  "enqueueEntry:clientRequest:isDuplicateOfOriginalQueueEntry:",  v27,  v19,  &v75);
            id v49 = v75;
            v50 = v49;
            if ((v47 & 1) != 0)
            {
              if (v49) {
                v51 = v49;
              }
              else {
                v51 = v27;
              }
              id v52 = v51;
              if (!v50) {
                [v45 startProgressUpdateTimerAndMarkStartTime];
              }
              v53 = (void *)objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"]);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
              {
                v54 = v37;
                v55 = (void *)objc_claimAutoreleasedReturnValue([v52 identifier]);
                *(_DWORD *)buf = 134219266;
                v79 = (__CFString *)v62;
                __int16 v80 = 2114;
                v81 = v74;
                __int16 v82 = 2114;
                v83 = v55;
                __int16 v84 = 1024;
                BOOL v85 = v50 != 0LL;
                __int16 v86 = 2114;
                v87 = v53;
                __int16 v88 = 2114;
                v89 = v71;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Received conversion request #%lu %{public}@, attached to conversion task %{public}@, isDuplicate = %d, reason '%{public}@', connection %{public}@",  buf,  0x3Au);

                v37 = v54;
                v38 = v73;
              }
            }

            else
            {
              unsigned int v56 = [v19 requiresDeduplicationAgainstOriginalWithIdenticalOutput];
              BOOL v57 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v56)
              {
                if (v57)
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to enqueue new request, required deduplication failed",  buf,  2u);
                }

                NSErrorUserInfoKey v92 = NSDebugDescriptionErrorKey;
                v93 = @"Unable to enqueue new request, required deduplication failed";
                v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
                uint64_t v59 = 4LL;
              }

              else
              {
                if (v57)
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to enqueue new request, unknown reason",  buf,  2u);
                }

                NSErrorUserInfoKey v90 = NSDebugDescriptionErrorKey;
                v91 = @"Unable to enqueue new request, unknown reason";
                v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
                uint64_t v59 = 0LL;
              }

              uint64_t v60 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  v59,  v58));

              v37[2](v37, 2LL, 0LL, v60);
              v30 = (__CFString *)v60;
            }

LABEL_40:
            v29 = v65;
            id v13 = v66;
            goto LABEL_41;
          }
        }

        else
        {

          v37 = (void (**)(void, void, void, void))v67;
        }

        v38 = v73;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v79 = v74;
          __int16 v80 = 2112;
          v81 = v40;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to resolve final destination URLs for %{public}@: %@",  buf,  0x16u);
        }

        ((void (**)(void, uint64_t, void, __CFString *))v37)[2](v37, 2LL, 0LL, v40);
        v30 = v40;
        goto LABEL_40;
      }

      -[MediaConversionRequestTracker setDestinationURLCollection:](v73, "setDestinationURLCollection:", v35);
      if ([v27 taskTypeSupportsDeduplication])
      {
        id v41 = (id)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceSharedUtilitiesServiceSide temporaryDestinationURLCollectionForFinalDestinationURLCollection:inParentDirectoryURL:]( &OBJC_CLASS___PAMediaConversionServiceSharedUtilitiesServiceSide,  "temporaryDestinationURLCollectionForFinalDestinationURLCollection:inParentDirectoryURL:",  v35,  v31));
      }

      else
      {
        id v41 = v35;
        v35 = v41;
      }

      uint64_t v36 = (uint64_t)v41;
      v30 = v40;
      id v13 = v66;
    }

    v37 = (void (**)(void, void, void, void))v67;
    goto LABEL_22;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v79 = v74;
    __int16 v80 = 2112;
    v81 = v30;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create temporary files directory for request %{public}@: %@",  buf,  0x16u);
  }

  v37 = (void (**)(void, void, void, void))v67;
  (*((void (**)(id, uint64_t, void, __CFString *))v67 + 2))(v67, 2LL, 0LL, v30);
  v38 = v73;
LABEL_41:
}

- (BOOL)optionsRequirePhotosAdjustmentProcessing:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( [a3 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAdjustmentInformationKey"]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)conversionQueue:(id)a3 didCancelQueuedEntry:(id)a4 clientRequests:(id)a5
{
  id v28 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 videoConversionTask]);
  id v12 = [v11 status];
  if (v12 != (id)5)
  {
    unint64_t v24 = (unint64_t)v12;
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    if (v24 > 6) {
      id v26 = 0LL;
    }
    else {
      id v26 = off_100030E80[v24];
    }
    v27 = v26;
    [v25 handleFailureInMethod:a2, self, @"VideoConversionService.m", 1684, @"Unexpected conversion task status %@ during cancellation of queued task", v27, v28 object file lineNumber description];
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100018948;
  v33[3] = &unk_1000310B0;
  id v13 = v9;
  id v34 = v13;
  [v11 setCompletionHandler:v33];
  [v11 cancel];
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v18);
        v20 = objc_autoreleasePoolPush();
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 requestTracker]);
        id v22 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v19 videoClientReplyHandler]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 error]);
        ((void (**)(void, uint64_t, void, void *))v22)[2](v22, 4LL, 0LL, v23);

        objc_autoreleasePoolPop(v20);
        uint64_t v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v16);
  }
}

- (void)conversionQueue:(id)a3 processNextEntry:(id)a4
{
  id v37 = a3;
  id v39 = a4;
  id v41 = (void *)objc_claimAutoreleasedReturnValue([v39 videoConversionTask]);
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x2020000000LL;
  uint64_t v53 = 0LL;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100018934;
  v47[3] = &unk_1000310D8;
  id v49 = &v50;
  dsema = dispatch_semaphore_create(0LL);
  v48 = dsema;
  [v41 setCompletionHandler:v47];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v41 options]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"_unitTestPreConversionDelayKey"]);

  if (v38) {
    sleep([v38 intValue]);
  }
  [v41 performConversion];
  while (1)
  {
    dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
    if (!dispatch_semaphore_wait(dsema, v7)) {
      break;
    }
    if ([v41 didDetectHang])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v39 sourceURLCollection]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 filenameExtensionAndPathHashForRole:@"PAMediaConversionResourceRoleMainResource"]);

      id v10 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v39 sourceURLCollection]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 logMessageSummary]);
        *(_DWORD *)buf = 138543875;
        id v56 = v39;
        __int16 v57 = 2113;
        v58 = v9;
        __int16 v59 = 2114;
        uint64_t v60 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Timeout for %{public}@ with stalled conversion for %{private}@ (%{public}@), forcing exit",  buf,  0x20u);
      }

      [(id)objc_opt_class(self) _forceCrashAfterVideoConversionHangDetectedWithMarker];
    }
  }

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v41 error]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v41 resultInformation]);
  uint64_t v42 = v51[3];
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v41 resultInformation]);
  if (v13) {
    goto LABEL_10;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v41 error]);
  BOOL v15 = v14 == 0LL;

  if (v15)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:1729 description:@"Conversion task finished without output information or error"];
LABEL_10:
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue([v41 outputURLCollection]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v41 resultInformation]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"PAMediaConversionServiceResultDataKey"]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v41 options]);
  v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOutputFileTypeKey"]);
  v20 = (void *)objc_claimAutoreleasedReturnValue( [v37 markCompletionAndRetrieveClientRequestsForQueueEntry:v39 resultURLCollection:v34 didConvertSuccessfully:v42 == 1 conv ersionOutputInformation:v35 conversionOutputData:v17 conversionOutputFileType:v19 conversionError:v36]);

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v21);
        }
        unint64_t v25 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        id v26 = objc_autoreleasePoolPush();
        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 requestTracker]);
        id v28 = v27;
        if (v42 == 1) {
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v27 outputInformation]);
        }
        else {
          __int128 v29 = 0LL;
        }
        __int128 v30 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v25 videoClientReplyHandler]);
        uint64_t v31 = v51[3];
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v28 error]);
        ((void (**)(void, uint64_t, void *, void *))v30)[2](v30, v31, v29, v32);

        objc_autoreleasePoolPop(v26);
      }

      id v22 = [v21 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }

    while (v22);
  }

  _Block_object_dispose(&v50, 8);
}

- (void)conversionQueue:(id)a3 cancelCurrentlyProcessingEntry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Request queue issued cancellation of currently processing queue entry %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 videoConversionTask]);
  if (!v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:1763 description:@"Unexpected nil conversion task"];
  }

  [v9 cancel];
}

- (void)echo:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 stringByAppendingString:a3]);
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)convertVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = (void (**)(id, uint64_t, void, void *))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  if (-[VideoConversionService optionsRequirePhotosAdjustmentProcessing:]( self,  "optionsRequirePhotosAdjustmentProcessing:",  v11))
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    uint64_t v18 = @"Photos adjustments rendering is unavailable on this platform";
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  2LL,  v14));

    v10[2](v10, 2LL, 0LL, v15);
    uint64_t v16 = 0LL;
  }

  else
  {
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___ExportSessionVideoTranscodingTask);
  }

  -[VideoConversionService performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:]( self,  "performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:",  v16,  v13,  v12,  v11,  v10);
}

- (void)generateGIFForVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[VideoConversionService performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:]( self,  "performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:",  objc_opt_class(&OBJC_CLASS___GIFExportVideoTranscodingTask),  v13,  v12,  v11,  v10);
}

- (void)singlePassConvertVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[VideoConversionService performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:]( self,  "performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:",  objc_opt_class(&OBJC_CLASS___SinglePassVideoTranscodingTask),  v13,  v12,  v11,  v10);
}

- (void)extractStillImageFromVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[VideoConversionService performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:]( self,  "performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:",  objc_opt_class(&OBJC_CLASS___VideoStillImageExtractionTask),  v13,  v12,  v11,  v10);
}

- (void)modifyJobWithIdentifier:(id)a3 modifications:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Modify job for request %{public}@: %{public}@",  buf,  0x16u);
  }

  requestQueue = self->_requestQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100018614;
  v12[3] = &unk_100031100;
  id v13 = v7;
  id v14 = v8;
  BOOL v15 = self;
  SEL v16 = a2;
  id v10 = v8;
  id v11 = v7;
  -[MediaConversionQueue modifyRequestWithIdentifier:changeHandler:]( requestQueue,  "modifyRequestWithIdentifier:changeHandler:",  v11,  v12);
}

- (void)cancelJobWithIdentifier:(id)a3
{
}

- (void)cancelJobsForConnectionWithIdentifier:(id)a3
{
  requestQueue = self->_requestQueue;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  -[MediaConversionQueue cancelRequestsForConnectionIdentifier:]( requestQueue,  "cancelRequestsForConnectionIdentifier:",  v4);
}

- (void)requestStatusWithReply:(id)a3
{
  id v8 = @"PAMediaConversionServiceProcessIdentifierKey";
  id v4 = a3;
  v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v9 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  (*((void (**)(id, void *, void))a3 + 2))(v4, v7, 0LL);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v4 _xpcConnection]);
  pid_t pid = xpc_connection_get_pid(v6);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v5;
    __int16 v29 = 1024;
    pid_t v30 = pid;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Connection %{public}@ [%d] accepted",  buf,  0x12u);
  }

  unint64_t v25 = @"PAMCS_CONNECTION_USER_INFO_CONNECTION_IDENTIFIER_KEY";
  uint64_t v26 = v5;
  uint64_t v23 = (void *)v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  [v4 setUserInfo:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VideoConversionService));
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PAMediaConversionServiceDefaultImageMetadataPolicy);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___CLLocation);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData);
  NSErrorUserInfoKey v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v9 setClasses:v18 forSelector:"convertVideoAtSourceBookmarkDictionary:toDestinationBookmarkDictionary:options:replyHandler:" argumentIndex:2 ofReply:0];
  [v9 setClasses:v18 forSelector:"extractStillImageFromVideoAtSourceBookmarkDictionary:toDestinationBookmarkDictionary:options:replyHandler:" argumentIndex:2 ofReply:0];
  [v4 setExportedInterface:v9];
  [v4 setExportedObject:self];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VideoConversionServiceClient));
  [v4 setRemoteObjectInterface:v19];

  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[VideoConversionService connectionTerminationEventHandlerForConnectionIdentifier:eventDescription:]( self,  "connectionTerminationEventHandlerForConnectionIdentifier:eventDescription:",  v23,  @"interruption"));
  [v4 setInterruptionHandler:v20];

  id v21 = (void *)objc_claimAutoreleasedReturnValue( -[VideoConversionService connectionTerminationEventHandlerForConnectionIdentifier:eventDescription:]( self,  "connectionTerminationEventHandlerForConnectionIdentifier:eventDescription:",  v23,  @"invalidation"));
  [v4 setInvalidationHandler:v21];

  [v4 resume];
  return 1;
}

- (id)connectionTerminationEventHandlerForConnectionIdentifier:(id)a3 eventDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001853C;
  v12[3] = &unk_100031128;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = objc_retainBlock(v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setListener:(id)a3
{
}

- (MediaConversionQueue)requestQueue
{
  return (MediaConversionQueue *)objc_getProperty(self, a2, 16LL, 1);
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

+ (id)resourceURLCollectionForDestinationBookmarkDictionary:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceResourceURLCollection collectionForBookmarkDataDictionaryRepresentation:accessProvider:error:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLCollection,  "collectionForBookmarkDataDictionaryRepresentation:accessProvider:error:",  a3,  0LL,  a4));
  id v6 = v5;
  if (!v5)
  {
    id v8 = 0LL;
    goto LABEL_8;
  }

  id v10 = 0LL;
  unsigned __int8 v7 = [v5 removeExistingEmptyFilesWithError:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to remove destination URL: %@",  buf,  0xCu);
      if (!a4) {
        goto LABEL_6;
      }
    }

    else if (!a4)
    {
LABEL_6:

      id v6 = 0LL;
      goto LABEL_8;
    }

    *a4 = v8;
    goto LABEL_6;
  }

+ (void)_forceCrashAfterVideoConversionHangDetectedWithMarker
{
}

@end
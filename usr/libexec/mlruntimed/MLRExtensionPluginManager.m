@interface MLRExtensionPluginManager
+ (id)pluginManagerForBundleIdentifier:(id)a3 endpoint:(id)a4;
- (MLRExtensionPluginManager)initWithExtension:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)description;
- (id)_createSandBoxExtensions:(id)a3 error:(id *)a4;
- (id)_failToGetHostError;
- (id)_failToPerformErrorWithError:(id)a3;
- (id)_recordDirectoriesForIdentifier:(id)a3;
- (id)_skipTaskError;
- (id)extensionName;
- (id)performTask:(id)a3 error:(id *)a4;
- (id)performTrialTask:(id)a3 outError:(id *)a4;
- (id)sandboxExtensionsForTask:(id)a3 error:(id *)a4;
- (int64_t)_graceIntervalBeforeKilling;
- (int64_t)_graceIntervalBeforeUnloading;
- (void)_activateExtensionIfNecessary;
- (void)_killExtension:(id)a3 afterInterval:(int64_t)a4;
- (void)_setupExtensionHandlers;
- (void)_triggerSimulatedCrash;
- (void)_unload;
- (void)stopWithCompletion:(id)a3;
- (void)unload;
@end

@implementation MLRExtensionPluginManager

+ (id)pluginManagerForBundleIdentifier:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v39[0] = NSExtensionPointName;
      v39[1] = NSExtensionIdentifierName;
      v40[0] = v7;
      v40[1] = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  2LL));
      id v32 = 0LL;
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtension extensionsWithMatchingAttributes:error:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingAttributes:error:",  v9,  &v32));
      v11 = (os_log_s *)v32;
      if ((unint64_t)[v10 count] < 2)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
        v12 = v29;
        if (v28)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            sub_100004E10(v10, v12);
          }

          id v30 = objc_alloc((Class)a1);
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
          id v27 = [v30 initWithExtension:v12];
          goto LABEL_18;
        }

        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v34 = v6;
          __int16 v35 = 2112;
          v36 = v8;
          __int16 v37 = 2112;
          v38 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unable to find extension for identifier=%@ extensionPoint=%@, with error=%@",  buf,  0x20u);
        }
      }

      else
      {
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          sub_100004D90((uint64_t)v6, (uint64_t)v8, v12);
        }
      }

      id v27 = 0LL;
LABEL_18:

      goto LABEL_19;
    }

    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100004D60(v11, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  else
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100004D30(v11, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  id v27 = 0LL;
LABEL_19:

  return v27;
}

- (MLRExtensionPluginManager)initWithExtension:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___MLRExtensionPluginManager;
  id v6 = -[MLRExtensionPluginManager init](&v34, "init");
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 identifier]);
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@"."]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastObject]);

    uint64_t v13 = (objc_class *)objc_opt_class(v7);
    uint64_t v14 = NSStringFromClass(v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v15, v12));

    id v17 = v16;
    uint64_t v18 = (const char *)[v17 cStringUsingEncoding:4];
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create(v18, v20);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v21;

    uint64_t v23 = (objc_class *)objc_opt_class(v7);
    uint64_t v24 = NSStringFromClass(v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.execution",  v25,  v12));

    id v27 = v26;
    v28 = (const char *)[v27 cStringUsingEncoding:4];
    dispatch_queue_attr_t v29 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v30 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v29);
    dispatch_queue_t v31 = dispatch_queue_create(v28, v30);
    taskExecutionQueue = v7->_taskExecutionQueue;
    v7->_taskExecutionQueue = (OS_dispatch_queue *)v31;

    -[MLRExtensionPluginManager _setupExtensionHandlers](v7, "_setupExtensionHandlers");
  }

  return v7;
}

- (void)_setupExtensionHandlers
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100002CC0;
  v5[3] = &unk_1000146B8;
  objc_copyWeak(&v6, &location);
  -[NSExtension setRequestInterruptionBlock:](self->_extension, "setRequestInterruptionBlock:", v5);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100002DDC;
  v3[3] = &unk_1000146E0;
  objc_copyWeak(&v4, &location);
  -[NSExtension setRequestCancellationBlock:](self->_extension, "setRequestCancellationBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)extensionName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension identifier](self->_extension, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsSeparatedByString:@"."]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  return v4;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager extensionName](self, "extensionName"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@ %@>", v3, v4));

  return (NSString *)v5;
}

- (void)_activateExtensionIfNecessary
{
  if (!self->_sessionID)
  {
    if (self->_stopped)
    {
      uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_100005008();
      }
    }

    else
    {
      extension = self->_extension;
      id v10 = 0LL;
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSExtension beginExtensionRequestWithOptions:inputItems:error:]( extension,  "beginExtensionRequestWithOptions:inputItems:error:",  0LL,  0LL,  &v10));
      uint64_t v3 = (os_log_s *)v10;
      if (v5)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension _extensionContextForUUID:](self->_extension, "_extensionContextForUUID:", v5));
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___MLRExtensionHostContext);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          objc_storeStrong((id *)&self->_hostContext, v6);
          uint64_t v8 = v5;
          sessionID = self->_sessionID;
          self->_sessionID = v8;
        }

        else
        {
          sessionID = (NSUUID *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
          if (os_log_type_enabled((os_log_t)sessionID, OS_LOG_TYPE_ERROR)) {
            sub_100004F88((uint64_t)v6, (os_log_s *)sessionID);
          }
        }
      }

      else
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
        if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
          sub_100004F24();
        }
      }
    }
  }

- (int64_t)_graceIntervalBeforeKilling
{
  if (-[MLRExtensionPluginManager shouldTriggerSimulatedCrash](self, "shouldTriggerSimulatedCrash")) {
    return 10000000000LL;
  }
  else {
    return 0LL;
  }
}

- (void)_killExtension:(id)a3 afterInterval:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 < 1)
  {
    [v6 _kill:9];
  }

  else
  {
    dispatch_time_t v8 = dispatch_time(0LL, a4);
    syncQueue = self->_syncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003220;
    block[3] = &unk_100014708;
    id v11 = v7;
    dispatch_after(v8, (dispatch_queue_t)syncQueue, block);
  }
}

- (void)_triggerSimulatedCrash
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000506C(self, v3);
  }

  hostContext = self->_hostContext;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000032D0;
  v5[3] = &unk_100014770;
  void v5[4] = self;
  -[MLRExtensionHostContext performOnRemoteObjectSynchronouslyWithBlock:errorHandler:]( hostContext,  "performOnRemoteObjectSynchronouslyWithBlock:errorHandler:",  &stru_100014748,  v5);
}

- (void)_unload
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100005170();
  }

  if (self->_sessionID)
  {
    -[NSExtension setRequestCancellationBlock:](self->_extension, "setRequestCancellationBlock:", 0LL);
    -[NSExtension setRequestInterruptionBlock:](self->_extension, "setRequestInterruptionBlock:", 0LL);
    hostContext = self->_hostContext;
    self->_hostContext = 0LL;

    -[NSExtension cancelExtensionRequestWithIdentifier:]( self->_extension,  "cancelExtensionRequestWithIdentifier:",  self->_sessionID);
    sessionID = self->_sessionID;
    self->_sessionID = 0LL;
  }

- (void)unload
{
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003428;
  block[3] = &unk_100014708;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)syncQueue, block);
}

- (id)_recordDirectoriesForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___DESRecordStoreManager);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DESRecordStoreManager recordDirURLsForBundleId:](v4, "recordDirURLsForBundleId:", v3));

  return v5;
}

- (id)_createSandBoxExtensions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recipe]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 attachments]);
  id v10 = [v9 count];

  if (v10)
  {
    hostContext = self->_hostContext;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 recipe]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 attachments]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:]( hostContext,  "issueSandBoxExtensionsForFileURLs:requireWrite:outError:",  v13,  0LL,  a4));

    id v15 = [v14 count];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 recipe]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 attachments]);
    id v18 = [v17 count];

    if (v15 != v18)
    {
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1000052CC(v6, v28);
      }
      goto LABEL_14;
    }

    [v7 addObjectsFromArray:v14];
  }

  dispatch_queue_attr_t v19 = self->_hostContext;
  uint64_t v20 = DESSubmissionLogDirectoryURL();
  dispatch_queue_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v32 = v21;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:]( v19,  "issueSandBoxExtensionsForFileURLs:requireWrite:outError:",  v22,  1LL,  a4));

  if ([v14 count] != (id)1)
  {
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100005268();
    }
    goto LABEL_14;
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
  [v7 addObject:v23];

  uint64_t v24 = self->_hostContext;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 recipe]);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleIdentifier]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue( -[MLRExtensionPluginManager _recordDirectoriesForIdentifier:]( self,  "_recordDirectoriesForIdentifier:",  v26));
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:]( v24,  "issueSandBoxExtensionsForFileURLs:requireWrite:outError:",  v27,  0LL,  a4));

  if (!-[os_log_s count](v28, "count"))
  {
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1000051D4(v6, v30);
    }

LABEL_14:
    id v29 = 0LL;
    goto LABEL_15;
  }

  [v7 addObjectsFromArray:v28];
  id v29 = [v7 copy];
LABEL_15:

  return v29;
}

- (id)_skipTaskError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager extensionName](self, "extensionName"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Ignoring tasks after plugin=%@ is requested to stop.",  v2));

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100005360();
  }

  uint64_t v5 = kDESDistributedEvaluationErrorDomain;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  8003LL,  v6));

  return v7;
}

- (id)_failToGetHostError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager extensionName](self, "extensionName"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Fail to get host context for %@.",  v2));

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100005360();
  }

  uint64_t v5 = kDESDistributedEvaluationErrorDomain;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  8004LL,  v6));

  return v7;
}

- (id)_failToPerformErrorWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"error should not be nil",  0LL));
    objc_exception_throw(v17);
  }

  uint64_t v5 = v4;
  BOOL stopped = self->_stopped;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager extensionName](self, "extensionName"));
  dispatch_time_t v8 = (void *)v7;
  if (stopped)
  {
    NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Not responding to stop request?",  v7));

    uint64_t v10 = kDESDistributedEvaluationErrorDomain;
    v20[0] = NSLocalizedDescriptionKey;
    v20[1] = NSUnderlyingErrorKey;
    v21[0] = v9;
    v21[1] = v5;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  8015LL,  v11));

    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000053C4();
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ crashed?",  v7));

    uint64_t v14 = kDESDistributedEvaluationErrorDomain;
    v18[0] = NSLocalizedDescriptionKey;
    v18[1] = NSUnderlyingErrorKey;
    v19[0] = v13;
    v19[1] = v5;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  8016LL,  v15));
  }

  return v12;
}

- (id)sandboxExtensionsForTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  dispatch_queue_t v21 = v6;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 MLRSandboxExtensionRequests]);
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        hostContext = self->_hostContext;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 URLs]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:]( hostContext,  "issueSandBoxExtensionsForFileURLs:requireWrite:outError:",  v14,  [v12 requireWrite],  a4));

        id v16 = [v15 count];
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 URLs]);
        id v18 = [v17 count];

        if (v16 != v18)
        {

          id v19 = 0LL;
          goto LABEL_11;
        }

        [v7 addObjectsFromArray:v15];
      }

      id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v19 = v7;
LABEL_11:

  return v19;
}

- (id)performTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_100003F2C;
  id v30 = sub_100003F3C;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  dispatch_queue_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  __int128 v23 = sub_100003F2C;
  __int128 v24 = sub_100003F3C;
  id v25 = 0LL;
  taskExecutionQueue = self->_taskExecutionQueue;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_100003F44;
  id v15 = &unk_100014838;
  id v16 = self;
  id v18 = &v20;
  id v8 = v6;
  id v17 = v8;
  id v19 = &v26;
  dispatch_sync((dispatch_queue_t)taskExecutionQueue, &v12);
  if (a4)
  {
    id v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }

  -[MLRExtensionPluginManager unload](self, "unload", v12, v13, v14, v15, v16);
  id v10 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (id)performTrialTask:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_100003F2C;
  id v30 = sub_100003F3C;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  dispatch_queue_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  __int128 v23 = sub_100003F2C;
  __int128 v24 = sub_100003F3C;
  id v25 = 0LL;
  taskExecutionQueue = self->_taskExecutionQueue;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_1000044BC;
  id v15 = &unk_100014838;
  id v16 = self;
  id v18 = &v20;
  id v8 = v6;
  id v17 = v8;
  id v19 = &v26;
  dispatch_sync((dispatch_queue_t)taskExecutionQueue, &v12);
  if (a4)
  {
    id v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }

  -[MLRExtensionPluginManager unload](self, "unload", v12, v13, v14, v15, v16);
  id v10 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (int64_t)_graceIntervalBeforeUnloading
{
  return 5000000000LL;
}

- (void)stopWithCompletion:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004950;
  v7[3] = &unk_100014888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)syncQueue, v7);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end
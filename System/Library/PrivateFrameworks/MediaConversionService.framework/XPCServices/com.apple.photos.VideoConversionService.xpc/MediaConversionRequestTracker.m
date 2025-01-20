@interface MediaConversionRequestTracker
- (BOOL)_valueIsSimpleScalarType:(id)a3;
- (BOOL)copyDuplicateRequestOutputFromOriginalRequestTracker:(id)a3 error:(id *)a4;
- (BOOL)isDuplicateOfRequestWithRequestTracker:(id)a3 identicalDestinationURL:(BOOL *)a4;
- (BOOL)shouldDump;
- (MediaConversionRequestTracker)initWithRequestOptions:(id)a3 requestNumber:(unint64_t)a4;
- (NSData)outputData;
- (NSDate)dequeueAndStartProcessingTime;
- (NSDate)endTime;
- (NSDate)enqueueTime;
- (NSDictionary)cachedPerfCheckInformation;
- (NSDictionary)outputInformation;
- (NSDictionary)requestCompletionPerfCheckExtraInformation;
- (NSDictionary)requestOptions;
- (NSDictionary)serviceInformation;
- (NSError)error;
- (NSMutableArray)coreImageGraphDumpPaths;
- (NSSet)coreImageGraphDumpURLsAtStart;
- (NSString)originalRequestIdentifier;
- (NSString)outputTypeIdentifier;
- (NSString)requestIdentifier;
- (NSString)requestOptionsSignatureString;
- (NSString)sourceURLFilenameOnlySummary;
- (NSURL)debugDumpDirectoryURL;
- (NSURL)outputURL;
- (OS_os_transaction)transaction;
- (PAMediaConversionServiceResourceURLCollection)destinationURLCollection;
- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection;
- (double)initialProcessMemoryPeak;
- (id)destinationURLsSignature;
- (id)graphDumpURLsForCurrentProcessIdentifier;
- (id)requestCompletionPerfCheckExtraInformationLogString;
- (id)sourceURLCollectionSignature;
- (int)clientProcessIdentifier;
- (int64_t)compare:(id)a3;
- (int64_t)effectivePriority;
- (pc_session)pc_session;
- (unint64_t)hashForObject:(id)a3;
- (unint64_t)requestNumber;
- (unint64_t)signpostId;
- (void)addCoreImageGraphDumpPath:(id)a3;
- (void)cacheDestinationBookmarkCollectionSignature;
- (void)cacheSourceBookmarkCollectionSignatureAndFilename;
- (void)copyCoreImageGraphDumpsToURL:(id)a3;
- (void)didCompleteRequest;
- (void)didDequeueAndStartProcessingRequest;
- (void)dumpResourceURLCollection:(id)a3 toParentDirectory:(id)a4 directoryName:(id)a5 updatingDebugInformation:(id)a6;
- (void)markAsCompletedWithInitialRequestIdentifier:(id)a3;
- (void)setCachedPerfCheckInformation:(id)a3;
- (void)setClientProcessIdentifier:(int)a3;
- (void)setCoreImageGraphDumpPaths:(id)a3;
- (void)setCoreImageGraphDumpURLsAtStart:(id)a3;
- (void)setDebugDumpDirectoryURL:(id)a3;
- (void)setDequeueAndStartProcessingTime:(id)a3;
- (void)setDestinationURLCollection:(id)a3;
- (void)setEffectivePriority:(int64_t)a3;
- (void)setEndTime:(id)a3;
- (void)setEnqueueTime:(id)a3;
- (void)setError:(id)a3;
- (void)setInitialProcessMemoryPeak:(double)a3;
- (void)setOriginalRequestIdentifier:(id)a3;
- (void)setOutputData:(id)a3;
- (void)setOutputInformation:(id)a3;
- (void)setOutputTypeIdentifier:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setPc_session:(pc_session *)a3;
- (void)setRequestNumber:(unint64_t)a3;
- (void)setRequestOptions:(id)a3;
- (void)setServiceInformation:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setSourceURLCollection:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setupCoreImageGraphDumpCapture;
- (void)setupPerfCheck;
- (void)storeDebugDump;
- (void)storeDebugDumpInputInformationToURL:(id)a3 updatingDebugInformation:(id)a4;
- (void)storeDebugDumpOutputInformationToURL:(id)a3 updatingDebugInformation:(id)a4;
@end

@implementation MediaConversionRequestTracker

- (MediaConversionRequestTracker)initWithRequestOptions:(id)a3 requestNumber:(unint64_t)a4
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"]);

  if (!v9)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v24 handleFailureInMethod:a2, self, @"MediaConversionDebugUtilities.m", 46, @"Invalid parameter not satisfying: %@", @"requestOptions[PAMediaConversionServiceJobIdentifierKey]" object file lineNumber description];
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MediaConversionRequestTracker;
  v10 = -[MediaConversionRequestTracker init](&v25, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_requestOptions, a3);
    v11->_requestNumber = a4;
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    enqueueTime = v11->_enqueueTime;
    v11->_enqueueTime = (NSDate *)v12;

    uint64_t v14 = os_transaction_create("com.apple.photos.mediaconversion.requesttracking");
    transaction = v11->_transaction;
    v11->_transaction = (OS_os_transaction *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v16 _xpcConnection]);
    v11->_clientProcessIdentifier = xpc_connection_get_pid(v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"PAMediaConversionServiceOptionJobPriorityKey"]);
    v11->_effectivePriority = (int64_t)[v18 integerValue];

    v11->_os_signpost_id_t signpostId = os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, v11);
    id v19 = &_os_log_default;
    os_signpost_id_t signpostId = v11->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"]);
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      __int16 v28 = 2112;
      v29 = v22;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostId,  "com.apple.photos.mediaconversion.service.enqueue",  "Media conversion request %{public}@, reason: %@",  buf,  0x16u);
    }

    -[MediaConversionRequestTracker setupPerfCheck](v11, "setupPerfCheck");
    -[MediaConversionRequestTracker setupCoreImageGraphDumpCapture](v11, "setupCoreImageGraphDumpCapture");
    -[MediaConversionRequestTracker cacheDestinationBookmarkCollectionSignature]( v11,  "cacheDestinationBookmarkCollectionSignature");
  }

  return v11;
}

- (void)setupPerfCheck
{
  int __errnum = 0;
  v3 = (pc_session *)pc_session_create(&__errnum, __stderrp, __stderrp);
  self->_pc_session = v3;
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = getpid();
    pc_session_set_procpid(v4, v5);
    int v6 = pc_session_begin(self->_pc_session);
    int __errnum = v6;
    if (v6)
    {
      int v7 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v9 = strerror(v7);
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to begin performance check session: %s",  buf,  0xCu);
      }

      pc_session_destroy(self->_pc_session);
      self->_pc_session = 0LL;
    }

    else
    {
      pc_session_get_value(self->_pc_session, 0LL, 0x6C6966657065616BLL, &self->_initialProcessMemoryPeak, buf, 0LL);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v8 = strerror(__errnum);
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create performance check session: %s",  buf,  0xCu);
  }

- (void)setupCoreImageGraphDumpCapture
{
  if (-[MediaConversionRequestTracker shouldDump](self, "shouldDump"))
  {
    setenv("CI_PRINT_TREE", "4 pdf", 1);
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue( -[MediaConversionRequestTracker graphDumpURLsForCurrentProcessIdentifier]( self,  "graphDumpURLsForCurrentProcessIdentifier"));
    coreImageGraphDumpURLsAtStart = self->_coreImageGraphDumpURLsAtStart;
    self->_coreImageGraphDumpURLsAtStart = v3;
  }

- (NSString)requestIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestOptions](self, "requestOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"]);

  return (NSString *)v3;
}

- (BOOL)shouldDump
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"MediaConversionServiceKeepTemporaryFiles"];

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MediaConversionRequestTracker effectivePriority](self, "effectivePriority");
  id v6 = [v4 effectivePriority];
  if (v5 <= (uint64_t)v6)
  {
    if (v5 < (uint64_t)v6)
    {
      int64_t v7 = 1LL;
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker enqueueTime](self, "enqueueTime"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 enqueueTime]);
      int64_t v10 = (int64_t)[v8 compare:v9];

      if (v5 <= 0) {
        int64_t v7 = v10;
      }
      else {
        int64_t v7 = -v10;
      }
    }
  }

  else
  {
    int64_t v7 = -1LL;
  }

  return v7;
}

- (void)cacheSourceBookmarkCollectionSignatureAndFilename
{
  if (!self->_sourceURLCollection)
  {
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:136 description:@"Source URL collection has not been set yet"];
  }

  id v12 = 0LL;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_requestOptions,  "objectForKeyedSubscript:",  @"PAMediaConversionServiceSourceBookmarkCollectionKey",  0LL));
  +[PAMediaConversionServiceResourceURLCollection getSignatureString:filenameSummary:forDictionaryRepresentation:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLCollection,  "getSignatureString:filenameSummary:forDictionaryRepresentation:",  &v12,  &v11,  v3);
  id v4 = (NSString *)v12;
  uint64_t v5 = (NSString *)v11;

  cachedSourceURLCollectionSignature = self->_cachedSourceURLCollectionSignature;
  self->_cachedSourceURLCollectionSignature = v4;
  int64_t v7 = v4;

  cachedSourceURLFilenameOnlySummary = self->_cachedSourceURLFilenameOnlySummary;
  self->_cachedSourceURLFilenameOnlySummary = v5;
}

- (NSString)sourceURLFilenameOnlySummary
{
  cachedSourceURLFilenameOnlySummary = self->_cachedSourceURLFilenameOnlySummary;
  if (!cachedSourceURLFilenameOnlySummary)
  {
    -[MediaConversionRequestTracker cacheSourceBookmarkCollectionSignatureAndFilename]( self,  "cacheSourceBookmarkCollectionSignatureAndFilename");
    cachedSourceURLFilenameOnlySummary = self->_cachedSourceURLFilenameOnlySummary;
  }

  return cachedSourceURLFilenameOnlySummary;
}

- (id)sourceURLCollectionSignature
{
  cachedSourceURLCollectionSignature = self->_cachedSourceURLCollectionSignature;
  if (!cachedSourceURLCollectionSignature)
  {
    -[MediaConversionRequestTracker cacheSourceBookmarkCollectionSignatureAndFilename]( self,  "cacheSourceBookmarkCollectionSignatureAndFilename");
    cachedSourceURLCollectionSignature = self->_cachedSourceURLCollectionSignature;
  }

  return cachedSourceURLCollectionSignature;
}

- (void)cacheDestinationBookmarkCollectionSignature
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_requestOptions,  "objectForKeyedSubscript:",  @"PAMediaConversionServiceDestinationBookmarkCollectionKey"));
  if (v3)
  {
    id v10 = 0LL;
    id v11 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_requestOptions,  "objectForKeyedSubscript:",  @"PAMediaConversionServiceDestinationBookmarkCollectionKey"));
    +[PAMediaConversionServiceResourceURLCollection getSignatureString:filenameSummary:forDictionaryRepresentation:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLCollection,  "getSignatureString:filenameSummary:forDictionaryRepresentation:",  &v11,  &v10,  v4);
    uint64_t v5 = (NSString *)v11;
    id v6 = v10;

    cachedDestinationURLCollectionSignature = self->_cachedDestinationURLCollectionSignature;
    self->_cachedDestinationURLCollectionSignature = v5;
    id v8 = v5;
  }

  else
  {
    v9 = self->_cachedDestinationURLCollectionSignature;
    self->_cachedDestinationURLCollectionSignature = (NSString *)@"nsdata";
  }
}

- (id)destinationURLsSignature
{
  return self->_cachedDestinationURLCollectionSignature;
}

- (NSString)requestOptionsSignatureString
{
  cachedRequestOptionsSignature = self->_cachedRequestOptionsSignature;
  if (!cachedRequestOptionsSignature)
  {
    v12[0] = @"PAMediaConversionServiceJobIdentifierKey";
    v12[1] = @"PAMediaConversionServiceSourceBookmarkCollectionKey";
    v12[2] = @"PAMediaConversionServiceDestinationBookmarkCollectionKey";
    v12[3] = @"PAMediaConversionServiceOptionRequestReasonKey";
    v12[4] = @"PAMediaConversionServiceOptionJobPriorityKey";
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 5LL));
    id v5 = -[NSDictionary mutableCopy](self->_requestOptions, "mutableCopy");
    [v5 removeObjectsForKeys:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker sourceURLCollectionSignature](self, "sourceURLCollectionSignature"));
    unint64_t v7 = -[MediaConversionRequestTracker hashForObject:](self, "hashForObject:", v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker destinationURLsSignature](self, "destinationURLsSignature"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%lx-%@",  v6,  v7,  v8));
    id v10 = self->_cachedRequestOptionsSignature;
    self->_cachedRequestOptionsSignature = v9;

    cachedRequestOptionsSignature = self->_cachedRequestOptionsSignature;
  }

  return cachedRequestOptionsSignature;
}

- (BOOL)isDuplicateOfRequestWithRequestTracker:(id)a3 identicalDestinationURL:(BOOL *)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2, self, @"MediaConversionDebugUtilities.m", 196, @"Invalid parameter not satisfying: %@", @"otherRequestTracker" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v20 handleFailureInMethod:a2, self, @"MediaConversionDebugUtilities.m", 197, @"Invalid parameter not satisfying: %@", @"identicalDestinationURL" object file lineNumber description];

LABEL_3:
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestOptionsSignatureString](self, "requestOptionsSignatureString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsSeparatedByString:@"-"]);

  if ([v9 count] != (id)3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v21,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"MediaConversionDebugUtilities.m",  200,  @"Unexpected self signature component count %lu",  objc_msgSend(v9, "count"));
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 requestOptionsSignatureString]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@"-"]);

  if ([v11 count] != (id)3)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v22,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"MediaConversionDebugUtilities.m",  203,  @"Unexpected other signature component count %lu",  objc_msgSend(v9, "count"));
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
  unsigned int v14 = [v12 isEqualToString:v13];
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:1]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
    unsigned int v17 = [v15 isEqualToString:v16];

    if (!v17)
    {
      LOBYTE(v14) = 0;
      goto LABEL_12;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:2]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:2]);
    *a4 = [v12 isEqualToString:v13];
  }

LABEL_12:
  return v14;
}

- (BOOL)copyDuplicateRequestOutputFromOriginalRequestTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 1;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker destinationURLCollection](self, "destinationURLCollection"));
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_10001BF08;
  v27 = sub_10001BF18;
  id v28 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationURLCollection]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10001BF20;
  v16[3] = &unk_100031150;
  id v10 = v7;
  id v17 = v10;
  id v11 = v6;
  id v18 = v11;
  id v19 = self;
  v21 = &v29;
  v22 = &v23;
  id v12 = v8;
  id v20 = v12;
  [v9 enumerateResourceURLs:v16];

  int v13 = *((unsigned __int8 *)v30 + 24);
  if (a4 && !*((_BYTE *)v30 + 24))
  {
    *a4 = (id) v24[5];
    int v13 = *((unsigned __int8 *)v30 + 24);
  }

  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

- (unint64_t)hashForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingComparator:&stru_100031190]);

    id v9 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v9)
    {
      id v10 = v9;
      unint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v8);
          }
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * (void)i)]);
          v11 ^= -[MediaConversionRequestTracker hashForObject:](self, "hashForObject:", v14);
        }

        id v10 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }

      while (v10);
    }

    else
    {
      unint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v4, v15) & 1) == 0)
    {
      if (!-[MediaConversionRequestTracker _valueIsSimpleScalarType:](self, "_valueIsSimpleScalarType:", v4))
      {
        uint64_t v20 = objc_opt_class(&OBJC_CLASS___PAMediaConversionServiceImageMetadataPolicy);
        if ((objc_opt_isKindOfClass(v4, v20) & 1) != 0)
        {
          id v26 = 0LL;
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v26));
          id v6 = v26;
          if (v21)
          {
            unint64_t v11 = (unint64_t)[v21 hash];
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v6;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to archive metadata policy: %@",  buf,  0xCu);
            }

            unint64_t v11 = 0LL;
          }

          goto LABEL_25;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = (objc_class *)objc_opt_class(v4);
          v24 = NSStringFromClass(v23);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          *(_DWORD *)buf = 138412290;
          id v36 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unexpected options dictionary value class: %@",  buf,  0xCu);
        }
      }

      unint64_t v11 = (unint64_t)[v4 hash];
      goto LABEL_26;
    }

    id v6 = v4;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v16 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v16)
    {
      id v17 = v16;
      unint64_t v11 = 0LL;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v6);
          }
          v11 ^= -[MediaConversionRequestTracker hashForObject:]( self,  "hashForObject:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)j));
        }

        id v17 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }

      while (v17);
    }

    else
    {
      unint64_t v11 = 0LL;
    }
  }

- (BOOL)_valueIsSimpleScalarType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v3, v6) & 1) != 0))
  {
    char isKindOfClass = 1;
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v9);
  }

  return isKindOfClass & 1;
}

- (void)didDequeueAndStartProcessingRequest
{
  id v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  dequeueAndStartProcessingTime = self->_dequeueAndStartProcessingTime;
  self->_dequeueAndStartProcessingTime = v3;

  id v5 = &_os_log_default;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_INTERVAL_END,  signpostId,  "com.apple.photos.mediaconversion.service.enqueue",  (const char *)&unk_10002DD8D,  (uint8_t *)&v10,  2u);
  }

  id v7 = &_os_log_default;
  os_signpost_id_t v8 = self->_signpostId;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_requestOptions,  "objectForKeyedSubscript:",  @"PAMediaConversionServiceJobIdentifierKey"));
    int v10 = 138543362;
    unint64_t v11 = v9;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "com.apple.photos.mediaconversion.service.processing",  "Media conversion request %{public}@",  (uint8_t *)&v10,  0xCu);
  }
}

- (void)markAsCompletedWithInitialRequestIdentifier:(id)a3
{
  id v19 = (NSMutableArray *)a3;
  -[MediaConversionRequestTracker didCompleteRequest](self, "didCompleteRequest");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputInformation](self, "outputInformation"));
  id v6 = [v5 mutableCopy];

  if (v6)
  {
    if (!self->_enqueueTime)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v16 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:306 description:@"Unexpected missing enqueue time"];
    }

    if (!self->_dequeueAndStartProcessingTime)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v17 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:307 description:@"Unexpected missing dequeue time"];
    }

    if (!self->_endTime)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v18 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:308 description:@"Unexpected missing end time"];
    }

    [v6 setObject:self->_enqueueTime forKeyedSubscript:@"PAMediaConversionServiceConversionStartDateKey"];
    [v6 setObject:self->_dequeueAndStartProcessingTime forKeyedSubscript:@"PAMediaConversionServiceConversionDequeueAndStartProcessingDateKey"];
    [v6 setObject:self->_endTime forKeyedSubscript:@"PAMediaConversionServiceConversionEndDateKey"];
    -[NSDate timeIntervalSinceDate:](self->_endTime, "timeIntervalSinceDate:", self->_enqueueTime);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v6 setObject:v7 forKeyedSubscript:@"PAMediaConversionServiceConversionTotalDurationTimeIntervalServiceSideKey"];

    if (v19
      && (os_signpost_id_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestIdentifier](self, "requestIdentifier")),
          unsigned __int8 v9 = -[NSMutableArray isEqualToString:](v19, "isEqualToString:", v8),
          v8,
          (v9 & 1) == 0))
    {
      uint64_t v12 = @"PAMediaConversionServiceDeduplicatedAgainstOriginalRequestIdentifierKey";
      int v13 = v6;
      coreImageGraphDumpPaths = v19;
    }

    else
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionRequestTracker requestCompletionPerfCheckExtraInformation]( self,  "requestCompletionPerfCheckExtraInformation"));
      [v6 setObject:v10 forKeyedSubscript:@"PAMediaConversionServiceConversionPerfCheckDataKey"];

      coreImageGraphDumpPaths = self->_coreImageGraphDumpPaths;
      uint64_t v12 = @"PAMediaConversionServiceUnitTestSupportCoreImageGraphDumpPathsKey";
      int v13 = v6;
    }

    [v13 setObject:coreImageGraphDumpPaths forKeyedSubscript:v12];
    -[MediaConversionRequestTracker setOutputInformation:](self, "setOutputInformation:", v6);
  }

  else
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker error](self, "error"));

    if (!v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v15 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:303 description:@"Unexpected nil result information and error"];
    }
  }
}

- (void)didCompleteRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[MediaConversionRequestTracker setEndTime:](self, "setEndTime:", v3);

  id v4 = &_os_log_default;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_INTERVAL_END,  signpostId,  "com.apple.photos.mediaconversion.service.processing",  (const char *)&unk_10002DD8D,  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestIdentifier](self, "requestIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionRequestTracker requestCompletionPerfCheckExtraInformationLogString]( self,  "requestCompletionPerfCheckExtraInformationLogString"));
  -[MediaConversionRequestTracker storeDebugDump](self, "storeDebugDump");
  os_signpost_id_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker debugDumpDirectoryURL](self, "debugDumpDirectoryURL"));

  if (v8)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker debugDumpDirectoryURL](self, "debugDumpDirectoryURL"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    unint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", debug dump saved to %@ because %@ user default is set",  v10,  @"MediaConversionServiceKeepTemporaryFiles"));
  }

  else
  {
    unint64_t v11 = &stru_1000325B0;
  }

  if (self->_originalRequestIdentifier)
  {
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (duplicate of %@)",  self->_originalRequestIdentifier));
    int v13 = @"(omitted)";
  }

  else
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker sourceURLCollection](self, "sourceURLCollection"));
    int v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 logMessageSummary]);

    uint64_t v12 = &stru_1000325B0;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker endTime](self, "endTime"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker enqueueTime](self, "enqueueTime"));
  [v15 timeIntervalSinceDate:v16];
  uint64_t v18 = v17;

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker dequeueAndStartProcessingTime](self, "dequeueAndStartProcessingTime"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker enqueueTime](self, "enqueueTime"));
  [v19 timeIntervalSinceDate:v20];
  uint64_t v22 = v21;

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker endTime](self, "endTime"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker dequeueAndStartProcessingTime](self, "dequeueAndStartProcessingTime"));
  [v23 timeIntervalSinceDate:v24];
  uint64_t v26 = v25;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker error](self, "error"));
    *(_DWORD *)buf = 138545411;
    __int128 v29 = v6;
    __int16 v30 = 2114;
    __int128 v31 = v12;
    __int16 v32 = 2113;
    __int128 v33 = v13;
    __int16 v34 = 2048;
    uint64_t v35 = v18;
    __int16 v36 = 2048;
    uint64_t v37 = v22;
    __int16 v38 = 2048;
    uint64_t v39 = v26;
    __int16 v40 = 2114;
    v41 = v27;
    __int16 v42 = 2114;
    v43 = v7;
    __int16 v44 = 2114;
    v45 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Completed media conversion for job %{public}@%{public}@, source URL Collection %{private}@, request duration % .3fs (%.3fs enqueued/waiting, %.3fs processing), error = %{public}@%{public}@%{public}@",  buf,  0x5Cu);
  }
}

- (NSDictionary)requestCompletionPerfCheckExtraInformation
{
  p_cachedPerfCheckInformation = &self->_cachedPerfCheckInformation;
  cachedPerfCheckInformation = self->_cachedPerfCheckInformation;
  if (cachedPerfCheckInformation)
  {
    id v4 = cachedPerfCheckInformation;
  }

  else
  {
    pc_session = self->_pc_session;
    if (pc_session)
    {
      int v7 = pc_session_end(pc_session, a2);
      if (v7)
      {
        int v8 = v7;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = strerror(v8);
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to end performance check session: %s",  buf,  0xCu);
        }

        id v4 = 0LL;
      }

      else
      {
        *(void *)buf = 0LL;
        pc_session_get_value(self->_pc_session, 0LL, 0x6C6966657065616BLL, buf, v16, 0LL);
        double v15 = 0.0;
        pc_session_get_value(self->_pc_session, 0LL, 0x63707574696D6500LL, &v15, v16, 0LL);
        double v14 = 0.0;
        pc_session_get_value(self->_pc_session, 0LL, 0x637075696E737472LL, &v14, v16, 0LL);
        v18[0] = @"processMemoryPeakKiloBytesInitial";
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_initialProcessMemoryPeak));
        v19[0] = v9;
        v18[1] = @"processMemoryPeakKiloBytesAfterRequest";
        int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)buf));
        v19[1] = v10;
        v18[2] = @"cpuTimeMilliSeconds";
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15 / 1000000.0));
        v19[2] = v11;
        v18[3] = @"cpuMillionInstructions";
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14 / 1000000.0));
        v19[3] = v12;
        id v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));
      }

      pc_session_destroy(self->_pc_session);
      self->_pc_session = 0LL;
    }

    else
    {
      id v4 = 0LL;
    }

    objc_storeStrong((id *)p_cachedPerfCheckInformation, v4);
  }

  return v4;
}

- (id)requestCompletionPerfCheckExtraInformationLogString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionRequestTracker requestCompletionPerfCheckExtraInformation]( self,  "requestCompletionPerfCheckExtraInformation"));
  id v3 = v2;
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"processMemoryPeakKiloBytesInitial"]);
    [v4 doubleValue];
    uint64_t v6 = v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"processMemoryPeakKiloBytesAfterRequest"]);
    [v7 doubleValue];
    uint64_t v9 = v8;
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"cpuTimeMilliSeconds"]);
    [v10 doubleValue];
    uint64_t v12 = v11;
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"cpuMillionInstructions"]);
    [v13 doubleValue];
    double v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", dirty memory peak before/after request: %.0f/%.0f KB, CPU time %.0fms, instructions %.1fM",  v6,  v9,  v12,  v14));
  }

  else
  {
    double v15 = @" (error getting perf check info)";
  }

  return v15;
}

- (void)storeDebugDump
{
  if (-[MediaConversionRequestTracker shouldDump](self, "shouldDump"))
  {
    unsetenv("CI_PRINT_TREE");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestIdentifier](self, "requestIdentifier"));
    id v4 = NSTemporaryDirectory();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"MediaConversionServiceDebugging"]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v6, 1LL));

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v3]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v31 = 0LL;
    unsigned __int8 v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v31];
    id v11 = v31;
    if ((v10 & 1) != 0)
    {
      -[MediaConversionRequestTracker setDebugDumpDirectoryURL:](self, "setDebugDumpDirectoryURL:", v8);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[MediaConversionRequestTracker storeDebugDumpInputInformationToURL:updatingDebugInformation:]( self,  "storeDebugDumpInputInformationToURL:updatingDebugInformation:",  v8,  v12);
      -[MediaConversionRequestTracker storeDebugDumpOutputInformationToURL:updatingDebugInformation:]( self,  "storeDebugDumpOutputInformationToURL:updatingDebugInformation:",  v8,  v12);
      -[MediaConversionRequestTracker copyCoreImageGraphDumpsToURL:](self, "copyCoreImageGraphDumpsToURL:", v8);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker endTime](self, "endTime"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker enqueueTime](self, "enqueueTime"));
      [v13 timeIntervalSinceDate:v14];
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v12 setObject:v15 forKeyedSubscript:@"requestDurationSeconds"];

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker endTime](self, "endTime"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionRequestTracker dequeueAndStartProcessingTime]( self,  "dequeueAndStartProcessingTime"));
      [v16 timeIntervalSinceDate:v17];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v12 setObject:v18 forKeyedSubscript:@"processingDurationSeconds"];

      [v12 setObject:self->_serviceInformation forKeyedSubscript:@"serviceInformation"];
      id v19 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      [v12 setObject:v20 forKeyedSubscript:@"processIdentifier"];

      uint64_t v21 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", getprogname());
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      [v12 setObject:v22 forKeyedSubscript:@"processName"];

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionRequestTracker requestCompletionPerfCheckExtraInformation]( self,  "requestCompletionPerfCheckExtraInformation"));
      [v12 setObject:v23 forKeyedSubscript:@"perfCheckInformation"];

      v24 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionRequestTracker requestOptionsSignatureString]( self,  "requestOptionsSignatureString"));
      [v12 setObject:v24 forKeyedSubscript:@"requestOptionsSignature"];

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"debug-info.plist"]);
      id v30 = 0LL;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v12,  100LL,  0LL,  &v30));
      id v27 = v30;

      if (v26)
      {
        id v29 = v27;
        unsigned __int8 v28 = [v26 writeToURL:v25 options:1 error:&v29];
        id v11 = v29;

        if ((v28 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v33 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to write debug dump info property list: %{public}@",  buf,  0xCu);
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v33 = v27;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to serialize debug dump info property list: %{public}@",  buf,  0xCu);
        }

        id v11 = v27;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v3;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create dump directory for media conversion request %@: %@",  buf,  0x16u);
    }
  }

- (void)copyCoreImageGraphDumpsToURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionRequestTracker graphDumpURLsForCurrentProcessIdentifier]( self,  "graphDumpURLsForCurrentProcessIdentifier"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v6));

  uint64_t v20 = self;
  [v7 minusSet:self->_coreImageGraphDumpURLsAtStart];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v24;
    *(void *)&__int128 v9 = 138543874LL;
    __int128 v19 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent", v19));
        double v15 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v14]);
        id v22 = 0LL;
        unsigned int v16 = [v5 copyItemAtURL:v13 toURL:v15 error:&v22];
        id v17 = v22;
        if (v16)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
          -[MediaConversionRequestTracker addCoreImageGraphDumpPath:](v20, "addCoreImageGraphDumpPath:", v18);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v19;
          unsigned __int8 v28 = v13;
          __int16 v29 = 2114;
          id v30 = v15;
          __int16 v31 = 2114;
          id v32 = v17;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to copy core image graph dump file %{public}@ to %{public}@: %{public}@",  buf,  0x20u);
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }

    while (v10);
  }
}

- (id)graphDumpURLsForCurrentProcessIdentifier
{
  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"^%d_.+_program_graph.*\\.pdf$",  getpid());
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  v55[0] = @"/tmp";
  id v4 = NSTemporaryDirectory();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v55[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL));

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (!v7)
  {
    __int128 v9 = 0LL;
    goto LABEL_33;
  }

  id v8 = v7;
  __int128 v9 = 0LL;
  uint64_t v37 = *(void *)v47;
  while (2)
  {
    id v10 = 0LL;
    id v33 = v8;
    do
    {
      if (*(void *)v47 != v37) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByResolvingSymlinksInPath]);

      id v45 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v38 contentsOfDirectoryAtURL:v13 includingPropertiesForKeys:0 options:7 error:&v45]);
      id v15 = v45;
      unsigned int v16 = v15;
      if (v14)
      {
        __int16 v40 = v13;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v17 = v14;
        id v18 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v39 = v14;
          id v35 = v10;
          __int16 v36 = v16;
          char v20 = 0;
          uint64_t v21 = *(void *)v42;
          do
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v42 != v21) {
                objc_enumerationMutation(v17);
              }
              __int128 v23 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lastPathComponent]);
              if ([v24 rangeOfString:v3 options:1024] != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                if (!v9) {
                  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
                }
                [v9 addObject:v23];
                char v20 = 1;
              }
            }

            id v19 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }

          while (v19);

          if ((v20 & 1) != 0)
          {

            goto LABEL_33;
          }

          id v8 = v33;
          id v10 = v35;
          unsigned int v16 = v36;
          uint64_t v14 = v39;
          int v13 = v40;
        }

        else
        {

          int v13 = v40;
        }
      }

      else
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
        if ([v25 isEqualToString:NSCocoaErrorDomain])
        {
          id v26 = [v16 code];
          id v27 = v16;
          unsigned __int8 v28 = v13;
          __int16 v29 = v10;
          id v30 = v26;

          BOOL v31 = v30 == (id)257;
          id v10 = v29;
          int v13 = v28;
          unsigned int v16 = v27;
          uint64_t v14 = 0LL;
          if (v31) {
            goto LABEL_28;
          }
        }

        else
        {
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = v11;
          __int16 v53 = 2114;
          v54 = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to enumerate contents of temp directory %{public}@: %{public}@",  buf,  0x16u);
        }
      }

- (void)addCoreImageGraphDumpPath:(id)a3
{
  id v4 = a3;
  coreImageGraphDumpPaths = self->_coreImageGraphDumpPaths;
  id v8 = v4;
  if (!coreImageGraphDumpPaths)
  {
    uint64_t v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v7 = self->_coreImageGraphDumpPaths;
    self->_coreImageGraphDumpPaths = v6;

    id v4 = v8;
    coreImageGraphDumpPaths = self->_coreImageGraphDumpPaths;
  }

  -[NSMutableArray addObject:](coreImageGraphDumpPaths, "addObject:", v4);
}

- (void)storeDebugDumpInputInformationToURL:(id)a3 updatingDebugInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestOptions](self, "requestOptions"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
  [v7 setObject:v9 forKeyedSubscript:@"requestOptionsDescription"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestOptions](self, "requestOptions"));
  id v23 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v10,  0LL,  &v23));
  id v12 = v23;

  if (v11)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"request-options.keyedarchive"]);
    id v22 = v12;
    unsigned __int8 v14 = [v11 writeToURL:v13 options:1 error:&v22];
    id v15 = v22;

    if ((v14 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to write request options: %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to serialize request options: %{public}@",  buf,  0xCu);
    }

    id v15 = v12;
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker sourceURLCollection](self, "sourceURLCollection"));
  id v17 = [v16 urlCount];

  if (v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker sourceURLCollection](self, "sourceURLCollection"));
    -[MediaConversionRequestTracker dumpResourceURLCollection:toParentDirectory:directoryName:updatingDebugInformation:]( self,  "dumpResourceURLCollection:toParentDirectory:directoryName:updatingDebugInformation:",  v18,  v6,  @"sourceResourceURLCollection",  v7);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker destinationURLCollection](self, "destinationURLCollection"));
  id v20 = [v19 urlCount];

  if (v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker destinationURLCollection](self, "destinationURLCollection"));
    -[MediaConversionRequestTracker dumpResourceURLCollection:toParentDirectory:directoryName:updatingDebugInformation:]( self,  "dumpResourceURLCollection:toParentDirectory:directoryName:updatingDebugInformation:",  v21,  v6,  @"destinationResourceURLCollection",  v7);
  }
}

- (void)dumpResourceURLCollection:(id)a3 toParentDirectory:(id)a4 directoryName:(id)a5 updatingDebugInformation:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 urlForDebugDumpWithDirectoryName:v10 inExistingParentDirectory:a4 error:&v18]);
  id v13 = v18;
  if (v12)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([@"resourceDumpPath-" stringByAppendingString:v10]);
    [v11 setObject:v14 forKeyedSubscript:v15];

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 logMessageSummary]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([@"resourceURLCollectionSummary-" stringByAppendingString:v10]);
    [v11 setObject:v16 forKeyedSubscript:v17];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to dump resources %{public}@ to debug dump: %{public}@",  buf,  0x16u);
  }
}

- (void)storeDebugDumpOutputInformationToURL:(id)a3 updatingDebugInformation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputData](self, "outputData"));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputTypeIdentifier](self, "outputTypeIdentifier"));

    if (!v11)
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v35 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:548 description:@"Unexpected nil result data UTI"];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputTypeIdentifier](self, "outputTypeIdentifier"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](&OBJC_CLASS___UTType, "typeWithIdentifier:", v12));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredFilenameExtension]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([@"outputData" stringByAppendingPathExtension:v14]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v15]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputData](self, "outputData"));
    id v37 = 0LL;
    unsigned int v18 = [v17 writeToURL:v16 options:1 error:&v37];
    id v19 = v37;

    if (v18)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
      [v8 setObject:v20 forKeyedSubscript:@"outputFilename"];
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to write result data to debug dump: %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputURL](self, "outputURL"));

    if (!v21) {
      goto LABEL_14;
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputURL](self, "outputURL"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 pathExtension]);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([@"output" stringByAppendingPathExtension:v23]);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v24]);

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputURL](self, "outputURL"));
    id v36 = 0LL;
    LODWORD(v24) = [v9 copyItemAtURL:v25 toURL:v14 error:&v36];
    id v19 = v36;

    if (!(_DWORD)v24)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to copy output file url to debug dump: %{public}@",  buf,  0xCu);
      }

      goto LABEL_13;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    [v8 setObject:v15 forKeyedSubscript:@"outputFilename"];
  }

LABEL_13:
LABEL_14:
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputInformation](self, "outputInformation"));

  if (v26)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker outputInformation](self, "outputInformation"));
    id v28 = [v27 mutableCopy];

    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"PAMediaConversionServiceResultDataKey"]);
    id v30 = v29;
    if (v29)
    {
      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<output data (%lu bytes) removed>",  [v29 length]));
      [v28 setObject:v31 forKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];
    }

    [v8 setObject:v28 forKeyedSubscript:@"outputInformation"];
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker error](self, "error"));

  if (v32)
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker error](self, "error"));
    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 description]);
    [v8 setObject:v34 forKeyedSubscript:@"error"];
  }
}

- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)destinationURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDestinationURLCollection:(id)a3
{
}

- (NSData)outputData
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setOutputData:(id)a3
{
}

- (NSString)outputTypeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOutputTypeIdentifier:(id)a3
{
}

- (NSURL)outputURL
{
  return (NSURL *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setOutputURL:(id)a3
{
}

- (NSDictionary)outputInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setOutputInformation:(id)a3
{
}

- (NSDictionary)serviceInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setServiceInformation:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setError:(id)a3
{
}

- (NSDate)enqueueTime
{
  return (NSDate *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setEnqueueTime:(id)a3
{
}

- (NSDate)dequeueAndStartProcessingTime
{
  return (NSDate *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDequeueAndStartProcessingTime:(id)a3
{
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setEndTime:(id)a3
{
}

- (int64_t)effectivePriority
{
  return self->_effectivePriority;
}

- (void)setEffectivePriority:(int64_t)a3
{
  self->_effectivePriority = a3;
}

- (NSMutableArray)coreImageGraphDumpPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setCoreImageGraphDumpPaths:(id)a3
{
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_os_signpost_id_t signpostId = a3;
}

- (unint64_t)requestNumber
{
  return self->_requestNumber;
}

- (void)setRequestNumber:(unint64_t)a3
{
  self->_requestNumber = a3;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (void)setClientProcessIdentifier:(int)a3
{
  self->_clientProcessIdentifier = a3;
}

- (NSDictionary)requestOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setRequestOptions:(id)a3
{
}

- (NSURL)debugDumpDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setDebugDumpDirectoryURL:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (pc_session)pc_session
{
  return self->_pc_session;
}

- (void)setPc_session:(pc_session *)a3
{
  self->_pc_session = a3;
}

- (double)initialProcessMemoryPeak
{
  return self->_initialProcessMemoryPeak;
}

- (void)setInitialProcessMemoryPeak:(double)a3
{
  self->_initialProcessMemoryPeak = a3;
}

- (NSDictionary)cachedPerfCheckInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setCachedPerfCheckInformation:(id)a3
{
}

- (NSSet)coreImageGraphDumpURLsAtStart
{
  return (NSSet *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setCoreImageGraphDumpURLsAtStart:(id)a3
{
}

- (NSString)originalRequestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setOriginalRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface MediaConversionQueueEntry
- (BOOL)allRequestsAreBackground;
- (BOOL)allRequestsAreOptional;
- (BOOL)allRequestsHaveRequestPriority:(int64_t)a3;
- (BOOL)cancelled;
- (BOOL)clientRequestIsDuplicate:(id)a3 identicalDestination:(BOOL *)a4;
- (BOOL)taskTypeSupportsDeduplication;
- (MediaConversionQueueEntry)initWithIdentifier:(id)a3 initialConversionOptions:(id)a4;
- (NSArray)clientRequestsSnapshot;
- (NSDictionary)initialRequestConversionOptions;
- (NSString)identifier;
- (NSString)initialRequestIdentifier;
- (NSURL)temporaryFilesParentDirectoryURL;
- (OS_os_transaction)transaction;
- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection;
- (PAMediaConversionServiceResourceURLCollection)temporaryDestinationURLCollection;
- (VideoConversionTask)videoConversionTask;
- (id)anyDestinationURLCollection;
- (id)clientRequestForIdentifier:(id)a3;
- (id)description;
- (id)removeAndReturnClientRequestWithIdentifier:(id)a3 remainingRequestCount:(int64_t *)a4;
- (id)requestIdentifiersForConnectionIdentifier:(id)a3;
- (int64_t)compareProcessingOrderToEntry:(id)a3;
- (void)addClientRequest:(id)a3;
- (void)dealloc;
- (void)didDequeueAndStartProcessingQueueEntry;
- (void)setCancelled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitialRequestConversionOptions:(id)a3;
- (void)setInitialRequestIdentifier:(id)a3;
- (void)setSourceURLCollection:(id)a3;
- (void)setTaskTypeSupportsDeduplication:(BOOL)a3;
- (void)setTemporaryDestinationURLCollection:(id)a3;
- (void)setTemporaryFilesParentDirectoryURL:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setVideoConversionTask:(id)a3;
- (void)videoConversionTask:(id)a3 didUpdateFractionCompleted:(double)a4;
- (void)withLockEnumerateClientRequests:(id)a3;
@end

@implementation MediaConversionQueueEntry

- (MediaConversionQueueEntry)initWithIdentifier:(id)a3 initialConversionOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MediaConversionQueueEntry;
  v9 = -[MediaConversionQueueEntry init](&v16, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    clientRequests = v9->_clientRequests;
    v9->_clientRequests = (NSMutableArray *)v10;

    v9->_queueEntryStateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_initialRequestConversionOptions, a4);
    id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.photos.media-conversion.queue-entry-%@", v7));
    uint64_t v13 = os_transaction_create([v12 UTF8String]);
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v13;
  }

  return v9;
}

- (void)dealloc
{
  if (self->_temporaryFilesParentDirectoryURL)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    temporaryFilesParentDirectoryURL = self->_temporaryFilesParentDirectoryURL;
    id v9 = 0LL;
    unsigned __int8 v5 = [v3 removeItemAtURL:temporaryFilesParentDirectoryURL error:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v7 = self->_temporaryFilesParentDirectoryURL;
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to delete temporary files directory %{public}@: %{public}@",  buf,  0x16u);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MediaConversionQueueEntry;
  -[MediaConversionQueueEntry dealloc](&v8, "dealloc");
}

- (id)description
{
  p_queueEntryStateLock = &self->_queueEntryStateLock;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  identifier = self->_identifier;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKey:](self->_clientRequests, "valueForKey:", @"description"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:@" "]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MediaConversionQueueEntry %@ (%p) for requests [%@]>",  identifier,  self,  v6));

  os_unfair_lock_unlock(p_queueEntryStateLock);
  return v7;
}

- (void)addClientRequest:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v5 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 194, @"Invalid parameter not satisfying: %@", @"clientRequest" object file lineNumber description];
  }

  os_unfair_lock_lock(&self->_queueEntryStateLock);
  -[NSMutableArray addObject:](self->_clientRequests, "addObject:", v6);
  [v6 setRequestQueueEntry:self];
  os_unfair_lock_unlock(&self->_queueEntryStateLock);
}

- (void)withLockEnumerateClientRequests:(id)a3
{
  id v4 = a3;
  p_queueEntryStateLock = &self->_queueEntryStateLock;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  clientRequests = self->_clientRequests;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000AF40;
  v8[3] = &unk_100028A38;
  id v9 = v4;
  id v7 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](clientRequests, "enumerateObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_queueEntryStateLock);
}

- (void)didDequeueAndStartProcessingQueueEntry
{
}

- (BOOL)clientRequestIsDuplicate:(id)a3 identicalDestination:(BOOL *)a4
{
  id v6 = a3;
  p_queueEntryStateLock = &self->_queueEntryStateLock;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_clientRequests, "firstObject"));
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 requestTracker]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 requestTracker]);
    unsigned __int8 v12 = [v10 isDuplicateOfRequestWithRequestTracker:v11 identicalDestinationURL:a4];
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  os_unfair_lock_unlock(p_queueEntryStateLock);

  return v12;
}

- (id)removeAndReturnClientRequestWithIdentifier:(id)a3 remainingRequestCount:(int64_t *)a4
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_clientRequests;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        unsigned __int8 v13 = [v12 isEqualToString:v5];

        if ((v13 & 1) != 0)
        {
          id v14 = v11;

          if (v14)
          {
            -[NSMutableArray removeObject:](self->_clientRequests, "removeObject:", v14);
            *a4 = (int64_t)-[NSMutableArray count](self->_clientRequests, "count");
          }

          goto LABEL_12;
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = 0LL;
LABEL_12:
  os_unfair_lock_unlock(&self->_queueEntryStateLock);

  return v14;
}

- (id)clientRequestForIdentifier:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  unsigned __int8 v13 = sub_10000AE04;
  id v14 = sub_10000AE14;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000AE8C;
  v7[3] = &unk_100028AA0;
  id v4 = a3;
  id v8 = v4;
  uint64_t v9 = &v10;
  -[MediaConversionQueueEntry withLockEnumerateClientRequests:](self, "withLockEnumerateClientRequests:", v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)anyDestinationURLCollection
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_10000AE04;
  uint64_t v9 = sub_10000AE14;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000AE1C;
  v4[3] = &unk_100028AC8;
  v4[4] = &v5;
  -[MediaConversionQueueEntry withLockEnumerateClientRequests:](self, "withLockEnumerateClientRequests:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)requestIdentifiersForConnectionIdentifier:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000AD78;
  v9[3] = &unk_100028AF0;
  id v10 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = v4;
  id v5 = v10;
  -[MediaConversionQueueEntry withLockEnumerateClientRequests:](self, "withLockEnumerateClientRequests:", v9);
  id v6 = v11;
  id v7 = v4;

  return v7;
}

- (void)videoConversionTask:(id)a3 didUpdateFractionCompleted:(double)a4
{
  id v6 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueueEntry clientRequestsSnapshot](self, "clientRequestsSnapshot", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) videoConversionTask:v6 didUpdateFractionCompleted:a4];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (NSArray)clientRequestsSnapshot
{
  p_queueEntryStateLock = &self->_queueEntryStateLock;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  id v4 = -[NSMutableArray copy](self->_clientRequests, "copy");
  os_unfair_lock_unlock(p_queueEntryStateLock);
  return (NSArray *)v4;
}

- (int64_t)compareProcessingOrderToEntry:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 298, @"Invalid parameter not satisfying: %@", @"otherEntry" object file lineNumber description];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueueEntry clientRequestsSnapshot](self, "clientRequestsSnapshot"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingComparator:&stru_100028B30]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequestsSnapshot]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingComparator:&stru_100028B30]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 firstObject]);
  __int128 v12 = (void *)v11;
  id v13 = 0LL;
  if (v10 && v11)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 requestTracker]);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 requestTracker]);
    id v13 = [v14 compare:v15];
  }

  return (int64_t)v13;
}

- (BOOL)allRequestsHaveRequestPriority:(int64_t)a3
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000AC98;
  v5[3] = &unk_100028B58;
  v5[4] = &v6;
  v5[5] = a3;
  -[MediaConversionQueueEntry withLockEnumerateClientRequests:](self, "withLockEnumerateClientRequests:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allRequestsAreOptional
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000AC34;
  v4[3] = &unk_100028AC8;
  v4[4] = &v5;
  -[MediaConversionQueueEntry withLockEnumerateClientRequests:](self, "withLockEnumerateClientRequests:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)allRequestsAreBackground
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000ABC8;
  v4[3] = &unk_100028AC8;
  v4[4] = &v5;
  -[MediaConversionQueueEntry withLockEnumerateClientRequests:](self, "withLockEnumerateClientRequests:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)initialRequestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInitialRequestIdentifier:(id)a3
{
}

- (NSDictionary)initialRequestConversionOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setInitialRequestConversionOptions:(id)a3
{
}

- (NSURL)temporaryFilesParentDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setTemporaryFilesParentDirectoryURL:(id)a3
{
}

- (VideoConversionTask)videoConversionTask
{
  return (VideoConversionTask *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setVideoConversionTask:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)temporaryDestinationURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTemporaryDestinationURLCollection:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)taskTypeSupportsDeduplication
{
  return self->_taskTypeSupportsDeduplication;
}

- (void)setTaskTypeSupportsDeduplication:(BOOL)a3
{
  self->_taskTypeSupportsDeduplication = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
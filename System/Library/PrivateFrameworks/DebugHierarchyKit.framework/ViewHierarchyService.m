@interface ViewHierarchyService
+ (id)forLocalPid:(int)a3;
- (DBGSnapshotManager)snapshotManager;
- (DBGStandaloneDataSourceConnection)dataSourceConnection;
- (NSString)platform;
- (NSURL)destination;
- (OS_dispatch_queue)captureQueue;
- (ViewHierarchyService)initWithDataSourceConnection:(id)a3 runnablePid:(int)a4;
- (id)_metadata;
- (id)completionBlock;
- (id)defaultPlatform;
- (int)runnablePid;
- (void)_enqueueAdditionalRequests;
- (void)_enqueueInitialRequest;
- (void)_enqueueRemainingUnfetchedPropertyValuesRequest;
- (void)_requestFailed:(id)a3;
- (void)_saveCompletedRequests;
- (void)captureTo:(id)a3 completionBlock:(id)a4;
- (void)finishWithError:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDestination:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setRunnablePid:(int)a3;
@end

@implementation ViewHierarchyService

+ (id)forLocalPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = -[DBGLocalDataSourceConnection initWithPid:]( objc_alloc(&OBJC_CLASS___DBGLocalDataSourceConnection),  "initWithPid:",  *(void *)&a3);
  id v6 = [objc_alloc((Class)a1) initWithDataSourceConnection:v5 runnablePid:v3];

  return v6;
}

- (ViewHierarchyService)initWithDataSourceConnection:(id)a3 runnablePid:(int)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ViewHierarchyService;
  v8 = -[ViewHierarchyService init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dataSourceConnection, a3);
    v10 = objc_alloc_init(&OBJC_CLASS___DBGSnapshot);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[DBGDataCoordinator coordinatorWithDataSourceConnection:]( &OBJC_CLASS___DBGDataCoordinatorTargetHub,  "coordinatorWithDataSourceConnection:",  v7));
    [v11 setShouldStoreCompletedRequests:1];
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[DBGSnapshotManager snapshotManagerWithSnapshot:primaryDataCoordinator:]( &OBJC_CLASS___DBGSnapshotManager,  "snapshotManagerWithSnapshot:primaryDataCoordinator:",  v10,  v11));
    snapshotManager = v9->_snapshotManager;
    v9->_snapshotManager = (DBGSnapshotManager *)v12;

    v9->_runnablePid = a4;
    dispatch_queue_t v14 = dispatch_queue_create("CaptureQueue", 0LL);
    captureQueue = v9->_captureQueue;
    v9->_captureQueue = (OS_dispatch_queue *)v14;

    -[DBGStandaloneDataSourceConnection setCaptureQueue:]( v9->_dataSourceConnection,  "setCaptureQueue:",  v9->_captureQueue);
  }

  return v9;
}

- (void)captureTo:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService captureQueue](self, "captureQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __50__ViewHierarchyService_captureTo_completionBlock___block_invoke;
  block[3] = &unk_20778;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ViewHierarchyService_captureTo_completionBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionBlock]);

  if (v2)
  {
    NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
    id v6 = @"A capture is already in progress";
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dt.ViewHierarchyService",  -2LL,  v3));

    [*(id *)(a1 + 32) finishWithError:v4];
  }

  else
  {
    [*(id *)(a1 + 32) setDestination:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setCompletionBlock:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _enqueueInitialRequest];
  }

- (void)_enqueueInitialRequest
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService platform](self, "platform"));
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService defaultPlatform](self, "defaultPlatform"));
  }
  id v6 = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[RequestFactory initialRequestForPlatform:]( &OBJC_CLASS___RequestFactory,  "initialRequestForPlatform:",  v6));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __46__ViewHierarchyService__enqueueInitialRequest__block_invoke;
  v10[3] = &unk_207A0;
  v10[4] = self;
  [v7 setCompletion:v10];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService snapshotManager](self, "snapshotManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryDataCoordinator]);
  [v9 performRequest:v7];
}

void __46__ViewHierarchyService__enqueueInitialRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (char *)[v3 status];
  id v5 = *(void **)(a1 + 32);
  if (v4 == (_BYTE *)&dword_0 + 3) {
    [v5 _enqueueAdditionalRequests];
  }
  else {
    [v5 _requestFailed:v3];
  }
}

- (void)_enqueueAdditionalRequests
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService snapshotManager](self, "snapshotManager"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 snapshot]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __50__ViewHierarchyService__enqueueAdditionalRequests__block_invoke;
  v6[3] = &unk_207C8;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[RequestFactory additionalRequestsWithSnapshot:]( &OBJC_CLASS___RequestFactory,  "additionalRequestsWithSnapshot:",  v5));
  v8 = self;
  id v4 = v7;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __50__ViewHierarchyService__enqueueAdditionalRequests__block_invoke(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  if ((char *)[*(id *)(a1 + 32) count] - 1 <= a3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __50__ViewHierarchyService__enqueueAdditionalRequests__block_invoke_2;
    v10[3] = &unk_207A0;
    v10[4] = *(void *)(a1 + 40);
    [v5 setCompletion:v10];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) snapshotManager]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryDataCoordinator]);
    [v7 performRequest:v5];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) snapshotManager]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryDataCoordinator]);
  [v9 performRequest:v5];
}

id __50__ViewHierarchyService__enqueueAdditionalRequests__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueRemainingUnfetchedPropertyValuesRequest];
}

- (void)_enqueueRemainingUnfetchedPropertyValuesRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService snapshotManager](self, "snapshotManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 snapshot]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RequestFactory requestForRemainingLazyPropertiesWithSnapshot:]( &OBJC_CLASS___RequestFactory,  "requestForRemainingLazyPropertiesWithSnapshot:",  v4));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __71__ViewHierarchyService__enqueueRemainingUnfetchedPropertyValuesRequest__block_invoke;
  v8[3] = &unk_207A0;
  v8[4] = self;
  [v5 setCompletion:v8];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService snapshotManager](self, "snapshotManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryDataCoordinator]);
  [v7 performRequest:v5];
}

void __71__ViewHierarchyService__enqueueRemainingUnfetchedPropertyValuesRequest__block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataSourceConnection]);
  [v4 closeConnection];

  id v5 = (char *)[v3 status];
  id v6 = *(void **)(a1 + 32);
  if (v5 == (_BYTE *)&dword_0 + 3) {
    [v6 _saveCompletedRequests];
  }
  else {
    [v6 _requestFailed:v3];
  }
}

- (void)_requestFailed:(id)a3
{
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  id v7 = @"Failed to capture view hierarchy";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dt.ViewHierarchyService",  -1LL,  v4));

  -[ViewHierarchyService finishWithError:](self, "finishWithError:", v5);
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService completionBlock](self, "completionBlock"));

  if (v4)
  {
    id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[ViewHierarchyService completionBlock](self, "completionBlock"));
    ((void (**)(void, id))v5)[2](v5, v6);

    -[ViewHierarchyService setCompletionBlock:](self, "setCompletionBlock:", 0LL);
  }
}

- (void)_saveCompletedRequests
{
  id v3 = -[NSFileWrapper initDirectoryWithFileWrappers:]( objc_alloc(&OBJC_CLASS___NSFileWrapper),  "initDirectoryWithFileWrappers:",  &__NSDictionary0__struct);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService destination](self, "destination"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  -[NSFileWrapper setPreferredFilename:](v3, "setPreferredFilename:", v5);

  id v6 = -[NSFileWrapper initDirectoryWithFileWrappers:]( objc_alloc(&OBJC_CLASS___NSFileWrapper),  "initDirectoryWithFileWrappers:",  &__NSDictionary0__struct);
  -[NSFileWrapper setPreferredFilename:](v6, "setPreferredFilename:", @"RequestResponses");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService snapshotManager](self, "snapshotManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryDataCoordinator]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 completedRequests]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __46__ViewHierarchyService__saveCompletedRequests__block_invoke;
  v19[3] = &unk_207F0;
  v20 = v6;
  id v10 = v6;
  [v9 enumerateObjectsUsingBlock:v19];

  id v11 = -[NSFileWrapper addFileWrapper:](v3, "addFileWrapper:", v10);
  id v12 = objc_alloc(&OBJC_CLASS___NSFileWrapper);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService _metadata](self, "_metadata"));
  dispatch_queue_t v14 = -[NSFileWrapper initRegularFileWithContents:](v12, "initRegularFileWithContents:", v13);

  -[NSFileWrapper setPreferredFilename:](v14, "setPreferredFilename:", @"metadata");
  id v15 = -[NSFileWrapper addFileWrapper:](v3, "addFileWrapper:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService destination](self, "destination"));
  id v18 = 0LL;
  -[NSFileWrapper writeToURL:options:originalContentsURL:error:]( v3,  "writeToURL:options:originalContentsURL:error:",  v16,  1LL,  0LL,  &v18);
  id v17 = v18;

  -[ViewHierarchyService finishWithError:](self, "finishWithError:", v17);
}

void __46__ViewHierarchyService__saveCompletedRequests__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc(&OBJC_CLASS___NSFileWrapper);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 rawResponseData]);

  id v10 = -[NSFileWrapper initRegularFileWithContents:](v6, "initRegularFileWithContents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Response_%lu", a3));
  -[NSFileWrapper setPreferredFilename:](v10, "setPreferredFilename:", v8);

  id v9 = [*(id *)(a1 + 32) addFileWrapper:v10];
}

- (id)_metadata
{
  v11[0] = &off_2A548;
  v10[0] = @"DocumentVersion";
  v10[1] = @"RunnablePID";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[ViewHierarchyService runnablePid](self, "runnablePid")));
  v11[1] = v3;
  v10[2] = @"RunnableDisplayName";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ViewHierarchyService destination](self, "destination"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByReplacingOccurrencesOfString:@".viewhierarchy" withString:&stru_20CA8]);
  v11[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v7,  100LL,  0LL,  0LL));
  return v8;
}

- (id)defaultPlatform
{
  return @"tvOS";
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (DBGStandaloneDataSourceConnection)dataSourceConnection
{
  return (DBGStandaloneDataSourceConnection *)objc_getProperty(self, a2, 24LL, 1);
}

- (DBGSnapshotManager)snapshotManager
{
  return (DBGSnapshotManager *)objc_getProperty(self, a2, 32LL, 1);
}

- (int)runnablePid
{
  return self->_runnablePid;
}

- (void)setRunnablePid:(int)a3
{
  self->_runnablePid = a3;
}

- (OS_dispatch_queue)captureQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSURL)destination
{
  return (NSURL *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDestination:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
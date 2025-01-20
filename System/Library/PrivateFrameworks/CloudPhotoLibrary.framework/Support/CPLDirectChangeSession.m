@interface CPLDirectChangeSession
+ (id)selfCrashResetReason;
- (BOOL)processSessionContext:(id)a3 inStore:(id)a4 error:(id *)a5;
- (BOOL)tearedDown;
- (CPLDirectChangeSession)initWithAbstractObject:(id)a3;
- (id)clientWorkDescription;
- (void)beginClientWork;
- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)discardTentativeResetReason;
- (void)dispatchCallback:(id)a3;
- (void)endClientWork;
- (void)finalizeWithCompletionHandler:(id)a3;
- (void)registerTentativeResetReason;
- (void)tearDownWithCompletionHandler:(id)a3;
@end

@implementation CPLDirectChangeSession

- (CPLDirectChangeSession)initWithAbstractObject:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLDirectChangeSession;
  v3 = -[CPLDirectChangeSession initWithAbstractObject:](&v15, "initWithAbstractObject:", a3);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = CPLCopyDefaultSerialQueueAttributes(v3);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cpl.session.lock", v6);
    lock = v4->_lock;
    v4->_lock = (OS_dispatch_queue *)v7;

    uint64_t v10 = CPLCopyDefaultSerialQueueAttributes(v9);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.cpl.session.callback", v11);
    callbackQueue = v4->_callbackQueue;
    v4->_callbackQueue = (OS_dispatch_queue *)v12;
  }

  return v4;
}

- (id)clientWorkDescription
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/DirectClien tToEngine/CPLDirectChangeSession.m"));
  v6 = NSStringFromSelector(a2);
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 handleFailureInMethod:a2, self, v5, 44, @"%@ should be implemented by subclasses", v7 object file lineNumber description];

  abort();
}

- (void)beginClientWork
{
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013DD14;
  block[3] = &unk_10023DC70;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)lock, block);
}

- (BOOL)processSessionContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopes]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 mainScopeIdentifier]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeWithIdentifier:v10]);
  if (v11
    && ((id v12 = [v7 estimatedInitialSizeForLocalLibrary],
         id v13 = [v7 estimatedInitialAssetCountForLocalLibrary],
         id v14 = [v9 estimatedSizeForScope:v11],
         v13 > [v9 estimatedAssetCountForScope:v11])
     || v12 > v14))
  {
    unsigned __int8 v15 = [v9 storeEstimatedSize:v12 estimatedAssetCount:v13 forScope:v11 error:a5];
  }

  else
  {
    unsigned __int8 v15 = 1;
  }

  return v15;
}

- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/DirectClie ntToEngine/CPLDirectChangeSession.m"));
  id v14 = NSStringFromSelector(a2);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v12 handleFailureInMethod:a2, self, v13, 81, @"%@ should be implemented by subclasses", v15 object file lineNumber description];

  abort();
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/DirectClien tToEngine/CPLDirectChangeSession.m"));
  id v8 = NSStringFromSelector(a2);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 handleFailureInMethod:a2, self, v7, 85, @"%@ should be implemented by subclasses", v9 object file lineNumber description];

  abort();
}

- (void)endClientWork
{
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013E0B0;
  block[3] = &unk_10023DC70;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)lock, block);
}

- (void)tearDownWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  -[CPLDirectChangeSession discardTentativeResetReason](self, "discardTentativeResetReason");
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013E324;
  block[3] = &unk_10023E658;
  block[4] = self;
  void block[5] = &v17;
  dispatch_sync((dispatch_queue_t)lock, block);
  if (*((_BYTE *)v18 + 24))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectChangeSession abstractObject](self, "abstractObject"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryManager]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 platformObject]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 engineLibrary]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 store]);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10013E420;
    v13[3] = &unk_100246248;
    id v11 = v10;
    id v14 = v11;
    unsigned __int8 v15 = v4;
    id v12 = [v11 performReadTransactionWithBlock:v13];
  }

  else
  {
    v4[2](v4);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)dispatchCallback:(id)a3
{
  id v4 = a3;
  callbackQueue = self->_callbackQueue;
  id v6 = v4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013E77C;
  block[3] = &unk_10023DBC8;
  id v10 = v6;
  id v7 = callbackQueue;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);
}

- (BOOL)tearedDown
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013E58C;
  v5[3] = &unk_10023DD58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)lock, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)selfCrashResetReason
{
  if (qword_1002A37E0 != -1) {
    dispatch_once(&qword_1002A37E0, &stru_100246F20);
  }
  return (id)qword_1002A37E8;
}

- (void)registerTentativeResetReason
{
  if (self->_tentativeReason) {
    sub_100199254(a2, (uint64_t)self);
  }
  id v3 = [(id)objc_opt_class(self) selfCrashResetReason];
  id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (CPLResetReason *)objc_claimAutoreleasedReturnValue( +[CPLResetTracker registerTentativeResetReasonIfCrashing:]( &OBJC_CLASS___CPLResetTracker,  "registerTentativeResetReasonIfCrashing:",  v6));
  tentativeReason = self->_tentativeReason;
  self->_tentativeReason = v4;
}

- (void)discardTentativeResetReason
{
  if (self->_tentativeReason)
  {
    +[CPLResetTracker discardTentativeResetReason:](&OBJC_CLASS___CPLResetTracker, "discardTentativeResetReason:");
    tentativeReason = self->_tentativeReason;
    self->_tentativeReason = 0LL;
  }

- (void).cxx_destruct
{
}

@end
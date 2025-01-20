@interface CKKSLockStateTracker
+ (id)globalTracker;
- (BOOL)checkErrorChainForLockState:(id)a3;
- (BOOL)isLocked;
- (BOOL)isLockedError:(id)a3;
- (BOOL)lockedError:(id)a3;
- (BOOL)queueIsLocked;
- (CKKSLockStateProviderProtocol)lockStateProvider;
- (CKKSLockStateTracker)initWithProvider:(id)a3;
- (NSDate)lastUnlockTime;
- (NSDate)lastUnlockedTime;
- (NSHashTable)observers;
- (NSOperation)unlockDependency;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)queue;
- (id)description;
- (int)notify_token;
- (void)_onqueueRecheck;
- (void)addLockStateObserver:(id)a3;
- (void)dealloc;
- (void)recheck;
- (void)resetUnlockDependency;
- (void)setLastUnlockedTime:(id)a3;
- (void)setLockStateProvider:(id)a3;
- (void)setNotify_token:(int)a3;
- (void)setObservers:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueueIsLocked:(BOOL)a3;
- (void)setUnlockDependency:(id)a3;
@end

@implementation CKKSLockStateTracker

- (CKKSLockStateTracker)initWithProvider:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CKKSLockStateTracker;
  v6 = -[CKKSLockStateTracker init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lockStateProvider, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("lock-state-tracker", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v12;

    v7->_notify_token = -1;
    v7->_queueIsLocked = 1;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    -[CKKSLockStateTracker resetUnlockDependency](v7, "resetUnlockDependency");
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    v16 = (dispatch_queue_s *)v7->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100138E14;
    handler[3] = &unk_1002913A0;
    objc_copyWeak(&v22, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v7->_notify_token, v16, handler);
    objc_destroyWeak(&v22);
    v17 = (dispatch_queue_s *)v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100138E40;
    block[3] = &unk_100291A38;
    objc_copyWeak(&v20, &location);
    dispatch_async(v17, block);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  int notify_token = self->_notify_token;
  if (notify_token != -1) {
    notify_cancel(notify_token);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CKKSLockStateTracker;
  -[CKKSLockStateTracker dealloc](&v4, "dealloc");
}

- (BOOL)isLocked
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = -86;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100138E00;
  v5[3] = &unk_1002916D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)lastUnlockTime
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  dispatch_queue_t v10 = sub_100138D68;
  v11 = sub_100138D78;
  id v12 = 0LL;
  char v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100138D80;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (id)description
{
  if (-[CKKSLockStateTracker isLocked](self, "isLocked"))
  {
    char v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker lastUnlockedTime](self, "lastUnlockedTime"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSLockStateTracker: %@ last:%@>",  @"locked",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSLockStateTracker: %@ last:%@>",  @"unlocked",  @"now"));
  }

  return v4;
}

- (void)resetUnlockDependency
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker unlockDependency](self, "unlockDependency"));
  if (!v3
    || (id v4 = (void *)v3,
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker unlockDependency](self, "unlockDependency")),
        unsigned __int8 v6 = [v5 isPending],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"keybag-unlocked-dependency",  &stru_1002903E0));
    [v7 setDescriptionErrorCode:4];
    -[CKKSLockStateTracker setUnlockDependency:](self, "setUnlockDependency:", v7);
  }

- (void)_onqueueRecheck
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = -[CKKSLockStateTracker queueIsLocked](self, "queueIsLocked");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker lockStateProvider](self, "lockStateProvider"));
  -[CKKSLockStateTracker setQueueIsLocked:](self, "setQueueIsLocked:", [v5 queryAKSLocked]);

  if (v4 == -[CKKSLockStateTracker queueIsLocked](self, "queueIsLocked") && (byte_1002DEC90 & 1) != 0) {
    return;
  }
  byte_1002DEC90 = 1;
  if (-[CKKSLockStateTracker queueIsLocked](self, "queueIsLocked"))
  {
    -[CKKSLockStateTracker resetUnlockDependency](self, "resetUnlockDependency");
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker operationQueue](self, "operationQueue"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker unlockDependency](self, "unlockDependency"));
    [v6 addOperation:v7];

    -[CKKSLockStateTracker setUnlockDependency:](self, "setUnlockDependency:", 0LL);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[CKKSLockStateTracker setLastUnlockedTime:](self, "setLastUnlockedTime:", v8);

LABEL_8:
  unsigned __int8 v9 = -[CKKSLockStateTracker queueIsLocked](self, "queueIsLocked");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  dispatch_queue_t v10 = self->_observers;
  id v11 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v11)
  {
    id v12 = v11;
    char v13 = v9 ^ 1;
    uint64_t v14 = *(void *)v23;
LABEL_10:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(id *)(*((void *)&v22 + 1) + 8 * v15);
      if (!v16) {
        break;
      }
      v17 = v16;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100138CE4;
      v20[3] = &unk_100290408;
      v20[4] = v17;
      char v21 = v13;
      dispatch_async(v19, v20);

      if (v12 == (id)++v15)
      {
        id v12 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
        if (v12) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
}

- (void)recheck
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100138CDC;
  block[3] = &unk_1002927F0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)lockedError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-25308)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v4 isEqualToString:@"securityd"])
    {
      unsigned __int8 v5 = 1;
    }

    else
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
      unsigned __int8 v5 = [v6 isEqualToString:kCFErrorDomainOSStatus];
    }
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)checkErrorChainForLockState:(id)a3
{
  id v4 = a3;
  if (!v4) {
    return 0;
  }
  unsigned __int8 v5 = v4;
  do
  {
    BOOL v6 = -[CKKSLockStateTracker lockedError:](self, "lockedError:", v5);
    if (v6) {
      break;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    unsigned __int8 v5 = (void *)v8;
  }

  while (v8);

  return v6;
}

- (BOOL)isLockedError:(id)a3
{
  BOOL v4 = -[CKKSLockStateTracker checkErrorChainForLockState:](self, "checkErrorChainForLockState:", a3);
  if (v4)
  {
    unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100138CA4;
    block[3] = &unk_1002927F0;
    void block[4] = self;
    dispatch_sync(v5, block);
  }

  return v4;
}

- (void)addLockStateObserver:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSLockStateTracker queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100138BE8;
  v7[3] = &unk_100290788;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSOperation)unlockDependency
{
  return (NSOperation *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setUnlockDependency:(id)a3
{
}

- (CKKSLockStateProviderProtocol)lockStateProvider
{
  return (CKKSLockStateProviderProtocol *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLockStateProvider:(id)a3
{
}

- (BOOL)queueIsLocked
{
  return self->_queueIsLocked;
}

- (void)setQueueIsLocked:(BOOL)a3
{
  self->_queueIsLocked = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setObservers:(id)a3
{
}

- (int)notify_token
{
  return self->_notify_token;
}

- (void)setNotify_token:(int)a3
{
  self->_int notify_token = a3;
}

- (NSDate)lastUnlockedTime
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLastUnlockedTime:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)globalTracker
{
  if (qword_1002DECA0 != -1) {
    dispatch_once(&qword_1002DECA0, &stru_100290428);
  }
  return (id)qword_1002DEC98;
}

@end
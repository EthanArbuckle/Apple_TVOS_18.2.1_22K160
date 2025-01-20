@interface IDSDuetInterface
+ (id)sharedInstance;
- (BOOL)initialSyncInProgress;
- (BOOL)reunionSyncInProgress;
- (IDSDuetInterface)init;
- (IDSDuetInterfaceDelegate)delegate;
- (NSMutableSet)initialSyncClientIDs;
- (NSMutableSet)reunionSyncClientIDs;
- (id)_newKeyForValues:(id)a3 priority:(int64_t)a4;
- (void)checkAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7;
- (void)dealloc;
- (void)forceCheckAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setInitialSyncClientIDs:(id)a3;
- (void)setReunionSyncClientIDs:(id)a3;
@end

@implementation IDSDuetInterface

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020A94;
  block[3] = &unk_1008F6558;
  block[4] = a1;
  if (qword_1009BE5B8 != -1) {
    dispatch_once(&qword_1009BE5B8, block);
  }
  return (id)qword_1009BE5B0;
}

- (IDSDuetInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSDuetInterface;
  return -[IDSDuetInterface init](&v3, "init");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___IDSDuetInterface;
  -[IDSDuetInterface dealloc](&v2, "dealloc");
}

- (BOOL)initialSyncInProgress
{
  return 0;
}

- (BOOL)reunionSyncInProgress
{
  return 0;
}

- (id)_newKeyForValues:(id)a3 priority:(int64_t)a4
{
  id v5 = a3;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100020C14;
  v14 = &unk_1008F6580;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v15 = v6;
  [v5 enumerateObjectsUsingBlock:&v11];

  v7 = objc_alloc(&OBJC_CLASS___NSString);
  v8 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%d", a4, v11, v12, v13, v14);
  -[NSMutableString appendString:](v6, "appendString:", v8);
  v9 = v6;

  return v9;
}

- (void)forceCheckAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  v13 = (dispatch_queue_s *)a6;
  v14 = (void (**)(id, uint64_t))a7;
  dispatch_assert_queue_V2(v13);
  uint64_t v15 = OSLogHandleForIDSCategory("IDSDuet");
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = self;
    __int16 v20 = 2080;
    v21 = "-[IDSDuetInterface forceCheckAvailabilityForValues:priority:logString:fromQueue:withCompletionBlock:]";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%p %s Sending IDS message, no CoreDuet on platform",  buf,  0x16u);
  }

  if (v14) {
    v14[2](v14, 1LL);
  }
}

- (void)checkAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  v13 = (dispatch_queue_s *)a6;
  v14 = (void (**)(id, uint64_t))a7;
  dispatch_assert_queue_V2(v13);
  uint64_t v15 = OSLogHandleForIDSCategory("IDSDuet");
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = self;
    __int16 v20 = 2080;
    v21 = "-[IDSDuetInterface checkAvailabilityForValues:priority:logString:fromQueue:withCompletionBlock:]";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%p %s Sending IDS message, no CoreDuet on platform",  buf,  0x16u);
  }

  if (v14) {
    v14[2](v14, 1LL);
  }
}

- (IDSDuetInterfaceDelegate)delegate
{
  return (IDSDuetInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)initialSyncClientIDs
{
  return self->_initialSyncClientIDs;
}

- (void)setInitialSyncClientIDs:(id)a3
{
}

- (NSMutableSet)reunionSyncClientIDs
{
  return self->_reunionSyncClientIDs;
}

- (void)setReunionSyncClientIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
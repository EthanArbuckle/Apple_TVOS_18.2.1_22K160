@interface RestoreService
- (RestoreService)init;
- (void)clearFollowupsForAccountID:(id)a3 replyHandler:(id)a4;
- (void)prioritizeBundleIDs:(id)a3 userInitiated:(BOOL)a4 replyHandler:(id)a5;
@end

@implementation RestoreService

- (RestoreService)init
{
  id v3 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (self)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___RestoreService;
    v6 = -[RestoreService init](&v17, "init");
    self = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_database, v4);
      dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appstored.RestoreService", v8);
      queue = self->_queue;
      self->_queue = v9;

      v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      queue_parkedDownloadSizeHandlers = self->_queue_parkedDownloadSizeHandlers;
      self->_queue_parkedDownloadSizeHandlers = v11;

      self->_queue_restoreState = 0;
      uint64_t v13 = ASDLogHandleForCategory(29LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v16 = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "(RestoreService) Restore state -> UNKNOWN",  v16,  2u);
      }
    }
  }

  return self;
}

- (void)clearFollowupsForAccountID:(id)a3 replyHandler:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10020ED50;
  block[3] = &unk_1003EA158;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

- (void)prioritizeBundleIDs:(id)a3 userInitiated:(BOOL)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10020EE18;
  block[3] = &unk_1003ECD38;
  BOOL v16 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
}

@end
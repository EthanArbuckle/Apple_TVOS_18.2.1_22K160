@interface CKDiscretionaryDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CKDiscretionaryDaemon)initWithInSyncBubble:(BOOL)a3;
- (CKDiscretionaryDaemon)initWithSchedulerClass:(Class)a3;
- (Class)schedulerClass;
- (OS_dispatch_queue)serialQueue;
- (void)setSchedulerClass:(Class)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation CKDiscretionaryDaemon

- (CKDiscretionaryDaemon)initWithInSyncBubble:(BOOL)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKDiscretionaryImmediateScheduler, a2);
  if (!a3) {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKDiscretionaryDASScheduler, v6);
  }
  return -[CKDiscretionaryDaemon initWithSchedulerClass:](self, "initWithSchedulerClass:", v5);
}

- (CKDiscretionaryDaemon)initWithSchedulerClass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CKDiscretionaryDaemon;
  v4 = -[CKDiscretionaryDaemon init](&v10, "init");
  if (v4)
  {
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ckdiscretionaryd.serial", v6);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v4->_schedulerClass, a3);
  }

  return v4;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (Class)schedulerClass
{
  return self->_schedulerClass;
}

- (void)setSchedulerClass:(Class)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer _CKXPCClientToDiscretionaryDaemonInterface]( &OBJC_CLASS___CKContainer,  "_CKXPCClientToDiscretionaryDaemonInterface"));
  [v7 setExportedInterface:v8];

  v9 = -[CKDiscretionaryClientConnection initWithDaemon:connection:]( objc_alloc(&OBJC_CLASS___CKDiscretionaryClientConnection),  "initWithDaemon:connection:",  self,  v7);
  [v7 setExportedObject:v9];

  objc_initWeak(&location, v7);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_1000071C0;
  v14 = &unk_100010510;
  objc_copyWeak(&v15, &location);
  [v7 setInvalidationHandler:&v11];
  objc_msgSend(v7, "resume", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

@end
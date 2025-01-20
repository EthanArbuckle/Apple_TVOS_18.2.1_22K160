@interface GKIDSConnectionManager
+ (id)sharedManager;
- (BOOL)isReady;
- (GKIDSConnectionManager)init;
- (GKIDSConnectionManagerDelegate)delegate;
- (IDSAccountController)gcArcadeAccountController;
- (OS_dispatch_queue)idsDelegateQueue;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)dealloc;
- (void)fetchIDSDataForHandles:(id)a3 service:(id)a4 infoTypes:(unint64_t)a5 performingBlockPerBatch:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setGcArcadeAccountController:(id)a3;
- (void)setIdsDelegateQueue:(id)a3;
@end

@implementation GKIDSConnectionManager

+ (id)sharedManager
{
  if (qword_1002BB550 != -1) {
    dispatch_once(&qword_1002BB550, &stru_100270560);
  }
  return (id)qword_1002BB558;
}

- (GKIDSConnectionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GKIDSConnectionManager;
  v2 = -[GKIDSConnectionManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.gamed.idsConnectionManager.idsDelegateQueue", 0LL);
    idsDelegateQueue = v2->_idsDelegateQueue;
    v2->_idsDelegateQueue = (OS_dispatch_queue *)v3;

    v5 = -[IDSAccountController initWithService:]( objc_alloc(&OBJC_CLASS___IDSAccountController),  "initWithService:",  @"com.apple.private.alloy.arcade");
    gcArcadeAccountController = v2->_gcArcadeAccountController;
    v2->_gcArcadeAccountController = v5;

    v7 = v2->_gcArcadeAccountController;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager idsDelegateQueue](v2, "idsDelegateQueue"));
    -[IDSAccountController addDelegate:queue:](v7, "addDelegate:queue:", v2, v8);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKIDSConnectionManager;
  -[GKIDSConnectionManager dealloc](&v3, "dealloc");
}

- (BOOL)isReady
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager gcArcadeAccountController](self, "gcArcadeAccountController"));
  unsigned __int8 v3 = [v2 _gkIsReadyForService:@"com.apple.private.alloy.arcade"];

  return v3;
}

- (void)fetchIDSDataForHandles:(id)a3 service:(id)a4 infoTypes:(unint64_t)a5 performingBlockPerBatch:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager idsDelegateQueue](self, "idsDelegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AAFA8;
  block[3] = &unk_100270588;
  id v18 = v10;
  id v19 = v11;
  id v21 = v12;
  unint64_t v22 = a5;
  v20 = self;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager idsDelegateQueue](self, "idsDelegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AB13C;
  block[3] = &unk_10026BDB0;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceName]);
    int v14 = 138412290;
    id v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Account added: %@", (uint8_t *)&v14, 0xCu);
  }

  if (-[GKIDSConnectionManager isReady](self, "isReady"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKIDSConnectionManager delegate](self, "delegate"));
    [v13 connectionManagerReady:self];
  }
}

- (GKIDSConnectionManagerDelegate)delegate
{
  return (GKIDSConnectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)idsDelegateQueue
{
  return self->_idsDelegateQueue;
}

- (void)setIdsDelegateQueue:(id)a3
{
}

- (IDSAccountController)gcArcadeAccountController
{
  return self->_gcArcadeAccountController;
}

- (void)setGcArcadeAccountController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
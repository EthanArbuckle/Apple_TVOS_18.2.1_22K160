@interface AXManagedAssetTask
+ (AXManagedAssetTask)taskWithName:(id)a3 policy:(id)a4 context:(id)a5 block:(id)a6;
- (AXAssetController)assetController;
- (AXAssetPolicy)policy;
- (AXManagedAssetTask)initWithName:(id)a3 policy:(id)a4 context:(id)a5 block:(id)a6;
- (AXManagedAssetTaskContext)context;
- (AXManagedAssetTaskRestorationState)restorationState;
- (BOOL)_deferIfNeeded;
- (BOOL)finished;
- (NSString)description;
- (NSString)name;
- (id)_restorationExitStatusForResult:(unint64_t)a3;
- (id)taskBlock;
- (void)_completeWithResult:(unint64_t)a3;
- (void)setAssetController:(id)a3;
- (void)setContext:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setRestorationState:(id)a3;
- (void)setTaskBlock:(id)a3;
@end

@implementation AXManagedAssetTask

+ (AXManagedAssetTask)taskWithName:(id)a3 policy:(id)a4 context:(id)a5 block:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithName:v13 policy:v12 context:v11 block:v10];

  return (AXManagedAssetTask *)v14;
}

- (AXManagedAssetTask)initWithName:(id)a3 policy:(id)a4 context:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___AXManagedAssetTask;
  id v14 = -[AXManagedAssetTask init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    -[AXManagedAssetTask setTaskBlock:](v14, "setTaskBlock:", v13);
    -[AXManagedAssetTask setPolicy:](v15, "setPolicy:", v11);
    -[AXManagedAssetTask setName:](v15, "setName:", v10);
    -[AXManagedAssetTask setContext:](v15, "setContext:", v12);
  }

  return v15;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask context](self, "context"));
  id v4 = [v3 environment];
  v5 = @"XPCActivity";
  if (!v4) {
    v5 = @"XPCClientReq";
  }
  v6 = v5;

  v8 = (objc_class *)objc_opt_class(self, v7);
  v9 = NSStringFromClass(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask name](self, "name"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask policy](self, "policy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetType]);
  unsigned int v14 = -[AXManagedAssetTask finished](self, "finished");
  v15 = @"Active";
  if (v14) {
    v15 = @"Finished";
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p> [%@:%@:%@ - Status:%@]",  v10,  self,  v6,  v11,  v13,  v15));

  return (NSString *)v16;
}

- (AXAssetController)assetController
{
  assetController = self->_assetController;
  if (!assetController)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask policy](self, "policy"));
    v5 = (AXAssetController *)objc_claimAutoreleasedReturnValue( +[AXAssetController assetControllerWithPolicy:qosClass:shouldRefreshForAssetInstallNotifications:]( &OBJC_CLASS___AXAssetController,  "assetControllerWithPolicy:qosClass:shouldRefreshForAssetInstallNotifications:",  v4,  33LL,  0LL));
    v6 = self->_assetController;
    self->_assetController = v5;

    -[AXAssetController setUserInitiated:](self->_assetController, "setUserInitiated:", 1LL);
    -[AXAssetController addObserver:](self->_assetController, "addObserver:", self);
    assetController = self->_assetController;
  }

  return assetController;
}

- (void)_completeWithResult:(unint64_t)a3
{
  uint64_t v5 = AXLogAssetDaemon(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"Deferred";
    if (a3 == 1) {
      uint64_t v7 = @"Failed";
    }
    if (!a3) {
      uint64_t v7 = @"Success";
    }
    int v18 = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will complete task [%@] with result : %@",  (uint8_t *)&v18,  0x16u);
  }

  BOOL v8 = -[AXManagedAssetTask finished](self, "finished");
  if (v8)
  {
    uint64_t v9 = AXLogAssetDaemon(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10001505C((uint64_t)self, v10);
    }
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask assetController](self, "assetController"));
    [v11 removeObserver:self];

    -[AXManagedAssetTask setAssetController:](self, "setAssetController:", 0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask restorationState](self, "restorationState"));
    if (a3 > 1)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask restorationState](self, "restorationState"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 phase]);
      v15 = (void *)objc_claimAutoreleasedReturnValue( -[AXManagedAssetTask _restorationExitStatusForResult:]( self,  "_restorationExitStatusForResult:",  a3));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
      [v12 updatePhase:v14 exitStatus:v15 saveToStore:v16];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[AXManagedAssetTask _restorationExitStatusForResult:]( self,  "_restorationExitStatusForResult:",  a3));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
      [v12 updatePhase:@"Idle" exitStatus:v13 saveToStore:v14];
    }

    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask context](self, "context"));
    [v17 finishWithResult:a3];

    -[AXManagedAssetTask setFinished:](self, "setFinished:", 1LL);
  }

- (id)_restorationExitStatusForResult:(unint64_t)a3
{
  v3 = @"Success";
  if (a3 == 1) {
    v3 = @"Failed";
  }
  if (a3 == 2) {
    return @"Deferred";
  }
  else {
    return (id)v3;
  }
}

- (BOOL)_deferIfNeeded
{
  BOOL v3 = -[AXManagedAssetTask finished](self, "finished");
  if (v3)
  {
    uint64_t v4 = AXLogAssetDaemon(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      unsigned int v14 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ - Checking _deferIfNeeded: Already finixhed, returning true ",  (uint8_t *)&v13,  0xCu);
    }

    return 1;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask context](self, "context"));
  unsigned int v7 = [v6 shouldDefer];

  uint64_t v9 = AXLogAssetDaemon(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      int v13 = 138412290;
      unsigned int v14 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ - Checking _deferIfNeeded: Returning true",  (uint8_t *)&v13,  0xCu);
    }

    -[AXManagedAssetTask _completeWithResult:](self, "_completeWithResult:", 2LL);
    return 1;
  }

  if (v11)
  {
    int v13 = 138412290;
    unsigned int v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ - Checking _deferIfNeeded: Returning false",  (uint8_t *)&v13,  0xCu);
  }

  return 0;
}

- (id)taskBlock
{
  return self->_taskBlock;
}

- (void)setTaskBlock:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (AXAssetPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (void)setAssetController:(id)a3
{
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (AXManagedAssetTaskRestorationState)restorationState
{
  return self->_restorationState;
}

- (void)setRestorationState:(id)a3
{
}

- (AXManagedAssetTaskContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
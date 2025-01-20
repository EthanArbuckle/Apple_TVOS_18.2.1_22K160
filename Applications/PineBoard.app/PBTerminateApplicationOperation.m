@interface PBTerminateApplicationOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (FBProcessManager)processManager;
- (NSString)reason;
- (PBTerminateApplicationOperation)initWithApplicationProcessIdentity:(id)a3;
- (PBTerminateApplicationOperation)initWithProcessManager:(id)a3 applicationProcessIdentity:(id)a4;
- (RBSProcessIdentity)applicationProcessIdentity;
- (id)terminateApplicationCompletionHandler;
- (void)setReason:(id)a3;
- (void)setTerminateApplicationCompletionHandler:(id)a3;
- (void)start;
@end

@implementation PBTerminateApplicationOperation

- (PBTerminateApplicationOperation)initWithProcessManager:(id)a3 applicationProcessIdentity:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"processManager != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293674(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x10020A54CLL);
  }

  v10 = v9;
  if (([v9 isEmbeddedApplication] & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[applicationProcessIdentity isEmbeddedApplication]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293730(a2);
    }
    goto LABEL_11;
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBTerminateApplicationOperation;
  id v11 = -[PBTerminateApplicationOperation init](&v17, "init");
  v12 = (PBTerminateApplicationOperation *)v11;
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, a3);
    id v13 = [v10 copy];
    v14 = *(void **)&v12->_executing;
    *(void *)&v12->_executing = v13;
  }

  return v12;
}

- (PBTerminateApplicationOperation)initWithApplicationProcessIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  v6 = -[PBTerminateApplicationOperation initWithProcessManager:applicationProcessIdentity:]( self,  "initWithProcessManager:applicationProcessIdentity:",  v5,  v4);

  return v6;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (char)v2->super._private;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = BYTE1(v2->super._private);
  objc_sync_exit(v2);

  return v3;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->super._private)) {
    goto LABEL_4;
  }
  if (-[PBTerminateApplicationOperation isCancelled](v2, "isCancelled"))
  {
    -[PBTerminateApplicationOperation willChangeValueForKey:](v2, "willChangeValueForKey:", @"finished");
    BYTE1(v2->super._private) = 1;
    -[PBTerminateApplicationOperation didChangeValueForKey:](v2, "didChangeValueForKey:", @"finished");
LABEL_4:
    objc_sync_exit(v2);
    goto LABEL_5;
  }

  objc_sync_exit(v2);

  char v3 = v2;
  objc_sync_enter(v3);
  -[PBTerminateApplicationOperation willChangeValueForKey:](v3, "willChangeValueForKey:", @"executing");
  LOBYTE(v3->super._private) = 1;
  -[PBTerminateApplicationOperation didChangeValueForKey:](v3, "didChangeValueForKey:", @"executing");
  objc_sync_exit(v3);

  id v4 = sub_100084518();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)&v3->_executing;
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Terminating application. {applicationProcessIdentity=%@}",  buf,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v3->super._private1 processForIdentity:*(void *)&v3->_executing]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___FBApplicationProcess);
  id v9 = v7;
  v10 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  v12 = v11;

  if (v12)
  {
    objc_initWeak((id *)buf, v3);
    processManager = (__CFString *)v3->_processManager;
    if (!processManager) {
      processManager = @"UserSwitch";
    }
    v14 = processManager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10020AA24;
    v19[3] = &unk_1003D9530;
    objc_copyWeak(&v20, (id *)buf);
    v19[4] = v3;
    -[PBTerminateApplicationOperation killForReason:andReport:withDescription:completion:]( v12,  "killForReason:andReport:withDescription:completion:",  3LL,  0LL,  v14,  v19);
    objc_destroyWeak(&v20);

    objc_destroyWeak((id *)buf);
  }

  else
  {
    id v15 = sub_100084518();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1002937EC((uint64_t *)&v3->_executing, v16);
    }

    objc_super v17 = v3;
    objc_sync_enter(v17);
    applicationProcessIdentity = v17->_applicationProcessIdentity;
    if (applicationProcessIdentity) {
      (*((void (**)(RBSProcessIdentity *, void, void))applicationProcessIdentity + 2))( applicationProcessIdentity,  0LL,  0LL);
    }
    -[PBTerminateApplicationOperation willChangeValueForKey:](v17, "willChangeValueForKey:", @"finished");
    -[PBTerminateApplicationOperation willChangeValueForKey:](v17, "willChangeValueForKey:", @"executing");
    LOBYTE(v3->super._private) = 0;
    BYTE1(v2->super._private) = 1;
    -[PBTerminateApplicationOperation didChangeValueForKey:](v17, "didChangeValueForKey:", @"executing");
    -[PBTerminateApplicationOperation didChangeValueForKey:](v17, "didChangeValueForKey:", @"finished");
    objc_sync_exit(v17);
  }

  v2 = v12;
LABEL_5:
}

- (void)setTerminateApplicationCompletionHandler:(id)a3
{
  id v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  uint64_t v6 = (RBSProcessIdentity *)objc_retainBlock(v5);

  applicationProcessIdentity = v4->_applicationProcessIdentity;
  v4->_applicationProcessIdentity = v6;

  objc_sync_exit(v4);
}

- (FBProcessManager)processManager
{
  return *(FBProcessManager **)&self->super._private1;
}

- (RBSProcessIdentity)applicationProcessIdentity
{
  return *(RBSProcessIdentity **)&self->_executing;
}

- (NSString)reason
{
  return (NSString *)self->_processManager;
}

- (void)setReason:(id)a3
{
}

- (id)terminateApplicationCompletionHandler
{
  return self->_applicationProcessIdentity;
}

- (void).cxx_destruct
{
}

@end
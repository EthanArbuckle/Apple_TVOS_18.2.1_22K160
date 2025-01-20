@interface PBProcessLaunchAgent
+ (id)defaultAttributes;
- (BOOL)relaunchProcessOnExit;
- (BSCompoundAssertion)compoundAssertion;
- (FBProcess)process;
- (FBProcessExecutionContext)processExecutionContext;
- (FBProcessManager)processManager;
- (NSArray)attributes;
- (OS_dispatch_queue)queue;
- (PBProcessLaunchAgent)initWithProcessIdentity:(id)a3;
- (PBProcessLaunchAgent)initWithProcessIdentity:(id)a3 processManager:(id)a4 assertionCreator:(id)a5;
- (RBSAssertion)processAssertion;
- (RBSProcessIdentity)processIdentity;
- (id)_queue_createProcessAssertion;
- (id)assertionCreator;
- (id)launchProcessForReason:(id)a3;
- (void)_assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)_queue_assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)_queue_stateDidChange:(int64_t)a3;
- (void)_stateDidChange:(int64_t)a3;
- (void)appendAttributes:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)processManager:(id)a3 didAddProcess:(id)a4;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
- (void)setAttributes:(id)a3;
- (void)setProcessExecutionContext:(id)a3;
- (void)setRelaunchProcessOnExit:(BOOL)a3;
@end

@implementation PBProcessLaunchAgent

+ (id)defaultAttributes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[RBSJetsamPriorityGrant grantWithBackgroundPriority]( &OBJC_CLASS___RBSJetsamPriorityGrant,  "grantWithBackgroundPriority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v2));

  return v3;
}

- (PBProcessLaunchAgent)initWithProcessIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
  v6 = -[PBProcessLaunchAgent initWithProcessIdentity:processManager:assertionCreator:]( self,  "initWithProcessIdentity:processManager:assertionCreator:",  v4,  v5,  &stru_1003D9AC0);

  return v6;
}

- (PBProcessLaunchAgent)initWithProcessIdentity:(id)a3 processManager:(id)a4 assertionCreator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  Class v13 = NSClassFromString(@"RBSProcessIdentity");
  if (!v12)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002874D4();
    }
LABEL_23:
    _bs_set_crash_log_message([v36 UTF8String]);
    __break(0);
    JUMPOUT(0x100162154LL);
  }

  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:RBSProcessIdentityClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028779C();
    }
    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x1001621B8LL);
  }

  id v14 = v10;
  Class v15 = NSClassFromString(@"FBProcessManager");
  if (!v14)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287588();
    }
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x10016221CLL);
  }

  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FBProcessManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002876E8();
    }
    _bs_set_crash_log_message([v39 UTF8String]);
    __break(0);
    JUMPOUT(0x100162280LL);
  }

  if (!v11)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"assertionCreator != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028763C();
    }
    goto LABEL_23;
  }

  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___PBProcessLaunchAgent;
  v16 = -[PBProcessLaunchAgent init](&v43, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_processIdentity, a3);
    objc_storeStrong((id *)&v17->_processManager, a4);
    id v18 = objc_retainBlock(v11);
    id assertionCreator = v17->_assertionCreator;
    v17->_id assertionCreator = v18;

    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.PineBoard.ProcessLaunchAgent", v21);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    objc_initWeak(&location, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v12));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100162314;
    v40[3] = &unk_1003D1970;
    objc_copyWeak(&v41, &location);
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  v24,  v40));
    compoundAssertion = v17->_compoundAssertion;
    v17->_compoundAssertion = (BSCompoundAssertion *)v25;

    -[BSCompoundAssertion setLog:](v17->_compoundAssertion, "setLog:", &_os_log_disabled);
    id v27 = [[FBMutableProcessExecutionContext alloc] initWithIdentity:v17->_processIdentity];
    [v27 setLaunchIntent:1];
    v28 = (FBProcessExecutionContext *)[v27 copy];
    queue_processExecutionContext = v17->_queue_processExecutionContext;
    v17->_queue_processExecutionContext = v28;

    id v30 = [(id)objc_opt_class(v17) defaultAttributes];
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    queue_attributes = v17->_queue_attributes;
    v17->_queue_attributes = (NSArray *)v31;

    -[FBProcessManager addObserver:](v17->_processManager, "addObserver:", v17);
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v14 processForIdentity:v12]);
    queue_process = v17->_queue_process;
    v17->_queue_process = (FBProcess *)v33;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBProcessLaunchAgent;
  -[PBProcessLaunchAgent dealloc](&v3, "dealloc");
}

- (FBProcessExecutionContext)processExecutionContext
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100162484;
  id v10 = sub_100162494;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001624AC;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FBProcessExecutionContext *)v3;
}

- (void)setProcessExecutionContext:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(@"FBProcessExecutionContext");
  if (!v4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287850();
    }
LABEL_13:
    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
    JUMPOUT(0x100162638LL);
  }

  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FBProcessExecutionContextClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287850();
    }
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x10016269CLL);
  }

  if (-[BSCompoundAssertion isActive](self->_compoundAssertion, "isActive"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot adjust configuration with outstanding assertions"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287900();
    }
    goto LABEL_13;
  }

  id v6 = [v4 mutableCopy];
  [v6 setIdentity:self->_processIdentity];
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001626F8;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v13, &location);
  id v12 = v6;
  id v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)relaunchProcessOnExit
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001627CC;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setRelaunchProcessOnExit:(BOOL)a3
{
  if (-[BSCompoundAssertion isActive](self->_compoundAssertion, "isActive"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot adjust configuration with outstanding assertions"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002879A8();
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

  else
  {
    objc_initWeak(&location, self);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001628E8;
    block[3] = &unk_1003D1A50;
    objc_copyWeak(&v8, &location);
    BOOL v9 = a3;
    dispatch_async(queue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

- (NSArray)attributes
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  BOOL v9 = sub_100162484;
  id v10 = sub_100162494;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001629D4;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setAttributes:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(@"NSArray");
  if (!v4)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287A50();
    }
LABEL_13:
    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
    JUMPOUT(0x100162B58LL);
  }

  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSArrayClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287A50();
    }
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x100162BBCLL);
  }

  if (-[BSCompoundAssertion isActive](self->_compoundAssertion, "isActive"))
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot adjust configuration with outstanding assertions"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287B00();
    }
    goto LABEL_13;
  }

  id v6 = [v4 copy];

  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100162C18;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v13, &location);
  id v12 = v6;
  id v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)appendAttributes:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(@"NSArray");
  if (!v4)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287BA8();
    }
LABEL_13:
    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
    JUMPOUT(0x100162DB4LL);
  }

  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSArrayClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287BA8();
    }
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x100162E18LL);
  }

  if (-[BSCompoundAssertion isActive](self->_compoundAssertion, "isActive"))
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot adjust configuration with outstanding assertions"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287C58();
    }
    goto LABEL_13;
  }

  id v6 = [v4 copy];

  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100162E74;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v13, &location);
  id v12 = v6;
  id v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)launchProcessForReason:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:]( self->_compoundAssertion,  "acquireForReason:",  a3));
}

- (void)invalidate
{
  processManager = self->_processManager;
  self->_processManager = 0LL;

  -[BSCompoundAssertion invalidate](self->_compoundAssertion, "invalidate");
  -[RBSAssertion invalidate](self->_queue_processAssertion, "invalidate");
  id assertionCreator = self->_assertionCreator;
  self->_id assertionCreator = 0LL;

  dispatch_barrier_sync((dispatch_queue_t)self->_queue, &stru_1003D9AE0);
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identity]);
  unsigned int v7 = [v6 isEqual:self->_processIdentity];

  if (v7)
  {
    id v8 = sub_100162388((id *)&self->super.isa);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Did add process {process=%{public}@}",  (uint8_t *)&v10,  0xCu);
    }

    -[PBProcessLaunchAgent _stateDidChange:](self, "_stateDidChange:", 2LL);
  }
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identity]);
  unsigned int v7 = [v6 isEqual:self->_processIdentity];

  if (v7)
  {
    id v8 = sub_100162388((id *)&self->super.isa);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Did remove process {process=%{public}@}",  (uint8_t *)&v10,  0xCu);
    }

    -[PBProcessLaunchAgent _stateDidChange:](self, "_stateDidChange:", 3LL);
  }
}

- (void)_stateDidChange:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001631AC;
  block[3] = &unk_1003D1D98;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_queue_stateDidChange:(int64_t)a3
{
  queue_process = self->_queue_process;
  if (!queue_process || (-[FBProcess isRunning](queue_process, "isRunning") & 1) == 0)
  {
    id v6 = (FBProcess *)objc_claimAutoreleasedReturnValue( -[FBProcessManager processForIdentity:]( self->_processManager,  "processForIdentity:",  self->_processIdentity));
    unsigned int v7 = self->_queue_process;
    self->_queue_process = v6;
  }

  if (-[BSCompoundAssertion isActive](self->_compoundAssertion, "isActive"))
  {
    BOOL queue_relaunchProcessOnExit = self->_queue_relaunchProcessOnExit;
    BOOL v9 = self->_queue_process;
    if (!v9 || (-[FBProcess isRunning](v9, "isRunning") & 1) == 0)
    {
      BOOL v11 = a3 != 3 || queue_relaunchProcessOnExit;
      id v12 = sub_100162388((id *)&self->super.isa);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v14)
        {
          Class v15 = sub_1001634C4(a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          *(_DWORD *)buf = 138543618;
          uint64_t v31 = v16;
          __int16 v32 = 1024;
          BOOL v33 = queue_relaunchProcessOnExit;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Launching process {source=%{public}@, relaunchProcessOnExit=%{BOOL}d}",  buf,  0x12u);
        }

        -[FBProcessManager launchProcessWithContext:]( self->_processManager,  "launchProcessWithContext:",  self->_queue_processExecutionContext);
      }

      else
      {
        if (v14)
        {
          dispatch_queue_attr_t v20 = sub_1001634C4(3LL);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          *(_DWORD *)buf = 138543618;
          uint64_t v31 = v21;
          __int16 v32 = 1024;
          BOOL v33 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Not launching process {source=%{public}@, relaunchProcessOnExit=%{BOOL}d}",  buf,  0x12u);
        }
      }
    }

    if (-[FBProcess isRunning](self->_queue_process, "isRunning")
      && (-[RBSAssertion isValid](self->_queue_processAssertion, "isValid") & 1) == 0)
    {
      dispatch_queue_t v22 = (RBSAssertion *)objc_claimAutoreleasedReturnValue( -[PBProcessLaunchAgent _queue_createProcessAssertion]( self,  "_queue_createProcessAssertion"));
      queue_processAssertion = self->_queue_processAssertion;
      self->_queue_processAssertion = v22;

      v24 = sub_100162388((id *)&self->super.isa);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  self->_queue_processAssertion));
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Acquiring assertion {assertion=%{public}@}",  buf,  0xCu);
      }

      objc_initWeak((id *)buf, self);
      id v27 = self->_queue_processAssertion;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10016351C;
      v28[3] = &unk_1003D9B08;
      objc_copyWeak(&v29, (id *)buf);
      -[RBSAssertion acquireWithInvalidationHandler:](v27, "acquireWithInvalidationHandler:", v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    id v18 = self->_queue_processAssertion;
    p_queue_processAssertion = &self->_queue_processAssertion;
    -[RBSAssertion invalidate](v18, "invalidate");
    v19 = *p_queue_processAssertion;
    *p_queue_processAssertion = 0LL;
  }

- (id)_queue_createProcessAssertion
{
  id v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSTarget targetWithProcessIdentity:]( &OBJC_CLASS___RBSTarget,  "targetWithProcessIdentity:",  self->_processIdentity));
  uint64_t v7 = (*((uint64_t (**)(void))self->_assertionCreator + 2))();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (void)_assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001636CC;
  v11[3] = &unk_1003D0378;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_queue_assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = (RBSAssertion *)a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_queue_processAssertion == v6)
  {
    if (!v7) {
      goto LABEL_5;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    if ([v9 isEqualToString:RBSAssertionErrorDomain])
    {
      id v10 = [v8 code];

      if (v10 == (id)1)
      {
LABEL_5:
        BOOL v11 = sub_100162388((id *)&self->super.isa);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v6));
          int v16 = 138543362;
          v17 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Assertion invalidated {assertion=%{public}@}",  (uint8_t *)&v16,  0xCu);
        }

- (FBProcess)process
{
  return self->_queue_process;
}

- (RBSAssertion)processAssertion
{
  return self->_queue_processAssertion;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (FBProcessManager)processManager
{
  return self->_processManager;
}

- (id)assertionCreator
{
  return self->_assertionCreator;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BSCompoundAssertion)compoundAssertion
{
  return self->_compoundAssertion;
}

- (void).cxx_destruct
{
}

@end
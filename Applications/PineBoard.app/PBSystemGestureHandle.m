@interface PBSystemGestureHandle
+ (id)defaultLog;
- (BOOL)isActive;
- (BOOL)isValid;
- (BSInvalidatable)stateCaptureHandle;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)lastAcquiredReason;
- (PBSystemGestureHandle)initWithSystemGestureManager:(id)a3 recipe:(id)a4 actionHandler:(id)a5;
- (PBSystemGestureManager)gestureManager;
- (PBSystemGestureRecipe)recipe;
- (id)_stateDump;
- (id)actionHandler;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_invalidateWithReason:(id)a3;
- (int64_t)invalidateWithReason:(id)a3;
- (unint64_t)_atomic_load_state;
- (unint64_t)state;
- (void)_invokeWithActivationContext:(id)a3;
- (void)acquire;
- (void)acquireWithReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invokeActionHandlerWithCancellation;
- (void)invokeActionHandlerWithDeferringSourceRecipe:(id)a3;
- (void)invokeActionHandlerWithGestureRecognizer:(id)a3 descriptor:(id)a4;
- (void)relinquish;
@end

@implementation PBSystemGestureHandle

+ (id)defaultLog
{
  id v2 = sub_1000841D0();
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (PBSystemGestureHandle)initWithSystemGestureManager:(id)a3 recipe:(id)a4 actionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PBSystemGestureHandle;
  v12 = -[PBSystemGestureHandle init](&v30, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_gestureManager, a3);
    objc_storeStrong((id *)&v13->_recipe, a4);
    id v14 = [v11 copy];
    id actionHandler = v13->_actionHandler;
    v13->_id actionHandler = v14;

    id v16 = [(id)objc_opt_class(v13) defaultLog];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    log = v13->_log;
    v13->_log = (OS_os_log *)v17;

    objc_initWeak(&location, v13);
    v19 = &_dispatch_main_q;
    v20 = sub_10006BC6C((unint64_t)[v10 type]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PBSystemGestureHandle - %@",  v21));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000951AC;
    v27[3] = &unk_1003D04B8;
    objc_copyWeak(&v28, &location);
    uint64_t v23 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v22, v27);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    stateCaptureHandle = v13->_stateCaptureHandle;
    v13->_stateCaptureHandle = (BSInvalidatable *)v24;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)dealloc
{
  if (-[PBSystemGestureHandle _invalidateWithReason:](self, "_invalidateWithReason:", @"Deallocated") != -1)
  {
    if (self) {
      log = self->_log;
    }
    else {
      log = 0LL;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT)) {
      sub_100279800((uint64_t)self, log);
    }
  }

  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  stateCaptureHandle = self->_stateCaptureHandle;
  self->_stateCaptureHandle = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSystemGestureHandle;
  -[PBSystemGestureHandle dealloc](&v5, "dealloc");
}

- (BOOL)isValid
{
  return (id)-[PBSystemGestureHandle _atomic_load_state](self, "_atomic_load_state") != (id)2;
}

- (BOOL)isActive
{
  return (id)-[PBSystemGestureHandle _atomic_load_state](self, "_atomic_load_state") == (id)1;
}

- (void)acquire
{
}

- (void)acquireWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  p_state = &self->_state;
  while (1)
  {
    unint64_t v6 = __ldxr(p_state);
    if (v6) {
      break;
    }
    if (!__stxr(1uLL, p_state))
    {
      v7 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/handle/acquire",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v7, &v17);

      v8 = (NSString *)[v4 copy];
      lastAcquiredReason = self->_lastAcquiredReason;
      self->_lastAcquiredReason = v8;

      -[PBSystemGestureManager activateHandle:](self->_gestureManager, "activateHandle:", self);
      os_activity_scope_leave(&v17);
      goto LABEL_10;
    }
  }

  __clrex();
  if (v6 == 2)
  {
    if (self) {
      self = (PBSystemGestureHandle *)self->_log;
    }
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT)) {
      sub_100279874((os_log_s *)self, v10, v11, v12, v13, v14, v15, v16);
    }
  }

- (void)relinquish
{
  p_state = &self->_state;
  while (1)
  {
    unint64_t v4 = __ldxr(p_state);
    if (v4 != 1) {
      break;
    }
    if (!__stxr(0LL, p_state))
    {
      uint64_t v12 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/handle/relinquish",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v12, &v13);

      -[PBSystemGestureManager deactivateHandle:](self->_gestureManager, "deactivateHandle:", self);
      os_activity_scope_leave(&v13);
      return;
    }
  }

  __clrex();
  if (v4 == 2)
  {
    if (self) {
      self = (PBSystemGestureHandle *)self->_log;
    }
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT)) {
      sub_100279874((os_log_s *)self, v5, v6, v7, v8, v9, v10, v11);
    }
  }

- (int64_t)invalidateWithReason:(id)a3
{
  return -[PBSystemGestureHandle _invalidateWithReason:](self, "_invalidateWithReason:", a3);
}

- (void)invokeActionHandlerWithGestureRecognizer:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/handle/invoke",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000955C0;
  v11[3] = &unk_1003D44D8;
  id v9 = v6;
  id v12 = v9;
  os_activity_scope_state_s v13 = self;
  id v10 = v7;
  id v14 = v10;
  -[PBSystemGestureHandle _invokeWithActivationContext:](self, "_invokeWithActivationContext:", v11);

  os_activity_scope_leave(&state);
}

- (void)invokeActionHandlerWithDeferringSourceRecipe:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/handle/invoke",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000957F4;
  v7[3] = &unk_1003D4500;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[PBSystemGestureHandle _invokeWithActivationContext:](self, "_invokeWithActivationContext:", v7);

  os_activity_scope_leave(&state);
}

- (void)invokeActionHandlerWithCancellation
{
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/handle/cancel",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000959A0;
  v4[3] = &unk_1003D4528;
  v4[4] = self;
  -[PBSystemGestureHandle _invokeWithActivationContext:](self, "_invokeWithActivationContext:", v4);
  os_activity_scope_leave(&state);
}

- (void)_invokeWithActivationContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_actionHandler)
  {
    uint64_t v6 = (*((uint64_t (**)(id))v4 + 2))(v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(void))self->_actionHandler + 2))();
    [v7 invalidate];
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Action handler is missing {handle=%{public}@}",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (int64_t)_invalidateWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isEqual:@"Deallocated"];
  unsigned int v6 = v5;
  p_os_activity_scope_state_s state = &self->_state;
  do
    unint64_t v8 = __ldxr(p_state);
  while (__stxr(2uLL, p_state));
  if (v8 == 2)
  {
    if (v5)
    {
      if (self) {
        log = self->_log;
      }
      else {
        log = 0LL;
      }
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
        sub_1002798A8((uint64_t)self, log);
      }
    }

    else
    {
      if (self) {
        v18 = self->_log;
      }
      else {
        v18 = 0LL;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LODWORD(state.opaque[0]) = 138543362;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)self;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Already been invalidated {handle=%{public}@}",  (uint8_t *)&state,  0xCu);
      }
    }

    int64_t v17 = -1LL;
  }

  else
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "gestures/handle/invalidate",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &state);

    uint64_t v11 = self->_gestureManager;
    gestureManager = self->_gestureManager;
    self->_gestureManager = 0LL;

    if (v6) {
      os_activity_scope_state_s v13 = 0LL;
    }
    else {
      os_activity_scope_state_s v13 = self;
    }
    id v14 = v13;
    uint64_t v15 = self->_recipe;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100095D68;
    v20[3] = &unk_1003D1998;
    uint64_t v16 = v11;
    v21 = v16;
    v22 = v14;
    uint64_t v23 = v15;
    id v24 = v4;
    BSDispatchMain(v20);

    os_activity_scope_leave(&state);
    int64_t v17 = 0LL;
  }

  return v17;
}

- (id)_stateDump
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  id v4 = [v3 appendObject:self->_recipe withName:0];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v5;
}

- (unint64_t)_atomic_load_state
{
  return self->_state;
}

- (void)invalidate
{
}

- (id)succinctDescription
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = sub_10006BC6C(-[PBSystemGestureRecipe type](self->_recipe, "type"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:0];

  id v6 = sub_100095F14(-[PBSystemGestureHandle _atomic_load_state](self, "_atomic_load_state"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 appendString:v7 withName:@"state"];

  id v8 = [v3 appendPointer:self->_gestureManager withName:@"manager"];
  id v9 =  [v3 appendObject:self->_lastAcquiredReason withName:@"lastAcquiredReason" skipIfNil:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureHandle descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v5 setActiveMultilinePrefix:v4];

  id v6 = sub_100095F14(-[PBSystemGestureHandle _atomic_load_state](self, "_atomic_load_state"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 appendString:v7 withName:0];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  self->_recipe));
  [v5 appendString:v8 withName:0];

  id v9 = [v5 appendObject:self->_gestureManager withName:0];
  return v5;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBSystemGestureHandle succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBSystemGestureHandle descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (PBSystemGestureRecipe)recipe
{
  return self->_recipe;
}

- (unint64_t)state
{
  return atomic_load(&self->_state);
}

- (PBSystemGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (NSString)lastAcquiredReason
{
  return self->_lastAcquiredReason;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void).cxx_destruct
{
}

@end
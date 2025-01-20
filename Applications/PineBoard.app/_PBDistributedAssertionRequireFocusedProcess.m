@interface _PBDistributedAssertionRequireFocusedProcess
- (BOOL)_lock_isActive;
- (BOOL)isActive;
- (PBSceneManager)sceneManager;
- (_PBDistributedAssertionRequireFocusedProcess)initWithParentAssertion:(id)a3 sceneManager:(id)a4 processStateInfoProvider:(id)a5;
- (id)context;
- (id)orderedContext;
- (id)orderedReasons;
- (id)processStateInfoProvider;
- (id)reasons;
- (id)requireFocusedProcess;
- (id)stateDumpBuilder;
- (int)focusedProcessIdentifier;
- (void)_lock_setIsActiveNeedsUpdate;
- (void)_lock_updateIsActiveIfNeeded;
- (void)_lock_updateOrderedContext;
- (void)dealloc;
- (void)distributedAssertion:(id)a3 didChangeState:(id)a4;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
@end

@implementation _PBDistributedAssertionRequireFocusedProcess

- (_PBDistributedAssertionRequireFocusedProcess)initWithParentAssertion:(id)a3 sceneManager:(id)a4 processStateInfoProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  Class v12 = NSClassFromString(@"PBSceneManager");
  if (!v11)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273698();
    }
LABEL_15:
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x10003BA38LL);
  }

  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSceneManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273698();
    }
    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x10003BA9CLL);
  }

  if (!v10)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"processStateInfoProvider != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273748();
    }
    goto LABEL_15;
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS____PBDistributedAssertionRequireFocusedProcess;
  v13 = -[PBDistributedAssertion initWithParentAssertion:](&v24, "initWithParentAssertion:", v8);
  v14 = v13;
  if (v13)
  {
    v13->_lock_isActiveNeedsUpdate = 1;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet"));
    lock_orderedContext = v14->_lock_orderedContext;
    v14->_lock_orderedContext = (NSOrderedSet *)v15;

    objc_storeStrong((id *)&v14->_sceneManager, a4);
    -[PBSceneManager addObserver:](v14->_sceneManager, "addObserver:", v14);
    id v17 = [v10 copy];
    id processStateInfoProvider = v14->_processStateInfoProvider;
    v14->_id processStateInfoProvider = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneManager focusedSceneHandle](v14->_sceneManager, "focusedSceneHandle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sceneIfExists]);
    v14->_lock_focusedProcessIdentifier = sub_10003BB04(v20);
  }

  return v14;
}

- (void)dealloc
{
  id processStateInfoProvider = self->_processStateInfoProvider;
  self->_id processStateInfoProvider = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PBDistributedAssertionRequireFocusedProcess;
  -[PBDistributedAssertion dealloc](&v4, "dealloc");
}

- (void)distributedAssertion:(id)a3 didChangeState:(id)a4
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  -[_PBDistributedAssertionRequireFocusedProcess _lock_setIsActiveNeedsUpdate](self, "_lock_setIsActiveNeedsUpdate");
  -[_PBDistributedAssertionRequireFocusedProcess _lock_updateOrderedContext](self, "_lock_updateOrderedContext");
  -[_PBDistributedAssertionRequireFocusedProcess _lock_updateIsActiveIfNeeded](self, "_lock_updateIsActiveIfNeeded");
  os_unfair_lock_unlock(p_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDistributedAssertion delegate](self, "delegate"));
  v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10003BCA0;
    v8[3] = &unk_1003CFEB8;
    id v9 = v6;
    id v10 = self;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
  int v6 = sub_10003BB04(a5);
  os_unfair_lock_lock(&self->super._lock);
  self->_lock_focusedProcessIdentifier = v6;
  -[_PBDistributedAssertionRequireFocusedProcess _lock_setIsActiveNeedsUpdate](self, "_lock_setIsActiveNeedsUpdate");
  os_unfair_lock_unlock(&self->super._lock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDistributedAssertion delegate](self, "delegate"));
  [v7 distributedAssertion:self didChangeState:self];
}

- (BOOL)isActive
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = -[_PBDistributedAssertionRequireFocusedProcess _lock_isActive](v2, "_lock_isActive");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)context
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_PBDistributedAssertionRequireFocusedProcess orderedContext](self, "orderedContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 set]);

  return v3;
}

- (id)orderedContext
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_super v4 = self->_lock_orderedContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)reasons
{
  objc_super v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s isn't available on this class: %@",  "-[_PBDistributedAssertionRequireFocusedProcess reasons]",  objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (objc_class *)objc_opt_class(self);
    id v9 = NSStringFromClass(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138544642;
    v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    id v17 = self;
    __int16 v18 = 2114;
    v19 = @"PBDistributedAssertion.m";
    __int16 v20 = 1024;
    int v21 = 524;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
  }

  id result = (id) _bs_set_crash_log_message([v5 UTF8String]);
  __break(0);
  return result;
}

- (id)orderedReasons
{
  objc_super v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s isn't available on this class: %@",  "-[_PBDistributedAssertionRequireFocusedProcess orderedReasons]",  objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (objc_class *)objc_opt_class(self);
    id v9 = NSStringFromClass(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138544642;
    v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    id v17 = self;
    __int16 v18 = 2114;
    v19 = @"PBDistributedAssertion.m";
    __int16 v20 = 1024;
    int v21 = 530;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
  }

  id result = (id) _bs_set_crash_log_message([v5 UTF8String]);
  __break(0);
  return result;
}

- (id)requireFocusedProcess
{
  objc_super v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s isn't available on this class: %@",  "-[_PBDistributedAssertionRequireFocusedProcess requireFocusedProcess]",  objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (objc_class *)objc_opt_class(self);
    id v9 = NSStringFromClass(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138544642;
    v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    id v17 = self;
    __int16 v18 = 2114;
    v19 = @"PBDistributedAssertion.m";
    __int16 v20 = 1024;
    int v21 = 536;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
  }

  id result = (id) _bs_set_crash_log_message([v5 UTF8String]);
  __break(0);
  return result;
}

- (id)stateDumpBuilder
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  uint64_t lock_focusedProcessIdentifier = self->_lock_focusedProcessIdentifier;
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PBDistributedAssertionRequireFocusedProcess;
  id v5 = -[PBDistributedAssertion stateDumpBuilder](&v9, "stateDumpBuilder");
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 appendInteger:lock_focusedProcessIdentifier withKey:@"focusedProcessIdentifier"];
  return v6;
}

- (BOOL)_lock_isActive
{
  return self->_lock_active;
}

- (void)_lock_setIsActiveNeedsUpdate
{
  self->_lock_isActiveNeedsUpdate = 1;
}

- (void)_lock_updateIsActiveIfNeeded
{
  if (self->_lock_isActiveNeedsUpdate)
  {
    self->_lock_isActiveNeedsUpdate = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._parentAssertion);
    unsigned int v4 = [WeakRetained isActive];

    if (v4)
    {
      int lock_focusedProcessIdentifier = self->_lock_focusedProcessIdentifier;
      lock_orderedContext = self->_lock_orderedContext;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10003C2F8;
      v7[3] = &unk_1003D19B8;
      int v8 = lock_focusedProcessIdentifier;
      self->_lock_active = -[NSOrderedSet bs_containsObjectPassingTest:]( lock_orderedContext,  "bs_containsObjectPassingTest:",  v7);
    }

    else
    {
      self->_lock_active = 0;
    }
  }

- (void)_lock_updateOrderedContext
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._parentAssertion);
  }
  else {
    id WeakRetained = 0LL;
  }
  id v4 = objc_retainBlock(self->_processStateInfoProvider);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained orderedContext]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003C43C;
  v9[3] = &unk_1003D19E0;
  id v10 = v4;
  id v6 = v4;
  id v7 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_compactMap:", v9));
  lock_orderedContext = self->_lock_orderedContext;
  self->_lock_orderedContext = v7;
}

- (int)focusedProcessIdentifier
{
  return self->_lock_focusedProcessIdentifier;
}

- (PBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (id)processStateInfoProvider
{
  return self->_processStateInfoProvider;
}

- (void).cxx_destruct
{
}

@end
@interface PBApplicationProcessStateMonitor
- (NSSet)bundleIdentifiers;
- (PBApplicationProcessStateMonitor)init;
- (PBApplicationProcessStateMonitor)initWithProcessMonitor:(id)a3 processStateProvider:(id)a4;
- (PBApplicationProcessStateMonitorDelegate)delegate;
- (RBSProcessMonitor)processMonitor;
- (id)_infoForProcessWithIdentifier:(id)a3 handle:(id)a4 state:(id)a5;
- (id)applicationStateForBundleIdentifier:(id)a3;
- (id)processStateProvider;
- (void)_process:(id)a3 stateDidUpdate:(id)a4;
- (void)_reconfigureProcessMonitorPredicates;
- (void)addBundleIdentifier:(id)a3;
- (void)invalidate;
- (void)removeBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PBApplicationProcessStateMonitor

- (PBApplicationProcessStateMonitor)initWithProcessMonitor:(id)a3 processStateProvider:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  Class v11 = NSClassFromString(@"RBSProcessMonitor");
  if (!v10)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028FBB0(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D1B64LL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:RBSProcessMonitorClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028FC58(a2);
    }
    goto LABEL_11;
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBApplicationProcessStateMonitor;
  v12 = -[PBApplicationProcessStateMonitor init](&v24, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_processMonitor, a3);
    id v14 = objc_retainBlock(v9);
    id processStateProvider = v13->_processStateProvider;
    v13->_id processStateProvider = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    bundleIdentifiers = v13->_bundleIdentifiers;
    v13->_bundleIdentifiers = (NSSet *)v16;

    objc_initWeak(&location, v13);
    processMonitor = v13->_processMonitor;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001D1BE8;
    v21[3] = &unk_1003D31E0;
    objc_copyWeak(&v22, &location);
    -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (PBApplicationProcessStateMonitor)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitor](&OBJC_CLASS___RBSProcessMonitor, "monitor"));
  v4 = -[PBApplicationProcessStateMonitor initWithProcessMonitor:processStateProvider:]( self,  "initWithProcessMonitor:processStateProvider:",  v3,  &stru_1003DBFD8);

  return v4;
}

- (id)applicationStateForBundleIdentifier:(id)a3
{
  id processStateProvider = self->_processStateProvider;
  id v12 = 0LL;
  v5 = (uint64_t (*)(void *, id, id *))processStateProvider[2];
  id v6 = a3;
  uint64_t v7 = v5(processStateProvider, v6, &v12);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v12;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBApplicationProcessStateMonitor _infoForProcessWithIdentifier:handle:state:]( self,  "_infoForProcessWithIdentifier:handle:state:",  v6,  v9,  v8));

  return v10;
}

- (void)addBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (!-[NSSet containsObject:](self->_bundleIdentifiers, "containsObject:", v4))
  {
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObject:](self->_bundleIdentifiers, "setByAddingObject:", v4));
    bundleIdentifiers = self->_bundleIdentifiers;
    self->_bundleIdentifiers = v5;

    -[PBApplicationProcessStateMonitor _reconfigureProcessMonitorPredicates]( self,  "_reconfigureProcessMonitorPredicates");
  }
}

- (void)removeBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (-[NSSet containsObject:](self->_bundleIdentifiers, "containsObject:", v4))
  {
    v5 = (NSSet *)-[NSSet mutableCopy](self->_bundleIdentifiers, "mutableCopy");
    -[NSSet removeObject:](v5, "removeObject:", v4);
    bundleIdentifiers = self->_bundleIdentifiers;
    self->_bundleIdentifiers = v5;

    -[PBApplicationProcessStateMonitor _reconfigureProcessMonitorPredicates]( self,  "_reconfigureProcessMonitorPredicates");
  }
}

- (void)invalidate
{
}

- (id)_infoForProcessWithIdentifier:(id)a3 handle:(id)a4 state:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[PBApplicationProcessStateInfo initWithBundleIdentifier:processHandle:processState:]( objc_alloc(&OBJC_CLASS___PBApplicationProcessStateInfo),  "initWithBundleIdentifier:processHandle:processState:",  v9,  v8,  v7);

  return v10;
}

- (void)_process:(id)a3 stateDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 embeddedApplicationIdentifier]);
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcServiceIdentifier]);
    v13 = v12;
    if (v12)
    {
      id v11 = v12;
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bundle]);
      id v11 = (id)objc_claimAutoreleasedReturnValue([v14 identifier]);
    }
  }

  if (v6 && v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[PBApplicationProcessStateMonitor _infoForProcessWithIdentifier:handle:state:]( self,  "_infoForProcessWithIdentifier:handle:state:",  v11,  v6,  v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationProcessStateMonitor delegate](self, "delegate"));
    [v17 applicationProcessStateMonitor:self updatedProcessState:v16];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10028FD00();
  }
}

- (void)_reconfigureProcessMonitorPredicates
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifiers:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifiers:",  self->_bundleIdentifiers));
  id v9 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  processMonitor = self->_processMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D2284;
  v7[3] = &unk_1003D3270;
  id v8 = v4;
  id v6 = v4;
  -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v7);
}

- (PBApplicationProcessStateMonitorDelegate)delegate
{
  return (PBApplicationProcessStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (id)processStateProvider
{
  return self->_processStateProvider;
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void).cxx_destruct
{
}

  ;
}

@end
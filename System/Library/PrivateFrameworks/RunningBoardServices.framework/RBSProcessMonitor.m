@interface RBSProcessMonitor
+ (id)_monitorWithService:(id)a3;
+ (id)_monitorWithService:(id)a3 configuration:(id)a4;
+ (id)monitor;
+ (id)monitorWithConfiguration:(id)a3;
+ (id)monitorWithPredicate:(id)a3 updateHandler:(id)a4;
- (NSSet)states;
- (OS_dispatch_queue)calloutQueue;
- (RBSProcessMonitor)init;
- (RBSProcessMonitorConfiguration)configuration;
- (id)_initWithService:(id *)a1;
- (id)description;
- (id)stateForIdentity:(id)a3;
- (unint64_t)events;
- (unsigned)serviceClass;
- (void)_handleExitEvent:(id)a3;
- (void)_handlePreventLaunchUpdate:(id)a3;
- (void)_handleProcessStateChange:(id)a3;
- (void)_reconnect;
- (void)dealloc;
- (void)invalidate;
- (void)setEvents:(unint64_t)a3;
- (void)setPredicates:(id)a3;
- (void)setPreventLaunchUpdateHandle:(id)a3;
- (void)setServiceClass:(unsigned int)a3;
- (void)setStateDescriptor:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)updateConfiguration:(id)a3;
@end

@implementation RBSProcessMonitor

+ (id)monitor
{
  return objc_alloc_init((Class)a1);
}

+ (id)_monitorWithService:(id)a3
{
  id v4 = a3;
  v5 = -[RBSProcessMonitor _initWithService:]((id *)objc_alloc((Class)a1), v4);

  return v5;
}

- (id)_initWithService:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_CLASS___RBSProcessMonitor;
    v5 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v5;
    if (v5)
    {
      *((_BYTE *)v5 + 24) = 1;
      objc_storeStrong(v5 + 2, a2);
      *((_DWORD *)a1 + 2) = 0;
      v6 = objc_alloc_init(&OBJC_CLASS___RBSProcessMonitorConfiguration);
      id v7 = a1[4];
      a1[4] = v6;

      id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
      id v9 = a1[5];
      a1[5] = v8;

      dispatch_queue_t v10 = +[RBSWorkloop createCalloutQueue:]( (uint64_t)&OBJC_CLASS___RBSWorkloop,  @"RBSProcessMonitorCalloutQueue");
      id v11 = a1[6];
      a1[6] = v10;
    }
  }

  return a1;
}

+ (id)monitorWithPredicate:(id)a3 updateHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, a1, @"RBSProcessMonitor.m", 55, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1896077D8] currentHandler];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInMethod:a2, a1, @"RBSProcessMonitor.m", 56, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __56__RBSProcessMonitor_monitorWithPredicate_updateHandler___block_invoke;
  v16[3] = &unk_189DE0270;
  id v17 = v7;
  id v18 = v9;
  id v10 = v9;
  id v11 = v7;
  [a1 monitorWithConfiguration:v16];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __56__RBSProcessMonitor_monitorWithPredicate_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v7 = *(void *)(a1 + 32);
  v3 = (void *)MEMORY[0x189603F18];
  id v4 = a2;
  [v3 arrayWithObjects:&v7 count:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v5, v7, v8);

  [v4 setUpdateHandler:*(void *)(a1 + 40)];
  v6 = +[RBSProcessStateDescriptor descriptor](&OBJC_CLASS___RBSProcessStateDescriptor, "descriptor");
  [v4 setStateDescriptor:v6];
}

+ (id)monitorWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  [a1 _monitorWithService:v5 configuration:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_monitorWithService:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[RBSProcessMonitor _initWithService:]((id *)objc_alloc((Class)a1), v7);

  [v8 updateConfiguration:v6];
  return v8;
}

- (RBSProcessMonitor)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (RBSProcessMonitor *)-[RBSProcessMonitor _initWithService:]((id *)&self->super.isa, v3);

  return v4;
}

- (void)dealloc
{
}

- (id)stateForIdentity:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stateByIdentity, "objectForKeyedSubscript:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSSet)states
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)MEMORY[0x189603FE0];
  -[NSMutableDictionary allValues](self->_stateByIdentity, "allValues");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setWithArray:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v6;
}

- (void)updateConfiguration:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v5 = (void (**)(id, RBSProcessMonitor *))a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 handleFailureInMethod:a2, self, @"RBSProcessMonitor.m", 119, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    self->_configuring = 1;
    v5[2](v5, self);
    self->_configuring = 0;
    id v7 = (void *)-[RBSProcessMonitorConfiguration copy](self->_configuration, "copy");
    os_unfair_lock_unlock(&self->_lock);
    if (v7)
    {
      service = self->_service;
      id v36 = 0LL;
      int v9 = -[RBSServiceLocalProtocol subscribeProcessStateMonitor:configuration:error:]( service,  "subscribeProcessStateMonitor:configuration:error:",  self,  v7,  &v36);
      id v10 = v36;
      id v11 = v10;
      if (v9)
      {
        id v30 = v10;
        v31 = v5;
        os_unfair_lock_lock(&self->_lock);
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        v12 = -[NSMutableDictionary allValues](self->_stateByIdentity, "allValues");
        uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v33;
          do
          {
            for (uint64_t i = 0LL; i != v14; ++i)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              -[RBSProcessMonitorConfiguration stateDescriptor](self->_configuration, "stateDescriptor");
              id v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 filterState:v17];

              if (([v17 isEmptyState] & 1) == 0)
              {
                [v17 process];
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                char v20 = [v7 matchesProcess:v19];

                if ((v20 & 1) != 0) {
                  continue;
                }
              }

              stateByIdentity = self->_stateByIdentity;
              [v17 process];
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              [v22 identity];
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:]( stateByIdentity,  "setObject:forKeyedSubscript:",  0LL,  v23);
            }

            uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }

          while (v14);
        }

        os_unfair_lock_unlock(&self->_lock);
        rbs_monitor_log();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[RBSProcessMonitor updateConfiguration:].cold.1();
        }

        id v11 = v30;
        id v5 = v31;
      }

      else
      {
        int v26 = objc_msgSend(v10, "rbs_isPermanentFailure");
        rbs_monitor_log();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (v26)
        {
          if (v28) {
            -[RBSProcessMonitor updateConfiguration:].cold.2();
          }

          -[RBSProcessMonitor invalidate](self, "invalidate");
        }

        else
        {
          if (v28) {
            -[RBSProcessMonitor updateConfiguration:].cold.3();
          }
        }
      }
    }
  }

  else
  {
    v25 = objc_alloc_init(&OBJC_CLASS___RBSProcessMonitorConfiguration);
    v5[2](v5, (RBSProcessMonitor *)v25);

    os_unfair_lock_unlock(p_lock);
  }
}

- (id)description
{
  return -[RBSProcessMonitorConfiguration description](self->_configuration, "description");
}

- (void)invalidate
{
}

- (RBSProcessMonitorConfiguration)configuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid) {
    uint64_t v4 = (void *)-[RBSProcessMonitorConfiguration copy](self->_configuration, "copy");
  }
  else {
    uint64_t v4 = 0LL;
  }
  os_unfair_lock_unlock(p_lock);
  return (RBSProcessMonitorConfiguration *)v4;
}

- (unsigned)serviceClass
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid) {
    unsigned int v4 = -[RBSProcessMonitorConfiguration serviceClass](self->_configuration, "serviceClass");
  }
  else {
    unsigned int v4 = 17;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)events
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid) {
    unint64_t v4 = -[RBSProcessMonitorConfiguration events](self->_configuration, "events");
  }
  else {
    unint64_t v4 = 0LL;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPredicates:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:208 description:@"must only call during configuration"];
  }

  -[RBSProcessMonitorConfiguration setPredicates:](self->_configuration, "setPredicates:", v6);
}

- (void)setStateDescriptor:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:213 description:@"must only call during configuration"];
  }

  -[RBSProcessMonitorConfiguration setStateDescriptor:](self->_configuration, "setStateDescriptor:", v6);
}

- (void)setServiceClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:218 description:@"must only call during configuration"];
  }

  -[RBSProcessMonitorConfiguration setServiceClass:](self->_configuration, "setServiceClass:", v3);
}

- (void)setEvents:(unint64_t)a3
{
  if (!self->_configuring)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:223 description:@"must only call during configuration"];
  }

  -[RBSProcessMonitorConfiguration setEvents:](self->_configuration, "setEvents:", a3);
}

- (void)setUpdateHandler:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:228 description:@"must only call during configuration"];
  }

  -[RBSProcessMonitorConfiguration setUpdateHandler:](self->_configuration, "setUpdateHandler:", v6);
}

- (void)setPreventLaunchUpdateHandle:(id)a3
{
  newValue = (char *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:233 description:@"must only call during configuration"];
  }

  -[RBSProcessMonitorConfiguration setPreventLaunchUpdateHandler:](self->_configuration, newValue);
}

- (void)_reconnect
{
  if (a1) {
    return (void *)[a1 updateConfiguration:&__block_literal_global];
  }
  return a1;
}

- (void)_handleProcessStateChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[RBSProcessMonitorConfiguration stateDescriptor](self->_configuration, "stateDescriptor");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !self->_valid)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_28;
  }

  [v4 process];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = self->_configuration;
  [v6 identity];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RBSProcessMonitorConfiguration matchesProcess:](v7, "matchesProcess:", v6))
  {
    int v9 = (void *)[v4 copy];
    -[RBSProcessMonitorConfiguration stateDescriptor](v7, "stateDescriptor");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 filterState:v9];

    -[NSMutableDictionary objectForKey:](self->_stateByIdentity, "objectForKey:", v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = v11;
    if (v11)
    {
      if ([v11 isEqual:v9])
      {
LABEL_13:
        rbs_monitor_log();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          [v4 process];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v16;
          _os_log_impl(&dword_185F67000, v15, OS_LOG_TYPE_INFO, "Update skipped for %{public}@", buf, 0xCu);
        }

        v12 = 0LL;
        uint64_t v13 = 0LL;
        goto LABEL_16;
      }
    }

    else if (([v4 isRunning] & 1) == 0 {
           && ([v4 taskState] || (objc_msgSend(v4, "isEmptyState") & 1) != 0))
    }
    {
      goto LABEL_13;
    }

    -[RBSProcessMonitorConfiguration updateHandler](v7, "updateHandler");
    v12 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v14 = (void *)[v9 copy];
    +[RBSProcessStateUpdate updateWithState:previousState:exitEvent:]( &OBJC_CLASS___RBSProcessStateUpdate,  "updateWithState:previousState:exitEvent:",  v14,  v20,  0LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    if (([v4 isRunning] & 1) == 0
      && ([v4 taskState] || (objc_msgSend(v4, "isEmptyState") & 1) != 0))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_stateByIdentity, "removeObjectForKey:", v8);
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:](self->_stateByIdentity, "setObject:forKey:", v9, v8);
    }

    goto LABEL_22;
  }

  -[NSMutableDictionary removeObjectForKey:](self->_stateByIdentity, "removeObjectForKey:", v8);
  v12 = 0LL;
  uint64_t v13 = 0LL;
LABEL_22:
  os_unfair_lock_unlock(&self->_lock);
  if (v13 && v12)
  {
    ((void (**)(void, RBSProcessMonitor *, void *, void *))v12)[2](v12, self, v6, v13);
    rbs_monitor_log();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      [v4 process];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v19 = [v4 taskState];
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      __int16 v23 = 1024;
      int v24 = v19;
      _os_log_impl( &dword_185F67000,  v17,  OS_LOG_TYPE_INFO,  "Update delivered for %{public}@ with taskState %d",  buf,  0x12u);
    }
  }

LABEL_28:
}

- (void)_handleExitEvent:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    [v4 process];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_configuration;
    if ((-[RBSProcessMonitorConfiguration events](v6, "events") & 1) != 0
      && -[RBSProcessMonitorConfiguration matchesProcess:](v6, "matchesProcess:", v5))
    {
      -[RBSProcessMonitorConfiguration updateHandler](v6, "updateHandler");
      id v7 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      +[RBSProcessStateUpdate updateWithState:previousState:exitEvent:]( &OBJC_CLASS___RBSProcessStateUpdate,  "updateWithState:previousState:exitEvent:",  0LL,  0LL,  v4);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v7 = 0LL;
      uint64_t v8 = 0LL;
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v8 && v7) {
      ((void (**)(void, RBSProcessMonitor *, void *, os_log_s *))v7)[2](v7, self, v5, v8);
    }
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
    rbs_monitor_log();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessMonitor _handleExitEvent:].cold.1();
    }
  }
}

- (void)_handlePreventLaunchUpdate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    uint64_t v5 = self->_configuration;
    if ((-[RBSProcessMonitorConfiguration events](v5, "events") & 2) != 0)
    {
      -[RBSProcessMonitorConfiguration preventLaunchUpdateHandler]((os_unfair_lock_s *)v5);
      id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      if (v6)
      {
        ((void (**)(void, RBSProcessMonitor *, id))v6)[2](v6, self, v4);
      }
    }

    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
    rbs_monitor_log();
    uint64_t v5 = (RBSProcessMonitorConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessMonitor _handlePreventLaunchUpdate:].cold.1();
    }
  }
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)updateConfiguration:.cold.1()
{
}

- (void)updateConfiguration:.cold.2()
{
}

- (void)updateConfiguration:.cold.3()
{
}

- (void)_handleExitEvent:.cold.1()
{
}

- (void)_handlePreventLaunchUpdate:.cold.1()
{
}

@end
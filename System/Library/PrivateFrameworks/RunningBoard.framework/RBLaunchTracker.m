@interface RBLaunchTracker
- (RBLaunchTracker)initWithTimeProvider:(id)a3;
- (double)nextAllowedLaunchOfIdentity:(id)a3;
- (void)trackLaunchOfIdentity:(id)a3;
@end

@implementation RBLaunchTracker

- (RBLaunchTracker)initWithTimeProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RBLaunchTracker;
  v6 = -[RBLaunchTracker init](&v13, sel_init);
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x189603FC8] dictionary];
    lastLaunch = v6->_lastLaunch;
    v6->_lastLaunch = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x189603FC8] dictionary];
    launchBeforeLast = v6->_launchBeforeLast;
    v6->_launchBeforeLast = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v6->_timeProvider, a3);
    v11 = v6;
  }

  return v6;
}

- (void)trackLaunchOfIdentity:(id)a3
{
  id v4 = a3;
  if ([v4 isMultiInstanceExtension]) {
    goto LABEL_15;
  }
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  double v6 = v5;
  -[NSMutableDictionary objectForKey:](self->_lastLaunch, "objectForKey:", v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = -[NSMutableDictionary objectForKey:](self->_launchBeforeLast, "objectForKey:", v4);
  uint64_t v9 = (void *)v8;
  if (v7)
  {
    [v7 doubleValue];
    BOOL v11 = v6 - v10 < 10.0;
    if (!v9) {
      goto LABEL_10;
    }
LABEL_6:
    [v9 doubleValue];
    if (v6 - v12 < 10.0)
    {
      rbs_general_log();
      objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchTracker trackLaunchOfIdentity:].cold.1(v13);
      }
    }

    goto LABEL_10;
  }

  BOOL v11 = 0;
  if (v8) {
    goto LABEL_6;
  }
LABEL_10:
  lastLaunch = self->_lastLaunch;
  [MEMORY[0x189607968] numberWithDouble:v6];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](lastLaunch, "setObject:forKey:", v15, v4);

  if (v11)
  {
    -[NSMutableDictionary setObject:forKey:](self->_launchBeforeLast, "setObject:forKey:", v7, v4);
  }

  else if (v9)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_launchBeforeLast, "removeObjectForKey:", v4);
  }

LABEL_15:
}

- (double)nextAllowedLaunchOfIdentity:(id)a3
{
  timeProvider = self->_timeProvider;
  id v5 = a3;
  -[RBTimeProviding currentTime](timeProvider, "currentTime");
  double v7 = v6;
  -[NSMutableDictionary objectForKey:](self->_launchBeforeLast, "objectForKey:", v5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  double v9 = 0.0;
  if (v8)
  {
    [v8 doubleValue];
    if (v7 - v10 < 10.0)
    {
      [v8 doubleValue];
      double v9 = v11 + 10.0;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (void)trackLaunchOfIdentity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl( &dword_188634000,  log,  OS_LOG_TYPE_FAULT,  "tracking a launch of an identity that shouldn't have been allowed",  v1,  2u);
}

@end
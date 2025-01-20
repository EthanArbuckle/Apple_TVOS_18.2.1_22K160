@interface RPApplicationStateMonitor
- (BKSApplicationStateMonitor)applicationStateMonitor;
- (BOOL)isApplicationInForegroundWithBundleIdentifier:(id)a3;
- (NSMutableDictionary)observers;
- (NSMutableDictionary)previousState;
- (RPApplicationStateMonitor)init;
- (RPSystemStateObserver)systemObserver;
- (int64_t)observersCount;
- (void)addObserver:(id)a3 processIdentifier:(int)a4;
- (void)addSystemObserver:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)handleApplicationStateChange:(id)a3;
- (void)notifyInAppSessionShouldPauseOrResume:(id)a3;
- (void)observersCountDidChange;
- (void)removeObserverWithProcessIdentifier:(int)a3;
- (void)removeSystemObserver;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreviousState:(id)a3;
- (void)setSystemObserver:(id)a3;
@end

@implementation RPApplicationStateMonitor

- (RPApplicationStateMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RPApplicationStateMonitor;
  v2 = -[RPApplicationStateMonitor init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
    -[RPApplicationStateMonitor setApplicationStateMonitor:](v2, "setApplicationStateMonitor:", v3);

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[RPApplicationStateMonitor setObservers:](v2, "setObservers:", v4);

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[RPApplicationStateMonitor setPreviousState:](v2, "setPreviousState:", v5);

    -[RPApplicationStateMonitor setSystemObserver:](v2, "setSystemObserver:", 0LL);
  }

  return v2;
}

- (void)addObserver:(id)a3 processIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  [v7 setObject:v6 forKey:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor"));
  id v17 = (id)objc_claimAutoreleasedReturnValue([v9 applicationInfoForPID:v4]);

  uint64_t v10 = BKSApplicationStateKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:BKSApplicationStateKey]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  [v12 setObject:v11 forKeyedSubscript:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
  NSLog( @"%s processIdentifier %i userInfo %@ previousState %@",  "-[RPApplicationStateMonitor addObserver:processIdentifier:]",  v4,  v17,  v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v10]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
  NSLog( @"%s processIdentifier %i BKSApplicationStateKey %@ previousState %@",  "-[RPApplicationStateMonitor addObserver:processIdentifier:]",  v4,  v15,  v16);

  -[RPApplicationStateMonitor observersCountDidChange](self, "observersCountDidChange");
}

- (void)removeObserverWithProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  [v5 removeObjectForKey:v6];

  -[RPApplicationStateMonitor observersCountDidChange](self, "observersCountDidChange");
}

- (void)addSystemObserver:(id)a3
{
}

- (void)removeSystemObserver
{
}

- (int64_t)observersCount
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  id v4 = [v3 count];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor systemObserver](self, "systemObserver"));
  if (v5) {
    int64_t v6 = (int64_t)v4 + 1;
  }
  else {
    int64_t v6 = (int64_t)v4;
  }

  return v6;
}

- (void)observersCountDidChange
{
  if (-[RPApplicationStateMonitor observersCount](self, "observersCount") >= 1)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handler]);

    if (!v4)
    {
      objc_initWeak(&location, self);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor"));
      uint64_t v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472LL;
      v12 = sub_100016EF4;
      v13 = &unk_100071358;
      objc_copyWeak(&v14, &location);
      [v5 setHandler:&v10];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[RPApplicationStateMonitor applicationStateMonitor]( self,  "applicationStateMonitor",  v10,  v11,  v12,  v13));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 handler]);
  if (v7)
  {
    v8 = (void *)v7;
    int64_t v9 = -[RPApplicationStateMonitor observersCount](self, "observersCount");

    if (v9) {
      return;
    }
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor"));
    [v6 setHandler:0];
  }
}

- (void)applicationStateDidChange:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
  NSLog( @"%s userInfo %@ previousState %@",  "-[RPApplicationStateMonitor applicationStateDidChange:]",  v8,  v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor systemObserver](self, "systemObserver"));
  if (v5) {
    -[RPApplicationStateMonitor handleApplicationStateChange:](self, "handleApplicationStateChange:", v8);
  }
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  id v7 = [v6 count];

  if (v7) {
    -[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]( self,  "notifyInAppSessionShouldPauseOrResume:",  v8);
  }
}

- (void)handleApplicationStateChange:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:BKSApplicationStateAppIsFrontmostKey]);
  unsigned int v5 = [v4 BOOLValue];

  int64_t v6 = v10;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:BKSApplicationStateDisplayIDKey]);
    id v8 = (void *)SBSCopyFrontmostApplicationDisplayIdentifier();
    if ([v7 isEqualToString:v8])
    {
      int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor systemObserver](self, "systemObserver"));
      [v9 frontmostApplicationDidChange:v7];
    }

    int64_t v6 = v10;
  }
}

- (void)notifyInAppSessionShouldPauseOrResume:(id)a3
{
  id v16 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:BKSApplicationStateProcessIDKey]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 integerValue]));

  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);

  NSLog( @"%s processIdentifer %@ observer nonnil %i",  "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]",  v5,  v7 != 0LL);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:BKSApplicationStateKey]);
    id v9 = [v8 unsignedIntValue];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v5]);
    id v12 = [v11 unsignedIntValue];

    NSLog( @"%s state %i previousState %i",  "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]",  v9,  v12);
    if ((_DWORD)v9 == 8)
    {
      if ((_DWORD)v12 != 8)
      {
        NSLog( @"%s calling clientApplicationDidEnterForeground",  "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]");
        [v7 clientApplicationDidEnterForeground];
      }
    }

    else if ((_DWORD)v12 == 8)
    {
      NSLog( @"%s calling clientApplicationDidEnterBackground",  "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]");
      [v7 clientApplicationDidEnterBackground];
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
    [v14 setObject:v13 forKeyedSubscript:v5];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
    NSLog( @"%s state %i previousState %@",  "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]",  v9,  v15);
  }
}

- (BOOL)isApplicationInForegroundWithBundleIdentifier:(id)a3
{
  return (-[BKSApplicationStateMonitor applicationStateForApplication:]( self->_applicationStateMonitor,  "applicationStateForApplication:",  a3) >> 3) & 1;
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (RPSystemStateObserver)systemObserver
{
  return self->_systemObserver;
}

- (void)setSystemObserver:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
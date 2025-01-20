@interface ADDisplayScaleContextCollector
- (ADDisplayScaleContextCollector)initWithDelegate:(id)a3;
- (ADDisplayScaleContextCollectorDelegate)delegate;
- (BOOL)_shouldMonitorScaleChanges;
- (double)displayScale;
- (void)_updateDisplayScaleIfNeededAndNotify:(BOOL)a3;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ADDisplayScaleContextCollector

- (ADDisplayScaleContextCollector)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADDisplayScaleContextCollector;
  v5 = -[ADDisplayScaleContextCollector init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[ADDisplayScaleContextCollector setDelegate:](v5, "setDelegate:", v4);
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADDisplayScaleContextCollector;
  -[ADDisplayScaleContextCollector dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    if (-[ADDisplayScaleContextCollector _shouldMonitorScaleChanges](self, "_shouldMonitorScaleChanges"))
    {
      displayMonitor = self->_displayMonitor;
      if (displayMonitor)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100088A14;
        block[3] = &unk_1004FD968;
        v19 = displayMonitor;
        v20 = self;
        v7 = v19;
        dispatch_async(&_dispatch_main_q, block);
      }

      id v8 = objc_loadWeakRetained((id *)&self->_delegate);

      self->_hasSetUpDisplayMonitor = 0;
      if (v8)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100088A20;
        v17[3] = &unk_1004EF600;
        v17[4] = self;
        v9 = -[FBSDisplayMonitor initWithInitializationCompletion:]( objc_alloc(&OBJC_CLASS___FBSDisplayMonitor),  "initWithInitializationCompletion:",  v17);
        v10 = self->_displayMonitor;
        self->_displayMonitor = v9;

        v11 = self->_displayMonitor;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100088A38;
        v14[3] = &unk_1004FD968;
        v15 = v11;
        v16 = self;
        v12 = v11;
        dispatch_async(&_dispatch_main_q, v14);
      }

      else
      {
        v13 = self->_displayMonitor;
        self->_displayMonitor = 0LL;
      }
    }
  }
}

- (double)displayScale
{
  if (!self->_hasSetUpDisplayMonitor)
  {
    if (-[ADDisplayScaleContextCollector _shouldMonitorScaleChanges](self, "_shouldMonitorScaleChanges"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100088A08;
      block[3] = &unk_1004FD940;
      void block[4] = self;
      dispatch_sync(&_dispatch_main_q, block);
    }

    else
    {
      self->_displayScale = 1.0;
      self->_hasSetUpDisplayMonitor = 1;
    }
  }

  return self->_displayScale;
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
}

- (void)_updateDisplayScaleIfNeededAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBSDisplayMonitor connectedIdentities](self->_displayMonitor, "connectedIdentities", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    double v9 = 1.0;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( -[FBSDisplayMonitor configurationForIdentity:]( self->_displayMonitor,  "configurationForIdentity:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i)));
        [v11 scale];
        if (v12 >= v9) {
          double v9 = v12;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  else
  {
    double v9 = 1.0;
  }

  double displayScale = self->_displayScale;
  self->_double displayScale = v9;
  if (v3 && v9 != displayScale)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADDisplayScaleContextCollector delegate](self, "delegate"));
    [v14 contextCollector:self didChangeDisplayScale:v9];
  }

- (BOOL)_shouldMonitorScaleChanges
{
  if ((AFIsHorseman(self, a2) & 1) != 0) {
    return 0;
  }
  else {
    return +[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR");
  }
}

- (ADDisplayScaleContextCollectorDelegate)delegate
{
  return (ADDisplayScaleContextCollectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end
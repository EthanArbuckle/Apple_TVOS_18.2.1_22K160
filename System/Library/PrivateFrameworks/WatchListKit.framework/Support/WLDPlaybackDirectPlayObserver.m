@interface WLDPlaybackDirectPlayObserver
- (BOOL)_getAppRunningState;
- (BOOL)appIsRunning;
- (NSString)bundleID;
- (RBSProcessMonitor)stateMonitor;
- (WLDPlaybackDirectPlayObserver)initWithBundleID:(id)a3;
- (WLKTransactionScope)transaction;
- (id)_identifier;
- (id)updateHandler;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)setAppIsRunning:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setStateMonitor:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation WLDPlaybackDirectPlayObserver

- (WLDPlaybackDirectPlayObserver)initWithBundleID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WLDPlaybackDirectPlayObserver;
  v5 = -[WLDPlaybackDirectPlayObserver init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[WLDPlaybackDirectPlayObserver setBundleID:](v5, "setBundleID:", v4);
    -[WLDPlaybackDirectPlayObserver setAppIsRunning:](v6, "setAppIsRunning:", 0LL);
    -[WLDPlaybackDirectPlayObserver _startObserving](v6, "_startObserving");
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WLDPlaybackDirectPlayObserver;
  -[WLDPlaybackDirectPlayObserver dealloc](&v3, "dealloc");
}

- (void)_startObserving
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver bundleID](self, "bundleID"));
  NSLog(@"WLDPlaybackDirectPlayObserver: Start Observing (%@)", v3);

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __48__WLDPlaybackDirectPlayObserver__startObserving__block_invoke;
  v6[3] = &unk_10003D980;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver bundleID](self, "bundleID"));
  id v7 = v4;
  objc_copyWeak(&v9, &location);
  objc_super v8 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  v6));
  -[WLDPlaybackDirectPlayObserver setStateMonitor:](self, "setStateMonitor:", v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__WLDPlaybackDirectPlayObserver__startObserving__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](&OBJC_CLASS___RBSProcessStateDescriptor, "descriptor"));
  [v4 setValues:1];
  [v3 setStateDescriptor:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  *(void *)(a1 + 32)));
  id v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  [v3 setPredicates:v6];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __48__WLDPlaybackDirectPlayObserver__startObserving__block_invoke_2;
  v7[3] = &unk_10003D958;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v7[4] = *(void *)(a1 + 40);
  [v3 setUpdateHandler:v7];
  objc_destroyWeak(&v8);
}

void __48__WLDPlaybackDirectPlayObserver__startObserving__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained _getAppRunningState];
    id v4 = @"NO";
    if ((_DWORD)v3) {
      id v4 = @"YES";
    }
    NSLog(@"WLDPlaybackDirectPlayObserver: _handleStateChange: appIsRunning: %@", v4);
    [*(id *)(a1 + 32) setAppIsRunning:v3];
    id WeakRetained = v5;
  }
}

- (void)_stopObserving
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver stateMonitor](self, "stateMonitor"));
  [v3 invalidate];

  -[WLDPlaybackDirectPlayObserver setStateMonitor:](self, "setStateMonitor:", 0LL);
}

- (void)setAppIsRunning:(BOOL)a3
{
  if (self->_appIsRunning != a3)
  {
    self->_appIsRunning = a3;
    if (a3)
    {
      id v4 = objc_alloc(&OBJC_CLASS___WLKTransactionScope);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver _identifier](self, "_identifier"));
      v6 = -[WLKTransactionScope initWithIdentifier:delay:](v4, "initWithIdentifier:delay:", v5, 10.0);

      -[WLDPlaybackDirectPlayObserver setTransaction:](self, "setTransaction:", v6);
    }

    else
    {
      -[WLDPlaybackDirectPlayObserver setTransaction:](self, "setTransaction:", 0LL);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver updateHandler](self, "updateHandler"));

    if (v7) {
      (*((void (**)(void))self->_updateHandler + 2))();
    }
  }

- (BOOL)_getAppRunningState
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver stateMonitor](self, "stateMonitor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 states]);

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 process]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundle]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver bundleID](self, "bundleID"));
      unsigned __int8 v14 = [v12 isEqualToString:v13];

      if ((v14 & 1) != 0) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v15 = v9;

    if (!v15) {
      goto LABEL_12;
    }
    unsigned __int8 v16 = [v15 isRunning];
  }

  else
  {
LABEL_9:

LABEL_12:
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver bundleID](self, "bundleID"));
    NSLog(@"WLDPlaybackDirectPlayObserver: No process state matching %@", v15);
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (id)_identifier
{
  id v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver bundleID](self, "bundleID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v5, v6));

  return v7;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (RBSProcessMonitor)stateMonitor
{
  return self->_stateMonitor;
}

- (void)setStateMonitor:(id)a3
{
}

- (BOOL)appIsRunning
{
  return self->_appIsRunning;
}

- (WLKTransactionScope)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
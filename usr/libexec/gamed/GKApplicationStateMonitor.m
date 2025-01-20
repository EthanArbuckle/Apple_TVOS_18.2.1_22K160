@interface GKApplicationStateMonitor
- (BOOL)startObservingStateChangesForBundleID:(id)a3;
- (GKApplicationStateMonitor)init;
- (LSApplicationWorkspaceObserverProtocol)delegate;
- (NSMutableSet)interestedBundleIDs;
- (RBSProcessMonitor)processMonitor;
- (id)handler;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setInterestedBundleIDs:(id)a3;
- (void)setProcessMonitor:(id)a3;
- (void)startObservingApplicationWorkspaceChanges;
- (void)stopObservingStateChangesForBundleID:(id)a3;
- (void)updateStateObservation;
@end

@implementation GKApplicationStateMonitor

- (GKApplicationStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKApplicationStateMonitor;
  v2 = -[GKApplicationStateMonitor init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitor](&OBJC_CLASS___RBSProcessMonitor, "monitor"));
    -[GKApplicationStateMonitor setProcessMonitor:](v2, "setProcessMonitor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[GKApplicationStateMonitor setInterestedBundleIDs:](v2, "setInterestedBundleIDs:", v4);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKApplicationStateMonitor;
  -[GKApplicationStateMonitor dealloc](&v4, "dealloc");
}

- (void)setHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id handler = self->_handler;
  self->_id handler = v5;

  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor processMonitor](self, "processMonitor"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F6054;
  v8[3] = &unk_100272658;
  objc_copyWeak(&v9, &location);
  [v7 updateConfiguration:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)startObservingStateChangesForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor interestedBundleIDs](self, "interestedBundleIDs"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor interestedBundleIDs](self, "interestedBundleIDs"));
    [v7 addObject:v4];

    -[GKApplicationStateMonitor updateStateObservation](self, "updateStateObservation");
  }

  return v6 ^ 1;
}

- (void)stopObservingStateChangesForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor interestedBundleIDs](self, "interestedBundleIDs"));
  [v5 removeObject:v4];

  -[GKApplicationStateMonitor updateStateObservation](self, "updateStateObservation");
}

- (void)updateStateObservation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor processMonitor](self, "processMonitor"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F6440;
  v4[3] = &unk_100272658;
  objc_copyWeak(&v5, &location);
  [v3 updateConfiguration:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)startObservingApplicationWorkspaceChanges
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[GKApplicationStateMonitor startObservingApplicationWorkspaceChanges]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v5 addObserver:self];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[GKApplicationStateMonitor applicationsDidUninstall:]";
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor delegate](self, "delegate"));
  char v9 = objc_opt_respondsToSelector(v8, "applicationsDidUninstall:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor delegate](self, "delegate"));
    [v10 applicationsDidUninstall:v5];
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[GKApplicationStateMonitor applicationsWillUninstall:]";
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor delegate](self, "delegate"));
  char v9 = objc_opt_respondsToSelector(v8, "applicationsWillUninstall:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor delegate](self, "delegate"));
    [v10 applicationsWillUninstall:v5];
  }
}

- (id)handler
{
  return self->_handler;
}

- (LSApplicationWorkspaceObserverProtocol)delegate
{
  return (LSApplicationWorkspaceObserverProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
}

- (NSMutableSet)interestedBundleIDs
{
  return self->_interestedBundleIDs;
}

- (void)setInterestedBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
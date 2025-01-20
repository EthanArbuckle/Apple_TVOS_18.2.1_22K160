@interface DMDiphoneOSAppLifeCycle
- (DMDiphoneOSAppLifeCycle)initWithBundleIdentifier:(id)a3;
- (NSProgress)proxyProgress;
- (id)progress;
- (void)_findProxyInProxies:(id)a3 andCallBlock:(id)a4;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidFailToUninstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)dealloc;
- (void)setProxyProgress:(id)a3;
@end

@implementation DMDiphoneOSAppLifeCycle

- (DMDiphoneOSAppLifeCycle)initWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v5 = DMFAppLog(v3, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v50 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Initialize app life cycle with bundle identifier: %{public}@",  buf,  0xCu);
  }

  id v48 = 0LL;
  id v7 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v48];
  id v8 = v48;
  v10 = v8;
  if (!v7)
  {
    uint64_t v11 = DMFAppLog(v8, v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000611C4((uint64_t)v3, (uint64_t)v10, v12);
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 compatibilityObject]);
  v15 = v13;
  if (v7 && v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 appState]);
    unsigned int v17 = [v16 isInstalled];

    unint64_t v18 = (unint64_t)[v15 installType];
    if (v18 > 0xA)
    {
LABEL_25:
      uint64_t v22 = 0LL;
    }

    else if (((1LL << v18) & 0x45E) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v15 installProgress]);
      id v21 = [v20 installState];

      switch((unint64_t)v21)
      {
        case 0uLL:
          if (v17) {
            uint64_t v22 = 5LL;
          }
          else {
            uint64_t v22 = 1LL;
          }
          break;
        case 1uLL:
          BOOL v28 = v17 == 0;
          uint64_t v29 = 2LL;
          uint64_t v30 = 6LL;
          goto LABEL_31;
        case 2uLL:
          BOOL v28 = v17 == 0;
          uint64_t v29 = 3LL;
          uint64_t v30 = 7LL;
LABEL_31:
          if (v28) {
            uint64_t v22 = v29;
          }
          else {
            uint64_t v22 = v30;
          }
          break;
        case 3uLL:
        case 4uLL:
          if (v17) {
            uint64_t v22 = 4LL;
          }
          else {
            uint64_t v22 = 0LL;
          }
          break;
        case 5uLL:
          uint64_t v22 = 4LL;
          break;
        default:
          goto LABEL_25;
      }
    }

    else
    {
      uint64_t v26 = 4LL;
      if (!v17) {
        uint64_t v26 = 0LL;
      }
      uint64_t v27 = 6LL;
      if (v18 != 5) {
        uint64_t v27 = 0LL;
      }
      if (v18) {
        uint64_t v22 = v27;
      }
      else {
        uint64_t v22 = v26;
      }
    }

    uint64_t v31 = DMFAppLog(v18, v19);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", v22));
      if (v17) {
        v33 = @"YES";
      }
      else {
        v33 = @"NO";
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "appState", v33));
      v34 = v10;
      else {
        v35 = @"NO";
      }
      id v36 = [v15 installType];
      v37 = (void *)objc_claimAutoreleasedReturnValue([v15 installProgress]);
      id v38 = [v37 installState];
      *(_DWORD *)buf = 138544642;
      id v50 = v3;
      __int16 v51 = 2114;
      v52 = v32;
      __int16 v53 = 2114;
      uint64_t v54 = v44;
      __int16 v55 = 2114;
      v56 = v35;
      v10 = v34;
      __int16 v57 = 2048;
      id v58 = v36;
      __int16 v59 = 2048;
      id v60 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "App lifecycle for %{public}@\n \tcalculated install state:%{public}@\n \tis installed: %{public}@\n \tis placeholder: %{public}@\n \tinstall type: %lu\n \tinstall progress install state: %lu",  buf,  0x3Eu);
    }
  }

  else
  {
    uint64_t v23 = DMFAppLog(v13, v14);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 0LL));
      *(_DWORD *)buf = 138543618;
      id v50 = v3;
      __int16 v51 = 2114;
      v52 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "App lifecycle for %{public}@ (no proxy)\n\tassumed install state:%{public}@",  buf,  0x16u);
    }

    uint64_t v22 = 0LL;
  }

  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___DMDiphoneOSAppLifeCycle;
  v39 = -[DMDAppLifeCycle initWithBundleIdentifier:currentState:]( &v47,  "initWithBundleIdentifier:currentState:",  v3,  v22);
  if (v39)
  {
    uint64_t v40 = objc_claimAutoreleasedReturnValue([v15 installProgress]);
    proxyProgress = v39->_proxyProgress;
    v39->_proxyProgress = (NSProgress *)v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v42 addObserver:v39];
  }

  return v39;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DMDiphoneOSAppLifeCycle;
  -[DMDiphoneOSAppLifeCycle dealloc](&v4, "dealloc");
}

- (id)progress
{
  return -[DMDiphoneOSAppLifeCycle proxyProgress](self, "proxyProgress");
}

- (void)applicationsWillInstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001CEA4;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidStart:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001D0C4;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001D500;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidPause:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001D724;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidResume:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001D948;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationInstallsDidCancel:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001DB6C;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsDidFailToInstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001DD98;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsDidInstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001E0B0;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsWillUninstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001E4A8;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001E74C;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)applicationsDidUninstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001E8E8;
  v3[3] = &unk_10009E098;
  v3[4] = self;
  -[DMDiphoneOSAppLifeCycle _findProxyInProxies:andCallBlock:](self, "_findProxyInProxies:andCallBlock:", a3, v3);
}

- (void)_findProxyInProxies:(id)a3 andCallBlock:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (!v8)
  {
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v18 handleFailureInMethod:a2, self, @"DMDAppLifeCycle+iphoneOS.m", 460, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle bundleIdentifier](self, "bundleIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
        unsigned int v17 = [v15 isEqualToString:v16];

        if (v17)
        {
          v8[2](v8, v14);
          goto LABEL_13;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (NSProgress)proxyProgress
{
  return self->_proxyProgress;
}

- (void)setProxyProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
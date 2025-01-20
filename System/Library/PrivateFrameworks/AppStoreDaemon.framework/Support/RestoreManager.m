@interface RestoreManager
- (RestoreManager)init;
- (void)_bootstrapWhenReadyWithInfo:(id)a3;
- (void)_handleMonitorStateDidChangeNotification:(id)a3;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation RestoreManager

- (RestoreManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RestoreManager;
  v2 = -[RestoreManager init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.RestoreManager.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
    restoreQueue = v2->_restoreQueue;
    v2->_restoreQueue = v7;

    v9 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10020FC50;
    block[3] = &unk_1003E9880;
    v12 = v2;
    dispatch_async(v9, block);
  }

  return v2;
}

- (void)_bootstrapWhenReadyWithInfo:(id)a3
{
  v4 = a3;
  id v5 = sub_1001E1834((uint64_t)&OBJC_CLASS___DeviceStateMonitor);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = sub_1002164C0((uint64_t)self);
  if (v6)
  {
    id v8 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unsigned int v10 = [v9 isConnected] & v7;

    if (v10 == 1)
    {
      if (v4 && (v4[8] & 1) != 0)
      {
        id v42 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v44 = v43;
        if (v43
          && (unsigned int v45 = sub_100256DD0(v43, @"preflightAccountsOnStartup", (void *)1, 1),
              v44,
              v45))
        {
          uint64_t v46 = sub_1002101FC((uint64_t)self);
          if ((v4[9] & 1) == 0)
          {
            uint64_t v47 = v46;
            if (v46 >= 1)
            {
              uint64_t v48 = ASDLogHandleForCategory(29LL);
              v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v73 = v47;
                _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Account preflight retry for %ld hard failure(s)",  buf,  0xCu);
              }

              sub_100215070(self, 0);
            }
          }
        }

        else
        {
          uint64_t v50 = ASDLogHandleForCategory(29LL);
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Skipping account preflight retry due to bag override",  buf,  2u);
          }
        }
      }

      else
      {
        uint64_t v11 = ASDLogHandleForCategory(29LL);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          if (v4) {
            id Property = objc_getProperty(v4, v13, 24LL, 1);
          }
          else {
            id Property = 0LL;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v73 = (uint64_t)Property;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Initializing now that there is network, setup complete, and data migration complete, bag loaded for accountID: %{public}@",  buf,  0xCu);
        }

        if (v4)
        {
          id v16 = objc_getProperty(v4, v15, 16LL, 1);
          id v18 = objc_getProperty(v4, v17, 24LL, 1);
          int v19 = v4[9] & 1;
        }

        else
        {
          id v18 = 0LL;
          id v16 = 0LL;
          int v19 = 0;
        }

        sub_100210CC4(self, v16, v18, v19);

        if (sub_100212600((uint64_t)&OBJC_CLASS___RestoreManager))
        {
          if (sub_1002138D8((uint64_t)self) < 1 || sub_1002FA294((uint64_t)&OBJC_CLASS___AppDefaultsManager))
          {
            uint64_t v20 = ASDLogHandleForCategory(29LL);
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = sub_1002138D8((uint64_t)self);
              BOOL v23 = sub_1002FA294((uint64_t)&OBJC_CLASS___AppDefaultsManager);
              *(_DWORD *)buf = 134218240;
              uint64_t v73 = v22;
              __int16 v74 = 1024;
              *(_DWORD *)v75 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "App distributor is missing. %ld app(s) waiting hasPresentedDistributorRestoreDialog: %{BOOL}d",  buf,  0x12u);
            }
          }

          else
          {
            sub_1002FA420((uint64_t)&OBJC_CLASS___AppDefaultsManager, 1LL);
            v52 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
            uint64_t v53 = ASDLogHandleForCategory(29LL);
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v55 = sub_100210138((uint64_t)self);
              *(_DWORD *)buf = 138412546;
              uint64_t v73 = (uint64_t)v52;
              __int16 v74 = 2048;
              *(void *)v75 = v55;
              _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "[%@] Will present dialog to get app distributor with %ld app(s) waiting",  buf,  0x16u);
            }

            sub_1002111C4((uint64_t)self, v52, 0LL);
          }
        }
      }

      goto LABEL_67;
    }
  }

  sub_100216EC4((uint64_t)self, v4);
  uint64_t v24 = ASDLogHandleForCategory(29LL);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v27 = objc_getProperty(v4, v26, 16LL, 1);
    }
    else {
      id v27 = 0LL;
    }
    id v28 = v27;
    id v29 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    *(_DWORD *)buf = 138544386;
    uint64_t v73 = (uint64_t)v27;
    __int16 v74 = 1024;
    *(_DWORD *)v75 = v6 != 0LL;
    *(_WORD *)&v75[4] = 1024;
    *(_DWORD *)&v75[6] = *(_DWORD *)v75;
    __int16 v76 = 1024;
    unsigned int v77 = [v30 isConnected];
    __int16 v78 = 1024;
    unsigned int v79 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Not ready to bootstrap restore for reason: %{public}@. Setup complete: %d migrator complete: %d network available: %d bag loaded: %d",  buf,  0x24u);
  }

  id v31 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  if ([v32 isConnected])
  {

    goto LABEL_25;
  }

  if (self)
  {
    BOOL v33 = !self->_bootstrapNetworkMonitorAdded;

    if (!v33)
    {
LABEL_25:
      if (v6) {
        goto LABEL_56;
      }
      goto LABEL_26;
    }
  }

  else
  {
  }

  uint64_t v56 = ASDLogHandleForCategory(29LL);
  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v59 = objc_getProperty(v4, v58, 16LL, 1);
    }
    else {
      id v59 = 0LL;
    }
    *(_DWORD *)buf = 138544130;
    uint64_t v73 = (uint64_t)v59;
    __int16 v74 = 1024;
    *(_DWORD *)v75 = v6 != 0LL;
    *(_WORD *)&v75[4] = 1024;
    *(_DWORD *)&v75[6] = *(_DWORD *)v75;
    __int16 v76 = 1024;
    unsigned int v77 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Creating network monitor to bootstrap restore for reason: %{public}@. Setup complete: %d migrator complete: %d bag loaded: %d",  buf,  0x1Eu);
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v61 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  [v60 addObserver:self selector:"_handleMonitorStateDidChangeNotification:" name:@"NetworkStateDidChangeNotification" object:v62];

  if (!self)
  {
    if (v6) {
      goto LABEL_70;
    }
    goto LABEL_72;
  }

  self->_bootstrapNetworkMonitorAdded = 1;
  if (!v6)
  {
LABEL_26:
    if (self)
    {
      if (self->_bootstrapDeviceMonitorAdded) {
        goto LABEL_56;
      }
      char v34 = 0;
LABEL_29:
      uint64_t v35 = ASDLogHandleForCategory(29LL);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        if (v4) {
          id v38 = objc_getProperty(v4, v37, 16LL, 1);
        }
        else {
          id v38 = 0LL;
        }
        *(_DWORD *)buf = 138544130;
        uint64_t v73 = (uint64_t)v38;
        __int16 v74 = 1024;
        *(_DWORD *)v75 = v6 != 0LL;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = *(_DWORD *)v75;
        __int16 v76 = 1024;
        unsigned int v77 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Creating device monitor to bootstrap restore for reason: %{public}@. Setup complete: %d migrator complete: %d bag loaded: %d",  buf,  0x1Eu);
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v40 = sub_1001E1834((uint64_t)&OBJC_CLASS___DeviceStateMonitor);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      [v39 addObserver:self selector:"_handleMonitorStateDidChangeNotification:" name:@"DeviceStateDidChangeNotification" object:v41];

      if ((v34 & 1) == 0)
      {
        self->_bootstrapDeviceMonitorAdded = 1;
        goto LABEL_56;
      }

- (void)_handleMonitorStateDidChangeNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100218A2C;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = ASDLogHandleForCategory(29LL);
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    SEL v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  uint64_t v11 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v11, "present"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10021A674;
  v14[3] = &unk_1003EBDA8;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 addFinishBlock:v14];
}

- (void).cxx_destruct
{
}

@end
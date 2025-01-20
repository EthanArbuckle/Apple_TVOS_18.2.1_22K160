@interface PKDiscoveryLSWatcher
- (PKApplicationWorkspaceProxy)workspace;
- (PKDiscoveryDriver)wdriver;
- (PKDiscoveryLSWatcher)initWithDriver:(id)a3;
- (void)pluginsDidInstall:(id)a3;
- (void)pluginsDidUninstall:(id)a3;
- (void)setWdriver:(id)a3;
- (void)setWorkspace:(id)a3;
- (void)stopUpdates;
- (void)update;
- (void)updateWithUninstalledProxies:(id)a3;
@end

@implementation PKDiscoveryLSWatcher

- (PKDiscoveryLSWatcher)initWithDriver:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___PKDiscoveryLSWatcher;
  v5 = -[PKDiscoveryLSWatcher init](&v42, sel_init);
  v9 = v5;
  if (v5)
  {
    objc_msgSend_setWdriver_(v5, v6, (uint64_t)v4, v7, v8);
    objc_msgSend_host(v4, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_external(v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ls(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultApplicationWorkspace(v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWorkspace_(v9, v30, (uint64_t)v29, v31, v32);

    objc_msgSend_workspace(v9, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_(v37, v38, (uint64_t)v9, v39, v40);
  }

  return v9;
}

- (void)stopUpdates
{
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v9, v6, (uint64_t)self, v7, v8);
}

- (void)pluginsDidInstall:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  pklog_handle_for_category(6);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_wdriver(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = 134218240;
    v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = objc_msgSend_count(v4, v11, v12, v13, v14);
    _os_log_impl( &dword_186A04000,  v5,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> new plugin(s) (count: %lu) installed, re-performing query for continuous discovery",  (uint8_t *)&v19,  0x16u);
  }

  objc_msgSend_update(self, v15, v16, v17, v18);
}

- (void)pluginsDidUninstall:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  pklog_handle_for_category(6);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_wdriver(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = 134218240;
    int v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = objc_msgSend_count(v4, v11, v12, v13, v14);
    _os_log_impl( &dword_186A04000,  v5,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> plugin(s) (count: %lu) uninstalled",  (uint8_t *)&v18,  0x16u);
  }

  objc_msgSend_updateWithUninstalledProxies_(self, v15, (uint64_t)v4, v16, v17);
}

- (void)update
{
}

- (void)updateWithUninstalledProxies:(id)a3
{
  id v4 = a3;
  objc_msgSend_wdriver(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v9;
  if (v9)
  {
    objc_msgSend_queue(v9, v10, v11, v12, v13);
    v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = sub_186A0EA64;
    v16[3] = &unk_189F20608;
    v16[4] = self;
    id v17 = v4;
    dispatch_async(v15, v16);
  }
}

- (PKDiscoveryDriver)wdriver
{
  return (PKDiscoveryDriver *)objc_loadWeakRetained((id *)&self->_wdriver);
}

- (void)setWdriver:(id)a3
{
}

- (PKApplicationWorkspaceProxy)workspace
{
  return (PKApplicationWorkspaceProxy *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setWorkspace:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
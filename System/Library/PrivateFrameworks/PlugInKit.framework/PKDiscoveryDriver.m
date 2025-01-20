@interface PKDiscoveryDriver
- (NSDictionary)attributes;
- (NSSet)lastResults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)sync;
- (OS_os_activity)relatedActivity;
- (PKDiscoveryDriver)initWithAttributes:(id)a3 flags:(unint64_t)a4 host:(id)a5 report:(id)a6;
- (PKDiscoveryLSWatcher)lsWatcher;
- (PKHost)host;
- (id)mcNotificationToken;
- (id)report;
- (int)annotationNotifyToken;
- (unint64_t)flags;
- (void)_performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4 uninstalledProxies:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)installWatchers;
- (void)performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4;
- (void)removeWatchers;
- (void)setAnnotationNotifyToken:(int)a3;
- (void)setAttributes:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHost:(id)a3;
- (void)setLastResults:(id)a3;
- (void)setLsWatcher:(id)a3;
- (void)setMcNotificationToken:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelatedActivity:(id)a3;
- (void)setReport:(id)a3;
- (void)setSync:(id)a3;
@end

@implementation PKDiscoveryDriver

- (PKDiscoveryDriver)initWithAttributes:(id)a3 flags:(unint64_t)a4 host:(id)a5 report:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  os_activity_t v13 = _os_activity_create( &dword_186A04000,  "continuous-discovery",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_186A0CFF4;
  v33 = sub_186A0D004;
  id v34 = 0LL;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A0D00C;
  block[3] = &unk_189F20940;
  v22 = self;
  id v23 = v10;
  v27 = &v29;
  unint64_t v28 = a4;
  os_activity_t v24 = v13;
  id v25 = v11;
  id v26 = v12;
  id v14 = v11;
  v15 = v13;
  id v16 = v12;
  id v17 = v10;
  v18 = self;
  os_activity_apply(v15, block);
  v19 = (PKDiscoveryDriver *)(id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (void)dealloc
{
  v6 = (os_activity_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A0D214;
  block[3] = &unk_189F20630;
  void block[4] = self;
  os_activity_apply(v6, block);

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PKDiscoveryDriver;
  -[PKDiscoveryDriver dealloc](&v7, sel_dealloc);
}

- (void)performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4
{
  id v6 = a3;
  objc_msgSend_relatedActivity(self, v7, v8, v9, v10);
  id v11 = (os_activity_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A0D35C;
  block[3] = &unk_189F209B8;
  void block[4] = self;
  id v14 = v6;
  BOOL v15 = a4;
  id v12 = v6;
  os_activity_apply(v11, block);
}

- (void)_performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4 uninstalledProxies:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  objc_msgSend_report(self, v9, v10, v11, v12);
  os_activity_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_relatedActivity(self, v14, v15, v16, v17);
    v18 = (os_activity_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186A0D904;
    block[3] = &unk_189F20A30;
    id v21 = v8;
    BOOL v24 = a4;
    id v22 = v19;
    id v23 = self;
    os_activity_apply(v18, block);
  }
}

- (void)cancel
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(6);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v31 = self;
    _os_log_impl( &dword_186A04000,  v3,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> explicit cancellation for discovery",  buf,  0xCu);
  }

  objc_msgSend_report(self, v4, v5, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_current_queue();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sync(self, v10, v11, v12, v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v19 = MEMORY[0x1895F87A8];
  if (v9 == v14)
  {
    objc_msgSend_removeWatchers(self, v15, v16, v17, v18);
  }

  else
  {
    objc_msgSend_sync(self, v15, v16, v17, v18);
    v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v19;
    block[1] = 3221225472LL;
    block[2] = sub_186A0DE24;
    block[3] = &unk_189F20630;
    void block[4] = self;
    dispatch_sync(v20, block);
  }

  objc_msgSend_queue(self, v21, v22, v23, v24);
  id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  v27[1] = 3221225472LL;
  v27[2] = sub_186A0DE2C;
  v27[3] = &unk_189F20A58;
  v27[4] = self;
  id v28 = v8;
  id v26 = v8;
  dispatch_async(v25, v27);
}

- (void)installWatchers
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(6);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v47 = self;
    _os_log_impl( &dword_186A04000,  v3,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> installing watchers for continuous discovery",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v4 = objc_alloc(&OBJC_CLASS___PKDiscoveryLSWatcher);
  id v8 = (void *)objc_msgSend_initWithDriver_(v4, v5, (uint64_t)self, v6, v7);
  objc_msgSend_setLsWatcher_(self, v9, (uint64_t)v8, v10, v11);

  objc_msgSend_queue(self, v12, v13, v14, v15);
  uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = sub_186A0E178;
  handler[3] = &unk_189F20A80;
  objc_copyWeak(&v44, (id *)buf);
  sub_186A128D4(&out_token, v16, handler);

  objc_msgSend_setAnnotationNotifyToken_(self, v18, out_token, v19, v20);
  v41[0] = v17;
  v41[1] = 3221225472LL;
  v41[2] = sub_186A0E278;
  v41[3] = &unk_189F20AA8;
  objc_copyWeak(&v42, (id *)buf);
  id v21 = (void *)MEMORY[0x186E4154C](v41);
  objc_msgSend_defaultCenter(MEMORY[0x189607958], v22, v23, v24, v25);
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainQueue(MEMORY[0x189607988], v27, v28, v29, v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v17;
  v38[1] = 3221225472LL;
  v38[2] = sub_186A0E378;
  v38[3] = &unk_189F20AD0;
  objc_copyWeak(&v40, (id *)buf);
  id v32 = v21;
  id v39 = v32;
  objc_msgSend_addObserverForName_object_queue_usingBlock_( v26,  v33,  (uint64_t)@"com.apple.managedconfiguration.effectivesettingschanged",  0,  (uint64_t)v31,  v38);
  id v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMcNotificationToken_(self, v35, (uint64_t)v34, v36, v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);
}

- (void)removeWatchers
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(6);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 134217984;
    id v42 = self;
    _os_log_impl( &dword_186A04000,  v3,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> removing watchers for continous discovery",  (uint8_t *)&v41,  0xCu);
  }

  if (objc_msgSend_annotationNotifyToken(self, v4, v5, v6, v7))
  {
    objc_msgSend_lsWatcher(self, v8, v9, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopUpdates(v12, v13, v14, v15, v16);

    int v21 = objc_msgSend_annotationNotifyToken(self, v17, v18, v19, v20);
    sub_186A12944(v21);
    objc_msgSend_defaultCenter(MEMORY[0x189607958], v22, v23, v24, v25);
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mcNotificationToken(self, v27, v28, v29, v30);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObserver_(v26, v32, (uint64_t)v31, v33, v34);

    objc_msgSend_setAnnotationNotifyToken_(self, v35, 0, v36, v37);
    objc_msgSend_setReport_(self, v38, 0, v39, v40);
  }

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAttributes:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (id)report
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setReport:(id)a3
{
}

- (OS_os_activity)relatedActivity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRelatedActivity:(id)a3
{
}

- (NSSet)lastResults
{
  return (NSSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLastResults:(id)a3
{
}

- (int)annotationNotifyToken
{
  return self->_annotationNotifyToken;
}

- (void)setAnnotationNotifyToken:(int)a3
{
  self->_annotationNotifyToken = a3;
}

- (id)mcNotificationToken
{
  return objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMcNotificationToken:(id)a3
{
}

- (PKDiscoveryLSWatcher)lsWatcher
{
  return (PKDiscoveryLSWatcher *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLsWatcher:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)sync
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSync:(id)a3
{
}

- (PKHost)host
{
  return (PKHost *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface LANotification
+ (BOOL)isAppActive;
+ (void)postNotificationWithNewValue:(id)a3 oldValue:(id)a4;
- (BOOL)appMustBeActive;
- (BOOL)notifyOnResume;
- (LANotification)initWithObserver:(id)a3;
- (LANotificationObserver)observer;
- (LANotificationProxy)proxy;
- (LANotificationXPC)notification;
- (NSObject)oldValue;
- (NSObject)value;
- (NSString)description;
- (NSXPCConnection)connection;
- (id)_notificationNameWhenAppIsActive:(BOOL)a3;
- (id)darwinNotificationForValue:(id)a3;
- (void)_appActivityChanged:(id)a3;
- (void)_checkWaiting;
- (void)_notifyObserverWithAction:(id)a3 completionHandler:(id)a4;
- (void)_observeAppActivity:(BOOL)a3;
- (void)dealloc;
- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5;
- (void)postNewValue:(id)a3 oldValue:(id)a4;
- (void)resume;
- (void)setAppMustBeActive:(BOOL)a3;
- (void)setNotifyOnResume:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)suspend;
@end

@implementation LANotification

- (LANotification)initWithObserver:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LANotification;
  v5 = -[LANotification init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v6->_notifyOnResume = 1;
    -[LANotification setAppMustBeActive:](v6, "setAppMustBeActive:", 1LL);
    v7 = -[LANotificationProxy initWithTarget:](objc_alloc(&OBJC_CLASS___LANotificationProxy), "initWithTarget:", v6);
    proxy = v6->_proxy;
    v6->_proxy = v7;
  }

  return v6;
}

+ (void)postNotificationWithNewValue:(id)a3 oldValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 postNewValue:v6 oldValue:v5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LANotification;
  -[LANotification dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  objc_super v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification value](self, "value");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification oldValue](self, "oldValue");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LANotification observer](self, "observer");
  [v3 stringWithFormat:@"<%@ %p: value: %@, oldValue: %@, observer: %@>", v5, self, v6, v7, v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)resume
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  LA_LOG_0();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_186EAF000, v3, OS_LOG_TYPE_INFO, "%{public}@ is resuming", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[LANotification notification](self, "notification");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = -[LANotification notifyOnResume](self, "notifyOnResume");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __24__LANotification_resume__block_invoke;
  v6[3] = &unk_189F991F8;
  objc_copyWeak(&v7, (id *)buf);
  [v4 resumeAndNotify:v5 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __24__LANotification_resume__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  LA_LOG_0();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138543362;
    id v5 = WeakRetained;
    _os_log_impl(&dword_186EAF000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ has resumed", (uint8_t *)&v4, 0xCu);
  }
}

- (void)suspend
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  LA_LOG_0();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_186EAF000, v3, OS_LOG_TYPE_INFO, "%{public}@ is suspending", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[LANotification notification](self, "notification");
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __25__LANotification_suspend__block_invoke;
  v5[3] = &unk_189F991F8;
  objc_copyWeak(&v6, (id *)buf);
  [v4 suspendWithCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __25__LANotification_suspend__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  LA_LOG_0();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138543362;
    id v5 = WeakRetained;
    _os_log_impl(&dword_186EAF000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ has been suspended", (uint8_t *)&v4, 0xCu);
  }
}

- (void)postNewValue:(id)a3 oldValue:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[LANotification darwinNotificationForValue:](self, "darwinNotificationForValue:", v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  LA_LOG_0();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v24 = self;
    __int16 v25 = 2114;
    id v26 = v6;
    __int16 v27 = 2114;
    id v28 = v7;
    __int16 v29 = 2114;
    v30 = v8;
    _os_log_impl( &dword_186EAF000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is posting newValue: %{public}@, oldValue: %{public}@, darwin notification: %{public}@",  buf,  0x2Au);
  }

  if (v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0LL, 0LL, 1u);
  }

  objc_initWeak((id *)buf, self);
  v11 = -[LANotification connection](self, "connection");
  uint64_t v12 = MEMORY[0x1895F87A8];
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __40__LANotification_postNewValue_oldValue___block_invoke;
  v22[3] = &unk_189F99248;
  v22[4] = self;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v22];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472LL;
  v18[2] = __40__LANotification_postNewValue_oldValue___block_invoke_2;
  v18[3] = &unk_189F99E58;
  objc_copyWeak(&v21, (id *)buf);
  id v16 = v6;
  id v19 = v16;
  id v17 = v7;
  id v20 = v17;
  [v13 postNotificationOfClassNamed:v15 newValue:v16 oldValue:v17 completionHandler:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __40__LANotification_postNewValue_oldValue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0LL;
}

void __40__LANotification_postNewValue_oldValue___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  LA_LOG_0();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138543874;
    id v7 = WeakRetained;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl( &dword_186EAF000,  v2,  OS_LOG_TYPE_INFO,  "%{public}@ posted newValue: %{public}@, oldValue: %{public}@",  (uint8_t *)&v6,  0x20u);
  }
}

+ (BOOL)isAppActive
{
  return (_appIsActive & 1) == 0;
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  __int16 v10 = a4;
  uint64_t v11 = (void (**)(void))a5;
  objc_storeStrong((id *)&self->_value, a3);
  oldValue = self->_oldValue;
  self->_oldValue = v10;

  if (-[LANotification appMustBeActive](self, "appMustBeActive") && _appIsActive == 1)
  {
    LA_LOG_0();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      v15 = self;
      _os_log_impl( &dword_186EAF000,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will wait for app activation before notifying observer",  (uint8_t *)&v14,  0xCu);
    }

    self->_waitingForActivation = 1;
    v11[2](v11);
  }

  else
  {
    -[LANotification _notifyObserverWithAction:completionHandler:]( self,  "_notifyObserverWithAction:completionHandler:",  @"has received new value",  v11);
  }
}

- (void)_notifyObserverWithAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  LA_LOG_0();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl( &dword_186EAF000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %{public}@, notifying observer",  (uint8_t *)&v12,  0x16u);
  }

  -[LANotification observer](self, "observer");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[LANotification observer](self, "observer");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 notification:self completionHandler:v7];
  }

  v7[2](v7);
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    +[LAClient createConnection:legacyService:](&OBJC_CLASS___LAClient, "createConnection:legacyService:", 0LL, 0LL);
    uint64_t v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_connection;
    self->_connection = v4;

    [MEMORY[0x1896087A0] interfaceWithInternalProtocol:&unk_18C6B4100];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LANotification connection](self, "connection");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setRemoteObjectInterface:v6];

    -[LANotification connection](self, "connection");
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 resume];

    connection = self->_connection;
  }

  return connection;
}

- (LANotificationXPC)notification
{
  notification = self->_notification;
  if (!notification)
  {
    -[LANotification connection](self, "connection");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __30__LANotification_notification__block_invoke;
    v12[3] = &unk_189F99248;
    v12[4] = self;
    [v4 synchronousRemoteObjectProxyWithErrorHandler:v12];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LANotification proxy](self, "proxy");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472LL;
    v11[2] = __30__LANotification_notification__block_invoke_2;
    v11[3] = &unk_189F99E80;
    v11[4] = self;
    [v6 addNotificationObserver:v7 className:v9 completionHandler:v11];

    notification = self->_notification;
  }

  return notification;
}

void __30__LANotification_notification__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0LL;
}

void __30__LANotification_notification__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)darwinNotificationForValue:(id)a3
{
  return 0LL;
}

- (BOOL)appMustBeActive
{
  return self->_appMustBeActive;
}

- (void)setAppMustBeActive:(BOOL)a3
{
  self->_appMustBeActive = a3;
  -[LANotification _observeAppActivity:](self, "_observeAppActivity:");
  -[LANotification _checkWaiting](self, "_checkWaiting");
}

- (void)_observeAppActivity:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)MEMORY[0x189603F18];
  -[LANotification _notificationNameWhenAppIsActive:](self, "_notificationNameWhenAppIsActive:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification _notificationNameWhenAppIsActive:](self, "_notificationNameWhenAppIsActive:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        [MEMORY[0x189607958] defaultCenter];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = v15;
        if (v3) {
          [v15 addObserver:self selector:sel__appActivityChanged_ name:v14 object:0];
        }
        else {
          [v15 removeObserver:self name:v14 object:0];
        }
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

- (id)_notificationNameWhenAppIsActive:(BOOL)a3
{
  return 0LL;
}

- (void)_appActivityChanged:(id)a3
{
  id v4 = a3;
  [v4 name];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification _notificationNameWhenAppIsActive:](self, "_notificationNameWhenAppIsActive:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) != 0
    || ([v4 name],
        __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[LANotification _notificationNameWhenAppIsActive:](self, "_notificationNameWhenAppIsActive:", 0LL),
        id v9 = (void *)objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v10))
  {
    _appIsActive = v7 ^ 1;
  }

  LA_LOG_0();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[LANotification _appActivityChanged:].cold.1((uint64_t)self, (uint64_t)v4, v11);
  }

  -[LANotification _checkWaiting](self, "_checkWaiting");
}

- (void)_checkWaiting
{
  if (self->_waitingForActivation && (_appIsActive != 1 || !-[LANotification appMustBeActive](self, "appMustBeActive")))
  {
    self->_waitingForActivation = 0;
    -[LANotification _notifyObserverWithAction:completionHandler:]( self,  "_notifyObserverWithAction:completionHandler:",  @"activated pending notification",  &__block_literal_global_6);
  }

- (LANotificationObserver)observer
{
  return (LANotificationObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (BOOL)notifyOnResume
{
  return self->_notifyOnResume;
}

- (void)setNotifyOnResume:(BOOL)a3
{
  self->_notifyOnResume = a3;
}

- (NSObject)value
{
  return self->_value;
}

- (NSObject)oldValue
{
  return self->_oldValue;
}

- (LANotificationProxy)proxy
{
  return self->_proxy;
}

- (void).cxx_destruct
{
}

- (void)_appActivityChanged:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v4 = 138543874;
  uint64_t v5 = a1;
  if (_appIsActive) {
    BOOL v3 = "inactive";
  }
  else {
    BOOL v3 = "active";
  }
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  __int16 v8 = 2082;
  id v9 = v3;
  _os_log_debug_impl( &dword_186EAF000,  log,  OS_LOG_TYPE_DEBUG,  "%{public}@ received %{public}@, app is %{public}s",  (uint8_t *)&v4,  0x20u);
}

@end
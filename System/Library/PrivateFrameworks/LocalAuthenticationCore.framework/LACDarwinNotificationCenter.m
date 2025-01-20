@interface LACDarwinNotificationCenter
+ (LACDarwinNotificationCenter)sharedInstance;
- (BOOL)_hasSubscriptionToNotification:(__CFString *)a3;
- (BOOL)hasObserver:(id)a3;
- (LACDarwinNotificationCenter)init;
- (int64_t)observerCount;
- (void)_addSubscriptionToNotification:(__CFString *)a3;
- (void)_notifyObserversAboutNotification:(__CFString *)a3;
- (void)_postNotification:(__CFString *)a3;
- (void)_startObservingNotification:(__CFString *)a3;
- (void)_stopObservingAllNotifications;
- (void)_synchronizedObservers:(id)a3;
- (void)_synchronizedSubscriptions:(id)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 notification:(__CFString *)a4;
- (void)listenToLaunchNotifications;
- (void)postNotification:(__CFString *)a3;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)stopListeningToAllNotifications;
@end

@implementation LACDarwinNotificationCenter

- (LACDarwinNotificationCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACDarwinNotificationCenter;
  v2 = -[LACDarwinNotificationCenter init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    subscriptions = v2->_subscriptions;
    v2->_subscriptions = v5;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    v2->_subscriptionsLock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

+ (LACDarwinNotificationCenter)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_11);
  }
  return (LACDarwinNotificationCenter *)(id)sharedInstance_sharedInstance_6;
}

void __45__LACDarwinNotificationCenter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LACDarwinNotificationCenter);
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = (uint64_t)v0;
}

- (void)removeAllObservers
{
}

uint64_t __49__LACDarwinNotificationCenter_removeAllObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)stopListeningToAllNotifications
{
}

uint64_t __62__LACDarwinNotificationCenter_stopListeningToAllNotifications__block_invoke( uint64_t a1,  void *a2)
{
  return [a2 removeAllObjects];
}

- (int64_t)observerCount
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __44__LACDarwinNotificationCenter_observerCount__block_invoke;
  v4[3] = &unk_18A369878;
  v4[4] = &v5;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__LACDarwinNotificationCenter_observerCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

- (void)listenToLaunchNotifications
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __58__LACDarwinNotificationCenter_listenToLaunchNotifications__block_invoke;
  v2[3] = &unk_18A3698A0;
  objc_copyWeak(&v3, &location);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0LL, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __58__LACDarwinNotificationCenter_listenToLaunchNotifications__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend( NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1895F91D0]));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained _addSubscriptionToNotification:v4];
    [WeakRetained _notifyObserversAboutNotification:v4];
  }
}

- (void)postNotification:(__CFString *)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  LACLogNotifications();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = a3;
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "Will post %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[LACDarwinNotificationCenter _postNotification:](self, "_postNotification:", a3);
}

- (BOOL)hasObserver:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__LACDarwinNotificationCenter_hasObserver___block_invoke;
  v7[3] = &unk_18A3698C8;
  v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __43__LACDarwinNotificationCenter_hasObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (void)addObserver:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__LACDarwinNotificationCenter_addObserver___block_invoke;
  v7[3] = &unk_18A3698F0;
  id v5 = v4;
  id v8 = v5;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v7);
  LACLogNotifications();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "Did register observer %@", buf, 0xCu);
  }
}

uint64_t __43__LACDarwinNotificationCenter_addObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3 notification:(__CFString *)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __56__LACDarwinNotificationCenter_addObserver_notification___block_invoke;
  v9[3] = &unk_18A3698F0;
  id v7 = v6;
  id v10 = v7;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v9);
  -[LACDarwinNotificationCenter _startObservingNotification:](self, "_startObservingNotification:", a4);
  LACLogNotifications();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    v14 = a4;
    _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, "Did register observer %@ of notification %@", buf, 0x16u);
  }
}

uint64_t __56__LACDarwinNotificationCenter_addObserver_notification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __46__LACDarwinNotificationCenter_removeObserver___block_invoke;
  v7[3] = &unk_18A3698F0;
  id v5 = v4;
  id v8 = v5;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v7);
  LACLogNotifications();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "Did remove observer %@", buf, 0xCu);
  }
}

uint64_t __46__LACDarwinNotificationCenter_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)_notifyObserversAboutNotification:(__CFString *)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  LACLogNotifications();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl( &dword_189219000,  v5,  OS_LOG_TYPE_DEFAULT,  "Did receive notification %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000LL;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v20 = 0LL;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __65__LACDarwinNotificationCenter__notifyObserversAboutNotification___block_invoke;
  v14[3] = &unk_18A369878;
  v14[4] = &buf;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v14);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = *(id *)(*((void *)&buf + 1) + 40LL);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * v9++),  "notificationCenter:didReceiveNotification:",  self,  a3,  (void)v10);
      }

      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v7);
  }

  _Block_object_dispose(&buf, 8);
}

void __65__LACDarwinNotificationCenter__notifyObserversAboutNotification___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_postNotification:(__CFString *)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0LL, 0LL, 1u);
}

- (void)_startObservingNotification:(__CFString *)a3
{
  if (!-[LACDarwinNotificationCenter _hasSubscriptionToNotification:](self, "_hasSubscriptionToNotification:"))
  {
    -[LACDarwinNotificationCenter _addSubscriptionToNotification:](self, "_addSubscriptionToNotification:", a3);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, a3, 0LL);
    id v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v6,  self,  (CFNotificationCallback)LACDarwinNotificationCenterCallBack,  a3,  0LL,  (CFNotificationSuspensionBehavior)0LL);
  }

- (void)_stopObservingAllNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (BOOL)_hasSubscriptionToNotification:(__CFString *)a3
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __62__LACDarwinNotificationCenter__hasSubscriptionToNotification___block_invoke;
  v5[3] = &unk_18A369918;
  v5[4] = &v6;
  v5[5] = a3;
  -[LACDarwinNotificationCenter _synchronizedSubscriptions:](self, "_synchronizedSubscriptions:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__LACDarwinNotificationCenter__hasSubscriptionToNotification___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

- (void)_addSubscriptionToNotification:(__CFString *)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __62__LACDarwinNotificationCenter__addSubscriptionToNotification___block_invoke;
  v3[3] = &__block_descriptor_40_e22_v16__0__NSMutableSet_8l;
  v3[4] = a3;
  -[LACDarwinNotificationCenter _synchronizedSubscriptions:](self, "_synchronizedSubscriptions:", v3);
}

uint64_t __62__LACDarwinNotificationCenter__addSubscriptionToNotification___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)_synchronizedObservers:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = (void (**)(id, NSHashTable *))a3;
  os_unfair_lock_lock(p_observersLock);
  v5[2](v5, self->_observers);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_synchronizedSubscriptions:(id)a3
{
  p_subscriptionsLock = &self->_subscriptionsLock;
  id v5 = (void (**)(id, NSMutableSet *))a3;
  os_unfair_lock_lock(p_subscriptionsLock);
  v5[2](v5, self->_subscriptions);

  os_unfair_lock_unlock(p_subscriptionsLock);
}

- (void).cxx_destruct
{
}

@end
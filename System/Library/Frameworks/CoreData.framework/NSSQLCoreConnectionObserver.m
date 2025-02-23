@interface NSSQLCoreConnectionObserver
@end

@implementation NSSQLCoreConnectionObserver

uint64_t __63___NSSQLCoreConnectionObserver_initWithSQLCore_andCoordinator___block_invoke(uint64_t a1, int a2)
{
  state64[3] = *MEMORY[0x1895F89C0];
  id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t state = notify_get_state(a2, state64);
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x186E3E5D8](state);
    v8 = (os_unfair_lock_s *)objc_loadWeakRetained(WeakRetained + 3);
    objc_autoreleasePoolPop(v7);
    v9 = (void *)MEMORY[0x186E3E5D8]();
    id v10 = objc_loadWeakRetained(WeakRetained + 4);
    objc_autoreleasePoolPop(v9);
  }

  else
  {
    v8 = 0LL;
    id v10 = 0LL;
  }

  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
  {
    uint64_t v11 = -[os_unfair_lock_s identifier](v8, "identifier");
    _NSCoreDataLog( 9LL,  (uint64_t)@"Remote Change Notification - observer received for  %@ with state %lld",  v12,  v13,  v14,  v15,  v16,  v17,  v11);
  }

  if (v8 && v10)
  {
    os_unfair_lock_lock_with_options();
    LOBYTE(v8[66]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v8 + 38);
    if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
    {
      uint64_t v18 = -[os_unfair_lock_s identifier](v8, "identifier");
      _NSCoreDataLog( 9LL,  (uint64_t)@"Remote Change Notification - PSC to post notification for store  %@ with transaction ID %lld",  v19,  v20,  v21,  v22,  v23,  v24,  v18);
    }

    -[NSPersistentStoreCoordinator _postStoreRemoteChangeNotificationsForStore:andState:]((uint64_t)v10, v8, state64[0]);
  }

  return [v4 drain];
}

@end
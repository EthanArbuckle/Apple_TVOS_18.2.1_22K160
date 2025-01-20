@interface NSXPCStoreNotificationObserver
- (id)setStore:(id *)result;
- (void)dealloc;
@end

@implementation NSXPCStoreNotificationObserver

id __67__NSXPCStoreNotificationObserver_initForObservationWithName_store___block_invoke(uint64_t a1, int a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
  v5 = (void *)[MEMORY[0x189607958] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    uint64_t v8 = Weak[4];
    id v9 = (id)[WeakRetained persistentStoreForIdentifier:v8];
    v16 = v9;
    if (WeakRetained && v9)
    {
      _NSCoreDataLog( 8LL,  (uint64_t)@"Remote Change Notification - posting NSRemotePersistentStoreDidChangeNotification for store  %@ ",  v10,  v11,  v12,  v13,  v14,  v15,  v8);
      [v5 postNotificationName:@"NSRemotePersistentStoreDidChangeNotification" object:v16];
      notify_get_state(a2, &state64);
      _NSCoreDataLog( 8LL,  (uint64_t)@"Remote Change Notification - PSC to post notification for store  %@ with state %ld",  v17,  v18,  v19,  v20,  v21,  v22,  v8);
      -[NSPersistentStoreCoordinator _postStoreRemoteChangeNotificationsForStore:andState:]( (uint64_t)WeakRetained,  v16,  state64);
    }
  }

  else
  {
    v16 = 0LL;
  }

  [v4 drain];
  return 0LL;
}

- (void)dealloc
{
  int token = self->_token;
  if (token != -1)
  {
    notify_cancel(token);
    self->_int token = -1;
  }

  queue = (dispatch_object_s *)self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0LL;
  }

  objc_storeWeak((id *)&self->_psc, 0LL);

  self->_storeID = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSXPCStoreNotificationObserver;
  -[NSXPCStoreNotificationObserver dealloc](&v5, sel_dealloc);
}

- (id)setStore:(id *)result
{
  if (result)
  {
    v3 = result;
    objc_sync_enter(result);

    v3[4] = (id)objc_msgSend((id)objc_msgSend(a2, "identifier"), "copy");
    return (id *)objc_sync_exit(v3);
  }

  return result;
}

- (void).cxx_destruct
{
}

@end
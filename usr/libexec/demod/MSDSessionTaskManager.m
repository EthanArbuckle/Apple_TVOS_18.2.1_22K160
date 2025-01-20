@interface MSDSessionTaskManager
- (MSDSessionTaskManager)init;
- (NSMapTable)sharedStore;
- (id)getSessionTask:(id)a3;
- (id)getTaskInState:(int)a3;
- (os_unfair_lock_s)sharedStoreLock;
- (void)addSessionTask:(id)a3;
- (void)cancelAndRemoveAllSessionTask;
- (void)removeSessionTask:(id)a3;
- (void)setSharedStore:(id)a3;
- (void)setSharedStoreLock:(os_unfair_lock_s)a3;
@end

@implementation MSDSessionTaskManager

- (MSDSessionTaskManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDSessionTaskManager;
  v2 = -[MSDSessionTaskManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
    -[MSDSessionTaskManager setSharedStore:](v2, "setSharedStore:", v3);

    -[MSDSessionTaskManager setSharedStoreLock:](v2, "setSharedStoreLock:", 0LL);
    v4 = v2;
  }

  return v2;
}

- (id)getSessionTask:(id)a3
{
  p_sharedStoreLock = &self->_sharedStoreLock;
  id v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  os_unfair_lock_unlock(p_sharedStoreLock);
  return v7;
}

- (void)addSessionTask:(id)a3
{
  p_sharedStoreLock = &self->_sharedStoreLock;
  id v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);
  [v6 setObject:v5 forKey:v7];

  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (void)removeSessionTask:(id)a3
{
  p_sharedStoreLock = &self->_sharedStoreLock;
  id v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);

  [v6 removeObjectForKey:v7];
  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (void)cancelAndRemoveAllSessionTask
{
  p_sharedStoreLock = &self->_sharedStoreLock;
  os_unfair_lock_lock(&self->_sharedStoreLock);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);

        if (![v11 state])
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 task]);
          [v12 cancel];
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
        [v13 removeObjectForKey:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (id)getTaskInState:(int)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  os_unfair_lock_lock(&self->_sharedStoreLock);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(&self->_sharedStoreLock);
  return v5;
}

- (NSMapTable)sharedStore
{
  return (NSMapTable *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSharedStore:(id)a3
{
}

- (os_unfair_lock_s)sharedStoreLock
{
  return self->_sharedStoreLock;
}

- (void)setSharedStoreLock:(os_unfair_lock_s)a3
{
  self->_sharedStoreLock = a3;
}

- (void).cxx_destruct
{
}

@end
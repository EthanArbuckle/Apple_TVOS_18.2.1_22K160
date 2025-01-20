@interface MCMLRUCache
- (MCMDoublyLinkedList)mruItems;
- (MCMLRUCache)init;
- (MCMLRUCache)initWithName:(id)a3 maxCount:(unint64_t)a4;
- (NSMutableDictionary)storage;
- (NSString)name;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)maxCount;
- (void)removeAllObjects;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation MCMLRUCache

- (MCMLRUCache)init
{
  return -[MCMLRUCache initWithName:maxCount:](self, "initWithName:maxCount:", @"default", 10LL);
}

- (MCMLRUCache)initWithName:(id)a3 maxCount:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMLRUCache;
  v8 = -[MCMLRUCache init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_maxCount = a4;
    uint64_t v10 = [MEMORY[0x189603FC8] dictionaryWithCapacity:a4];
    storage = v9->_storage;
    v9->_storage = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    mruItems = v9->_mruItems;
    v9->_mruItems = (MCMDoublyLinkedList *)v12;

    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)objectForKey:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[MCMLRUCache mruItems](self, "mruItems");
  uint64_t v6 = [v5 count];
  -[MCMLRUCache storage](self, "storage");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];

  if (v6 != v8)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v34 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    v21 = -[MCMLRUCache mruItems](self, "mruItems");
    uint64_t v22 = [v21 count];
    -[MCMLRUCache storage](self, "storage");
    self = (MCMLRUCache *)objc_claimAutoreleasedReturnValue();
    int v29 = 134218240;
    uint64_t v30 = v22;
    __int16 v31 = 2048;
    unint64_t v32 = -[MCMLRUCache count](self, "count");
    LODWORD(v28) = 22;
    v27 = &v29;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
    goto LABEL_9;
  }
  v9 = -[MCMLRUCache storage](self, "storage");
  [v9 objectForKeyedSubscript:v4];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    container_log_handle_for_category();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v19 = -[MCMLRUCache name](self, "name");
      [v10 data];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_debug_impl(&dword_188846000, v11, OS_LOG_TYPE_DEBUG, "[%@] Cache hit: %@", buf, 0x16u);
    }

    -[MCMLRUCache mruItems](self, "mruItems");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 removeNodeAndAddToTail:v10];
  }

  [v10 data];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MCMLRUCache mruItems](self, "mruItems");
  uint64_t v15 = [v14 count];
  -[MCMLRUCache storage](self, "storage");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 count];

  if (v15 != v17)
  {
LABEL_9:
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v34 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    v23 = -[MCMLRUCache mruItems](self, "mruItems", v27, v28);
    uint64_t v24 = [v23 count];
    v25 = -[MCMLRUCache storage](self, "storage");
    uint64_t v26 = [v25 count];
    int v29 = 134218240;
    uint64_t v30 = v24;
    __int16 v31 = 2048;
    unint64_t v32 = v26;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }

  os_unfair_lock_unlock(&self->_lock);

  return v13;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[MCMLRUCache mruItems](self, "mruItems");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];
  -[MCMLRUCache storage](self, "storage");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 count];

  if (v9 != v11)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v44 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    -[MCMLRUCache mruItems](self, "mruItems");
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v31 count];
    -[MCMLRUCache storage](self, "storage");
    self = (MCMLRUCache *)objc_claimAutoreleasedReturnValue();
    int v39 = 134218240;
    uint64_t v40 = v32;
    __int16 v41 = 2048;
    unint64_t v42 = -[MCMLRUCache count](self, "count");
    LODWORD(v38) = 22;
    uint64_t v37 = &v39;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
    goto LABEL_13;
  }

  -[MCMLRUCache storage](self, "storage");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKey:v7];
  v13 = (MCMDoublyLinkedListNode *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MCMDoublyLinkedListNode setData:](v13, "setData:", v6);
    v14 = -[MCMLRUCache mruItems](self, "mruItems");
    [v14 removeNodeAndAddToTail:v13];
  }

  else
  {
    unint64_t v15 = -[MCMLRUCache maxCount](self, "maxCount");
    -[MCMLRUCache mruItems](self, "mruItems");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 count];

    if (v15 == v17)
    {
      v18 = -[MCMLRUCache mruItems](self, "mruItems");
      [v18 removeFromHead];
      v13 = (MCMDoublyLinkedListNode *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v27 = -[MCMLRUCache name](self, "name");
        -[MCMLRUCache storage](self, "storage");
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMDoublyLinkedListNode key](v13, "key");
        int v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 objectForKeyedSubscript:v29];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v30;
        _os_log_debug_impl(&dword_188846000, v19, OS_LOG_TYPE_DEBUG, "[%@] Evicting from cache: %@", buf, 0x16u);
      }
      v20 = -[MCMLRUCache storage](self, "storage");
      v21 = -[MCMDoublyLinkedListNode key](v13, "key");
      [v20 setObject:0 forKeyedSubscript:v21];

      -[MCMDoublyLinkedListNode setKey:](v13, "setKey:", v7);
      -[MCMDoublyLinkedListNode setData:](v13, "setData:", v6);
    }

    else
    {
      v13 = -[MCMDoublyLinkedListNode initWithKey:data:]( objc_alloc(&OBJC_CLASS___MCMDoublyLinkedListNode),  "initWithKey:data:",  v7,  v6);
    }

    -[MCMLRUCache mruItems](self, "mruItems");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 addToTail:v13];
    v14 = -[MCMLRUCache storage](self, "storage");
    [v14 setObject:v13 forKeyedSubscript:v7];
  }
  v23 = -[MCMLRUCache mruItems](self, "mruItems");
  uint64_t v24 = [v23 count];
  v25 = -[MCMLRUCache storage](self, "storage");
  uint64_t v26 = [v25 count];

  if (v24 != v26)
  {
LABEL_13:
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v44 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    v33 = -[MCMLRUCache mruItems](self, "mruItems", v37, v38);
    uint64_t v34 = [v33 count];
    -[MCMLRUCache storage](self, "storage");
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v35 count];
    int v39 = 134218240;
    uint64_t v40 = v34;
    __int16 v41 = 2048;
    unint64_t v42 = v36;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeAllObjects
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  container_log_handle_for_category();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[MCMLRUCache name](self, "name");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMLRUCache mruItems](self, "mruItems");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_debug_impl( &dword_188846000,  v4,  OS_LOG_TYPE_DEBUG,  "[%@] Evicting items from cache: %@",  (uint8_t *)&v9,  0x16u);
  }
  v5 = -[MCMLRUCache storage](self, "storage");
  [v5 removeAllObjects];

  -[MCMLRUCache mruItems](self, "mruItems");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMLRUCache mruItems](self, "mruItems");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 count];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (MCMDoublyLinkedList)mruItems
{
  return self->_mruItems;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end
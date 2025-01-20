@interface LSInstallProgressList
- (LSInstallProgressList)init;
- (id)description;
- (id)progressForBundleID:(id)a3;
- (id)subscriberForBundleID:(id)a3 andPublishingKey:(id)a4;
- (void)addSubscriber:(id)a3 forPublishingKey:(id)a4 andBundleID:(id)a5;
- (void)removeProgressForBundleID:(id)a3;
- (void)removeSubscriberForPublishingKey:(id)a3 andBundleID:(id)a4;
- (void)setProgress:(id)a3 forBundleID:(id)a4;
@end

@implementation LSInstallProgressList

- (LSInstallProgressList)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LSInstallProgressList;
  v2 = -[LSInstallProgressList init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
    progresses = v2->_progresses;
    v2->_progresses = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
    subscriptions = v2->_subscriptions;
    v2->_subscriptions = (NSMutableDictionary *)v5;
  }

  return v2;
}

- (id)progressForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableDictionary objectForKey:](v5->_progresses, "objectForKey:", v4);
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = v6;
  }
  else {
    id v7 = 0LL;
  }

  objc_sync_exit(v5);
  return v7;
}

- (void)setProgress:(id)a3 forBundleID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    -[NSMutableDictionary allKeys](v7->_progresses, "allKeys");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v8 containsObject:v6];

    if ((v9 & 1) == 0) {
      MEMORY[0x186E2AFD4]();
    }
  }

  -[NSMutableDictionary setObject:forKey:](v7->_progresses, "setObject:forKey:", v10, v6);
  objc_sync_exit(v7);
}

- (void)addSubscriber:(id)a3 forPublishingKey:(id)a4 andBundleID:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  _LSProgressLog();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "#LSInstallProgressList add subscriber: %@ publishingString: %@",  (uint8_t *)&v14,  0x16u);
  }
  v13 = -[NSMutableDictionary objectForKey:](v11->_subscriptions, "objectForKey:", v9);
  if (!v13)
  {
    [MEMORY[0x189603FA8] array];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11->_subscriptions, "setObject:forKey:", v13, v9);
  }

  [v13 addObject:v8];

  objc_sync_exit(v11);
}

- (id)subscriberForBundleID:(id)a3 andPublishingKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_subscriptions, "objectForKeyedSubscript:", v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v9;
}

- (void)removeSubscriberForPublishingKey:(id)a3 andBundleID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v14 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_subscriptions, "objectForKeyedSubscript:", v6);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        _LSProgressLog();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v12;
          __int16 v21 = 2112;
          id v22 = v6;
          _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_DEFAULT,  "#LSInstallProgressList remove subscriber: %@ publishingString: %@",  buf,  0x16u);
        }

        objc_msgSend(MEMORY[0x1896079E0], "_removeSubscriber:", v12, v14);
      }

      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v9);
  }

  -[NSMutableDictionary removeObjectForKey:](v7->_subscriptions, "removeObjectForKey:", v6);
  objc_sync_exit(v7);
}

- (void)removeProgressForBundleID:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    -[NSMutableDictionary allKeys](v4->_progresses, "allKeys");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v5 containsObject:v7];

    if (v6) {
      MEMORY[0x186E2AFE0]();
    }
  }

  -[NSMutableDictionary removeObjectForKey:](v4->_progresses, "removeObjectForKey:", v7);
  objc_sync_exit(v4);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"LSInstallProgressList: %@, %@", self->_progresses, self->_subscriptions];
}

- (void).cxx_destruct
{
}

@end
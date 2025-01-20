@interface NIRecentlyObservedObjectsCache
- (NIRecentlyObservedObjectsCache)init;
- (id)getMostRecentObjectsWithMaxAge:(double)a3;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didUpdateNearbyObjects:(id)a3;
@end

@implementation NIRecentlyObservedObjectsCache

- (NIRecentlyObservedObjectsCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIRecentlyObservedObjectsCache;
  v2 = -[NIRecentlyObservedObjectsCache init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    recentDevices = v3->_recentDevices;
    v3->_recentDevices = v4;

    v6 = v3;
  }

  return v3;
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        recentDevices = self->_recentDevices;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "discoveryToken", (void)v12));
        -[NSMutableDictionary setObject:forKeyedSubscript:](recentDevices, "setObject:forKeyedSubscript:", v9, v11);
      }

      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#recent-obj-cache,Discovered device: %@",  (uint8_t *)&v5,  0xCu);
  }
}

- (id)getMostRecentObjectsWithMaxAge:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  double v7 = sub_100023CC4();
  recentDevices = self->_recentDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10029311C;
  v13[3] = &unk_1007BB350;
  double v15 = v7;
  double v16 = a3;
  v9 = v6;
  __int128 v14 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](recentDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v9, "sortedArrayUsingComparator:", &stru_1007BB390));
  v11 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v18 = a3;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#recent-obj-cache,Most recent objects under age %0.2f seconds: %@",  buf,  0x16u);
  }

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void).cxx_destruct
{
}

@end
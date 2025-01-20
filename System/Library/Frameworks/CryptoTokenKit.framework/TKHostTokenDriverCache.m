@interface TKHostTokenDriverCache
- (BOOL)allowTestOnlyExtensions;
- (BOOL)avoidInitialKeepAlive;
- (NSArray)allowedExtensionClassIDs;
- (NSMutableDictionary)drivers;
- (TKHostTokenDriverCache)init;
- (TKHostTokenRegistry)registry;
- (double)idleTimeout;
- (id)hostTokenDriverFromExtension:(id)a3;
- (id)hostTokenDriverWithClassID:(id)a3 error:(id *)a4;
- (id)tokenExtensionsWithAttributes:(id)a3;
- (void)invalidate;
- (void)removeDriverWithClassID:(id)a3;
- (void)setAllowTestOnlyExtensions:(BOOL)a3;
- (void)setAllowedExtensionClassIDs:(id)a3;
- (void)setAvoidInitialKeepAlive:(BOOL)a3;
- (void)setIdleTimeout:(double)a3;
- (void)setRegistry:(id)a3;
@end

@implementation TKHostTokenDriverCache

- (TKHostTokenDriverCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TKHostTokenDriverCache;
  v2 = -[TKHostTokenDriverCache init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    drivers = v2->_drivers;
    v2->_drivers = (NSMutableDictionary *)v3;

    v2->_idleTimeout = 5.0;
    v5 = (void *)CFPreferencesCopyValue( TKSmartCardPreferencesDisabledTokensKey,  TKSmartCardPreferencesDomain,  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      v7 = v5;
    }
    else {
      v7 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v2->_disabledExtensionIDs, v7);
    if (-[NSArray count](v2->_disabledExtensionIDs, "count"))
    {
      id v8 = sub_10000DFD0();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        disabledExtensionIDs = v2->_disabledExtensionIDs;
        *(_DWORD *)buf = 138543362;
        v14 = disabledExtensionIDs;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Following token extensions disabled by configuration: %{public}@",  buf,  0xCu);
      }
    }
  }

  return v2;
}

- (void)removeDriverWithClassID:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000DFD0();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100011B24();
  }

  v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7->_drivers, "objectForKey:", v4));
  -[NSMutableDictionary removeObjectForKey:](v7->_drivers, "removeObjectForKey:", v4);
  objc_sync_exit(v7);

  [v8 invalidate];
}

- (id)tokenExtensionsWithAttributes:(id)a3
{
  return &__NSDictionary0__struct;
}

- (id)hostTokenDriverFromExtension:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  uint64_t v7 = TKTokenClassDriverClassIDKey;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TKTokenClassDriverClassIDKey]);

  if (!v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    [v14 handleFailureInMethod:a2, self, @"TKHostTokenDriver.m", 424, @"token extension %@ has no %@ attribute", v15, v7 object file lineNumber description];
  }

  v9 = self;
  objc_sync_enter(v9);
  v10 = (TKHostTokenDriver *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v9->_drivers,  "objectForKeyedSubscript:",  v8));
  if (!v10)
  {
    v10 = -[TKHostTokenDriver initWithExtension:cache:]( objc_alloc(&OBJC_CLASS___TKHostTokenDriver),  "initWithExtension:cache:",  v5,  v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_drivers, "setObject:forKeyedSubscript:", v10, v8);
    id v11 = sub_10000DFD0();
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100011B84();
    }
  }

  objc_sync_exit(v9);

  return v10;
}

- (id)hostTokenDriverWithClassID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = TKTokenClassDriverClassIDKey;
  id v24 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriverCache tokenExtensionsWithAttributes:](self, "tokenExtensionsWithAttributes:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  if (v10)
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      id v11 = sub_10000DFD0();
      objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v17 = [v8 count];
        v18 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        int v19 = 67109634;
        *(_DWORD *)v20 = v17;
        *(_WORD *)&v20[4] = 2114;
        *(void *)&v20[6] = v6;
        __int16 v21 = 2114;
        v22 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "detected %d drivers implementing '%{public}@' token class, using '%{public}@' and ignoring the rest",  (uint8_t *)&v19,  0x1Cu);
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriverCache hostTokenDriverFromExtension:](self, "hostTokenDriverFromExtension:", v10));
  }

  else
  {
    id v14 = sub_10000DFD0();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      *(void *)v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "requested driver for token class '%{public}@' not found in the system",  (uint8_t *)&v19,  0xCu);
    }

    v13 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TKErrorDomain,  -7LL,  0LL));
    }
  }

  return v13;
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2->_drivers, "allValues"));
  -[NSMutableDictionary removeAllObjects](v2->_drivers, "removeAllObjects");
  objc_sync_exit(v2);

  id v4 = sub_10000DFD0();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100011BE4(v3, v5);
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "invalidate", (void)v10);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (void)setIdleTimeout:(double)a3
{
  self->_idleTimeout = a3;
}

- (TKHostTokenRegistry)registry
{
  return (TKHostTokenRegistry *)objc_loadWeakRetained((id *)&self->_registry);
}

- (void)setRegistry:(id)a3
{
}

- (NSArray)allowedExtensionClassIDs
{
  return self->_allowedExtensionClassIDs;
}

- (void)setAllowedExtensionClassIDs:(id)a3
{
}

- (BOOL)allowTestOnlyExtensions
{
  return self->_allowTestOnlyExtensions;
}

- (void)setAllowTestOnlyExtensions:(BOOL)a3
{
  self->_allowTestOnlyExtensions = a3;
}

- (BOOL)avoidInitialKeepAlive
{
  return self->_avoidInitialKeepAlive;
}

- (void)setAvoidInitialKeepAlive:(BOOL)a3
{
  self->_avoidInitialKeepAlive = a3;
}

- (NSMutableDictionary)drivers
{
  return self->_drivers;
}

- (void).cxx_destruct
{
}

@end
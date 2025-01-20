@interface GTMTLCaptureScopeInfo
+ (id)allCaptureScopes;
+ (id)getInfoWithAddress:(unint64_t)a3;
+ (id)getInfoWithStreamRef:(unint64_t)a3;
+ (void)addScope:(id)a3;
+ (void)initialize;
+ (void)removeScope:(id)a3;
+ (void)sendAll:(os_unfair_lock_s *)a3;
+ (void)updateAll;
@end

@implementation GTMTLCaptureScopeInfo

+ (void)initialize
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
  v3 = (void *)_scopes;
  _scopes = v2;
}

+ (id)allCaptureScopes
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v3 = -[NSMutableArray initWithCapacity:](v2, "initWithCapacity:", [(id)_scopes count]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (id)_scopes;
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
        v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)_scopes,  "objectForKey:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)v8),  (void)v14));
        id v10 = newDYMTLCaptureScopeInfo(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        -[NSMutableArray addObject:](v3, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  id v12 = -[NSMutableArray copy](v3, "copy");

  return v12;
}

+ (void)sendAll:(os_unfair_lock_s *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (id)_scopes;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)_scopes,  "objectForKey:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)v9),  (void)v13));
        id v11 = newDYMTLCaptureScopeInfo(v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        -[NSMutableArray addObject:](v4, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  os_unfair_lock_unlock(a3);
  GTMTLGuestAppClientSendMTLCaptureScopeInfo(g_guestAppClientMTL, v4);
}

+ (void)addScope:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  id v4 = (void *)_scopes;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 streamReference]));
  [v4 setObject:v3 forKey:v5];

  +[GTMTLCaptureScopeInfo sendAll:](&OBJC_CLASS___GTMTLCaptureScopeInfo, "sendAll:", &lock);
  os_unfair_lock_assert_not_owner((os_unfair_lock_t)&lock);
}

+ (void)removeScope:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  id v4 = (void *)_scopes;
  id v5 = [v3 streamReference];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
  [v4 removeObjectForKey:v6];

  +[GTMTLCaptureScopeInfo sendAll:](&OBJC_CLASS___GTMTLCaptureScopeInfo, "sendAll:", &lock);
  os_unfair_lock_assert_not_owner((os_unfair_lock_t)&lock);
}

+ (void)updateAll
{
}

+ (id)getInfoWithStreamRef:(unint64_t)a3
{
  id v4 = (void *)_scopes;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);

  if (v6)
  {
    id v7 = newDYMTLCaptureScopeInfo(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v8;
}

+ (id)getInfoWithAddress:(unint64_t)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)_scopes;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)_scopes,  "objectForKey:",  *(void *)(*((void *)&v14 + 1) + 8 * v8),  (void)v14));
      id v10 = v9;

      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (!v10) {
      goto LABEL_12;
    }
    id v11 = newDYMTLCaptureScopeInfo(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
LABEL_9:

    id v10 = 0LL;
LABEL_12:
    id v12 = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v12;
}

@end